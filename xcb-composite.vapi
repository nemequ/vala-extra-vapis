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

	[CCode (cprefix = "xcb_composite_", cheader_filename = "xcb/composite.h")]
	namespace Composite {
		public static Connection get_connection (Xcb.Connection c) {
			return (Connection) c;
		}

		[Compact]
		[CCode (cname = "xcb_connection_t", cprefix = "xcb_composite_", unref_function = "")]
		public class Connection : Xcb.Connection {
			public QueryVersionCookie query_version (uint32 major_version, uint32 minor_version);
			public QueryVersionCookie query_version_unchecked (uint32 major_version, uint32 minor_version);
			public QueryVersionReply? query_version_reply (QueryVersionCookie cookie, out Xcb.GenericError? e = null);

			public VoidCookie redirect_window_checked (Xcb.Window window, uint8 update);
			public VoidCookie redirect_window (Xcb.Window window, uint8 update);

			public VoidCookie redirect_subwindows_checked (Xcb.Window window, uint8 update);
			public VoidCookie redirect_subwindows (Xcb.Window window, uint8 update);

			public VoidCookie unredirect_window_checked (Xcb.Window window, uint8 update);
			public VoidCookie unredirect_window (Xcb.Window window, uint8 update);

			public VoidCookie unredirect_subwindows_checked (Xcb.Window window, uint8 update);
			public VoidCookie unredirect_subwindows (Xcb.Window window, uint8 update);

			public VoidCookie create_region_from_border_clip_checked (Xcb.XFixes.Region region, Xcb.Window window);
			public VoidCookie create_region_from_border_clip (Xcb.XFixes.Region region, Xcb.Window window);

			public VoidCookie name_window_pixmap_checked (Xcb.Window window, Xcb.Pixmap pixmap);
			public VoidCookie name_window_pixmap (Xcb.Window window, Xcb.Pixmap pixmap);

			public GetOverlayWindowCookie get_overlay_window (Xcb.Window window);
			public GetOverlayWindowCookie get_overlay_window_unchecked (Xcb.Window window);
			public GetOverlayWindowReply? get_overlay_window_reply (GetOverlayWindowCookie cookie, out Xcb.GenericError? e = null);

			public VoidCookie release_overlay_window_checked (Xcb.Window window);
			public VoidCookie release_overlay_window (Xcb.Window window);
		}

		[SimpleType]
		[IntegerType (rank = 9)]
		[CCode (cname = "xcb_composite_query_version_cookie_t", has_type_id = false)]
		public struct QueryVersionCookie {
		}

		[Compact]
		[CCode (cname = "xcb_composite_query_version_reply_t", ref_function = "", unref_function = "free")]
		public class QueryVersionReply : Xcb.GenericReply {
			public uint32 major_version;
			public uint32 minor_version;
		}

		[SimpleType]
		[IntegerType (rank = 9)]
		[CCode (cname = "xcb_composite_get_overlay_window_cookie_t", has_type_id = false)]
		public struct GetOverlayWindowCookie {
		}

		[Compact]
		[CCode (cname = "xcb_composite_get_overlay_window_reply_t", ref_function = "", unref_function = "free")]
		public class GetOverlayWindowReply : Xcb.GenericReply {
			public Xcb.Window overlay_win;
		}
	}
}
