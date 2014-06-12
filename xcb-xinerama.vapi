/*
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
 * License along with this library; if not, write to the Free Software
 * Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301  USA
 */

using Xcb;

namespace Xcb {

	[CCode (cprefix = "xcb_xinerama_", cheader_filename = "xcb/xinerama.h")]
	namespace Xinerama {
		public static Connection get_connection (Xcb.Connection c) {
			return (Connection) c;
		}

		[Compact]
		[CCode (cname = "xcb_connection_t", cprefix = "xcb_xinerama_", unref_function = "")]
		public class Connection : Xcb.Connection {
			public QueryVersionCookie query_version (uint8 major, uint8 minor);
			public QueryVersionCookie query_version_unchecked (uint8 major, uint8 minor);
			public QueryVersionReply? query_version_reply (QueryVersionCookie cookie, out GenericError? e = null);

			public GetStateCookie get_state (Xcb.Window window);
			public GetStateCookie get_state_unchecked (Xcb.Window window);
			public GetStateReply? get_state_reply (GetStateCookie cookie, out GenericError? e = null);

			public GetScreenCountCookie get_screen_count (Xcb.Window window);
			public GetScreenCountCookie get_screen_count_unchecked (Xcb.Window window);
			public GetScreenCountReply? get_screen_count_reply (GetScreenCountCookie cookie, out GenericError? e = null);

			public GetScreenSizeCookie get_screen_size (Xcb.Window window, uint32 screen);
			public GetScreenSizeCookie get_screen_size_unchecked (Xcb.Window window, uint32 screen);
			public GetScreenSizeReply? get_screen_size_reply (GetScreenSizeCookie cookie, out GenericError? e = null);

			public IsActiveCookie is_active ();
			public IsActiveCookie is_active_unchecked ();
			public IsActiveReply? is_active_reply (IsActiveCookie cookie, out GenericError? e = null);

			public QueryScreensCookie query_screens ();
			public QueryScreensCookie query_screens_unchecked ();
			public QueryScreensReply? query_screens_reply (QueryScreensCookie cookie, out GenericError? e = null);
		}

		[SimpleType]
		[CCode (cname = "xcb_xinerama_screen_info_t", has_type_id = false)]
		public struct ScreenInfo {
			public int16 x_org;
			public int16 y_org;
			public uint16 width;
			public uint16 height;
		}

		[SimpleType]
		[IntegerType (rank = 9)]
		[CCode (cname = "xcb_xinerama_query_version_cookie_t", has_type_id = false)]
		public struct QueryVersionCookie {
		}

		[Compact]
		[CCode (cname = "xcb_xinerama_query_version_reply_t", ref_function = "", unref_function = "free")]
		public class QueryVersionReply : Xcb.GenericReply {
			public uint16 major;
			public uint16 minor;
		}

		[SimpleType]
		[IntegerType (rank = 9)]
		[CCode (cname = "xcb_xinerama_get_state_cookie_t", has_type_id = false)]
		public struct GetStateCookie {
		}

		[Compact]
		[CCode (cname = "xcb_xinerama_get_state_reply_t", ref_function = "", unref_function = "free")]
		public class GetStateReply : Xcb.GenericReply {
			public uint8 state;
			public Xcb.Window window;
		}

		[SimpleType]
		[IntegerType (rank = 9)]
		[CCode (cname = "xcb_xinerama_get_screen_count_cookie_t", has_type_id = false)]
		public struct GetScreenCountCookie {
		}

		[Compact]
		[CCode (cname = "xcb_xinerama_get_screen_count_reply_t", ref_function = "", unref_function = "free")]
		public class GetScreenCountReply : Xcb.GenericReply {
			public uint8 screen_count;
			public Xcb.Window window;
		}

		[SimpleType]
		[IntegerType (rank = 9)]
		[CCode (cname = "xcb_xinerama_get_screen_size_cookie_t", has_type_id = false)]
		public struct GetScreenSizeCookie {
		}

		[Compact]
		[CCode (cname = "xcb_xinerama_get_screen_size_reply_t", ref_function = "", unref_function = "free")]
		public class GetScreenSizeReply : Xcb.GenericReply {
			public uint32 width;
			public uint32 height;
			public Xcb.Window window;
			public uint32 screen;
		}

		[SimpleType]
		[IntegerType (rank = 9)]
		[CCode (cname = "xcb_xinerama_is_active_cookie_t", has_type_id = false)]
		public struct IsActiveCookie {
		}

		[Compact]
		[CCode (cname = "xcb_xinerama_is_active_reply_t", ref_function = "", unref_function = "free")]
		public class IsActiveReply : Xcb.GenericReply {
			public uint32 state;
		}

		[SimpleType]
		[IntegerType (rank = 9)]
		[CCode (cname = "xcb_xinerama_query_screens_cookie_t", has_type_id = false)]
		public struct QueryScreensCookie {
		}

		[Compact]
		[CCode (cname = "xcb_xinerama_query_screens_reply_t", ref_function = "", unref_function = "free")]
		public class QueryScreensReply : Xcb.GenericReply {
			private uint32 number;
			[CCode (cname = "xcb_xinerama_query_screens_screen_info")]
			private ScreenInfo* vala_screen_info ();
			public unowned ScreenInfo[] screen_info
			{
				get {
					unowned ScreenInfo[] res = (ScreenInfo[]) vala_screen_info ();
					res.length = (int) number;
					return res;
				}
			}
		}
	}
}
