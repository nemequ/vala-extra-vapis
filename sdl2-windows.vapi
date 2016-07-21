/*
The MIT License (MIT)

Copyright (c) 2013-2016

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
//FOR: SDL2.0.3 - This is not official, to be futurely changed for the official binding
//Maintainer: PedroHLC, Txasatonga, Desiderantes

namespace SDL {
	///
	/// Windows
	///
	[CCode (cname = "IDirect3DDevice9", cheader_filename = "d3d9.h")]
	[Compact]
	public struct IDirect3DDevice9 {}

	[CCode (cheader = "SDL2/SDL_system.h")]
	[Compact]
	public class Direct3D9  {
		[CCode (cname = "SDL_Direct3D9GetAdapterIndex")]
		public static int get_adapter_index (int display_index);

		[CCode (cname = "SDL_RenderGetD3D9Device")]
		public static IDirect3DDevice9* get_render_device (Video.Renderer renderer);

		[CCode (cname = "SDL_DXGIGetOutputInfo")]
		public static void dxgi_get_output_info (int display_index, out int adapter_index, out int output_index);
	}// Direct3D9

	[CCode (cname = "SDL_WindowsMessageHook", has_target= true, delegate_target_pos = 0.0, cheader = "SDL2/SDL_system.h")]
	public delegate void WindowsMessageHook (void* hWnd, uint message, uint64 w_param, int64 l_param);

	[CCode (cname = "SDL_SetWindowsMessageHook", cheader_filename = "SDL2/SDL_system.h") ]
	public static void set_windows_message_hook (WindowsMessageHook hook);

}
