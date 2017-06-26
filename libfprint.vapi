/*
 * Vala bindings for libfprint
 * Copyright (C) 2017  David Lechner <david@lechnology.com>
 * 
 * This library is free software; you can redistribute it and/or
 * modify it under the terms of the GNU Lesser General Public
 * License as published by the Free Software Foundation; either
 * version 2.1 of the License, or (at your option) any later version.
 * 
 * This library is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
 * Lesser General Public License for more details.
 * 
 * You should have received a copy of the GNU Lesser General Public
 * License along with this library; if not, you can find it at
 * <https://www.gnu.org/licenses/old-licenses/lgpl-2.1.html>
 */

/* Example usage available at <https://github.com/dlech/fprint-demo> */

[CCode (cheader_filename = "fprint.h")]
namespace Fp {
    /**
     * Initialise libfprint.
     *
     * This function must be called before you attempt to use the library
     * in any way. 
     *
     * @return      0 on success, non-zero on error.
     */
    public static int init ();

    /**
     * Deinitialise libfprint.
     *
     * This function should be called during your program exit sequence. You
     * must not use any libfprint functions after calling this function, unless
     * you call {@link init} again. 
     */
    public static void exit ();

    public static void set_debug (int level);

    [CCode (cname = "enum fp_capture_result", cprefix = "FP_CAPTURE_", has_type_id = false)]
    public enum CaptureResult {
        COMPLETE,
        FAIL,
    }

    /**
     *  Enrollment result codes returned from {@link enroll_finger}.
     *
     * Result codes with RETRY in the name suggest that the scan failed due to
     * user error. Applications will generally want to inform the user of the
     * problem and then retry the enrollment stage. For more info on the
     * semantics of interpreting these result codes and tracking enrollment
     * process, see Enrolling.
     */
    [CCode (cname = "enum fp_enroll_result", cprefix = "FP_ENROLL_", has_type_id = false)]
    public enum EnrollResult {
        /**
         * Enrollment completed successfully, the enrollment data has been
         * returned to the caller.
         */
        COMPLETE,

        /**
         * Enrollment failed due to incomprehensible data; this may occur when
         * the user scans a different finger on each enroll stage.
         */
        FAIL,

        /**
         * Enroll stage passed; more stages are need to complete the process.
         */
        PASS,

        /**
         * The enrollment scan did not succeed due to poor scan quality or
         * other general user scanning problem.
         */
        RETRY,

        /**
         * The enrollment scan did not succeed because the finger swipe was
         * too short. 
         */
        RETRY_TOO_SHORT,

        /**
         * The enrollment scan did not succeed because the finger was not
         * centered on the scanner. 
         */
        RETRY_CENTER_FINGER,

        /**
         * The verification scan did not succeed due to quality or pressure
         * problems; the user should remove their finger from the scanner
         * before retrying.
         */
        RETRY_REMOVE_FINGER,
    }

    /**
     *  Verification result codes returned from {@link verify_finger}.
     *
     * Return codes are also shared with {@link identify_finger}. Result codes
     * with RETRY in the name suggest that the scan failed due to user error.
     * Applications will generally want to inform the user of the problem and
     * then retry the verify operation. 
     */
    [CCode (cname = "enum fp_verify_result", cprefix = "FP_VERIFY_", has_type_id = false)]
    public enum VerifyResult {
        /**
         * The scan completed successfully, but the newly scanned fingerprint
         * does not match the fingerprint being verified against.
         *
         * In the case of identification, this return code indicates that the
         * scanned finger could not be found in the print gallery.
         */
        NO_MATCH,

        /**
         * The scan completed successfully and the newly scanned fingerprint
         * does match the fingerprint being verified, or in the case of
         * identification, the scanned fingerprint was found in the print
         * gallery.
         */
        MATCH,

        /**
         * The scan did not succeed due to poor scan quality or other general
         * user scanning problem. 
         */
        RETRY,

        /**
         * The scan did not succeed because the finger swipe was too short.
         */
        RETRY_TOO_SHORT,

        /**
         * The scan did not succeed because the finger was not centered on the
         * scanner.
         */
        RETRY_CENTER_FINGER,

        /**
         * The scan did not succeed due to quality or pressure problems; the
         * user should remove their finger from the scanner before retrying. 
         */
        RETRY_REMOVE_FINGER,
    }

    [CCode (cname = "struct fp_dev", has_type_id = false)]
    [Compact]
    public class Dev {
        /**
         * Opens and initialises a device.
         *
         * This is the function you call in order to convert a {@link DscvDev}
         * into an actual device handle that you can perform operations with.
         *
         * @param ddev  the discovered device to open
         * 
         * @return      the opened device handle, or NULL on error
         */
        public static unowned Dev? open (DscvDev ddev);

        /**
         * Close a device.
         *
         * You must call this function when you are finished using a
         * fingerprint device. 
         */
        public void close ();

        [CCode (cname = "fp_dev_open_cb", has_type_id = false)]
        public delegate void OpenCallback(Dev? dev, int status);
        [CCode (cname = "fp_async_dev_open")]
        public static int open_async (DscvDev ddev, OpenCallback callback);

        [CCode (cname = "fp_dev_close_cb", has_type_id = false)]
        public delegate void CloseCallback(Dev dev);
        [CCode (cname = "fp_async_dev_close")]
        public void close_async (CloseCallback callback);

        /**
         * Gets the {@link Driver} for a fingerprint device. 
         */
        public unowned Driver driver { get; }

        /**
         * Gets the number of enroll stages required to enroll a fingerprint
         * with the device.
         */
        public int nr_enroll_stages { get; }

        /**
         * Gets the devtype for a device.
         */
        public uint32 devtype { get; }

        /**
         * Determines if a stored print is compatible with a certain device.
         * 
         * @param data  the stored print
         * 
         * @return      true if the print is compatible with the device, false
         *              if not
         */
        public bool supports_print_data (PrintData data);

        /**
         * Determines if a discovered print appears to be compatible with a
         * certain device. 
         * 
         * @param data  the discovered print
         * 
         * @return      true if the print is compatible with the device, false
         *              if not
         */
        public bool supports_dscv_print (DscvPrint data);

        /**
         * Determines if a device has imaging capabilities.
         *
         * If a device has imaging capabilities you are able to perform imaging
         * operations such as retrieving scan images using {@link dev_img_capture}.
         * However, not all devices are imaging devices - some do all processing
         * in hardware. This function will indicate which class a device in
         * question falls into.
         * 
         * @return      true if the device is an imaging device, false if the
         *              device does not provide images to the host computer
         */
        public bool supports_imaging ();

        /**
         * Determines if a device is capable of identification through
         * {@link identify_finger} and similar.
         *
         * Not all devices support this functionality.
         * 
         * @return      true if the device is capable of identification, false
         *              otherwise.
         */
        public bool supports_identification ();

        /**
         * Captures an image from a device.
         *
         * The returned image is the raw image provided by the device, you may
         * wish to standardize it.
         *
         * If set, the unconditional flag indicates that the device should
         * capture an image unconditionally, regardless of whether a finger is
         * there or not. If unset, this function will block until a finger is
         * detected on the sensor.
         * 
         * @param unconditional     whether to unconditionally capture an image,
         *                          or to only capture when a finger is detected
         * @param image             the captured image
         * 
         * @return                  0 on success, non-zero on error. -ENOTSUP
         *                          indicates that either the unconditional flag
         *                          was set but the device does not support this,
         *                          or that the device does not support imaging.
         * 
         * @see                     supports_imaging
         */
        public int img_capture (bool unconditional, ref Img image);

        /**
         * Gets the expected width of images that will be captured from the device.
         *
         * This function will return -1 for devices that are not imaging devices.
         * If the width of images from this device can vary, 0 will be returned. 
         */
        public int img_width { get; }

        /**
         * Gets the expected height of images that will be captured from the device.
         *
         * This function will return -1 for devices that are not imaging devices.
         * If the height of images from this device can vary, 0 will be returned. 
         */
        public int img_height { get; }

        /**
         *  Performs an enroll stage.
         *
         * See Enrolling for an explanation of enroll stages.
         *
         * If no enrollment is in process, this kicks of the process and runs
         * the first stage. If an enrollment is already in progress, calling
         * this function runs the next stage, which may well be the last.
         *
         * A negative error code may be returned from any stage. When this
         * occurs, further calls to the enroll function will start a new
         * enrollment process, i.e. a negative error code indicates that the
         * enrollment process has been aborted. These error codes only ever
         * indicate unexpected internal errors or I/O problems.
         *
         * The RETRY codes from {@link EnrollResult} may be returned from any
         * enroll stage. These codes indicate that the scan was not succesful in
         * that the user did not position their finger correctly or similar.
         * When a RETRY code is returned, the enrollment stage is not advanced,
         * so the next call into this function will retry the current stage
         * again. The current stage may need to be retried several times.
         *
         * The {@link EnrollResult.FAIL} code may be returned from any enroll
         * stage. This code indicates that even though the scans themselves have
         * been acceptable, data processing applied to these scans produces
         * incomprehensible results. In other words, the user may have been
         * scanning a different finger for each stage or something like that.
         * Like negative error codes, this return code indicates that the
         * enrollment process has been aborted.
         *
         * The {@link EnrollResult.PASS} code will only ever be returned for
         * non-final stages. This return code indicates that the scan was
         * acceptable and the next call into this function will advance onto
         * the next enroll stage.
         *
         * The {@link EnrollResult.COMPLETE} code will only ever be returned
         * from the final enroll stage. It indicates that enrollment completed
         * successfully, and that print_data has been assigned to point to the
         * resultant enrollment data. The print_data parameter will not be
         * modified during any other enrollment stages, hence it is actually
         * legal to pass NULL as this argument for all but the final stage.
         *
         * If the device is an imaging device, it can also return the image from
         * the scan, even when the enroll fails with a RETRY or FAIL code. It is
         * legal to call this function even on non-imaging devices, just don't
         * expect them to provide images.
         * 
         * @param print_data    the resultant enrollment data from the final stage
         * @param img           the scan image or null for no image
         * 
         * @return              negative code on error, otherwise a code from
         *                      {@link EnrollResult}
         */
        [CCode (cname = "fp_enroll_finger_img")]
        public int enroll_finger (out PrintData print_data, out Img? img = null);

        /**
         *  Performs a new scan and verify it against a previously enrolled print.
         *
         * If the device is an imaging device, it can also return the image from
         * the scan, even when the verify fails with a RETRY code. It is legal
         * to call this function even on non-imaging devices, just don't expect
         * them to provide images.
         * 
         * @param enrolled_print    the print to verify against. Must have been
         *                          previously enrolled with a device compatible
         *                          to the device selected to perform the scan.
         * @param img               the scan image or null for no image
         * 
         * @return                  negative code on error, otherwise a code
         *                          from {@link EnrollResult}
         */
        [CCode (cname = "fp_verify_finger_img")]
        public int verify_finger (PrintData enrolled_print, out Img? img = null);

        /**
         * Performs a new scan and attempts to identify the scanned finger
         * against a collection of previously enrolled fingerprints.
         *
         * If the device is an imaging device, it can also return the image from
         * the scan, even when identification fails with a RETRY code. It is
         * legal to call this function even on non-imaging devices, just don't
         * expect them to provide images.
         *
         * This function returns codes from {@link VerifyResult}. The return
         * code {@link VerifyResult.MATCH} indicates that the scanned
         * fingerprint does appear in the print gallery, and the match_offset
         * output parameter will indicate the index into the print gallery array
         * of the matched print.
         *
         * This function will not necessarily examine the whole print gallery,
         * it will return as soon as it finds a matching print.
         *
         * Not all devices support identification. -ENOTSUP will be returned
         * when this is the case.
         * 
         * @param print_gallery     array of the prints to identify against.
         *                          Each one must have been previously enrolled
         *                          with a device compatible to the device
         *                          selected to perform the scan.
         * @param match_offset      the array index of the matched gallery print
         *                          (if any was found). Only valid if
         *                          {@link VerifyResult.MATCH} was returned.
         * @param img               the scan image or null for no image
         * 
         * @return                  negative code on error, otherwise a code
         *                          from {@link VerifyResult}
         */
        [CCode (cname = "fp_identify_finger_img")]
        public int identify_finger ([CCode (array_null_terminated = true)] PrintData[] print_gallery, out size_t match_offset, out Img? img = null);

        [CCode (cname = "fp_enroll_stage_cb")]
        public delegate void EnrollStageCallback(Dev dev, int result, owned PrintData? print, owned Img? img);
        [CCode (cname = "fp_async_enroll_start")]
        public int enroll_start (EnrollStageCallback callback);
        [CCode (cname = "fp_enroll_stop_cb")]
        public delegate void EnrollStopCallback(Dev dev);
        [CCode (cname = "fp_async_enroll_stop")]
        public int enroll_stop (EnrollStopCallback callback);
    }

    [CCode (cname = "struct fp_dscv_dev *", free_function = "fp_dscv_devs_free", has_type_id = false)]
    [Compact]
    public class DscvDevArray {
        /**
         * Searches a list of discovered devices for a device that appears to
         * be compatible with a stored print.
         * 
         * @param data      the print under inspection
         * 
         * @return          the first discovered device that appears to support
         *                  the print, or NULL if no apparently compatible
         *                  devices could be found
         */
        [CCode (cname = "fp_dscv_dev_for_print_data")]
        public unowned DscvDev dev_for_print_data(PrintData data);

        /**
         * Searches a list of discovered devices for a device that appears to
         * be compatible with a discovered print.
         * 
         * @param data      the print under inspection
         * 
         * @return          the first discovered device that appears to support
         *                  the print, or NULL if no apparently compatible
         *                  devices could be found
         */
        [CCode (cname = "fp_dscv_dev_for_dscv_print")]
        public unowned DscvDev dev_for_dscv_print(DscvPrint data);

        /**
         * Iterates all of the discovered devices in the array.
         * 
         * @param func      A function that acts on each discovered device
         */
        public void foreach (GLib.Func<DscvDev> func) {
            for (var ptr = (void **)this; ptr[0] != null; ptr++) {
                func((DscvDev)ptr[0]);
            }
        }
    }

    [CCode (cname = "struct fp_dscv_dev", has_type_id = false)]
    [Compact]
    public class DscvDev {
        /**
         * Scans the system and returns a list of discovered devices.
         *
         * This is your entry point into finding a fingerprint reader to operate. 
         */
        [CCode (cname = "fp_discover_devs")]
        public static DscvDevArray discover ();

        /**
         * Gets the driver for a discovered device.
         */
        public unowned Driver driver { get; }

        /**
         * Gets the devtype for a discovered device.
         */
        public uint32 devtype { get; }

        /**
         * Determines if a specific stored print appears to be compatible with
         * a discovered device.
         * 
         * @param data      the print for compatibility checking
         * 
         * @return          true if the print is compatible with the device,
         *                  false otherwise
         */
        public bool supports_print_data (PrintData data);

        /**
         * Determines if a specific discovered print appears to be compatible
         * with a discovered device. 
         * 
         * @param data      the discovered print for compatibility checking
         * 
         * @return          true if the print is compatible with the device,
         *                  false otherwise
         */
        public bool supports_dscv_print (DscvPrint data);
    }

    [CCode (cname = "struct fp_driver", has_type_id = false)]
    [Compact]
    public class Driver {
        /**
         * Retrieves the name of the driver.
         *
         * For example: "upekts" 
         */
        public unowned string name { get; }

        /**
         * Retrieves a descriptive name of the driver.
         *
         * For example: "UPEK TouchStrip"
         */
        public unowned string full_name { get; }

        /**
         * Retrieves the driver ID code for a driver.
         */
        public uint16 driver_id { get; }

        public ScanType scan_type { get; }
    }

    /**
     *  Numeric codes used to refer to fingers (and thumbs) of a human.
     *
     * These are purposely not available as strings, to avoid getting the
     * library tangled up in localization efforts.
     */
    [CCode (cname = "enum fp_finger", has_type_id = false)]
    public enum Finger {
        /**
         * thumb (left hand)
         */
        [CCode (cname = "LEFT_THUMB")]
        LEFT_THUMB,

        /**
         * index finger (left hand)
         */
        [CCode (cname = "LEFT_INDEX")]
        LEFT_INDEX,

        /**
         * middle finger (left hand)
         */
        [CCode (cname = "LEFT_MIDDLE")]
        LEFT_MIDDLE,

        /**
         * ring finger (left hand)
         */
        [CCode (cname = "LEFT_RING")]
        LEFT_RING,

        /**
         * little finger (left hand)
         */
        [CCode (cname = "LEFT_LITTLE")]
        LEFT_LITTLE,

        /**
         * thumb (right hand)
         */
        [CCode (cname = "RIGHT_THUMB")]
        RIGHT_THUMB,

        /**
         * index finger (right hand)
         */
        [CCode (cname = "RIGHT_INDEX")]
        RIGHT_INDEX,

        /**
         * middle finger (right hand)
         */
        [CCode (cname = "RIGHT_MIDDLE")]
        RIGHT_MIDDLE,

        /**
         * ring finger (right hand)
         */
        [CCode (cname = "RIGHT_RING")]
        RIGHT_RING,

        /**
         * little finger (right hand)
         */
        [CCode (cname = "RIGHT_LITTLE")]
        RIGHT_LITTLE,
    }

    [CCode (cname = "enum fp_scan_type", has_type_id = false)]
    public enum ScanType {
        PRESS,
        SWIPE,
    }

    [CCode (cname = "struct fp_print_data", free_function = "fp_print_data_free", has_type_id = false)]
    [Compact]
    public class PrintData {
        size_t get_data ([CCode (array_length = false)] out uint8[] ret);

        /**
         * Convert a stored print into a unified representation inside a data
         * buffer.
         *
         * You can then store this data buffer in any way that suits you, and
         * load it back at some later time using {@link from_data}.
         */
        public uint8[] data {
            [CCode (cname = "vala_fp_print_data_get_data")]
            owned get {
                uint8[] ret;
                var size = get_data (out ret);
                ret.length = (int)size;
                return (owned)ret;
            }
        }

        /**
         * Load a stored print from a data buffer.
         *
         * The contents of said buffer must be the untouched contents of a
         * buffer previously supplied to you by {@link data} 
         * 
         * @param buf   the data buffer
         *
         * @return      the stored print represented by the data, or NULL on error
         */
        public static PrintData? from_data (uint8[] buf);

        /**
         * Saves a stored print to disk, assigned to a specific finger.
         *
         * Even though you are limited to storing only the 10 human fingers,
         * this is a per-device-type limit. For example, you can store the users
         * right index finger from a DigitalPersona scanner, and you can also
         * save the right index finger from a UPEK scanner. When you later come
         * to load the print, the right one will be automatically selected.
         *
         * This function will unconditionally overwrite a fingerprint previously
         * saved for the same finger and device type. The print is saved in a
         * hidden directory beneath the current user's home directory.
         * 
         * @param finger    the finger that this print corresponds to
         * 
         * @return          0 on success, non-zero on error.
         */
        public int save (Finger finger);

        /**
         *  Loads a previously stored print from disk.
         *
         * The print must have been saved earlier using the {@link save} function.
         *
         * A return code of -ENOENT indicates that the fingerprint requested
         * could not be found. Other error codes (both positive and negative)
         * are possible for obscure error conditions (e.g. corruption).
         * 
         * @param dev       the device you are loading the print for
         * @param finger    the finger of the file you are loading
         * @param data      the corresponding stored print
         * 
         * @return          0 on success, non-zero on error
         */
        public static int load (Dev dev, Finger finger, out PrintData data);

        /**
         * Removes a stored print from disk previously saved with {@link save}.
         * 
         * @param dev       the device that the print belongs to
         * @param finger    the finger of the file you are deleting
         * 
         * @return          0 on success, negative on error
         */
        public static int delete (Dev dev, Finger finger);

        /**
         * Attempts to load a stored print based on a discovered print record.
         *
         * A return code of -ENOENT indicates that the file referred to by the
         * discovered print could not be found. Other error codes (both positive
         * and negative) are possible for obscure error conditions (e.g.
         * corruption).
         * 
         * @param print     the discovered print
         * @param data      the corresponding stored print
         * 
         * @return          0 on success, non-zero on error.
         */
        public static int from_dscv_print(DscvPrint print, out PrintData data);

        /**
         * Gets the driver ID for a stored print.
         *
         * The driver ID indicates which driver the print originally came from.
         * The print is only usable with a device controlled by that driver. 
         */
        public uint16 driver_id { get; }

        /**
         * Gets the devtype for a stored print.
         *
         * The devtype represents which type of device under the parent driver
         * is compatible with the print. 
         */
        public uint32 devtype { get; }
    }

    [CCode (cname = "struct fp_dscv_print *", free_function = "fp_dscv_prints_free", has_type_id = false)]
    [Compact]
    public class DscvPrintArray {
        public void foreach (GLib.Func<DscvPrint> func) {
            for (var ptr = (void **)this; ptr[0] != null; ptr++) {
                func((DscvPrint)ptr[0]);
            }
        }
    }

    [CCode (cname = "struct fp_dscv_print", has_type_id = false)]
    [Compact]
    public class DscvPrint {
        /**
         * Scans the users home directory and returns a list of prints that were
         * previously saved using {@link PrintData.save}.
         * 
         * @return  list of discovered prints 
         */
        [CCode (cname = "fp_discover_prints")]
        public static DscvPrintArray discover ();

        /**
         * Gets the driver ID for a discovered print.
         *
         * The driver ID indicates which driver the print originally came from.
         * The print is only usable with a device controlled by that driver. 
         */
        public uint16 driver_id { get; }

        /**
         * Gets the devtype for a discovered print.
         *
         * The devtype represents which type of device under the parent driver
         * is compatible with the print. 
         */
        public uint32 devtype { get; }

        /**
         * Gets the finger code for a discovered print. 
         */
        public Finger finger { get; }

        /**
         * Removes a discovered print from disk.
         * 
         * After successful return of this function, functions such as
         * {@link finger} will continue to operate as before, however calling
         * {@link PrintData.from_dscv_print} will fail for obvious reasons. 
         * 
         * @return      0 on success, negative on error
         */
        public int delete ();
    }

    [CCode (cname = "struct fp_img", free_function = "fp_img_free", has_type_id = false)]
    [Compact]
    public class Img {
        /**
         * Gets the pixel height of an image. 
         */
        public int height { get; }

        /**
         * Gets the pixel width of an image.
         */
        public int width { get; }
        
        [CCode (array_length = false)]
        unowned uint8[] get_data ();

        /**
         * Gets the greyscale data for an image.
         */
        public unowned uint8[] data {
            [CCode (cname = "vala_fp_img_get_data")]
            get {
                unowned uint8[] ret = get_data ();
                ret.length = width * height;
                return ret;
            }
        }

        /**
         * A quick convenience function to save an image to a file in PGM format. 
         * 
         * @param path  the path to save the image. Existing files will be
         *              overwritten.
         * 
         * @return      0 on success, non-zero on error.
         */
        public int save_to_file (string path);

        /**
         * Standardizes an image by normalizing its orientation, colors, etc.
         *
         * It is safe to call this multiple times on an image, libfprint keeps
         * track of the work it needs to do to make an image standard and will
         * not perform these operations more than once for a given image. 
         */
        public void standarize ();

        /**
         *  Get a binarized form of a standardized scanned image.
         *
         * This is where the fingerprint image has been "enhanced" and is a set
         * of pure black ridges on a pure white background. Internally, image
         * processing happens on top of the binarized image.
         *
         * The image must have been standardized otherwise this function will
         * fail.
         *
         * It is safe to binarize an image and free the original while
         * continuing to use the binarized version.
         *
         * You cannot binarize an image twice.
         * 
         * @return  a new image representing the binarized form of the original,
         * or NULL on error.
         */
        public Img binarize ();

        /**
         *  Get a list of minutiae detected in an image.
         *
         * A minutia point is a feature detected on a fingerprint, typically
         * where ridges end or split. libfprint's image processing code relies
         * upon comparing sets of minutiae, so accurate placement of minutia
         * points is critical for good imaging performance.
         *
         * The image must have been standardized otherwise this function will
         * fail.
         *
         * You cannot pass a binarized image to this function. Instead, pass
         * the original image.
         *
         * Returns a list of pointers to minutiae, where the list is of length
         * indicated in the nr_minutiae output parameter. The returned list is
         * only valid while the parent image has not been freed, and the
         * minutiae data must not be modified or freed.
         */
        public unowned Minutia[] minutiae { get; }
    }

    [CCode (cname = "struct fp_minutia", has_type_id = false)]
    [Compact]
    public class Minutia {
        public int x;
        public int y;
        public int ex;
        public int ey;
        public int direction;
        public double reliability;
        public int type;
        public int appearing;
        public int feature_id;
        [CCode (array_length_cname = "num_nbrs")]
        public int[] nbrs;
        [CCode (array_length_cname = "num_nbrs")]
        public int[] ridge_counts;
    }

    [CCode (cname = "struct fp_pollfd", free_function = "g_free", has_type_id = false)]
    public struct Pollfd {
        public int fd;
        public short events;
    }

    public bool handle_events_timeout (ref Posix.timeval timeout);
    public bool handle_events ();

    [CCode (cname = "fp_get_pollfds")]
    public size_t _get_pollfds ([CCode (array_length = false)] out Pollfd[] pollfds);
    [CCode (cname = "vala_fp_get_pollfds")]
    public Pollfd[] get_pollfds () {
        Pollfd[] pollfds;
        var size = _get_pollfds (out pollfds);
        pollfds.length = (int)size;

        return (owned)pollfds;
    }

    public bool get_next_timeout (out Posix.timeval tv);

    [CCode (cname = "fp_pollfd_added_cb", has_target = false, has_type_id = false)]
    public delegate void PollfdAddedCallback (int fd, short events);
    [CCode (cname = "fp_pollfd_removed_cb", has_target = false, has_type_id = false)]
    public delegate void PollfdRemovedCallback (int fd);
    public void set_pollfd_notifiers (PollfdAddedCallback added_cb, PollfdRemovedCallback remove_cb);
}
