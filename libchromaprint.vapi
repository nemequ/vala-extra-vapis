/*
 * The MIT License
 *
 * Copyright (C) 2017 - Mario Daniel Ruiz Saavedra
 *
 * Permission is hereby granted, free of charge, to any person obtaining a copy
 * of this software and associated documentation files (the "Software"), to deal
 * in the Software without restriction, including without limitation the rights
 * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 * copies of the Software, and to permit persons to whom the Software is
 * furnished to do so, subject to the following conditions:
 *
 * The above copyright notice and this permission notice shall be included in
 * all copies or substantial portions of the Software.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
 * THE SOFTWARE.
 */

/**
 * Chromaprint is a library for generating audio fingerprints, mainly to be used with the [[https://acoustid.org|AcoustID]] service.
 *
 * It needs raw audio stream (16-bit signed int) on input. The audio can have any sampling rate and any number of channels. Typically,
 * you would use some native library for decoding compressed audio files and feed the result into Chromaprint.
 *
 * Audio fingerprints returned from the library can be represented either as
 * base64-encoded strings or 32-bit integer arrays. The base64-encoded strings
 * are usually what's used externally when you need to send the fingerprint
 * to a service. You can't directly compare the fingerprints in such form.
 * The 32-bit integer arrays are also called "raw fingerprints" and they
 * represent the internal structure of the fingerprints. If you want to
 * compare two fingerprints yourself, you probably want them in this form.
 *
 * ==Generating fingerprints==
 *
 * Here is a simple example code that generates a fingerprint from audio samples in memory:
 *
 * {{{
 *
 * const int sample_rate = 44100;
 * const int num_channels = 2;
 *
 * var ctx = new ChromaContext();
 *
 * ctx.start(sample_rate, num_channels);
 * while (has_more_data) {
 *     ctx.feed(data, size);
 * }
 * ctx.finish();
 *
 * string fp =  ctx.get_fingerprint();
 * print("%s\n", fp);
 *
 * }}}
 *
 * Note that there is no error handling in the code above. Almost any of the called functions can fail.
 * You should check the return values in an actual code.
 */
[CCode (cheader_filename = "chromaprint.h")]
namespace Chromaprint {


	[CCode (cname = "CHROMAPRINT_VERSION_MAJOR")]
	public const uint VERSION_MAJOR;
	[CCode (cname = "CHROMAPRINT_VERSION_MINOR")]
	public const uint VERSION_MINOR;
	[CCode (cname = "CHROMAPRINT_VERSION_PATCH")]
	public const uint VERSION_PATCH;


	[CCode (cname = "ChromaprintAlgorithm", cprefix = "CHROMAPRINT_ALGORITHM_", has_type_id = false)]
	public enum Algorithm {
		TEST1,
		TEST2,
		TEST3,
		TEST4,
		TEST5,
		DEFAULT
	}
	
	/**
	 * Return the version number of Chromaprint.
	 */
	[CCode (cname = "chromaprint_get_version")]
	public static string get_version();
	
	/**
	 * Compress and optionally base64-encode a raw fingerprint
	 *
	 * The caller is responsible for freeing the returned pointer using
	 * chromaprint_dealloc().
	 *
	 * @param fp pointer to an array of 32-bit integers representing the raw
	 *        fingerprint to be encoded
	 * @param size number of items in the raw fingerprint
	 * @param algorithm Chromaprint algorithm version which was used to generate the
	 *               raw fingerprint
	 * @param encoded_fp pointer to a pointer, where the encoded fingerprint will be
	 *                stored
	 * @param encoded_size size of the encoded fingerprint in bytes
	 * @param base64 Whether to return binary data or base64-encoded ASCII data. The
	 *            compressed fingerprint will be encoded using base64 with the
	 *            URL-safe scheme if you set this parameter to 1. It will return
	 *            binary data if it's 0.
	 *
	 * @return false on error, true on success
	 */
	[CCode (cname = "chromaprint_encode_fingerprint")]
	public static bool encode_fingerprint(uint32[] fp, Algorithm algorithm = Algorithm.DEFAULT, [CCode (free_function = "chromaprint_dealloc")] out char[] encoded_fp, bool base64 = false);

	/**
	 * Uncompress and optionally base64-decode an encoded fingerprint
	 *
	 * The caller is responsible for freeing the returned pointer using
	 * chromaprint_dealloc().
	 *
	 * @param encoded_fp pointer to an encoded fingerprint
	 * @param encoded_size size of the encoded fingerprint in bytes
	 * @param fp pointer to a pointer, where the decoded raw fingerprint (array
	 *        of 32-bit integers) will be stored
	 * @param size Number of items in the returned raw fingerprint
	 * @param algorithm Chromaprint algorithm version which was used to generate the
	 *               raw fingerprint
	 * @param base64 Whether the encoded_fp parameter contains binary data or
	 *            base64-encoded ASCII data. If 1, it will base64-decode the data
	 *            before uncompressing the fingerprint.
	 *
	 * @return false on error, true on success
	 */
	[CCode (cname = "chromaprint_decode_fingerprint")]
	public static bool decode_fingerprint(char[] encoded_fp, [CCode (free_function = "chromaprint_dealloc")]out uint32[] fp, Algorithm algorithm = Algorithm.DEFAULT, bool base64 = false);

	/**
	 * Generate a single 32-bit hash for a raw fingerprint.
	 *
	 * If two fingerprints are similar, their hashes generated by this function
	 * will also be similar. If they are significantly different, their hashes
	 * will most likely be significantly different as well, but you can't rely
	 * on that.
	 *
	 * You compare two hashes by counting the bits in which they differ. Normally
	 * that would be something like POPCNT(hash1 XOR hash2), which returns a
	 * number between 0 and 32. Anthing above 15 means the hashes are
	 * completely different.
	 *
	 * @param fp pointer to an array of 32-bit integers representing the raw
	 *        fingerprint to be hashed
	 * @param hash pointer to a 32-bit integer where the hash will be stored
	 *
	 * @return false on error, true on success
	 */
	[CCode (cname = "chromaprint_hash_fingerprint")]
	public static bool hash_fingerprint(uint32[] fp, out uint32 hash);
	
	[Compact, CCode (cname = "ChromaprintContext", free_function = "chromaprint_free")]
	public class ChromaContext {
	
		/**
		 * Construct the Chromaprint context.
		 *
		 * Note that when Chromaprint is compiled with FFTW, this constructor is
		 * not reentrant and you need to call it only from one thread at a time.
		 * (This means you need to cache the context and use this class as a singleton in that case)
		 * This is not a problem when using FFmpeg or vDSP.
		 *
		 * @param algorithm the fingerprint algorithm version you want to use, or
		 * CHROMAPRINT_ALGORITHM_DEFAULT for the default algorithm
		 *
		 */
		[CCode (cname = "chromaprint_new")]
		public ChromaContext(Algorithm algorithm = Algorithm.DEFAULT);
		
		
		/**
		 * The fingerprint algorithm this context is configured to use.
		 */
		public Algorithm algorithm {
			[CCode (cname = "chromaprint_get_algorithm")]
			get;
		}


		/**
		 * The number of channels that is internally used for fingerprinting.
		 *
		 * You normally don't need this. Just set the audio's actual number of channels
		 * when calling chromaprint_start() and everything will work. This is only used for
		 * certain optimized cases to control the audio source.
		 *
		 * @return number of channels
		 */
		public int num_channels {
			[CCode (cname = "chromaprint_get_num_channels")]
			get;
		}
		
		/**
		 * Get the sampling rate that is internally used for fingerprinting.
		 *
		 * You normally don't need this. Just set the audio's actual number of channels
		 * when calling chromaprint_start() and everything will work. This is only used for
		 * certain optimized cases to control the audio source.
		 *
		 * @return sampling rate
		 */
		public int sample_rate {
			[CCode (cname = "chromaprint_get_sample_rate")]
			get;
		}

		/**
		 * Get the duration of one item in the raw fingerprint in samples.
		 *
		 * @return duration in samples
		 */
		[CCode (cname = "chromaprint_get_item_duration")]
		public int get_item_duration();

		/**
		 * Get the duration of one item in the raw fingerprint in milliseconds.
		 *
		 * @return duration in milliseconds
		 */
		[CCode (cname = "chromaprint_get_item_duration_ms")]
		public int get_item_duration_ms();

		/**
		 * Get the duration of internal buffers that the fingerprinting algorithm uses.
		 *
		 * @return duration in samples
		 */
		[CCode (cname = "chromaprint_get_delay")]
		public int get_delay();

		/**
		 * Get the duration of internal buffers that the fingerprinting algorithm uses.
		 *
		 * @return duration in milliseconds
		 */
		[CCode (cname = "chromaprint_get_delay_ms")]
		public int get_delay_ms();

		/**
		 * Restart the computation of a fingerprint with a new audio stream.
		 *
		 * @param sample_rate sample rate of the audio stream (in Hz)
		 * @param num_channels numbers of channels in the audio stream (1 or 2)
		 *
		 * @return false on error, true on success
		 */
		[CCode (cname = "chromaprint_start")]
		public bool start(int sample_rate, int num_channels);

		/**
		 * Send audio data to the fingerprint calculator.
		 *
		 * @param data raw audio data, should point to an array of 16-bit signed
		 *          integers in native byte-order
		 * @param size size of the data buffer (in samples)
		 *
		 * @return false on error, true on success
		 */
		[CCode (cname = "chromaprint_feed")]
		public bool feed(int16[] data);

		/**
		 * Process any remaining buffered audio data.
		 *
		 * @return false on error, true on success
		 */
		[CCode (cname = "chromaprint_finish")]
		public bool finish();

		/**
		 * Return the calculated fingerprint as a compressed string.
		 *
		 * The caller is responsible for freeing the returned pointer using
		 * chromaprint_dealloc().
		 *
		 * @param fingerprint pointer to a pointer, where a pointer to the allocated array
		 *                 will be stored
		 *
		 * @return false on error, true on success
		 */
		[CCode (cname = "chromaprint_get_fingerprint")]
		public bool get_fingerprint([CCode (free_function = "chromaprint_dealloc")] out string fingerprint);

		/**
		 * Return the calculated fingerprint as an array of 32-bit integers.
		 *
		 * The caller is responsible for freeing the returned pointer using
		 * chromaprint_dealloc().
		 *
		 * @param fingerprint pointer to a pointer, where a pointer to the allocated array
		 *                 will be stored
		 *
		 * @return false on error, true on success
		 */
		[CCode (cname = "chromaprint_get_raw_fingerprint")]
		public bool get_raw_fingerprint([CCode (free_function = "chromaprint_dealloc")]out uint32[] fingerprint);

		/**
		 * Return the length of the current raw fingerprint.
		 *
		 * @param size number of items in the current raw fingerprint
		 *
		 * @return false on error, true on success
		 */
		[CCode (cname = "chromaprint_get_raw_fingerprint_size")]
		public bool get_raw_fingerprint_size(out int size);

		/**
		 * Return 32-bit hash of the calculated fingerprint.
		 *
		 * See chromaprint_hash_fingerprint() for details on how to use the hash.
		 *
		 * @param hash pointer to a 32-bit integer where the hash will be stored
		 *
		 * @return false on error, true on success
		 */
		[CCode (cname = "chromaprint_get_fingerprint_hash")]
		public bool get_fingerprint_hash(out uint32 hash);

		/**
		 * Clear the current fingerprint, but allow more data to be processed.
		 *
		 * This is useful if you are processing a long stream and want to many
		 * smaller fingerprints, instead of waiting for the entire stream to be
		 * processed.
		 *
		 * @return false on error, true on success
		 */
		[CCode (cname = "chromaprint_clear_fingerprint")]
		public bool clear_fingerprint();


		/*
		 * Free memory allocated by any function from the Chromaprint API.
		 *
		 * @param ptr pointer to be deallocated
		
		[CCode (cname = "")]
		CHROMAPRINT_API void chromaprint_dealloc(void *ptr);  */

		/**
		 * Set a configuration option for the selected fingerprint algorithm.
		 *
		 * DO NOT USE THIS FUNCTION IF YOU ARE PLANNING TO USE
		 * THE GENERATED FINGERPRINTS WITH THE ACOUSTID SERVICE.
		 *
		 * Possible options:
		 * 
		 *  * silence_threshold: threshold for detecting silence, 0-32767
		 *
		 * @param name option name
		 * @param value option value
		 *
		 * @return false on error, true on success
		 */
		[CCode (cname = "chromaprint_set_option")]
		public bool set_option(string name, int value);
	}
}
