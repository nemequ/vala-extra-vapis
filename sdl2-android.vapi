/*
The MIT License (MIT)

Copyright (c) <2016> <SDL2.0 vapi>

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in
all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
THE SOFTWARE.
*/
//FOR: SDL2.0 - This is not official, to be futurely changed for the official binding
//Maintainer: PedroHLC, Txasatonga, Desiderantes

namespace SDL {
	///
	/// Android
	///
	[CCode (cheader = "SDL2/SDL_system.h")]
	[Compact]
	public class Android  {
		[CCode (cname = "SDL_AndroidGetJNIEnv")]
		public static void* get_jnienv ();

		[CCode (cname = "SDL_AndroidGetActivity")]
		public static void* get_activity ();

		[CCode (cname = "SDL_AndroidGetInternalStoragePath")]
		public static string get_internal_storage_path ();

		[CCode (cname = "SDL_AndroidGetExternalStoragePath")]
		public static string get_external_storage_path ();

		[CCode (cname = "SDL_AndroidGetExternalStorageState")]
		public static int get_external_storage_state ();

		[CCode (cname = "SDL_ANDROID_EXTERNAL_STORAGE_READ")]
		public static const int EXTERNAL_STORAGE_READ;

		[CCode (cname = "SDL_ANDROID_EXTERNAL_STORAGE_WRITE")]
		public static const int EXTERNAL_STORAGE_WRITE;
	}// Android


}
