/*
 * GLFW3 binding for Vala (Plain C Style)
 *
 * Copyright 2013 Aleksandr Palamar <void995@gmail.com>
 *
 * Permission is hereby granted, free of charge, to any person obtaining a copy of
 * this software and associated documentation files (the "Software"), to deal in
 * the Software without restriction, including without limitation the rights to
 * use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of
 * the Software, and to permit persons to whom the Software is furnished to do so,
 * subject to the following conditions:
 *
 * The above copyright notice and this permission notice shall be included in all
 * copies or substantial portions of the Software.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS
 * FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR
 * COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER
 * IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN
 * CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
 */

[CCode (cprefix = "", lower_case_cprefix = "", cheader_filename="GLFW/glfw3.h")]
namespace GLFW3 {
    public const int GLFW_VERSION_MAJOR;
    public const int GLFW_VERSION_MINOR;
    public const int GLFW_VERSION_REVISION;

    /*************************************************************************
     * Keyboard keys
     *************************************************************************/
     
     /* Key and button actions */    
    public const int GLFW_RELEASE;
    public const int GLFW_PRESS;
    public const int GLFW_REPEAT;
    
    /* The unknown key */
    public const int GLFW_KEY_UNKNOWN;

    /* Printable keys */
    public const int GLFW_KEY_SPACE;
    public const int GLFW_KEY_APOSTROPHE;
    public const int GLFW_KEY_COMMA;
    public const int GLFW_KEY_MINUS;
    public const int GLFW_KEY_PERIOD;
    public const int GLFW_KEY_SLASH;
    public const int GLFW_KEY_0;
    public const int GLFW_KEY_1;
    public const int GLFW_KEY_2;
    public const int GLFW_KEY_3;
    public const int GLFW_KEY_4;
    public const int GLFW_KEY_5;
    public const int GLFW_KEY_6;
    public const int GLFW_KEY_7;
    public const int GLFW_KEY_8;
    public const int GLFW_KEY_9;
    public const int GLFW_KEY_SEMICOLON;
    public const int GLFW_KEY_EQUAL;
    public const int GLFW_KEY_A;
    public const int GLFW_KEY_B;
    public const int GLFW_KEY_C;
    public const int GLFW_KEY_D;
    public const int GLFW_KEY_E;
    public const int GLFW_KEY_F;
    public const int GLFW_KEY_G;
    public const int GLFW_KEY_H;
    public const int GLFW_KEY_I;
    public const int GLFW_KEY_J;
    public const int GLFW_KEY_K;
    public const int GLFW_KEY_L;
    public const int GLFW_KEY_M;
    public const int GLFW_KEY_N;
    public const int GLFW_KEY_O;
    public const int GLFW_KEY_P;
    public const int GLFW_KEY_Q;
    public const int GLFW_KEY_R;
    public const int GLFW_KEY_S;
    public const int GLFW_KEY_T;
    public const int GLFW_KEY_U;
    public const int GLFW_KEY_V;
    public const int GLFW_KEY_W;
    public const int GLFW_KEY_X;
    public const int GLFW_KEY_Y;
    public const int GLFW_KEY_Z;
    public const int GLFW_KEY_LEFT_BRACKET;
    public const int GLFW_KEY_BACKSLASH;
    public const int GLFW_KEY_RIGHT_BRACKET;
    public const int GLFW_KEY_GRAVE_ACCENT;
    public const int GLFW_KEY_WORLD_1;
    public const int GLFW_KEY_WORLD_2;

    /* Function keys */
    public const int GLFW_KEY_ESCAPE;
    public const int GLFW_KEY_ENTER;
    public const int GLFW_KEY_TAB;
    public const int GLFW_KEY_BACKSPACE;
    public const int GLFW_KEY_INSERT;
    public const int GLFW_KEY_DELETE;
    public const int GLFW_KEY_RIGHT;
    public const int GLFW_KEY_LEFT;
    public const int GLFW_KEY_DOWN;
    public const int GLFW_KEY_UP;
    public const int GLFW_KEY_PAGE_UP;
    public const int GLFW_KEY_PAGE_DOWN;
    public const int GLFW_KEY_HOME;
    public const int GLFW_KEY_END;
    public const int GLFW_KEY_CAPS_LOCK;
    public const int GLFW_KEY_SCROLL_LOCK;
    public const int GLFW_KEY_NUM_LOCK;
    public const int GLFW_KEY_PRINT_SCREEN;
    public const int GLFW_KEY_PAUSE;
    public const int GLFW_KEY_F1;
    public const int GLFW_KEY_F2;
    public const int GLFW_KEY_F3;
    public const int GLFW_KEY_F4;
    public const int GLFW_KEY_F5;
    public const int GLFW_KEY_F6;
    public const int GLFW_KEY_F7;
    public const int GLFW_KEY_F8;
    public const int GLFW_KEY_F9;
    public const int GLFW_KEY_F10;
    public const int GLFW_KEY_F11;
    public const int GLFW_KEY_F12;
    public const int GLFW_KEY_F13;
    public const int GLFW_KEY_F14;
    public const int GLFW_KEY_F15;
    public const int GLFW_KEY_F16;
    public const int GLFW_KEY_F17;
    public const int GLFW_KEY_F18;
    public const int GLFW_KEY_F19;
    public const int GLFW_KEY_F20;
    public const int GLFW_KEY_F21;
    public const int GLFW_KEY_F22;
    public const int GLFW_KEY_F23;
    public const int GLFW_KEY_F24;
    public const int GLFW_KEY_F25;
    public const int GLFW_KEY_KP_0;
    public const int GLFW_KEY_KP_1;
    public const int GLFW_KEY_KP_2;
    public const int GLFW_KEY_KP_3;
    public const int GLFW_KEY_KP_4;
    public const int GLFW_KEY_KP_5;
    public const int GLFW_KEY_KP_6;
    public const int GLFW_KEY_KP_7;
    public const int GLFW_KEY_KP_8;
    public const int GLFW_KEY_KP_9;
    public const int GLFW_KEY_KP_DECIMAL;
    public const int GLFW_KEY_KP_DIVIDE;
    public const int GLFW_KEY_KP_MULTIPLY;
    public const int GLFW_KEY_KP_SUBTRACT;
    public const int GLFW_KEY_KP_ADD;
    public const int GLFW_KEY_KP_ENTER;
    public const int GLFW_KEY_KP_EQUAL;
    public const int GLFW_KEY_LEFT_SHIFT;
    public const int GLFW_KEY_LEFT_CONTROL;
    public const int GLFW_KEY_LEFT_ALT;
    public const int GLFW_KEY_LEFT_SUPER;
    public const int GLFW_KEY_RIGHT_SHIFT;
    public const int GLFW_KEY_RIGHT_CONTROL;
    public const int GLFW_KEY_RIGHT_ALT;
    public const int GLFW_KEY_RIGHT_SUPER;
    public const int GLFW_KEY_MENU;
    public const int GLFW_KEY_LAST;

    /* Modifier key flags */
    public const int GLFW_MOD_SHIFT;
    public const int GLFW_MOD_CONTROL;
    public const int GLFW_MOD_ALT;
    public const int GLFW_MOD_SUPER;

    /* Mouse buttons */
    public const int GLFW_MOUSE_BUTTON_1;
    public const int GLFW_MOUSE_BUTTON_2;
    public const int GLFW_MOUSE_BUTTON_3;
    public const int GLFW_MOUSE_BUTTON_4;
    public const int GLFW_MOUSE_BUTTON_5;
    public const int GLFW_MOUSE_BUTTON_6;
    public const int GLFW_MOUSE_BUTTON_7;
    public const int GLFW_MOUSE_BUTTON_8;
    public const int GLFW_MOUSE_BUTTON_LAST;
    public const int GLFW_MOUSE_BUTTON_LEFT;
    public const int GLFW_MOUSE_BUTTON_RIGHT;
    public const int GLFW_MOUSE_BUTTON_MIDDLE;

    /* Joysticks */
    public const int GLFW_JOYSTICK_1;
    public const int GLFW_JOYSTICK_2;
    public const int GLFW_JOYSTICK_3;
    public const int GLFW_JOYSTICK_4;
    public const int GLFW_JOYSTICK_5;
    public const int GLFW_JOYSTICK_6;
    public const int GLFW_JOYSTICK_7;
    public const int GLFW_JOYSTICK_8;
    public const int GLFW_JOYSTICK_9;
    public const int GLFW_JOYSTICK_10;
    public const int GLFW_JOYSTICK_11;
    public const int GLFW_JOYSTICK_12;
    public const int GLFW_JOYSTICK_13;
    public const int GLFW_JOYSTICK_14;
    public const int GLFW_JOYSTICK_15;
    public const int GLFW_JOYSTICK_16;
    public const int GLFW_JOYSTICK_LAST;
    
    /*************************************************************************
     * Error codes
     *************************************************************************/

    public const int GLFW_NOT_INITIALIZED;
    public const int GLFW_NO_CURRENT_CONTEXT;
    public const int GLFW_INVALID_ENUM;
    public const int GLFW_INVALID_VALUE;
    public const int GLFW_OUT_OF_MEMORY;
    public const int GLFW_API_UNAVAILABLE;
    public const int GLFW_VERSION_UNAVAILABLE;
    public const int GLFW_PLATFORM_ERROR;
    public const int GLFW_FORMAT_UNAVAILABLE;
    
    /*************************************************************************
     * GLFW API tokens
     *************************************************************************/

    public const int GLFW_FOCUSED;
    public const int GLFW_ICONIFIED;
    public const int GLFW_RESIZABLE;
    public const int GLFW_VISIBLE;
    public const int GLFW_DECORATED;

    public const int GLFW_RED_BITS;
    public const int GLFW_GREEN_BITS;
    public const int GLFW_BLUE_BITS;
    public const int GLFW_ALPHA_BITS;
    public const int GLFW_DEPTH_BITS;
    public const int GLFW_STENCIL_BITS;
    public const int GLFW_ACCUM_RED_BITS;
    public const int GLFW_ACCUM_GREEN_BITS;
    public const int GLFW_ACCUM_BLUE_BITS;
    public const int GLFW_ACCUM_ALPHA_BITS;
    public const int GLFW_AUX_BUFFERS;
    public const int GLFW_STEREO;
    public const int GLFW_SAMPLES;
    public const int GLFW_SRGB_CAPABLE;
    public const int GLFW_REFRESH_RATE;

    public const int GLFW_CLIENT_API;
    public const int GLFW_CONTEXT_VERSION_MAJOR;
    public const int GLFW_CONTEXT_VERSION_MINOR;
    public const int GLFW_CONTEXT_REVISION;
    public const int GLFW_CONTEXT_ROBUSTNESS;
    public const int GLFW_OPENGL_FORWARD_COMPAT;
    public const int GLFW_OPENGL_DEBUG_CONTEXT;
    public const int GLFW_OPENGL_PROFILE;

    public const int GLFW_OPENGL_API;
    public const int GLFW_OPENGL_ES_API;

    public const int GLFW_NO_ROBUSTNESS;
    public const int GLFW_NO_RESET_NOTIFICATION;
    public const int GLFW_LOSE_CONTEXT_ON_RESET;

    public const int GLFW_OPENGL_ANY_PROFILE;
    public const int GLFW_OPENGL_CORE_PROFILE;
    public const int GLFW_OPENGL_COMPAT_PROFILE;

    public const int GLFW_CURSOR;
    public const int GLFW_STICKY_KEYS;
    public const int GLFW_STICKY_MOUSE_BUTTONS;

    public const int GLFW_CURSOR_NORMAL;
    public const int GLFW_CURSOR_HIDDEN;
    public const int GLFW_CURSOR_DISABLED;

    public const int GLFW_CONNECTED;
    
    /*************************************************************************
     * GLFW API types
     *************************************************************************/
     
    [SimpleType]
    public struct GLFWmonitor {
    }
    
    [SimpleType]
    public struct GLFWwindow {
    }
    
    [CCode (has_type_id = false)]
    public struct GLFWvidmode {
        public int width;
        public int height;
        public int redBits;
        public int greenBits;
        public int blueBits;
        public int refreshRate;
    }
    
    [CCode (has_type_id = false)]
    public struct GLFWgammaramp {
        public ushort* red;
        public ushort* green;
        public ushort* blue;
        public uint size;
    }
    
    [CCode (has_target = false)]
    public delegate void GLFWglproc ();
    
    [CCode (has_target = false)]
    public delegate void GLFWerrorfun (int error, char* description);
    
    [CCode (has_target = false)]
    public delegate void GLFWwindowposfun (GLFWwindow* window, int xpos, int ypos);
    
    [CCode (has_target = false)]
    public delegate void GLFWwindowsizefun (GLFWwindow* window, int width, int height);
    
    [CCode (has_target = false)]
    public delegate void GLFWwindowclosefun (GLFWwindow* window);
    
    [CCode (has_target = false)]
    public delegate void GLFWwindowrefreshfun (GLFWwindow* window);
    
    [CCode (has_target = false)]
    public delegate void GLFWwindowfocusfun (GLFWwindow* window, bool focus);
    
    [CCode (has_target = false)]
    public delegate void GLFWwindowiconifyfun (GLFWwindow* window, bool iconified);
    
    [CCode (has_target = false)]
    public delegate void GLFWframebuffersizefun (GLFWwindow* window, int width, int height);
    
    [CCode (has_target = false)]
    public delegate void GLFWmousebuttonfun (GLFWwindow* window, int button, int action, int mods);
    
    [CCode (has_target = false)]
    public delegate void GLFWcursorposfun (GLFWwindow* window, double xpos, double ypos);
    
    [CCode (has_target = false)]
    public delegate void GLFWcursorenterfun (GLFWwindow* window, bool entered);
    
    [CCode (has_target = false)]
    public delegate void GLFWscrollfun (GLFWwindow* window, double xoffset, double yoffset);
    
    [CCode (has_target = false)]
    public delegate void GLFWkeyfun (GLFWwindow* window, int key, int scancode, int action, int mods);
    
    [CCode (has_target = false)]
    public delegate void GLFWcharfun (GLFWwindow* window, uint character);
    
    [CCode (has_target = false)]
    public delegate void GLFWmonitorfun (GLFWmonitor* monitor, int event);
    
    public int glfwInit ();
    public void glfwTerminate ();
    public void glfwGetVersion (int* major, int* minor, int* rev);
    public string glfwGetVersionString ();
    public GLFWerrorfun glfwSetErrorCallback (GLFWerrorfun cbfun);
    public GLFWmonitor** glfwGetMonitors (int* count);
    public GLFWmonitor* glfwGetPrimaryMonitor ();
    public void glfwGetMonitorPos (GLFWmonitor* monitor, int* xpos, int* ypos);
    public void glfwGetMonitorPhysicalSize (GLFWmonitor* monitor, int* width, int* height);
    public unowned string glfwGetMonitorName (GLFWmonitor* monitor);
    public GLFWmonitorfun glfwSetMonitorCallback (GLFWmonitorfun cbfun);
    public GLFWvidmode* glfwGetVideoModes (GLFWmonitor* monitor, int* count);
    public GLFWvidmode* glfwGetVideoMode (GLFWmonitor* monitor);
    public void glfwSetGamma (GLFWmonitor* monitor, float gamma);
    public GLFWgammaramp* glfwGetGammaRamp (GLFWmonitor* monitor);
    public void glfwSetGammaRamp (GLFWmonitor* monitor, GLFWgammaramp* ramp);
    public void glfwDefaultWindowHints ();
    public void glfwWindowHint (int target, int hint);
    public GLFWwindow* glfwCreateWindow (int width, int height, string title, GLFWmonitor* monitor, GLFWwindow* share);
    public void glfwDestroyWindow (GLFWwindow* window);
    public bool glfwWindowShouldClose (GLFWwindow* window);
    public void glfwSetWindowShouldClose (GLFWwindow* window, bool @value);
    public void glfwSetWindowTitle (GLFWwindow* window, string title);
    public void glfwGetWindowPos (GLFWwindow* window, int* xpos, int* ypos);
    public void glfwSetWindowPos (GLFWwindow* window, int xpos, int ypos);
    public void glfwGetWindowSize (GLFWwindow* window, int* width, int* height);
    public void glfwSetWindowSize (GLFWwindow* window, int width, int height);
    public void glfwGetFramebufferSize (GLFWwindow* window, int* width, int* height);
    public void glfwIconifyWindow (GLFWwindow* window);
    public void glfwRestoreWindow (GLFWwindow* window);
    public void glfwShowWindow (GLFWwindow* window);
    public void glfwHideWindow (GLFWwindow* window);
    public GLFWmonitor* glfwGetWindowMonitor (GLFWwindow* window);
    public int glfwGetWindowAttrib (GLFWwindow* window, int attrib);
    public void glfwSetWindowUserPointer (GLFWwindow* window, void* pointer);
    public void* glfwGetWindowUserPointer (GLFWwindow* window);
    public GLFWwindowposfun glfwSetWindowPosCallback (GLFWwindow* window, GLFWwindowposfun cbfun);
    public GLFWwindowsizefun glfwSetWindowSizeCallback (GLFWwindow* window, GLFWwindowsizefun cbfun);
    public GLFWwindowclosefun glfwSetWindowCloseCallback (GLFWwindow* window, GLFWwindowclosefun cbfun);
    public GLFWwindowrefreshfun glfwSetWindowRefreshCallback (GLFWwindow* window, GLFWwindowrefreshfun cbfun);
    public GLFWwindowfocusfun glfwSetWindowFocusCallback (GLFWwindow* window, GLFWwindowfocusfun cbfun);
    public GLFWwindowiconifyfun glfwSetWindowIconifyCallback (GLFWwindow* window, GLFWwindowiconifyfun cbfun);
    public GLFWframebuffersizefun glfwSetFramebufferSizeCallback (GLFWwindow* window, GLFWframebuffersizefun cbfun);
    public void glfwPollEvents ();
    public void glfwWaitEvents ();
    public int glfwGetInputMode (GLFWwindow* window, int mode);
    public void glfwSetInputMode (GLFWwindow* window, int mode, int value);
    public int glfwGetKey (GLFWwindow* window, int key);
    public int glfwGetMouseButton (GLFWwindow* window, int button);
    public void glfwGetCursorPos (GLFWwindow* window, double* xpos, double* ypos);
    public void glfwSetCursorPos (GLFWwindow* window, double xpos, double ypos);
    public GLFWkeyfun glfwSetKeyCallback (GLFWwindow* window, GLFWkeyfun cbfun);
    public GLFWcharfun glfwSetCharCallback (GLFWwindow* window, GLFWcharfun cbfun);
    public GLFWmousebuttonfun glfwSetMouseButtonCallback (GLFWwindow* window, GLFWmousebuttonfun cbfun);
    public GLFWcursorposfun glfwSetCursorPosCallback (GLFWwindow* window, GLFWcursorposfun cbfun);
    public GLFWcursorenterfun glfwSetCursorEnterCallback (GLFWwindow* window, GLFWcursorenterfun cbfun);
    public GLFWscrollfun glfwSetScrollCallback (GLFWwindow* window, GLFWscrollfun cbfun);
    public bool glfwJoystickPresent (int joy);
    public float* glfwGetJoystickAxes (int joy, int* count);
    public uchar* glfwGetJoystickButtons (int joy, int* count);
    public unowned string glfwGetJoystickName (int joy);
    public void glfwSetClipboardString (GLFWwindow* window, string @string);
    public unowned string glfwGetClipboardString (GLFWwindow* window);
    public double glfwGetTime ();
    public void glfwSetTime (double time);
    public void glfwMakeContextCurrent (GLFWwindow* window);
    public GLFWwindow* glfwGetCurrentContext ();
    public void glfwSwapBuffers (GLFWwindow* window);
    public void glfwSwapInterval (int interval);
    public int glfwExtensionSupported (string extension);
    public GLFWglproc glfwGetProcAddress (string procname);
}

