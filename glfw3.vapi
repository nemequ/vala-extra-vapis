/* glfw3 Vala Bindings
 * Copyright (c) 2014 Simon Werbeck <simon.werbeck@gmail.com>
 *
 * Permission is hereby granted, free of charge, to any person
 * obtaining a copy of this software and associated documentation
 * files (the "Software"), to deal in the Software without
 * restriction, including without limitation the rights to use, copy,
 * modify, merge, publish, distribute, sublicense, and/or sell copies
 * of the Software, and to permit persons to whom the Software is
 * furnished to do so, subject to the following conditions:
 *
 * The above copyright notice and this permission notice shall be
 * included in all copies or substantial portions of the Software.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
 * EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
 * MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
 * NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS
 * BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN
 * ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN
 * CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
 * SOFTWARE.
 */
[CCode (cprefix = "", lower_case_cprefix = "", cheader_filename="GLFW/glfw3.h")]
namespace GLFW {
	[CCode (cname = "GLFWwindow", free_function = "glfwDestroyWindow")]
	[Compact]
	public class Window {
		[CCode (cname = "glfwCreateWindow")]
		public Window (int width, int height, string title = "", Monitor? monitor = null, Window? share = null);

		public static unowned Window? current_context {
			[CCode (cname = "glfwGetCurrentContext")]
			get;
		}

		public string title {
			[CCode (cname = "glfwSetWindowTitle")]
			set;
		}

		public unowned Monitor? monitor {
			[CCode (cname = "glfwGetWindowMonitor")]
			get;
		}

		public unowned Cursor? cursor {
			[CCode (cname = "glfwSetCursor")]
			set;
		}

		public void* user_pointer {
			[CCode (cname = "glfwGetWindowUserPointer")]
			get;
			[CCode (cname = "glfwSetWindowUserPointer")]
			set;
		}

		public string clipboard_string {
			[CCode (cname = "glfwGetClipboardString")]
			get;
			[CCode (cname = "glfwSetClipboardString")]
			set;
		}

		public bool should_close {
			[CCode (cname = "glfwWindowShouldClose")]
			get;
			[CCode (cname = "glfwSetWindowShouldClose")]
			set;
		}

		[CCode (cname = "glfwSetWindowCloseCallback")]
		public void set_close_callback (WindowCloseFunc? c);

		[CCode (cname = "glfwSetWindowSizeCallback")]
		public void set_size_callback (WindowSizeFunc? c);

		[CCode (cname = "glfwSetWindowPosCallback")]
		public void set_position_callback (WindowPositionFunc? c);

		[CCode (cname = "glfwSetWindowFocusCallback")]
		public void set_focus_callback (WindowFocusFunc? c);

		[CCode (cname = "glfwSetWindowIconifyCallback")]
		public void set_iconify_callback (WindowIconifyFunc? c);

		[CCode (cname = "glfwSetWindowRefreshCallback")]
		public void set_refresh_callback (WindowRefreshFunc? c);

		[CCode (cname = "glfwSetKeyCallback")]
		public void set_key_callback (KeyFunc? c);

		[CCode (cname = "glfwSetCharCallback")]
		public void set_char_callback (CharFunc? c);

		[CCode (cname = "glfwSetMouseButtonCallback")]
		public void set_mouse_button_callback (MouseButtonFunc? c);

		[CCode (cname = "glfwSetCursorPosCallback")]
		public void set_cursor_pos_callback (CursorPosFunc? c);

		[CCode (cname = "glfwSetCursorEnterCallback")]
		public void set_cursor_enter_callback (CursorEnterFunc? c);

		[CCode (cname = "glfwSetScrollCallback")]
		public void set_scroll_callback (ScrollFunc? c);

		[CCode (cname = "glfwSetFramebufferSizeCallback")]
		public void set_framebuffer_size_callback (FrameBufferFunc? c);

		[CCode (cname = "glfwGetWindowSize")]
		public void get_size (out int width, out int height);

		[CCode (cname = "glfwSetWindowSize")]
		public void set_size (int width, int height);

		[CCode (cname = "glfwGetFramebufferSize")]
		public void get_framebuffer_size (out int width, out int height);

		[CCode (cname = "glfwIconifyWindow")]
		public void iconify ();

		[CCode (cname = "glfwRestoreWindow")]
		public void restore ();

		[CCode (cname = "glfwShowWindow")]
		public void show ();

		[CCode (cname = "glfwHideWindow")]
		public void hide ();

		[CCode (cname = "glfwGetWindowAttrib")]
		public int get_attrib (WindowAttribute attrib);

		[CCode (cname = "glfwGetInputMode")]
		public int get_input_mode (InputMode mode);

		[CCode (cname = "glfwSetInputMode")]
		public void set_input_mode (InputMode mode, int value);

		[CCode (cname = "glfwGetKey")]
		public ButtonState get_key (Key key);

		[CCode (cname = "glfwGetMouseButton")]
		public ButtonState get_mouse_button (MouseButton button);

		[CCode (cname = "glfwGetCursorPos")]
		public void get_cursor_pos (out double xpos, out double ypos);

		[CCode (cname = "glfwSetCursorPos")]
		public void set_cursor_pos (double xpos, double ypos);

		[CCode (cname = "glfwGetScrollOffset")]
		public void get_scroll_offset (out double xoffset, out double yoffset);

		[CCode (cname = "glfwMakeContextCurrent")]
		public void make_context_current ();

		[CCode (cname = "glfwSwapBuffers")]
		public void swap_buffers ();
	}

	[CCode (cname = "GLFWcursor", free_function = "glfwDestroyCursor")]
	[Compact]
	public class Cursor {
		[CCode (cname = "glfwCreateCursor")]
		public Cursor (Image image, int xhot, int yhot);
	}

	[CCode (cname = "GLFWimage", has_type_id = false)]
	public struct Image {
		int width;
		int height;
		[CCode (array_length = false)]
		uchar[] pixels;
	}

	[CCode (cname = "GLFWmonitorfun", has_target = false)]
	public delegate void MonitorFunc (Monitor monitor, int event);

	[Compact]
	[CCode (cname = "GLFWmonitor")]
	public class Monitor {
		public string name {
			[CCode (cname = "glfwGetMonitorName")]
			get;
		}

		public unowned GammaRamp gamma_ramp {
			[CCode (cname = "glfwGetGammaRamp")]
			get;
			[CCode (cname = "glfwSetGammaRamp")]
			set;
		}

		public float gamma {
			[CCode (cname = "glfwSetGamma")]
			set;
		}

		public GLFW.VideoMode[] video_modes {
			[CCode (cname="glfwGetVideoModes", array_length_pos = 0.5)]
			get;
		}

		public GLFW.VideoMode video_mode {
			[CCode (cname="glfwGetVideoMode")]
			get;
		}

		[CCode (cname = "glfwGetMonitorPos")]
		public void get_position (out int x, out int y);

		[CCode (cname = "glfwGetMonitorPhysicalSize")]
		public void get_physical_size (out int width, out int height);
	}

	[CCode (cname = "glfwGetMonitors")]
	public Monitor[]? get_monitors ();

	[CCode (cname = "glfwGetPrimaryMonitor")]
	public Monitor? get_primary_monitor ();

	[CCode (cname = "GLFWwindowclosefun", has_target = false)]
	public delegate void WindowCloseFunc (Window window);
	[CCode (cname = "GLFWwindowsizefun", has_target = false)]
	public delegate void WindowSizeFunc (Window window, int width, int height);
	[CCode (cname = "GLFWwindowposfun", has_target = false)]
	public delegate void WindowPositionFunc (Window window, int x, int y);
	[CCode (cname = "GLFWwindowrefreshfun", has_target = false)]
	public delegate void WindowRefreshFunc (Window window);
	[CCode (cname = "GLFWwindowfocusfun", has_target = false)]
	public delegate void WindowFocusFunc (Window window, bool focused);
	[CCode (cname = "GLFWwindowiconifyfun", has_target = false)]
	public delegate void WindowIconifyFunc (Window window, bool iconified);
	[CCode (cname = "GLFWkeyfun", has_target = false)]
	public delegate void KeyFunc (Window window, Key key, int scancode, ButtonState action, ModifierFlags mods);
	[CCode (cname = "GLFWcharfun", has_target = false)]
	public delegate void CharFunc (Window window, int character);
	[CCode (cname = "GLFWmousebuttonfun", has_target = false)]
	public delegate void MouseButtonFunc (Window window, int button, ButtonState action);
	[CCode (cname = "GLFWcursorposfun", has_target = false)]
	public delegate void CursorPosFunc (Window window, int x, int y);
	[CCode (cname = "GLFWcursorenterfun", has_target = false)]
	public delegate void CursorEnterFunc (Window window, bool entered);
	[CCode (cname = "GLFWscrollfun", has_target = false)]
	public delegate void ScrollFunc (Window window, int pos);
	[CCode (cname = "GLFWframebuffersizefun", has_target = false)]
	public delegate void FrameBufferFunc (Window window, int width, int height);

	[CCode (cprefix = "GLFW_", cname = "int", has_type_id = false)]
	public enum ErrorCode {
		NOT_INITIALIZED,
		NO_CURRENT_CONTEXT,
		INVALID_ENUM,
		INVALID_VALUE,
		OUT_OF_MEMORY,
		API_UNAVAILABLE,
		VERSION_UNAVAILABLE,
		PLATFORM_ERROR,
		FORMAT_UNAVAILABLE;
	}

	[CCode (cname = "GLFWerrorfun", has_target = false)]
	public delegate void ErrorFunc (ErrorCode error, string description);

	[CCode (cname = "glfwSetErrorCallback")]
	public ErrorFunc? set_error_callback (ErrorFunc? cb);

	[CCode (cname = "glfwSetMonitorCallback")]
	public MonitorFunc? set_monitor_callback (MonitorFunc? cb);

	[CCode (cprefix = "GLFW_", cname = "int", has_type_id = false)]
	public enum InputMode {
		[CCode (cname = "GLFW_CURSOR_MODE")]
		CURSOR,
		STICKY_KEYS,
		STICKY_MOUSE_BUTTONS
	}

	[CCode (cname = "GLFW_VERSION_MAJOR")]
	public const uint VERSION_MAJOR;

	[CCode (cname = "GLFW_VERSION_MINOR")]
	public const uint VERSION_MINOR;

	[CCode (cname = "GLFW_VERSION_REVISION")]
	public const uint VERSION_REVISION;

	[CCode (cprefix = "GLFW_", cname = "int", has_type_id = false)]
	public enum WindowAttribute {
		// Window attributes
		FOCUSED,
		ICONIFIED,
		VISIBLE,
		RESIZABLE,
		DECORATED,
		// Context attributes
		CLIENT_API,
		CONTEXT_VERSION_MAJOR,
		CONTEXT_VERSION_MINOR,
		CONTEXT_REVISION,
		OPENGL_FORWARD_COMPAT,
		OPENGL_DEBUG_CONTEXT,
		OPENGL_PROFILE,
		CONTEXT_ROBUSTNESS
	}

	[CCode (cprefix = "GLFW_", cname = "int", has_type_id = false)]
	public enum WindowHint {
		RESIZABLE,
		VISIBLE,
		DECORATED,
		RED_BITS,
		GREEN_BITS,
		BLUE_BITS,
		ALPHA_BITS,
		DEPTH_BITS,
		STENCIL_BITS,
		ACCUM_RED_BITS,
		ACCUM_GREEN_BITS,
		ACCUM_BLUE_BITS,
		ACCUM_ALPHA_BITS,
		AUX_BUFFERS,
		SAMPLES,
		REFRESH_RATE,
		STEREO,
		SRGB_CAPABLE,
		CLIENT_API,
		CONTEXT_VERSION_MAJOR,
		CONTEXT_VERSION_MINOR,
		CONTEXT_ROBUSTNESS,
		OPENGL_FORWARD_COMPAT,
		OPENGL_DEBUG_CONTEXT,
		OPENGL_PROFILE;

		[CCode (cname="glfwWindowHint")]
		public void set (int value);

		[CCode (cname="glfwWindowHint")]
		public void set_bool (bool value);

		[CCode (cname = "glfwDefaultWindowHints")]
		public static void set_defaults ();
	}

	[CCode (cname = "int", has_type_id = false)]
	public enum OpenGLProfile {
		[CCode (cname = "GLFW_OPENGL_CORE_PROFILE")]
		CORE,
		[CCode (cname = "GLFW_OPENGL_COMPAT_PROFILE")]
		COMPAT,
		[CCode (cname = "GLFW_OPENGL_ANY_PROFILE")]
		ANY
	}

	[CCode (cname = "int", has_type_id = false)]
	public enum ClientAPI {
		[CCode (cname = "GLFW_OPENGL_API")]
		OPENGL,
		[CCode (cname = "GLFW_OPENGL_ES_API")]
		OPENGL_ES
	}


	[Compact]
	public class GammaRamp {
		[CCode (array_length_cname = "size")]
		ushort[] red;
		[CCode (array_length_cname = "size")]
		ushort[] green;
		[CCode (array_length_cname = "size")]
		ushort[] blue;
	}

	[CCode (cname = "GLFWvidmode", has_type_id = false)]
	public struct VideoMode {
		[CCode (cname = "Width")]
		public int width;
		[CCode (cname = "Height")]
		public int height;
		[CCode (cname = "RedBits")]
		public int red_bits;
		[CCode (cname = "GreenBits")]
		public int green_bits;
		[CCode (cname = "BlueBits")]
		public int blue_bits;
	}

	[CCode (cname = "glfwInit")]
	public bool init ();
	[CCode (cname = "glfwTerminate")]
	public void terminate ();
	[CCode (cname = "glfwGetVersion")]
	public void get_version (out int major, out int minor, out int rev);

	[CCode (cname = "glfwSwapInterval")]
	public void swap_interval (int interval);

	[CCode (cname = "glfwPollEvents")]
	public void poll_events ();
	[CCode (cname = "glfwWaitEvents")]
	public void wait_events ();
	[CCode (cname = "glfwPostEmptyEvent")]
	public void post_empty_event ();

	[CCode (cname = "glfwExtensionSupported")]
	public bool extension_supported (string extension);

	[CCode (cname = "glfwGetProcAddress")]
	public GLFunc get_proc_address (string procname);

	[CCode (cname = "GLFWglproc", has_target = false)]
	public delegate void GLFunc ();

	[CCode (cname="int", cprefix="GLFW_", has_type_id = false)]
	public enum ButtonState {
		PRESS,
		RELEASE,
		REPEAT
	}

	// Timing
	[CCode (cname = "glfwGetTime")]
	public double get_time ();
	[CCode (cname = "glfwSetTime")]
	public void set_time (double time);

	[CCode (cprefix = "GLFW_MOUSE_BUTTON_", cname="int", has_type_id = false)]
	public enum MouseButton {
		LEFT,
		RIGHT,
		MIDDLE,
		@1,
		@2,
		@3,
		@4,
		@5,
		@6,
		@7,
		@8,
		LAST
	}

	[CCode (cprefix = "GLFW_JOYSTICK_", cname="int", has_type_id = false)]
	public enum Joystick {
		@1,
		@2,
		@3,
		@4,
		@5,
		@6,
		@7,
		@8,
		@9,
		@10,
		@11,
		@12,
		@13,
		@14,
		@15,
		@16,
		LAST;

		[CCode (cname="glfwGetJoystickButtons")]
		public unowned uchar[]? get_buttons ();

		[CCode (cname = "glfwGetJoystickAxes")]
		public unowned float[] get_axes ();

		[CCode (cname = "glfwGetJoystickName")]
		public string get_name ();

		[CCode (cname = "glfwJoystickPresent")]
		public bool present ();
	}

	[CCode (cprefix = "GLFW_MOD_", cname="int", has_type_id = false)]
	[Flags]
	public enum ModifierFlags {
		SHIFT,
		CONTROL,
		ALT,
		SUPER
	}

	[CCode (cprefix = "GLFW_KEY_", cname="int", has_type_id = false)]
	public enum Key {
		UNKNOWN,
		SPACE,
		APOSTROPHE,
		COMMA,
		MINUS,
		PERIOD,
		SLASH,
		@0,
		@1,
		@2,
		@3,
		@4,
		@5,
		@6,
		@7,
		@8,
		@9,
		SEMICOLON,
		EQUAL,
		A,
		B,
		C,
		D,
		E,
		F,
		G,
		H,
		I,
		J,
		K,
		L,
		M,
		N,
		O,
		P,
		Q,
		R,
		S,
		T,
		U,
		V,
		W,
		X,
		Y,
		Z,
		LEFT_BRACKET,
		BACKSLASH,
		RIGHT_BRACKET,
		GRAVE_ACCENT,
		WORLD_1,
		WORLD_2,

		/* Function keys */
		ESCAPE,
		ENTER,
		TAB,
		BACKSPACE,
		INSERT,
		DELETE,
		RIGHT,
		LEFT,
		DOWN,
		UP,
		PAGE_UP,
		PAGE_DOWN,
		HOME,
		END,
		CAPS_LOCK,
		SCROLL_LOCK,
		NUM_LOCK,
		PRINT_SCREEN,
		PAUSE,
		F1,
		F2,
		F3,
		F4,
		F5,
		F6,
		F7,
		F8,
		F9,
		F10,
		F11,
		F12,
		F13,
		F14,
		F15,
		F16,
		F17,
		F18,
		F19,
		F20,
		F21,
		F22,
		F23,
		F24,
		F25,
		KP_0,
		KP_1,
		KP_2,
		KP_3,
		KP_4,
		KP_5,
		KP_6,
		KP_7,
		KP_8,
		KP_9,
		KP_DECIMAL,
		KP_DIVIDE,
		KP_MULTIPLY,
		KP_SUBTRACT,
		KP_ADD,
		KP_ENTER,
		KP_EQUAL,
		LEFT_SHIFT,
		LEFT_CONTROL,
		LEFT_ALT,
		LEFT_SUPER,
		RIGHT_SHIFT,
		RIGHT_CONTROL,
		RIGHT_ALT,
		RIGHT_SUPER,
		MENU,
		LAST
	}
}
