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

	[CCode (cprefix = "xcb_test_", cheader_filename = "xcb/xtest.h")]
	namespace XTest {
		public static Connection get_connection (Xcb.Connection c) {
			return (Connection) c;
		}

		[Compact]
		[CCode (cname = "xcb_connection_t", cprefix = "xcb_test_", unref_function = "")]
		public class Connection : Xcb.Connection {
			public GetVersionCookie get_version (uint8 major_version, uint16 minor_version);
			public GetVersionCookie get_version_unchecked (uint8 major_version, uint16 minor_version);
			public GetVersionReply get_version_reply (GetVersionCookie cookie, out Xcb.GenericError? e = null);

			public CompareCursorCookie compare_cursor (Xcb.Window window, Xcb.Cursor cursor);
			public CompareCursorCookie compare_cursor_unchecked (Xcb.Window window, Xcb.Cursor cursor);
			public CompareCursorReply compare_cursor_reply (CompareCursorCookie cookie, out Xcb.GenericError? e = null);

			public VoidCookie fake_input_checked (uint8 type, uint8 detail, uint32 time, Xcb.Window root, int16 rootX, int16 rootY, uint8 device_id);
			public VoidCookie fake_input (uint8 type, uint8 detail, uint32 time, Xcb.Window root, int16 rootX, int16 rootY, uint8 device_id);

			public VoidCookie grab_control_checked (bool impervious);
			public VoidCookie grab_control (bool impervious);
		}

		[SimpleType]
		[IntegerType (rank = 9)]
		[CCode (cname = "xcb_test_get_version_cookie_t", has_type_id = false)]
		public struct GetVersionCookie {
		}

		[Compact]
		[CCode (cname = "xcb_test_get_version_reply_t", ref_function = "", unref_function = "free")]
		public class GetVersionReply : Xcb.GenericReply {
			public uint8 major_version;
			public uint16 minor_version;
		}

		[SimpleType]
		[IntegerType (rank = 9)]
		[CCode (cname = "xcb_test_compare_cursor_cookie_t", has_type_id = false)]
		public struct CompareCursorCookie {
		}

		[Compact]
		[CCode (cname = "xcb_test_compare_cursor_reply_t", ref_function = "", unref_function = "free")]
		public class CompareCursorReply : Xcb.GenericReply {
			public bool same;
		}
	}
}
