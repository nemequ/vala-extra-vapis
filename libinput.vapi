/* libinput Vala Bindings
 * Copyright (c) 2019 Hannes Schulze <haschu0103@gmail.com>
 *
 * Permission is hereby granted, free of charge, to any person obtaining a
 * copy of this software and associated documentation files (the "Software"),
 * to deal in the Software without restriction, including without limitation
 * the rights to use, copy, modify, merge, publish, distribute, sublicense,
 * and/or sell copies of the Software, and to permit persons to whom the
 * Software is furnished to do so, subject to the following conditions:
 *
 * The above copyright notice and this permission notice (including the next
 * paragraph) shall be included in all copies or substantial portions of the
 * Software.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL
 * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
 * FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
 * DEALINGS IN THE SOFTWARE.
 */

[CCode (cheader_filename = "libinput.h")]
namespace Libinput {
    /**
     * Event type for events returned by {@link Context.get_event}.
     */
    [CCode (cname = "enum libinput_event_type", cprefix = "LIBINPUT_EVENT_", has_type_id = false)]
    public enum EventType {
        NONE,
        DEVICE_ADDED,
        DEVICE_REMOVED,
        KEYBOARD_KEY,
        POINTER_MOTION,
        POINTER_MOTION_ABSOLUTE,
        POINTER_BUTTON,
        POINTER_AXIS,
        TOUCH_DOWN,
        TOUCH_UP,
        TOUCH_MOTION,
        TOUCH_CANCEL,
        TOUCH_FRAME,
        TABLET_TOOL_AXIS,
        TABLET_TOOL_PROXIMITY,
        TABLET_TOOL_TIP,
        TABLET_TOOL_BUTTON,
        TABLET_PAD_BUTTON,
        TABLET_PAD_RING,
        TABLET_PAD_STRIP,
        GESTURE_SWIPE_BEGIN,
        GESTURE_SWIPE_UPDATE,
        GESTURE_SWIPE_END,
        GESTURE_PINCH_BEGIN,
        GESTURE_PINCH_UPDATE,
        GESTURE_PINCH_END,
        SWITCH_TOGGLE
    }
    [CCode (cname = "enum libinput_led", cprefix = "LIBINPUT_LED_", has_type_id = "false")]
    public enum LED {
        NUM_LOCK,
        CAPS_LOCK,
        SCROLL_LOCK
    }
    [CCode (cname = "enum libinput_device_capability", cprefix = "LIBINPUT_DEVICE_CAP_", has_type_id = "false")]
    public enum DeviceCapability {
        KEYBOARD,
        POINTER,
        TOUCH,
        TABLET_TOOL,
        TABLET_PAD,
        GESTURE,
        SWITCH
    }
    [CCode (cname = "enum libinput_switch", cprefix = "LIBINPUT_SWITCH_", has_type_id = "false")]
    public enum Switch {
        LID,
        TABLET_MODE
    }
    [CCode (cname = "enum libinput_key_state", cprefix = "LIBINPUT_KEY_STATE_", has_type_id = "false")]
    public enum KeyState {
        RELEASED,
        PRESSED
    }
    [CCode (cname = "enum libinput_button_state", cprefix = "LIBINPUT_BUTTON_STATE_", has_type_id = "false")]
    public enum ButtonState {
        RELEASED,
        PRESSED
    }
    [CCode (cname = "enum libinput_pointer_axis", cprefix = "LIBINPUT_POINTER_AXIS_", has_type_id = "false")]
    public enum PointerAxis {
        SCROLL_VERTICAL,
        SCROLL_HORIZONTAL
    }
    [CCode (cname = "enum libinput_pointer_axis_source", cprefix = "LIBINPUT_POINTER_AXIS_SOURCE_", has_type_id = "false")]
    public enum PointerAxisSource {
        WHEEL,
        FINGER,
        CONTINUOUS,
        WHEEL_TILT
    }
    [CCode (cname = "enum libinput_switch_state", cprefix = "LIBINPUT_SWITCH_STATE_", has_type_id = "false")]
    public enum SwitchState {
        OFF,
        ON
    }
    [CCode (cname = "enum libinput_tablet_pad_ring_axis_source", cprefix = "LIBINPUT_TABLET_PAD_RING_SOURCE_", has_type_id = "false")]
    public enum TabletPadRingAxisSource {
        UNKNOWN,
        FINGER
    }
    [CCode (cname = "enum libinput_tablet_pad_strip_axis_source", cprefix = "LIBINPUT_TABLET_PAD_STRIP_SOURCE_", has_type_id = "false")]
    public enum TabletPadStripAxisSource {
        UNKNOWN,
        FINGER
    }
    [CCode (cname = "enum libinput_tablet_tool_proximity_state", cprefix = "LIBINPUT_TABLET_TOOL_PROXIMITY_STATE_", has_type_id = "false")]
    public enum TabletToolProximityState {
        OUT,
        IN
    }
    [CCode (cname = "enum libinput_tablet_tool_tip_state", cprefix = "LIBINPUT_TABLET_TOOL_TIP_", has_type_id = "false")]
    public enum TabletToolTipState {
        UP,
        DOWN
    }
    [CCode (cname = "enum libinput_log_priority", cprefix = "LIBINPUT_LOG_PRIORITY_", has_type_id = "false")]
    public enum LogPriority {
        DEBUG,
        INFO,
        ERROR
    }
    [CCode (cname = "enum libinput_config_status", cprefix = "LIBINPUT_CONFIG_STATUS_", has_type_id = "false")]
    public enum ConfigStatus {
        SUCCESS,
        UNSUPPORTED,
        INVALID
    }
    [CCode (cname = "enum libinput_config_tap_state", cprefix = "LIBINPUT_CONFIG_TAP_", has_type_id = "false")]
    public enum ConfigTapState {
        DISABLED,
        ENABLED
    }
    [CCode (cname = "enum libinput_config_tap_button_map", cprefix = "LIBINPUT_CONFIG_TAP_MAP_", has_type_id = "false")]
    public enum ConfigTapButtonMap {
        LRM,
        LMR
    }
    [CCode (cname = "enum libinput_config_drag_state", cprefix = "LIBINPUT_CONFIG_DRAG_", has_type_id = "false")]
    public enum ConfigDragState {
        DISABLED,
        ENABLED
    }
    [CCode (cname = "enum libinput_config_drag_lock_state", cprefix = "LIBINPUT_CONFIG_DRAG_LOCK_", has_type_id = "false")]
    public enum ConfigDragLockState {
        DISABLED,
        ENABLED
    }
    [CCode (cname = "enum libinput_config_accel_profile", cprefix = "LIBINPUT_CONFIG_ACCEL_PROFILE_", has_type_id = "false")]
    public enum ConfigAccelProfile {
        NONE,
        FLAT,
        ADAPTIVE
    }
    [CCode (cname = "enum libinput_config_click_method", cprefix = "LIBINPUT_CONFIG_CLICK_METHOD_", has_type_id = "false")]
    public enum ConfigClickMethod {
        NONE,
        BUTTON_AREAS,
        CLICKFINGER
    }
    [CCode (cname = "enum libinput_config_middle_emulation_state", cprefix = "LIBINPUT_CONFIG_MIDDLE_EMULATION_", has_type_id = "false")]
    public enum ConfigMiddleEmulationState {
        DISABLED,
        ENABLED
    }
    [CCode (cname = "enum libinput_config_scroll_method", cprefix = "LIBINPUT_CONFIG_SCROLL_", has_type_id = "false")]
    public enum ConfigScrollMethod {
        NO_SCROLL,
        2FG,
        EDGE,
        ON_BUTTON_DOWN
    }
    [CCode (cname = "enum libinput_config_dwt_state", cprefix = "LIBINPUT_CONFIG_DWT_", has_type_id = "false")]
    public enum ConfigDwtState {
        DISABLED,
        ENABLED
    }
    [CCode (cname = "enum libinput_tablet_tool_type", cprefix = "LIBINPUT_TABLET_TOOL_TYPE_", has_type_id = "false")]
    public enum TabletToolType {
        PEN,
        ERASER,
        BRUSH,
        PENCIL,
        AIRBRUSH,
        MOUSE,
        LENS
    }

    /**
     * Log handler type for custom logging.
     *
     * @param libinput The libinput context
     * @param priority The priority of the current message
     * @param format Message format in printf-style
     * @param args Message arguments
     *
     * @see Context.log_set_priority
     * @see Context.log_get_priority
     * @see Context.log_set_handler
     */
    [CCode (cname = "libinput_log_handler", has_target = false)]
    public delegate void LogHandler (Context libinput, LogPriority priority, string format, va_list args);

    /**
     * A handle for accessing libinput.
     */
    [CCode (cname = "struct libinput", cprefix="libinput_", ref_function = "libinput_ref", unref_function = "libinput_unref")]
    [Compact]
    public class Context {
        [CCode (simple_generics = true)]
        public void set_user_data<T> (T user_data);
        [CCode (simple_generics = true)]
        public T get_user_data<T> ();

        /**
         * Create a new libinput context from udev. This context is inactive until
         * assigned a seat ID with {@link udev_assign_seat}.
         *
         * @param iface The callback interface
         * @param udev An already initialized udev context
         *
         * @return An initialized, but inactive libinput context or NULL on error
         */
        [CCode (simple_generics = true)]
        public static Context? udev_create_context<T> (Interface iface, T user_data, Udev.Udev udev);

        /**
         * Assign a seat to this libinput context. New devices or the removal of
         * existing devices will appear as events during {@link dispatch}.
         *
         * {@link udev_assign_seat} succeeds even if no input devices are currently
         * available on this seat, or if devices are available but fail to open in
         * {@link Interface.open_restricted}. Devices that do not have the
         * minimum capabilities to be recognized as pointer, keyboard or touch
         * device are ignored. Such devices and those that failed to open
         * ignored until the next call to {@link resume}.
         *
         * This function may only be called once per context.
         *
         * @param seat_id A seat identifier. This string must not be NULL.
         *
         * @return 0 on success or -1 on failure.
         */
        public int udev_assign_seat (string seat_id);

        /**
         * Create a new libinput context that requires the caller to manually add or
         * remove devices with {@link path_add_device} and
         * {@link path_remove_device}.
         *
         * The context is fully initialized but will not generate events until at
         * least one device has been added.
         *
         * @param iface The callback interface
         *
         * @return An initialized, empty libinput context.
         */
        [CCode (simple_generics = true)]
        public static Context path_create_context<T> (Interface iface, T user_data);
        /**
         * Add a device to a libinput context initialized with
         * {@link path_create_context}. If successful, the device will be
         * added to the internal list and re-opened on {@link resume}. The device
         * can be removed with {@link path_remove_device}.
         *
         * ''NOTE:'' It is an application bug to call this function on a libinput
         * context initialized with {@link udev_create_context}.
         *
         * @param path Path to an input device
         * @return The newly initiated device on success, or NULL on failure.
         */
        public Device? path_add_device (string path);
        /**
         * Remove a device from a libinput context initialized with
         * {@link path_create_context} or added to such a context with
         * {@link path_add_device}.
         *
         * Events already processed from this input device are kept in the queue,
         * the {@link EventType.DEVICE_REMOVED} event marks the end of events for
         * this device.
         *
         * If no matching device exists, this function does nothing.
         *
         * ''NOTE:'' It is an application bug to call this function on a libinput
         * context initialized with {@link udev_create_context}.
         *
         * @param device A libinput device
         */
        [CCode (cname = "libinput_path_remove_device")]
        public static void path_remove_device (Device device);

        /**
         * libinput keeps a single file descriptor for all events.
         *
         * Call into {@link dispatch} if any events become available on this fd.
         *
         * @return The file descriptor used to notify of pending events.
         */
        public int get_fd ();
        /**
         * Main event dispatchment function. Reads events of the file descriptors
         * and processes them internally. Use {@link get_event} to retrieve the
         * events.
         *
         * Dispatching does not necessarily queue libinput events. This function
         * should be called immediately once data is available on the file
         * descriptor returned by {@link get_fd}. libinput has a number of
         * timing-sensitive features (e.g. tap-to-click), any delay in calling
         * {@link dispatch} may prevent these features from working correctly.
         *
         * @return 0 on success, or a negative errno on failure
         */
        public int dispatch ();
        /**
         * Retrieve the next event from libinput's internal event queue.
         *
         * @return The next available event, or null if no event is available.
         */
        public Event? get_event ();
        /**
         * Return the type of the next event in the internal queue. This function
         * does not pop the event off the queue and the next call to
         * {@link get_event} returns that event.
         *
         * @return The event type of the next available event or {@link
         * EventType.NONE} if no event is available.
         */
        public EventType next_event_type ();
        /**
         * Resume a suspended libinput context. This re-enables device
         * monitoring and adds existing devices.
         *
         * @see suspend
         *
         * @return 0 on success or -1 on failure
         */
        public int resume ();
        /**
         * Suspend monitoring for new devices and close existing devices.
         * This all but terminates libinput but does keep the context
         * valid to be resumed with {@link resume}.
         */
        public void suspend ();
        /**
         * Set the log priority for the libinput context. Messages with priorities
         * equal to or higher than the argument will be printed to the context's
         * log handler.
         *
         * The default log priority is {@link LogPriority.ERROR}.
         *
         * @param priority The minimum priority of log messages to print.
         *
         * @see log_set_handler
         * @see log_get_priority
         */
        public void log_set_priority (LogPriority priority);
        /**
         * Get the context's log priority. Messages with priorities equal to or
         * higher than the argument will be printed to the current log handler.
         *
         * The default log priority is {@link LogPriority.ERROR}.
         *
         * @return The minimum priority of log messages to print.
         *
         * @see log_set_handler
         * @see log_set_priority
         */
        public LogPriority log_get_priority ();
        /**
         * Set the context's log handler. Messages with priorities equal to or
         * higher than the context's log priority will be passed to the given
         * log handler.
         *
         * The default log handler prints to stderr.
         *
         * @param log_handler The log handler for library messages.
         *
         * @see log_set_priority
         * @see log_get_priority
         */
        public void log_set_handler (LogHandler log_handler);
    }

    /**
     * A base handle for accessing libinput devices.
     */
    [CCode (cname = "struct libinput_device", ref_function = "libinput_device_ref", unref_function = "libinput_device_unref")]
    [Compact]
    public class Device {
        [CCode (simple_generics = true)]
        public void set_user_data<T> (T user_data);
        [CCode (simple_generics = true)]
        public T get_user_data<T> ();

        /**
         * Get the libinput context from the device.
         *
         * @return The Context for this device.
         */
        public unowned Context get_context ();
        /**
         * Get the device group this device is assigned to. Some physical
         * devices like graphics tablets are represented by multiple kernel
         * devices and thus by multiple {@link Device}.
         *
         * libinput assigns these devices to the same {@link DeviceGroup}
         * allowing the caller to identify such devices and adjust configuration
         * settings accordingly. For example, setting a tablet to left-handed often
         * means turning it upside down. A touch device on the same tablet would
         * need to be turned upside down too to work correctly.
         *
         * All devices are part of a device group though for most devices the group
         * will be a singleton. A device is assigned to a device group on {@link
         * EventType.DEVICE_ADDED} and removed from that group on {@link
         * EventType.DEVICE_REMOVED}. It is up to the caller to track how many
         * devices are in each device group.
         *
         * Device groups do not get re-used once the last device in the group was
         * removed, i.e. unplugging and re-plugging a physical device with grouped
         * devices will return a different device group after every unplug.
         *
         * @return The device group this device belongs to
         */
        public DeviceGroup get_device_group ();
        /**
         * Get the system name of the device.
         *
         * To get the descriptive device name, use {@link get_name}.
         *
         * @return System name of the device
         */
        public unowned string get_sysname ();
        /**
         * The descriptive device name as advertised by the kernel and/or the
         * hardware itself. To get the sysname for this device, use
         * {@link get_sysname}.
         *
         * The lifetime of the returned string is tied to the Device.
         * The string may be the empty string but is never NULL.
         *
         * @return The device name
         */
        public unowned string? get_name ();
        /**
         * Get the product ID for this device.
         *
         * @return The product ID of this device
         */
        public uint get_id_product ();
        /**
         * Get the vendor ID for this device.
         *
         * @return The vendor ID of this device
         */
        public uint get_id_vendor ();
        /**
         * A device may be mapped to a single output, or all available outputs. If a
         * device is mapped to a single output only, a relative device may not move
         * beyond the boundaries of this output. An absolute device has its input
         * coordinates mapped to the extents of this output.
         *
         * ''NOTE: Use of this function is discouraged.'' Its return value is not
         * precisely defined and may not be understood by the caller or may be
         * insufficient to map the device. Instead, the system configuration could
         * set a udev property the caller understands and interprets correctly. The
         * caller could then obtain device with {@link get_udev_device}
         * and query it for this property. For more complex cases, the caller
         * must implement monitor-to-device association heuristics.
         *
         * @return The name of the output this device is mapped to, or NULL if no
         * output is set
         */
        public unowned string? get_output_name ();
        /**
         * Get the seat associated with this input device, see seats for
         * details.
         *
         * A seat can be uniquely identified by the physical and logical seat name.
         * There will ever be only one seat instance with a given physical and logical
         * seat name pair at any given time, but if no external reference is kept, it
         * may be destroyed if no device belonging to it is left.
         *
         * @return The seat this input device belongs to
         */
        public Seat get_seat ();
        /**
         * Change the logical seat associated with this device by removing the
         * device and adding it to the new seat.
         *
         * This command is identical to physically unplugging the device, then
         * re-plugging it as a member of the new seat. libinput will generate a
         * {@link EventType.DEVICE_REMOVED} event and this {@link Device} is
         * considered removed from the context; it will not generate further events
         * and will be freed when the refcount reaches zero.
         * A {@link EventType.DEVICE_ADDED} event is generated with a new {@link
         * Device} handle. It is the caller's responsibility to update
         * references to the new device accordingly.
         *
         * If the logical seat name already exists in the device's physical seat,
         * the device is added to this seat. Otherwise, a new seat is created.
         *
         * ''NOTE:'' This change applies to this device until removal or {@link
         * Context.suspend}, whichever happens earlier.
         *
         * @param name The new logical seat name
         * @return 0 on success, non-zero on error
         */
        public int set_seat_logical_name (string name);
        /**
         * Return a udev handle to the device that is this libinput device, if any.
         *
         * Some devices may not have a udev device, or the udev device may be unobtainable.
         * This function returns NULL if no udev device was available.
         *
         * Calling this function multiple times for the same device may not return the same udev handle each time.
         */
        public Udev.Device? get_udev_device ();
        /**
         * Update the LEDs on the device, if any. If the device does not have
         * LEDs, or does not have one or more of the LEDs given in the mask, this
         * function does nothing.
         *
         * @param leds A mask of the LEDs to set, or unset.
         */
        public void led_update (LED leds);
        /**
         * Check if the given device has the specified capability
         *
         * @return Non-zero if the given device has the capability or zero otherwise
         */
        public int has_capability (DeviceCapability capability);
        /**
         * Get the physical size of a device in mm, where meaningful. This function
         * only succeeds on devices with the required data, i.e. tablets, touchpads
         * and touchscreens.
         *
         * If this function returns nonzero, width and height are unmodified.
         *
         * @param width Set to the width of the device
         * @param height Set to the height of the device
         * @return 0 on success, or nonzero otherwise
         */
        public int get_size (out double width, out double height);
        /**
         * Check if a {@link DeviceCapability.POINTER} device has a button with the
         * given code (see linux/input.h).
         *
         * @param code Button code to check for, e.g. //BTN_LEFT//
         *
         * @return 1 if the device supports this button code, 0 if it does not, -1
         * on error.
         */
        public int pointer_has_button (uint32 code);
        /**
         * Check if a {@link DeviceCapability.KEYBOARD} device has a key with the
         * given code (see linux/input.h).
         *
         * @param code Key code to check for, e.g. //KEY_ESC//
         *
         * @return 1 if the device supports this key code, 0 if it does not, -1
         * on error.
         */
        public int keyboard_has_key (uint32 code);
        /**
         * Check if a {@link DeviceCapability.SWITCH} device has a switch of the
         * given type.
         *
         * @param sw Switch to check for
         *
         * @return 1 if the device supports this switch, 0 if it does not, -1
         * on error.
         */
        public int switch_has_switch (Switch sw);
        /**
         * Return the number of buttons on a device with the
         * {@link DeviceCapability.TABLET_PAD} capability.
         * Buttons on a pad device are numbered sequentially, see
         * tablet-pad-buttons for details.
         *
         * @return The number of buttons supported by the device.
         */
        public int tablet_pad_get_num_buttons ();
        /**
         * Return the number of rings a device with the {@link
         * DeviceCapability.TABLET_PAD} capability provides.
         *
         * @return The number of rings or 0 if the device has no rings.
         *
         * @see Event.TabletPad.get_ring_number
         */
        public int tablet_pad_get_num_rings ();
        /**
         * Return the number of strips a device with the {@link
         * DeviceCapability.TABLET_PAD} capability provides.
         *
         * @return The number of strips or 0 if the device has no strips.
         *
         * @see Event.TabletPad.get_strip_number
         */
        public int tablet_pad_get_num_strips ();
        /**
         * Most devices only provide a single mode group, however devices such as
         * the Wacom Cintiq 22HD provide two mode groups. If multiple mode groups
         * are available, a caller should use
         * {@link TabletPadModeGroup.has_button},
         * {@link TabletPadModeGroup.has_ring} and
         * {@link TabletPadModeGroup.has_strip} to associate each button,
         * ring and strip with the correct mode group.
         *
         * @return the number of mode groups available on this device
         */
        public int tablet_pad_get_num_mode_groups ();
        public TabletPadModeGroup tablet_pad_get_mode_group (uint index);
        public int config_tap_get_finger_count ();
        public ConfigStatus config_tap_set_enabled (ConfigTapState enable);
        public ConfigTapState config_tap_get_enabled ();
        public ConfigTapState config_tap_get_default_enabled ();
        public ConfigStatus config_tap_set_button_map (ConfigTapButtonMap map);
        public ConfigTapButtonMap config_tap_get_button_map ();
        public ConfigTapButtonMap config_tap_get_default_button_map ();
        public ConfigStatus config_tap_set_drag_enabled (ConfigDragState enable);
        public ConfigDragState config_tap_get_drag_enabled ();
        public ConfigDragState config_tap_get_default_drag_enabled ();
        public ConfigStatus config_tap_set_drag_lock_enabled (ConfigDragLockState enable);
        public ConfigDragLockState config_tap_get_drag_lock_enabled ();
        public ConfigDragLockState config_tap_get_default_drag_lock_enabled ();
        public int config_calibration_has_matrix ();
        public ConfigStatus config_calibration_set_matrix (float matrix[6]);
        public int config_calibration_get_matrix (out float matrix[6]);
        public int config_calibration_get_default_matrix (out float matrix[6]);
        public uint32 config_send_events_get_modes ();
        public ConfigStatus config_send_events_set_mode (uint32 mode);
        public uint32 config_send_events_get_mode ();
        public uint32 config_send_events_get_default_mode ();
        public int config_accel_is_available ();
        public ConfigStatus config_accel_set_speed (double speed);
        public double config_accel_get_speed ();
        public double config_accel_get_default_speed ();
        public uint32 config_accel_get_profiles ();
        public ConfigStatus config_accel_set_profile (ConfigAccelProfile mode);
        public ConfigAccelProfile config_accel_get_profile ();
        public ConfigAccelProfile config_accel_get_default_profile ();
        public int config_scroll_has_natural_scroll ();
        public ConfigStatus config_scroll_set_natural_scroll_enabled (int enable);
        public int config_scroll_get_natural_scroll_enabled ();
        public int config_scroll_get_default_natural_scroll_enabled ();
        public int config_left_handed_is_available ();
        public ConfigStatus config_left_handed_set (int left_handed);
        public int config_left_handed_get ();
        public int config_left_handed_get_default ();
        public uint32 config_click_get_methods ();
        public ConfigStatus config_click_set_method (ConfigClickMethod method);
        public ConfigClickMethod config_click_get_method ();
        public ConfigClickMethod config_click_get_default_method ();
        public int config_middle_emulation_is_available ();
        public ConfigStatus config_middle_emulation_set_enabled (ConfigMiddleEmulationState enable);
        public ConfigMiddleEmulationState config_middle_emulation_get_enabled ();
        public ConfigMiddleEmulationState config_middle_emulation_get_default_enabled ();
        public uint32 config_scroll_get_methods ();
        public ConfigStatus config_scroll_set_method (ConfigScrollMethod method);
        public ConfigScrollMethod config_scroll_get_method ();
        public ConfigScrollMethod config_scroll_get_default_method ();
        public ConfigStatus config_scroll_set_button (uint32 button);
        public uint32 config_scroll_get_button ();
        public uint32 config_scroll_get_default_button ();
        public int config_dwt_is_available ();
        public ConfigStatus config_dwt_set_enabled (ConfigDwtState enable);
        public ConfigDwtState config_dwt_get_enabled ();
        public ConfigDwtState config_dwt_get_default_enabled ();
        public int config_rotation_is_available ();
        public ConfigStatus config_rotation_set_angle (uint degrees_cw);
        public uint config_rotation_get_angle ();
        public uint config_rotation_get_default_angle ();
    }

    /**
     * A base handle for accessing libinput device groups.
     */
    [CCode (cname = "struct libinput_device_group", ref_function = "libinput_device_group_ref", unref_function = "libinput_device_group_unref")]
    [Compact]
    public class DeviceGroup {
        [CCode (simple_generics = true)]
        public void set_user_data<T> (T user_data);
        [CCode (simple_generics = true)]
        public T get_user_data<T> ();
    }

    /**
     * The base event type.
     */
    [CCode (cname = "struct libinput_event", free_function = "libinput_event_destroy")]
    [Compact]
    public class Event {
        /**
         * Get the type of the event.
         */
        public unowned EventType get_type ();
        /**
         * Get the libinput context from the event.
         *
         * @return The libinput context for this event.
         */
        public unowned Context get_context ();
        /**
         * Return the device associated with this event. For device added/removed
         * events this is the device added or removed. For all other device events,
         * this is the device that generated the event.
         *
         * @return The device associated with this event
         */
        public unowned Device get_device ();
        /**
         * Return the pointer event that is this input event. If the event type does
         * not match the pointer event types, this function returns null.
         *
         * The inverse of this function is {@link Event.Pointer.get_base_event}.
         *
         * @return A pointer event, or null for other events
         */
        public unowned Event.Pointer? get_pointer_event ();
        /**
         * Return the keyboard event that is this input event. If the event type does
         * not match the keyboard event types, this function returns null.
         *
         * The inverse of this function is {@link Event.Keyboard.get_base_event}.
         *
         * @return A keyboard event, or null for other events
         */
        public unowned Event.Keyboard? get_keyboard_event ();
        /**
         * Return the touch event that is this input event. If the event type does
         * not match the touch event types, this function returns null.
         *
         * The inverse of this function is {@link Event.Touch.get_base_event}.
         *
         * @return A touch event, or null for other events
         */
        public unowned Event.Touch? get_touch_event ();
        /**
         * Return the gesture event that is this input event. If the event type does
         * not match the gesture event types, this function returns null.
         *
         * The inverse of this function is {@link Event.Gesture.get_base_event}.
         *
         * @return A gesture event, or null for other events
         */
        public unowned Event.Gesture? get_gesture_event ();
        /**
         * Return the tablet tool event that is this input event. If the event type
         * does not match the tablet tool event types, this function returns null.
         *
         * The inverse of this function is {@link Event.TabletTool.get_base_event}.
         *
         * @return A tablet tool event, or null for other events
         */
        public unowned Event.TabletTool? get_tablet_tool_event ();
        /**
         * Return the tablet pad event that is this input event. If the event type does not
         * match the tablet pad event types, this function returns null.
         *
         * The inverse of this function is {@link Event.TabletPad.get_base_event}.
         *
         * @return A tablet pad event, or null for other events
         */
        public unowned Event.TabletPad? get_tablet_pad_event ();
        /**
         * Return the switch event that is this input event. If the event type does
         * not match the switch event types, this function returns null.
         *
         * The inverse of this function is {@link Event.Switch.get_base_event}.
         *
         * @return A switch event, or null for other events
         */
        public unowned Event.Switch? get_switch_event ();
        /**
         * Return the device event that is this input event. If the event type does
         * not match the device event types, this function returns null.
         *
         * The inverse of this function is {@link Event.DeviceNotify.get_base_event}.
         *
         * @return A device event, or null for other events
         */
        public unowned Event.DeviceNotify? get_device_notify_event ();

        /**
         * An event notifying the caller of a device being added or removed.
         */
        [CCode (cname = "struct libinput_event_device_notify")]
        [Compact]
        public class DeviceNotify {
            public unowned Event get_base_event ();
        }

        /**
         * A keyboard event representing a key press/release.
         */
        [CCode (cname = "struct libinput_event_keyboard")]
        [Compact]
        public class Keyboard {
            public unowned Event get_base_event ();
            public uint32 get_time ();
            public uint64 get_time_usec ();
            public uint32 get_key ();
            public KeyState get_key_state ();
            /**
             * For the key of a {@link EventType.KEYBOARD_KEY} event, return the total number
             * of keys pressed on all devices on the associated seat after the event was
             * triggered.
             *
             * ''NOTE:'' It is an application bug to call this function for events other than
             * {@link EventType.KEYBOARD_KEY}. For other events, this function returns 0.
             *
             * @return The seat wide pressed key count for the key of this event
             */
            public uint32 get_seat_key_count ();
        }

        /**
         * A pointer event representing relative or absolute pointer movement,
         * a button press/release or scroll axis events.
         */
        [CCode (cname = "struct libinput_event_pointer")]
        [Compact]
        public class Pointer {
            public unowned Event get_base_event ();
            public uint32 get_time ();
            public uint64 get_time_usec ();
            /**
             * Return the delta between the last event and the current event. For pointer
             * events that are not of type {@link EventType.POINTER_MOTION}, this
             * function returns 0.
             *
             * If a device employs pointer acceleration, the delta returned by this
             * function is the accelerated delta.
             *
             * Relative motion deltas are to be interpreted as pixel movement of a
             * standardized mouse. See motion_normalization for more details.
             *
             * ''NOTE:'' It is an application bug to call this function for events other than
             * {@link EventType.POINTER_MOTION}.
             *
             * @return The relative x movement since the last event
             */
            public double get_dx ();
            /**
             * Return the delta between the last event and the current event. For pointer
             * events that are not of type {@link EventType.POINTER_MOTION}, this
             * function returns 0.
             *
             * If a device employs pointer acceleration, the delta returned by this
             * function is the accelerated delta.
             *
             * Relative motion deltas are to be interpreted as pixel movement of a
             * standardized mouse. See motion_normalization for more details.
             *
             * ''NOTE:'' It is an application bug to call this function for events other than
             * {@link EventType.POINTER_MOTION}.
             *
             * @return The relative y movement since the last event
             */
            public double get_dy ();
            /**
             * Return the relative delta of the unaccelerated motion vector of the
             * current event. For pointer events that are not of type {@link
             * EventType.POINTER_MOTION}, this function returns 0.
             *
             * Relative unaccelerated motion deltas are raw device coordinates.
             * Note that these coordinates are subject to the device's native
             * resolution. Touchpad coordinates represent raw device coordinates in the
             * X resolution of the touchpad. See motion_normalization for more
             * details.
             *
             * Any rotation applied to the device also applies to unaccelerated motion
             * (see {@link Device.config_rotation_set_angle}).
             *
             * ''NOTE:''' It is an application bug to call this function for events other than
             * {@link EventType.POINTER_MOTION}.
             *
             * @return The unaccelerated relative x movement since the last event
             */
            public double get_dx_unaccelerated ();
            /**
             * Return the relative delta of the unaccelerated motion vector of the
             * current event. For pointer events that are not of type {@link
             * EventType.POINTER_MOTION}, this function returns 0.
             *
             * Relative unaccelerated motion deltas are raw device coordinates.
             * Note that these coordinates are subject to the device's native
             * resolution. Touchpad coordinates represent raw device coordinates in the
             * X resolution of the touchpad. See motion_normalization for more
             * details.
             *
             * Any rotation applied to the device also applies to unaccelerated motion
             * (see {@link Device.config_rotation_set_angle}).
             *
             * ''NOTE:''' It is an application bug to call this function for events other than
             * {@link EventType.POINTER_MOTION}.
             *
             * @return The unaccelerated relative y movement since the last event
             */
            public double get_dy_unaccelerated ();
            /**
             * Return the current absolute x coordinate of the pointer event, in mm from
             * the top left corner of the device. To get the corresponding output screen
             * coordinate, use {@link get_absolute_x_transformed}.
             *
             * For pointer events that are not of type
             * {@link EventType.POINTER_MOTION_ABSOLUTE}, this function returns 0.
             *
             * ''NOTE:''' It is an application bug to call this function for events other than
             * {@link EventType.POINTER_MOTION_ABSOLUTE}.
             *
             * @return The current absolute x coordinate
             */
            public double get_absolute_x ();
            /**
             * Return the current absolute y coordinate of the pointer event, in mm from
             * the top left corner of the device. To get the corresponding output screen
             * coordinate, use {@link get_absolute_y_transformed}.
             *
             * For pointer events that are not of type
             * {@link EventType.POINTER_MOTION_ABSOLUTE}, this function returns 0.
             *
             * ''NOTE:''' It is an application bug to call this function for events other than
             * {@link EventType.POINTER_MOTION_ABSOLUTE}.
             *
             * @return The current absolute y coordinate
             */
            public double get_absolute_y ();
            /**
             * Return the current absolute x coordinate of the pointer event, transformed to
             * screen coordinates.
             *
             * For pointer events that are not of type
             * {@link EventType.POINTER_MOTION_ABSOLUTE}, the return value of this
             * function is undefined.
             *
             * ''NOTE:''' It is an application bug to call this function for events other than
             * {@link EventType.POINTER_MOTION_ABSOLUTE}.
             *
             * @param width The current output screen width
             * @return The current absolute x coordinate transformed to a screen coordinate
             */
            public double get_absolute_x_transformed (uint32 width);
            /**
             * Return the current absolute y coordinate of the pointer event, transformed to
             * screen coordinates.
             *
             * For pointer events that are not of type
             * {@link EventType.POINTER_MOTION_ABSOLUTE}, the return value of this function is
             * undefined.
             *
             * ''NOTE:''' It is an application bug to call this function for events other than
             * {@link EventType.POINTER_MOTION_ABSOLUTE}.
             *
             * @param height The current output screen height
             * @return The current absolute y coordinate transformed to a screen coordinate
             */
            public double get_absolute_y_transformed (uint32 height);
            /**
             * Return the button that triggered this event.
             * For pointer events that are not of type {@link
             * EventType.POINTER_BUTTON}, this function returns 0.
             *
             * ''NOTE:''' It is an application bug to call this function for events other than
             * {@link EventType.POINTER_BUTTON}.
             *
             * @return The button triggering this event
             */
            public uint32 get_button ();
            /**
             * Return the button state that triggered this event.
             * For pointer events that are not of type {@link
             * EventType.POINTER_BUTTON}, this function returns 0.
             *
             * ''NOTE:''' It is an application bug to call this function for events other than
             * {@link EventType.POINTER_BUTTON}.
             *
             * @return The button state triggering this event
             */
            public ButtonState get_button_state ();
            /**
             * For the button of a {@link EventType.POINTER_BUTTON} event, return the
             * total number of buttons pressed on all devices on the associated seat
             * after the event was triggered.
             *
             * ''NOTE:''' It is an application bug to call this function for events other than
             * {@link EventType.POINTER_BUTTON}. For other events, this function
             * returns 0.
             *
             * @return The seat wide pressed button count for the key of this event
             */
            public uint32 get_seat_button_count ();
            /**
             * Check if the event has a valid value for the given axis.
             *
             * If this function returns non-zero for an axis and
             * {@link get_axis_value} returns a value of 0, the event
             * is a scroll stop event.
             *
             * For pointer events that are not of type {@link EventType.POINTER_AXIS},
             * this function returns 0.
             *
             * ''NOTE:''' It is an application bug to call this function for events other than
             * {@link EventType.POINTER_AXIS}.
             *
             * @return Non-zero if this event contains a value for this axis
             */
            public int has_axis (PointerAxis axis);
            /**
             * Return the axis value of the given axis. The interpretation of the value
             * depends on the axis. For the two scrolling axes
             * {@link PointerAxis.SCROLL_VERTICAL} and
             * {@link PointerAxis.SCROLL_HORIZONTAL}, the value of the event is in
             * relative scroll units, with the positive direction being down or right,
             * respectively. For the interpretation of the value, see
             * {@link get_axis_source}.
             *
             * If {@link has_axis} returns 0 for an axis, this function
             * returns 0 for that axis.
             *
             * For pointer events that are not of type {@link EventType.POINTER_AXIS},
             * this function returns 0.
             *
             * ''NOTE:''' It is an application bug to call this function for events other than
             * {@link EventType.POINTER_AXIS}.
             *
             * @return The axis value of this event
             *
             * @see get_axis_value_discrete
             */
            public double get_axis_value (PointerAxis axis);
            /**
             * Return the source for a given axis event. Axis events (scroll events) can
             * be caused by a hardware item such as a scroll wheel or emulated from
             * other input sources, such as two-finger or edge scrolling on a
             * touchpad.
             *
             * If the source is {@link PointerAxisSource.FINGER}, libinput
             * guarantees that a scroll sequence is terminated with a scroll value of 0.
             * A caller may use this information to decide on whether kinetic scrolling
             * should be triggered on this scroll sequence.
             * The coordinate system is identical to the cursor movement, i.e. a
             * scroll value of 1 represents the equivalent relative motion of 1.
             *
             * If the source is {@link PointerAxisSource.WHEEL}, no terminating
             * event is guaranteed (though it may happen).
             * Scrolling is in discrete steps, the value is the angle the wheel moved
             * in degrees. The default is 15 degrees per wheel click, but some mice may
             * have differently grained wheels. It is up to the caller how to interpret
             * such different step sizes.
             *
             * If the source is {@link PointerAxisSource.CONTINUOUS}, no
             * terminating event is guaranteed (though it may happen).
             * The coordinate system is identical to the cursor movement, i.e. a
             * scroll value of 1 represents the equivalent relative motion of 1.
             *
             * If the source is {@link PointerAxisSource.WHEEL_TILT}, no
             * terminating event is guaranteed (though it may happen).
             * Scrolling is in discrete steps and there is no physical equivalent for
             * the value returned here. For backwards compatibility, the value returned
             * by this function is identical to a single mouse wheel rotation by this
             * device (see the documentation for {@link PointerAxisSource.WHEEL}
             * above). Callers should not use this value but instead exclusively refer
             * to the value returned by {@link get_axis_value_discrete}.
             *
             * For pointer events that are not of type {@link EventType.POINTER_AXIS},
             * this function returns 0.
             *
             * ''NOTE:''' It is an application bug to call this function for events other than
             * {@link EventType.POINTER_AXIS}.
             *
             * @return The source for this axis event
             */
            public PointerAxisSource get_axis_source ();
            /**
             * Return the axis value in discrete steps for a given axis event. How a
             * value translates into a discrete step depends on the source.
             *
             * If the source is {@link PointerAxisSource.WHEEL}, the discrete
             * value correspond to the number of physical mouse wheel clicks.
             *
             * If the source is {@link PointerAxisSource.CONTINUOUS} or {@link
             * PointerAxisSource.FINGER}, the discrete value is always 0.
             *
             * @return The discrete value for the given event.
             *
             * @see get_axis_value
             */
            public double get_axis_value_discrete (PointerAxis axis);
        }

        /**
         * A switch event representing a changed state in a switch.
         */
        [CCode (cname = "struct libinput_event_switch")]
        [Compact]
        public class Switch {
            public unowned Event get_base_event ();
            /**
             * Return the switch that triggered this event.
             * For pointer events that are not of type {@link
             * EventType.SWITCH_TOGGLE}, this function returns 0.
             *
             * ''NOTE:''' It is an application bug to call this function for events other than
             * {@link EventType.SWITCH_TOGGLE}.
             *
             * @return The switch triggering this event
             */
            public Libinput.Switch get_switch ();
            /**
             * Return the switch state that triggered this event.
             * For switch events that are not of type {@link
             * EventType.SWITCH_TOGGLE}, this function returns 0.
             *
             * ''NOTE:''' It is an application bug to call this function for events other than
             * {@link EventType.SWITCH_TOGGLE}.
             *
             * @return The switch state triggering this event
             */
            public SwitchState get_switch_state ();
            public uint32 get_time ();
            public uint64 get_time_usec ();
        }

        /**
         * Tablet pad event representing a button press, or ring/strip update on
         * the tablet pad itself.
         *
         * Valid event types for this event are {@link EventType.TABLET_PAD_BUTTON},
         * {@link EventType.TABLET_PAD_RING} and {@link EventType.TABLET_PAD_STRIP}.
         */
        [CCode (cname = "struct libinput_event_tablet_pad")]
        [Compact]
        public class TabletPad {
            public unowned Event get_base_event ();
            public uint32 get_time ();
            public uint64 get_time_usec ();
            /**
             * Returns the current position of the ring, in degrees counterclockwise
             * from the northern-most point of the ring in the tablet's current logical
             * orientation.
             *
             * If the source is {@link TabletPadRingAxisSource.FINGER},
             * libinput sends a terminating event with a ring value of -1 when the
             * finger is lifted from the ring. A caller may use this information to e.g.
             * determine if kinetic scrolling should be triggered.
             *
             * ''NOTE:'' It is an application bug to call this function for events other than
             * {@link EventType.TABLET_PAD_RING}.  For other events, this function
             * returns 0.
             *
             * @return The current value of the the axis, -1 if the finger was lifted
             */
            public double get_ring_position ();
            /**
             * Returns the number of the ring that has changed state, with 0 being the
             * first ring. On tablets with only one ring, this function always returns
             * 0.
             *
             * ''NOTE:'' It is an application bug to call this function for events other than
             * {@link EventType.TABLET_PAD_RING}.  For other events, this function
             * returns 0.
             *
             * @return The index of the ring that changed state
             */
            public uint get_ring_number ();
            /**
             * Returns the source of the interaction with the ring. If the source is
             * {@link TabletPadRingAxisSource.FINGER}, libinput sends a ring
             * position value of -1 to terminate the current interaction.
             *
             * ''NOTE:'' It is an application bug to call this function for events other than
             * {@link EventType.TABLET_PAD_RING}.  For other events, this function
             * returns 0.
             *
             * @return The source of the ring interaction
             */
            public TabletPadRingAxisSource get_ring_source ();
            /**
             * Returns the current position of the strip, normalized to the range
             * [0, 1], with 0 being the top/left-most point in the tablet's current
             * logical orientation.
             *
             * If the source is {@link TabletPadStripAxisSource.FINGER},
             * libinput sends a terminating event with a ring value of -1 when the
             * finger is lifted from the ring. A caller may use this information to e.g.
             * determine if kinetic scrolling should be triggered.
             *
             * ''NOTE:'' It is an application bug to call this function for events other than
             * {@link EventType.TABLET_PAD_STRIP}.  For other events, this function
             * returns 0.
             *
             * @return The current value of the the axis, -1 if the finger was lifted
             */
            public double get_strip_position ();
            /**
             * Returns the number of the strip that has changed state, with 0 being the
             * first strip. On tablets with only one strip, this function always returns
             * 0.
             *
             * ''NOTE:'' It is an application bug to call this function for events other than
             * {@link EventType.TABLET_PAD_STRIP}.  For other events, this function
             * returns 0.
             *
             * @return The index of the strip that changed state
             */
            public uint get_strip_number ();
            /**
             * Returns the source of the interaction with the strip. If the source is
             * {@link TabletPadStripAxisSource.FINGER}, libinput sends a strip
             * position value of -1 to terminate the current interaction.
             *
             * ''NOTE:'' It is an application bug to call this function for events other than
             * {@link EventType.TABLET_PAD_STRIP}.  For other events, this function
             * returns 0.
             *
             * @return The source of the strip interaction
             */
            public TabletPadStripAxisSource get_strip_source ();
            /**
             * Return the button number that triggered this event, starting at 0.
             * For events that are not of type {@link EventType.TABLET_PAD_BUTTON},
             * this function returns 0.
             *
             * Note that the number returned is a generic sequential button number and
             * not a semantic button code as defined in linux/input.h.
             * See tablet-pad-buttons for more details.
             *
             * ''NOTE:'' It is an application bug to call this function for events other than
             * {@link EventType.TABLET_PAD_BUTTON}. For other events, this function
             * returns 0.
             *
             * @return the button triggering this event
             */
            public uint32 get_button_number ();
            /**
             * Return the button state of the event.
             *
             * ''NOTE:'' It is an application bug to call this function for events other than
             * {@link EventType.TABLET_PAD_BUTTON}. For other events, this function
             * returns 0.
             *
             * @return the button state triggering this event
             */
            public ButtonState get_button_state ();
            /**
             * Returns the mode the button, ring, or strip that triggered this event is
             * in, at the time of the event.
             *
             * The mode is a virtual grouping of functionality, usually based on some
             * visual feedback like LEDs on the pad. See tablet-pad-modes for
             * details. Mode indices start at 0, a device that does not support modes
             * always returns 0.
             *
             * Mode switching is controlled by libinput and more than one mode may exist
             * on the tablet. This function returns the mode that this event's button,
             * ring or strip is logically in. If the button is a mode toggle button
             * and the button event caused a new mode to be toggled, the mode returned
             * is the new mode the button is in.
             *
             * Note that the returned mode is the mode valid as of the time of the
             * event. The returned mode may thus be different to the mode returned by
             * {@link TabletPadModeGroup.get_mode}. See
             * {@link TabletPadModeGroup.get_mode} for details.
             *
             * @return the 0-indexed mode of this button, ring or strip at the time of
             * the event
             *
             * @see TabletPadModeGroup.get_mode
             */
            public uint get_mode ();
            /**
             * Returns the mode group that the button, ring, or strip that triggered
             * this event is considered in. The mode is a virtual grouping of
             * functionality, usually based on some visual feedback like LEDs on the
             * pad. See tablet-pad-modesfor details.
             *
             * @return the mode group of the button, ring or strip that caused this event
             *
             * @see Device.tablet_pad_get_mode_group
             */
            public TabletPadModeGroup get_mode_group ();
        }

        /**
         * Tablet tool event representing an axis update, button press, or tool update.
         *
         * Valid event types for this event are {@link EventType.TABLET_TOOL_AXIS},
         * {@link EventType.TABLET_TOOL_PROXIMITY} and
         * {@link EventType.TABLET_TOOL_BUTTON}.
         */
        [CCode (cname = "struct libinput_event_tablet_tool")]
        [Compact]
        public class TabletTool {
            public unowned Event get_base_event ();
            public uint32 get_type ();
            public uint64 get_time_usec ();
            /**
             * Check if the x axis was updated in this event.
             * For events that are not of type {@link EventType.TABLET_TOOL_AXIS},
             * {@link EventType.TABLET_TOOL_TIP}, or
             * {@link EventType.TABLET_TOOL_PROXIMITY}, this function returns 0.
             *
             * ''NOTE:'' It is an application bug to call this function for events other
             * than {@link EventType.TABLET_TOOL_AXIS}, {@link
             * EventType.TABLET_TOOL_TIP}, or {@link
             * EventType.TABLET_TOOL_PROXIMITY}, or {@link
             * EventType.TABLET_TOOL_BUTTON}.
             *
             * @return 1 if the axis was updated or 0 otherwise
             */
            public int x_has_changed ();
            /**
             * Check if the y axis was updated in this event.
             * For events that are not of type {@link EventType.TABLET_TOOL_AXIS},
             * {@link EventType.TABLET_TOOL_TIP}, or
             * {@link EventType.TABLET_TOOL_PROXIMITY}, this function returns 0.
             *
             * ''NOTE:'' It is an application bug to call this function for events other
             * than {@link EventType.TABLET_TOOL_AXIS}, {@link
             * EventType.TABLET_TOOL_TIP}, or {@link
             * EventType.TABLET_TOOL_PROXIMITY}, or {@link
             * EventType.TABLET_TOOL_BUTTON}
             *
             * @return 1 if the axis was updated or 0 otherwise
             */
            public int y_has_changed ();
            /**
             * Check if the pressure axis was updated in this event.
             * For events that are not of type {@link EventType.TABLET_TOOL_AXIS},
             * {@link EventType.TABLET_TOOL_TIP}, or
             * {@link EventType.TABLET_TOOL_PROXIMITY}, this function returns 0.
             *
             * ''NOTE:'' It is an application bug to call this function for events other
             * than {@link EventType.TABLET_TOOL_AXIS}, {@link
             * EventType.TABLET_TOOL_TIP}, or {@link
             * EventType.TABLET_TOOL_PROXIMITY}, or {@link
             * EventType.TABLET_TOOL_BUTTON}.
             *
             * @return 1 if the axis was updated or 0 otherwise
             */
            public int pressure_has_changed ();
            /**
             * Check if the distance axis was updated in this event.
             * For events that are not of type {@link EventType.TABLET_TOOL_AXIS},
             * {@link EventType.TABLET_TOOL_TIP}, or
             * {@link EventType.TABLET_TOOL_PROXIMITY}, this function returns 0.
             * For tablet tool events of type {@link EventType.TABLET_TOOL_PROXIMITY},
             * this function always returns 1.
             *
             * ''NOTE:'' It is an application bug to call this function for events other
             * than {@link EventType.TABLET_TOOL_AXIS}, {@link
             * EventType.TABLET_TOOL_TIP}, or {@link
             * EventType.TABLET_TOOL_PROXIMITY}, or {@link
             * EventType.TABLET_TOOL_BUTTON}.
             *
             * @return 1 if the axis was updated or 0 otherwise
             */
            public int distance_has_changed ();
            /**
             * Check if the tilt x axis was updated in this event.
             * For events that are not of type {@link EventType.TABLET_TOOL_AXIS},
             * {@link EventType.TABLET_TOOL_TIP}, or
             * {@link EventType.TABLET_TOOL_PROXIMITY}, this function returns 0.
             *
             * ''NOTE:'' It is an application bug to call this function for events other
             * than {@link EventType.TABLET_TOOL_AXIS}, {@link
             * EventType.TABLET_TOOL_TIP}, or {@link
             * EventType.TABLET_TOOL_PROXIMITY}, or {@link
             * EventType.TABLET_TOOL_BUTTON}.
             *
             * @return 1 if the axis was updated or 0 otherwise
             */
            public int tilt_x_has_changed ();
            /**
             * Check if the tilt y axis was updated in this event.
             * For events that are not of type {@link EventType.TABLET_TOOL_AXIS},
             * {@link EventType.TABLET_TOOL_TIP}, or
             * {@link EventType.TABLET_TOOL_PROXIMITY}, this function returns 0.
             *
             * ''NOTE:'' It is an application bug to call this function for events other
             * than {@link EventType.TABLET_TOOL_AXIS}, {@link
             * EventType.TABLET_TOOL_TIP}, or {@link
             * EventType.TABLET_TOOL_PROXIMITY}, or {@link
             * EventType.TABLET_TOOL_BUTTON}.
             *
             * @return 1 if the axis was updated or 0 otherwise
             */
            public int tilt_y_has_changed ();
            /**
             * Check if the z-rotation axis was updated in this event.
             * For events that are not of type {@link EventType.TABLET_TOOL_AXIS},
             * {@link EventType.TABLET_TOOL_TIP}, or
             * {@link EventType.TABLET_TOOL_PROXIMITY}, this function returns 0.
             *
             * ''NOTE:'' It is an application bug to call this function for events other
             * than {@link EventType.TABLET_TOOL_AXIS}, {@link
             * EventType.TABLET_TOOL_TIP}, or {@link
             * EventType.TABLET_TOOL_PROXIMITY}, or {@link
             * EventType.TABLET_TOOL_BUTTON}.
             *
             * @return 1 if the axis was updated or 0 otherwise
             */
            public int rotation_has_changed ();
            /**
             * Check if the slider axis was updated in this event.
             * For events that are not of type {@link EventType.TABLET_TOOL_AXIS},
             * {@link EventType.TABLET_TOOL_TIP}, or
             * {@link EventType.TABLET_TOOL_PROXIMITY}, this function returns 0.
             *
             * ''NOTE:'' It is an application bug to call this function for events other
             * than {@link EventType.TABLET_TOOL_AXIS}, {@link
             * EventType.TABLET_TOOL_TIP}, or {@link
             * EventType.TABLET_TOOL_PROXIMITY}, or {@link
             * EventType.TABLET_TOOL_BUTTON}.
             *
             * @return 1 if the axis was updated or 0 otherwise
             */
            public int slider_has_changed ();
            /**
             * Check if the wheel axis was updated in this event.
             * For events that are not of type {@link EventType.TABLET_TOOL_AXIS},
             * {@link EventType.TABLET_TOOL_TIP}, or
             * {@link EventType.TABLET_TOOL_PROXIMITY}, this function returns 0.
             *
             * ''NOTE:'' It is an application bug to call this function for events other
             * than {@link EventType.TABLET_TOOL_AXIS}, {@link
             * EventType.TABLET_TOOL_TIP}, or {@link
             * EventType.TABLET_TOOL_PROXIMITY}, or {@link
             * EventType.TABLET_TOOL_BUTTON}.
             *
             * @return 1 if the axis was updated or 0 otherwise
             */
            public int wheel_has_changed ();
            /**
             * Returns the X coordinate of the tablet tool, in mm from the top left
             * corner of the tablet in its current logical orientation. Use
             * {@link get_x_transformed} for transforming the axis
             * value into a different coordinate space.
             *
             * ''NOTE:'' On some devices, returned value may be negative or larger than the
             * width of the device. See tablet-bounds for more details.
             *
             * @return The current value of the the axis
             */
            public double get_x ();
            /**
             * Returns the Y coordinate of the tablet tool, in mm from the top left
             * corner of the tablet in its current logical orientation. Use
             * {@link get_y_transformed} for transforming the axis
             * value into a different coordinate space.
             *
             * ''NOTE:'' On some devices, returned value may be negative or larger than the
             * width of the device. See tablet-bounds for more details.
             *
             * @return The current value of the the axis
             */
            public double get_y ();
            /**
             * Return the delta between the last event and the current event.
             * If the tool employs pointer acceleration, the delta returned by this
             * function is the accelerated delta.
             *
             * This value is in screen coordinate space, the delta is to be interpreted
             * like the return value of {@link Event.Pointer.get_dx}.
             * See tablet-relative-motion for more details.
             *
             * @return The relative x movement since the last event
             */
            public double get_dx ();
            /**
             * Return the delta between the last event and the current event.
             * If the tool employs pointer acceleration, the delta returned by this
             * function is the accelerated delta.
             *
             * This value is in screen coordinate space, the delta is to be interpreted
             * like the return value of {@link Event.Pointer.get_dx}.
             * See tablet-relative-motion for more details.
             *
             * @return The relative y movement since the last event
             */
            public double get_dy ();
            /**
             * Returns the current pressure being applied on the tool in use, normalized
             * to the range [0, 1].
             *
             * If this axis does not exist on the current tool, this function returns 0.
             *
             * @return The current value of the the axis
             */
            public double get_pressure ();
            /**
             * Returns the current distance from the tablet's sensor, normalized to the
             * range [0, 1].
             *
             * If this axis does not exist on the current tool, this function returns 0.
             *
             * @return The current value of the the axis
             */
            public double get_distance ();
            /**
             * Returns the current tilt along the X axis of the tablet's current logical
             * orientation, in degrees off the tablet's z axis. That is, if the tool is
             * perfectly orthogonal to the tablet, the tilt angle is 0. When the top
             * tilts towards the logical top/left of the tablet, the x/y tilt angles are
             * negative, if the top tilts towards the logical bottom/right of the
             * tablet, the x/y tilt angles are positive.
             *
             * If this axis does not exist on the current tool, this function returns 0.
             *
             * @return The current value of the axis in degrees
             */
            public double get_tilt_x ();
            /**
             * Returns the current tilt along the Y axis of the tablet's current logical
             * orientation, in degrees off the tablet's z axis. That is, if the tool is
             * perfectly orthogonal to the tablet, the tilt angle is 0. When the top
             * tilts towards the logical top/left of the tablet, the x/y tilt angles are
             * negative, if the top tilts towards the logical bottom/right of the
             * tablet, the x/y tilt angles are positive.
             *
             * If this axis does not exist on the current tool, this function returns 0.
             *
             * @return The current value of the the axis in degrees
             */
            public double get_tilt_y ();
            /**
             * Returns the current z rotation of the tool in degrees, clockwise from the
             * tool's logical neutral position.
             *
             * For tools of type {@link TabletToolType.MOUSE} and {@link
             * TabletToolType.LENS} the logical neutral position is
             * pointing to the current logical north of the tablet. For tools of type {@link
             * TabletToolType.BRUSH}, the logical neutral position is with the
             * buttons pointing up.
             *
             * If this axis does not exist on the current tool, this function returns 0.
             *
             * @return The current value of the the axis
             */
            public double get_rotation ();
            /**
             * Returns the current position of the slider on the tool, normalized to the
             * range [-1, 1]. The logical zero is the neutral position of the slider, or
             * the logical center of the axis. This axis is available on e.g. the Wacom
             * Airbrush.
             *
             * If this axis does not exist on the current tool, this function returns 0.
             *
             * @return The current value of the the axis
             */
            public double get_slider_position ();
            /**
             * Return the delta for the wheel in degrees.
             *
             * @return The delta of the wheel, in degrees, compared to the last event
             *
             * @see get_wheel_delta_discrete
             */
            public double get_wheel_delta ();
            /**
             * Return the delta for the wheel in degrees.
             *
             * @return The delta of the wheel, in degrees, compared to the last event
             *
             * @see get_wheel_delta
             */
            public int get_wheel_delta_discrete ();
            /**
             * Return the current absolute x coordinate of the tablet tool event,
             * transformed to screen coordinates.
             *
             * ''NOTE:'' This function may be called for a specific axis even if
             * *_has_changed() returns 0 for that axis.
             * libinput always includes all device axes in the event.
             *
             * ''NOTE:'' On some devices, returned value may be negative or larger than the
             * width of the device. See tablet-bounds for more details.
             *
             * @param width The current output screen width
             * @return the current absolute x coordinate transformed to a screen coordinate
             */
            public double get_x_transformed (uint32 width);
            /**
             * Return the current absolute y coordinate of the tablet tool event,
             * transformed to screen coordinates.
             *
             * ''NOTE:'' This function may be called for a specific axis even if
             * *_has_changed() returns 0 for that axis.
             * libinput always includes all device axes in the event.
             *
             * ''NOTE:'' On some devices, returned value may be negative or larger than the
             * width of the device. See tablet-bounds for more details.
             *
             * @param height The current output screen height
             * @return the current absolute y coordinate transformed to a screen coordinate
             */
            public double get_y_transformed (uint32 height);
            /**
             * Returns the tool that was in use during this event.
             *
             * If the caller holds at least one reference, this struct is used
             * whenever the tools enters proximity again.
              *
             * ''NOTE:'' Physical tool tracking requires hardware support. If unavailable,
             * libinput creates one tool per type per tablet. See
             * tablet-serial-numbers for more details.
             *
             * @return The new tool triggering this event
             */
            public Libinput.TabletTool get_tool ();
            /**
             * Returns the new proximity state of a tool from a proximity event.
             * Used to check whether or not a tool came in or out of proximity during an
             * event of type {@link EventType.TABLET_TOOL_PROXIMITY}.
             *
             * See tablet-fake-proximity for recommendations on proximity handling.
             *
             * @return The new proximity state of the tool from the event.
             */
            public TabletToolProximityState get_proximity_state ();
            /**
             * Returns the new tip state of a tool from a tip event.
             * Used to check whether or not a tool came in contact with the tablet
             * surface or left contact with the tablet surface during an
             * event of type {@link EventType.TABLET_TOOL_TIP}.
             *
             * @return The new tip state of the tool from the event.
             */
            public TabletToolTipState get_tip_state ();
            /**
             * Return the button that triggered this event.  For events that are not of
             * type {@link EventType.TABLET_TOOL_BUTTON}, this function returns 0.
             *
             * ''NOTE:'' It is an application bug to call this function for events other than
             * {@link EventType.TABLET_TOOL_BUTTON}.
             *
             * @return the button triggering this event
             */
            public uint32 get_button ();
            /**
             * Return the button state of the event.
             *
             * ''NOTE:'' It is an application bug to call this function for events other than
             * {@link EventType.TABLET_TOOL_BUTTON}.
             *
             * @return the button state triggering this event
             */
            public ButtonState get_button_state ();
            /**
             * For the button of a {@link EventType.TABLET_TOOL_BUTTON} event,
             * return the total
             * number of buttons pressed on all devices on the associated seat after the
             * the event was triggered.
             *
             " ''NOTE:'' It is an application bug to call this function for events other than
             * {@link EventType.TABLET_TOOL_BUTTON}. For other events, this function
             * returns 0.
             *
             * @return the seat wide pressed button count for the key of this event
             */
            public uint32 get_seat_button_count ();
        }

        /**
         * Touch event representing a touch down, move or up, as well as a touch
         * cancel and touch frame events.
         *
         * Valid event types for this event are {@link EventType.TOUCH_DOWN},
         * {@link EventType.TOUCH_MOTION}, {@link EventType.TOUCH_UP},
         * {@link EventType.TOUCH_CANCEL} and {@link EventType.TOUCH_FRAME}.
         */
        [CCode (cname = "struct libinput_event_touch")]
        [Compact]
        public class Touch {
            public unowned Event get_base_event ();
            public uint32 get_time ();
            public uint64 get_time_usec ();
            /**
             * Get the slot of this touch event. See the kernel's multitouch
             * protocol B documentation for more information.
             *
             * If the touch event has no assigned slot, for example if it is from a
             * single touch device, this function returns -1.
             *
             * For events not of type {@link EventType.TOUCH_DOWN}, {@link
             * EventType.TOUCH_UP}, {@link EventType.TOUCH_MOTION} or {@link
             * EventType.TOUCH_CANCEL}, this function returns 0.
             *
             * ''NOTE:'' It is an application bug to call this function for events of type
             * other than {@link EventType.TOUCH_DOWN}, {@link EventType.TOUCH_UP},
             * {@link EventType.TOUCH_MOTION} or {@link EventType.TOUCH_CANCEL}.
             *
             * @return The slot of this touch event
             */
            public int32 get_slot ();
            /**
             * Get the seat slot of the touch event. A seat slot is a non-negative seat
             * wide unique identifier of an active touch point.
             *
             * Events from single touch devices will be represented as one individual
             * touch point per device.
             *
             * For events not of type {@link EventType.TOUCH_DOWN}, {@link
             * EventType.TOUCH_UP}, {@link EventType.TOUCH_MOTION} or {@link
             * EventType.TOUCH_CANCEL}, this function returns 0.
             *
             * ''NOTE:'' It is an application bug to call this function for events of type
             * other than {@link EventType.TOUCH_DOWN}, {@link EventType.TOUCH_UP},
             * {@link EventType.TOUCH_MOTION} or {@link EventType.TOUCH_CANCEL}.
             *
             * @return The seat slot of the touch event
             */
            public int32 get_seat_slot ();
            /**
             * Return the current absolute x coordinate of the touch event, in mm from
             * the top left corner of the device. To get the corresponding output screen
             * coordinate, use {@link get_x_transformed}.
             *
             * For events not of type {@link EventType.TOUCH_DOWN}, {@link
             * EventType.TOUCH_MOTION}, this function returns 0.
             *
             * ''NOTE:'' It is an application bug to call this function for events of type
             * other than {@link EventType.TOUCH_DOWN} or {@link
             * EventType.TOUCH_MOTION}.
             *
             * @return The current absolute x coordinate
             */
            public double get_x ();
            /**
             * Return the current absolute y coordinate of the touch event, in mm from
             * the top left corner of the device. To get the corresponding output screen
             * coordinate, use {@link get_y_transformed}.
             *
             * For events not of type {@link EventType.TOUCH_DOWN}, {@link
             * EventType.TOUCH_MOTION}, this function returns 0.
             *
             * ''NOTE:'' It is an application bug to call this function for events of type
             * other than {@link EventType.TOUCH_DOWN} or {@link
             * EventType.TOUCH_MOTION}.
             *
             * @return The current absolute y coordinate
             */
            public double get_y ();
            /**
             * Return the current absolute x coordinate of the touch event, transformed to
             * screen coordinates.
             *
             * For events not of type {@link EventType.TOUCH_DOWN}, {@link
             * EventType.TOUCH_MOTION}, this function returns 0.
             *
             * ''NOTE:'' It is an application bug to call this function for events of type
             * other than {@link EventType.TOUCH_DOWN} or {@link
             * EventType.TOUCH_MOTION}.
             *
             * @param width The current output screen width
             * @return The current absolute x coordinate transformed to a screen coordinate
             */
            public double get_x_transformed (uint32 width);
            /**
             * Return the current absolute y coordinate of the touch event, transformed to
             * screen coordinates.
             *
             * For events not of type {@link EventType.TOUCH_DOWN}, {@link
             * EventType.TOUCH_MOTION}, this function returns 0.
             *
             * ''NOTE:'' It is an application bug to call this function for events of type
             * other than {@link EventType.TOUCH_DOWN} or {@link
             * EventType.TOUCH_MOTION}.
             *
             * @param height The current output screen height
             * @return The current absolute y coordinate transformed to a screen coordinate
             */
            public double get_y_transformed (uint32 height);
        }

        [CCode (cname = "struct libinput_event_gesture")]
        [Compact]
        public class Gesture {
            public unowned Event get_base_event ();
            public uint32 get_time ();
            public uint64 get_time_usec ();
            /**
             * Return the number of fingers used for a gesture. This can be used e.g.
             * to differentiate between 3 or 4 finger swipes.
             *
             * This function can be called on all gesture events and the returned finger
             * count value will not change during a sequence.
             *
             * @return the number of fingers used for a gesture
             */
            public int get_finger_count ();
            /**
             * Return if the gesture ended normally, or if it was cancelled.
             * For gesture events that are not of type
             * {@link EventType.GESTURE_SWIPE_END} or
             * {@link EventType.GESTURE_PINCH_END}, this function returns 0.
             *
             * ''NOTE:'' It is an application bug to call this function for events other than
             * {@link EventType.GESTURE_SWIPE_END} or
             * {@link EventType.GESTURE_PINCH_END}.
             *
             * @return 0 or 1, with 1 indicating that the gesture was cancelled.
             */
            public int get_cancelled ();
            /**
             * Return the delta between the last event and the current event. For gesture
             * events that are not of type {@link EventType.GESTURE_SWIPE_UPDATE} or
             * {@link EventType.GESTURE_PINCH_UPDATE}, this function returns 0.
             *
             * If a device employs pointer acceleration, the delta returned by this
             * function is the accelerated delta.
             *
             * Relative motion deltas are normalized to represent those of a device with
             * 1000dpi resolution. See motion_normalization for more details.
             *
             * @return the relative x movement since the last event
             */
            public double get_dx ();
            /**
             * Return the delta between the last event and the current event. For gesture
             * events that are not of type {@link EventType.GESTURE_SWIPE_UPDATE} or
             * {@link EventType.GESTURE_PINCH_UPDATE}, this function returns 0.
             *
             * If a device employs pointer acceleration, the delta returned by this
             * function is the accelerated delta.
             *
             * Relative motion deltas are normalized to represent those of a device with
             * 1000dpi resolution. See motion_normalization for more details.
             *
             * @return the relative y movement since the last event
             */
            public double get_dy ();
            /**
             * Return the relative delta of the unaccelerated motion vector of the
             * current event. For gesture events that are not of type
             * {@link EventType.GESTURE_SWIPE_UPDATE} or
             * {@link EventType.GESTURE_PINCH_UPDATE}, this function returns 0.
             *
             * Relative unaccelerated motion deltas are normalized to represent those of a
             * device with 1000dpi resolution. See motion_normalization for more
             * details. Note that unaccelerated events are not equivalent to 'raw' events
             * as read from the device.
             *
             * Any rotation applied to the device also applies to gesture motion
             * (see {@link Device.config_rotation_set_angle}).
             *
             * @return the unaccelerated relative x movement since the last event
             */
            public double get_dx_unaccelerated ();
            /**
             * Return the relative delta of the unaccelerated motion vector of the
             * current event. For gesture events that are not of type
             * {@link EventType.GESTURE_SWIPE_UPDATE} or
             * {@link EventType.GESTURE_PINCH_UPDATE}, this function returns 0.
             *
             * Relative unaccelerated motion deltas are normalized to represent those of a
             * device with 1000dpi resolution. See motion_normalization for more
             * details. Note that unaccelerated events are not equivalent to 'raw' events
             * as read from the device.
             *
             * Any rotation applied to the device also applies to gesture motion
             * (see {@link Device.config_rotation_set_angle}).
             *
             * @return the unaccelerated relative y movement since the last event
             */
            public double get_dy_unaccelerated ();
            /**
             * Return the absolute scale of a pinch gesture, the scale is the division
             * of the current distance between the fingers and the distance at the start
             * of the gesture. The scale begins at 1.0, and if e.g. the fingers moved
             * together by 50% then the scale will become 0.5, if they move twice as far
             * apart as initially the scale becomes 2.0, etc.
             *
             * For gesture events that are of type {@link
             * EventType.GESTURE_PINCH_BEGIN}, this function returns 1.0.
             *
             * For gesture events that are of type {@link
             * EventType.GESTURE_PINCH_END}, this function returns the scale value
             * of the most recent {@link EventType.GESTURE_PINCH_UPDATE} event (if
             * any) or 1.0 otherwise.
             *
             * For all other events this function returns 0.
             *
             * ''NOTE:'' It is an application bug to call this function for events other than
             * {@link EventType.GESTURE_PINCH_BEGIN}, {@link
             * EventType.GESTURE_PINCH_END} or
             * {@link EventType.GESTURE_PINCH_UPDATE}.
             *
             * @return the absolute scale of a pinch gesture
             */
            public double get_scale ();
            /**
             * Return the angle delta in degrees between the last and the current {@link
             * EventType.GESTURE_PINCH_UPDATE} event. For gesture events that
             * are not of type {@link EventType.GESTURE_PINCH_UPDATE}, this
             * function returns 0.
             *
             * The angle delta is defined as the change in angle of the line formed by
             * the 2 fingers of a pinch gesture. Clockwise rotation is represented
             * by a positive delta, counter-clockwise by a negative delta. If e.g. the
             * fingers are on the 12 and 6 location of a clock face plate and they move
             * to the 1 resp. 7 location in a single event then the angle delta is
             * 30 degrees.
             *
             * If more than two fingers are present, the angle represents the rotation
             * around the center of gravity. The calculation of the center of gravity is
             * implementation-dependent.
             *
             * @return the angle delta since the last event
             */
            public double get_angle_delta ();
        }
    }

    /**
     * Open the device at the given path with the flags provided and
     * return the fd.
     *
     * @param path The device path to open
     * @param flags Flags as defined by open(2)
     *
     * @return The file descriptor, or a negative errno on failure.
     */
    [CCode (has_target = false, simple_generics = true)]
    public delegate int OpenRestrictedFunction<T> (string path, int flags, owned T user_data);
    /**
     * Close the file descriptor.
     *
     * @param fd The file descriptor to close
     */
    [CCode (has_target = false, simple_generics = true)]
    public delegate void CloseRestrictedFunction<T> (int fd, owned T user_data);

    /**
     * libinput does not open file descriptors to devices directly, instead
     * {@link Interface.open_restricted} and 
     * {@link Interface.close_restricted} are called for each path that
     * must be opened.
     *
     * @see Context.udev_create_context
     * @see Context.path_create_context
     */
    [CCode (cname = "struct libinput_interface", has_type_id = false, simple_generics = false)]
    public struct Interface {
        [CCode (cname = "open_restricted")]
        public OpenRestrictedFunction open_restricted;
        [CCode (cname = "close_restricted")]
        public CloseRestrictedFunction close_restricted;
    }

    /**
     * A base handle for accessing libinput seats.
     */
    [CCode (cname = "struct libinput_seat", ref_function = "libinput_seat_ref", unref_function = "libinput_seat_unref")]
    [Compact]
    public class Seat {
        [CCode (simple_generics = true)]
        public void set_user_data<T> (T user_data);
        [CCode (simple_generics = true)]
        public T get_user_data<T> ();

        /**
         * Get the {@link Context} from the seat.
         *
         * @return The libinput context for this seat.
         */
        public unowned Context get_context ();
        /**
         * Return the physical name of the seat. For libinput contexts created from
         * udev, this is always the same value as passed into
         * {@link Context.udev_assign_seat} and all seats from that context will have
         * the same physical name.
         *
         * The physical name of the seat is one that is usually set by the system or
         * lower levels of the stack. In most cases, this is the base filter for
         * devices - devices assigned to seats outside the current seat will not
         * be available to the caller.
         *
         * @return The physical name of this seat
         */
        public unowned string get_physical_name ();
        /**
         * Return the logical name of the seat. This is an identifier to group sets
         * of devices within the compositor.
         *
         * @return The logical name of this seat
         */
        public unowned string get_logical_name ();
    }

    /**
     * A mode on a tablet pad is a virtual grouping of functionality, usually
     * based on some visual feedback like LEDs on the pad.
     *
     * The set of buttons, rings and strips that share the same mode are a "mode
     * group". Whenever the mode changes, all buttons, rings and strips within
     * this mode group are affected.
     *
     * Most tablets only have a single mode group, some tablets provide multiple
     * mode groups through independent banks of LEDs (e.g. the Wacom Cintiq 24HD).
     * libinput guarantees that at least one mode group is always available.
     */
    [CCode (cname = "struct libinput_tablet_pad_mode_group", ref_function = "libinput_tablet_pad_mode_group_ref", unref_function = "libinput_tablet_pad_mode_group_unref")]
    [Compact]
    public class TabletPadModeGroup {
        [CCode (simple_generics = true)]
        public void set_user_data<T> (T user_data);
        [CCode (simple_generics = true)]
        public T get_user_data<T> ();

        /**
         * The returned number is the same index as passed to
         * {@link Device.tablet_pad_get_mode_group}. For tablets with only one
         * mode this number is always 0.
         *
         * @return the numeric index this mode group represents, starting at 0
         */
        public uint get_index ();
        /**
         * Query the mode group for the number of available modes. The number of
         * modes is usually decided by the number of physical LEDs available on the
         * device. Different mode groups may have a different number of modes. Use
         * {@link get_mode} to get the currently active mode.
         *
         * libinput guarantees that at least one mode is available. A device without
         * mode switching capability has a single mode group and a single mode.
         *
         * @return the number of modes available in this mode group
         */
        public uint get_num_modes ();
        /**
         * Return the current mode this mode group is in. Note that the returned
         * mode is the mode valid as of completing the last {@link Context.dispatch}.
         * The returned mode may thus be different than the mode returned by
         * {@link Event.TabletPad.get_mode}.
         *
         * For example, if the mode was toggled three times between the call to
         * {@link Context.dispatch}, this function returns the third mode but the events
         * in the event queue will return the modes 1, 2 and 3, respectively.
         *
         * @return the numeric index of the current mode in this group, starting at 0
         *
         * @see Event.TabletPad.get_mode
         */
        public uint get_mode ();
        /**
         * Devices without mode switching capabilities return true for every button.
         *
         * @param button A button index, starting at 0
         * @return true if the given button index is part of this mode group or
         * false otherwise
         */
        public int has_button (uint button);
        /**
         * Devices without mode switching capabilities return true for every ring.
         *
         * @param ring A ring index, starting at 0
         * @return true if the given ring index is part of this mode group or
         * false otherwise
         */
        public int has_ring (uint ring);
        /**
         * Devices without mode switching capabilities return true for every strip.
         *
         * @param strip A strip index, starting at 0
         * @return true if the given strip index is part of this mode group or
         * false otherwise
         */
        public int has_strip (uint strip);
        /**
         * The toggle button in a mode group is the button assigned to cycle to or
         * directly assign a new mode when pressed. Not all devices have a toggle
         * button and some devices may have more than one toggle button. For
         * example, the Wacom Cintiq 24HD has six toggle buttons in two groups, each
         * directly selecting one of the three modes per group.
         *
         * Devices without mode switching capabilities return false for every button.
         *
         * @param button A button index, starting at 0
         * @return non-zero if the button is a mode toggle button for this group, or
         * zero otherwise
         */
        public int button_is_toggle (uint button);
    }

    [CCode (cname = "libinput_config")]
    [Compact]
    public class Config {
        /**
         * Return a string describing the error.
         *
         * @param status The status to translate to a string
         * @return A human-readable string representing the error or NULL for an
         * invalid status.
         */
        public static unowned string? status_to_str (ConfigStatus status);
    }

    /**
     * An object representing a tool being used by a device with the
     * {@link DeviceCapability.TABLET_TOOL} capability.
     *
     * Tablet events generated by such a device are bound to a specific tool
     * rather than coming from the device directly. Depending on the hardware
     * it is possible to track the same physical tool across multiple struct
     * libinput_device devices. See {@link TabletTool.get_serial} for more details.
     */
    [CCode (cname = "struct libinput_tablet_tool", ref_function = "libinput_tablet_tool_ref", unref_function = "libinput_tablet_tool_unref")]
    [Compact]
    public class TabletTool {
        [CCode (simple_generics = true)]
        public void set_user_data<T> (T user_data);
        [CCode (simple_generics = true)]
        public T get_user_data<T> ();

        /**
         * Return the tool type for a tool object, see
         * tablet-tool-types for details.
         *
         * @return The tool type for this tool object
         *
         * @see get_tool_id
         */
        public TabletToolType get_type ();
        /**
         * Return the tool ID for a tool object. If nonzero, this number identifies
         * the specific type of the tool with more precision than the type returned in
         * {@link get_type}, see tablet-tool-types. Not all
         * tablets support a tool ID.
         *
         * Tablets known to support tool IDs include the Wacom Intuos 3, 4, 5, Wacom
         * Cintiq and Wacom Intuos Pro series.
         *
         * @return The tool ID for this tool object or 0 if none is provided
         *
         * @see get_type
         */
        public uint64 get_tool_id ();
        /**
         * Return whether the tablet tool supports pressure.
         *
         * @return Nonzero if the axis is available, zero otherwise.
         */
        public int has_pressure ();
        /**
         * Return whether the tablet tool supports distance.
         *
         * @return Nonzero if the axis is available, zero otherwise.
         */
        public int has_distance ();
        /**
         * Return whether the tablet tool supports tilt.
         *
         * @return Nonzero if the axis is available, zero otherwise.
         */
        public int has_tilt ();
        /**
         * Return whether the tablet tool supports z-rotation.
         *
         * @return Nonzero if the axis is available, zero otherwise.
         */
        public int has_rotation ();
        /**
         * Return whether the tablet tool has a slider axis.
         *
         * @return Nonzero if the axis is available, zero otherwise.
         */
        public int has_slider ();
        /**
         * Return whether the tablet tool has a relative wheel.
         *
         * @return Nonzero if the axis is available, zero otherwise.
         */
        public int has_wheel ();
        /**
         * Check if a tablet tool has a button with the
         * passed-in code (see linux/input.h).
         *
         * @param code button code to check for
         *
         * @return 1 if the tool supports this button code, 0 if it does not
         */
        public int has_button (uint32 code);
        /**
         * Return nonzero if the physical tool can be uniquely identified by
         * libinput, or nonzero otherwise. If a tool can be uniquely identified,
         * keeping a reference to the tool allows tracking the tool across
         * proximity out sequences and across compatible tablets.
         * See tablet-serial-numbers for more details.
         *
         * @return 1 if the tool can be uniquely identified, 0 otherwise.
         *
         * @see get_serial
         */
        public int is_unique ();
        /**
         * Return the serial number of a tool. If the tool does not report a serial
         * number, this function returns zero. See tablet-serial-numbers for
         * details.
         *
         * @return The tool serial number
         *
         * @see is_unique
         */
        public uint64 get_serial ();
    }
}
