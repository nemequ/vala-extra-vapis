/* libevent Vala Bindings
 * Copyright 2010 Evan Nemerson <evan@coeus-group.com>
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

[CCode (cheader_filename = "event2/event.h", lower_case_cprefix = "event_")]
namespace LibEvent {
  [Compact, CCode (cname = "struct event_base", cheader_filename = "event2/event.h")]
  public class Base {
    public Base ();
    public Base.with_config (LibEvent.Config cfg);
    [CCode (cname = "event_reinit")]
    public int reinit ();
    public int dispatch ();
    public unowned string get_method ();
    public int get_features ();
    public void set (LibEvent.Event event);
    public int loop (LibEvent.LoopFlags flags);
    public int loopexit (GLib.TimeVal tv);
    public int loopbreak ();
    public bool got_exit ();
    public bool got_break ();
    public int once (LibEvent.Base base, LibEvent.Util.Socket fd, short event, LibEvent.OccuredCallback cb, GLib.TimeVal tv);
    public int priority_init (int npriorities);
    public unowned GLib.TimeVal init_common_timeout (GLib.TimeVal duration);
    public void dump_events (GLib.FileStream file);
  }

  [Compact, CCode (cname = "struct event_config")]
  public class Config {
    public int avoid_method (string method);
    public int require_features (int feature);
    public int set_flag (int flag);
  }

  [Compact, CCode (cname = "struct event", cprefix = "event_")]
  public class Event {
    public Event (LibEvent.Base base, LibEvent.Util.Socket fd, short event, LibEvent.OccuredCallback cb);
    public int assign (LibEvent.Base base, LibEvent.Util.Socket fd, short event, LibEvent.OccuredCallback cb);
    public int add (GLib.TimeVal tv);
    public int del ();
    public int active (int res, short ncalls);
    public int pending (LibEvent.Flags what, GLib.TimeVal tv);
    public bool initialized ();
    public LibEvent.Util.Socket get_fd ();
    public LibEvent.Base get_base ();
    public int priority_set (int priority);
  }

  [CCode (cname = "enum event_method_feature", cprefix = "EV_FEATURE_", has_type_id = false)]
  public enum MethodFeature {
    ET,
    O1,
    FDS
  }

  [CCode (cname = "enum event_base_config_flag", cprefix = "EVENT_BASE_FLAG_", has_type_id = false)]
  public enum BaseConfigFlag {
	NOLOCK,
	IGNORE_ENV,
	STARTUP_IOCP,
	NO_CACHE_TIME
  }

  [CCode (cname = "int", cprefix = "_EVENT_LOG_", has_type_id = false)]
  public enum LogSeverity {
    DEBUG,
    MSG,
    WARN,
    ERR,
  }

  [Flags, CCode (cname = "int", cprefix = "EVLOOP_")]
  public enum LoopFlags {
    ONCE,
    NONBLOCK
  }

  [Flags, CCode (cname = "short", cprefix = "EV_")]
  public enum Flags {
    TIMEOUT,
    READ,
    WRITE,
    SIGNAL,
    PERSIST,
    ET
  }

  [CCode (cname = "event_log_cb", has_target = false)]
  public delegate void LogCallback (LibEvent.LogSeverity severity, string message);
  [CCode (cname = "event_fatal_cb", has_target = false)]
  public delegate void FatalCallback (int err);
  [CCode (cname = "void (*)(evutil_socket_t, short, void *)")]
  public delegate void OccuredCallback (LibEvent.Util.Socket socket, short event);

  [CCode (cname = "void *(*)(size_t)")]
  public delegate void* MallocFunc (size_t sz);
  [CCode (cname = "void *(*)(void *, size_t)")]
  public delegate void* ReallocFunc (void* ptr, size_t sz);
  [CCode (cname = "void (*)(void *)")]
  public delegate void FreeFunc (void* ptr);

  public static unowned string[] get_supported_methods ();
  public static void set_log_callback (LibEvent.LogCallback cb);
  public static void set_fatal_callback (LibEvent.FatalCallback cb);
  public static unowned string get_version ();
  public static uint32 get_version_number ();
  public static void set_mem_functions (LibEvent.MallocFunc malloc_fn, LibEvent.ReallocFunc realloc_fn, LibEvent.FreeFunc free_fn);

  [CCode (cname ="LIBEVENT_VERSION")]
  public const int VERSION;
  [CCode (cname ="LIBEVENT_VERSION_NUMBER")]
  public const int VERSION_NUMBER;
  public const int MAX_PRIORITIES;

  [CCode (lower_case_cprefix = "evutil_")]
  namespace Util {
    [SimpleType, CCode (cname = "evutil_socket_t")]
    public struct Socket {
      [CCode (cname = "evutil_socketpair")]
      public static int create_pair (int d, int type, int protocol, [CCode (array_length = false)] LibEvent.Util.Socket sv[2]);
      [CCode (cname = "evutil_make_socket_nonblocking")]
      public int make_nonblocking ();
      [CCode (cname = "evutil_make_listen_socket_reuseable")]
      public int make_listen_reuseable();
      [CCode (cname = "evutil_make_socket_closeonexec")]
      public int make_close_on_exec();
      [CCode (cname = "evutil_closesocket")]
      public int close ();
      [CCode (cname = "evutil_socket_geterror")]
      public int get_error ();
      [CCode (cname = "evutil_socket_error_to_string")]
      public static unowned string error_to_string (int errcode);
    }
  }
}
