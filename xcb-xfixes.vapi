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

	[CCode (cprefix = "xcb_composite_", cheader_filename = "xcb/xfixes.h")]
	namespace XFixes {
		public static Connection get_connection (Xcb.Connection c) {
			return (Connection) c;
		}

		[Compact]
		[CCode (cname = "xcb_connection_t", cprefix = "xcb_xfixes_", unref_function = "")]
		public class Connection : Xcb.Connection {
			public QueryVersionCookie query_version (uint32 major_version, uint32 minor_version);
			public QueryVersionCookie query_version_unchecked (uint32 major_version, uint32 minor_version);
			public QueryVersionReply? query_version_reply (QueryVersionCookie cookie, out Xcb.GenericError? e = null);

			public VoidCookie change_save_set_checked (SaveSetMode mode, SaveSetTarget target, SaveSetMapping map, Xcb.Window window);
			public VoidCookie change_save_set (SaveSetMode mode, SaveSetTarget target, SaveSetMapping map, Xcb.Window window);

			public VoidCookie select_selection_input_checked (Xcb.Window window, Xcb.Atom selection, SelectionEventMask event_mask);
			public VoidCookie select_selection_input (Xcb.Window window, Xcb.Atom selection, SelectionEventMask event_mask);

			public VoidCookie select_cursor_input_checked (Xcb.Window window, SelectionEventMask event_mask);
			public VoidCookie select_cursor_input (Xcb.Window window, SelectionEventMask event_mask);

			public GetCursorImageCookie get_cursor_image ();
			public GetCursorImageCookie get_cursor_image_unchecked ();
			public GetCursorImageReply? get_cursor_image_reply (GetCursorImageCookie cookie, out Xcb.GenericError? e = null);

			public VoidCookie create_region_checked (Region region, [CCode (array_length_pos = 1.9, array_length_type = "uint32_t")] Xcb.Rectangle[] rectangles);
			public VoidCookie create_region (Region region, [CCode (array_length_pos = 1.9, array_length_type = "uint32_t")] Xcb.Rectangle[] rectangles);

			public VoidCookie create_region_from_bitmap_checked (Region region, Xcb.Pixmap bitmap);
			public VoidCookie create_region_from_bitmap (Region region, Xcb.Pixmap bitmap);

			public VoidCookie create_region_from_window_checked (Region region, Xcb.Window window, Xcb.Shape.Kind kind);
			public VoidCookie create_region_from_window (Region region, Xcb.Window window, Xcb.Shape.Kind kind);

			public VoidCookie create_region_from_gc_checked (Region region, Xcb.GContext gc);
			public VoidCookie create_region_from_gc (Region region, Xcb.GContext gc);

			public VoidCookie create_region_from_picture_checked (Region region, Xcb.Render.Picture picture);
			public VoidCookie create_region_from_picture (Region region, Xcb.Render.Picture picture);

			public VoidCookie destroy_region_checked (Region region);
			public VoidCookie destroy_region (Region region);

			public VoidCookie set_region_checked (Region region, [CCode (array_length_pos = 1.9, array_length_type = "uint32_t")] Xcb.Rectangle[] rectangles);
			public VoidCookie set_region (Region region, [CCode (array_length_pos = 1.9, array_length_type = "uint32_t")] Xcb.Rectangle[] rectangles);

			public VoidCookie copy_region_checked (Region source, Region destination);
			public VoidCookie copy_region (Region source, Region destination);

			public VoidCookie union_region_checked (Region source1, Region source2, Region destination);
			public VoidCookie union_region (Region source1, Region source2, Region destination);

			public VoidCookie intersect_region_checked (Region source1, Region source2, Region destination);
			public VoidCookie intersect_region (Region source1, Region source2, Region destination);

			public VoidCookie subtract_region_checked (Region source1, Region source2, Region destination);
			public VoidCookie subtract_region (Region source1, Region source2, Region destination);

			public VoidCookie invert_region_checked (Region source, Xcb.Rectangle bounds, Region destination);
			public VoidCookie invert_region (Region source, Xcb.Rectangle bounds, Region destination);

			public VoidCookie translate_region_checked (Region region, int16 dx, int16 dy);
			public VoidCookie translate_region (Region region, int16 dx, int16 dy);

			public VoidCookie region_extents_checked (Region source, Region destination);
			public VoidCookie region_extents (Region source, Region destination);

			public FetchRegionCookie fetch_region (Region region);
			public FetchRegionCookie fetch_region_unchecked (Region region);
			public FetchRegionReply? fetch_region_reply (FetchRegionCookie cookie, out Xcb.GenericError? e = null);

			public VoidCookie set_gc_clip_region_checked (Xcb.GContext gc, Region region, int16 x_origin, int16 y_origin);
			public VoidCookie set_gc_clip_region (Xcb.GContext gc, Region region, int16 x_origin, int16 y_origin);

			public VoidCookie set_window_shape_region_checked (Xcb.Window dest, Xcb.Shape.Kind dest_kind, int16 x_offset, int16 y_offset, Region region);
			public VoidCookie set_window_shape_region (Xcb.Window dest, Xcb.Shape.Kind dest_kind, int16 x_offset, int16 y_offset, Region region);

			public VoidCookie set_picture_clip_region_checked (Xcb.Render.Picture picture, Region region, int16 x_origin, int16 y_origin);
			public VoidCookie set_picture_clip_region (Xcb.Render.Picture picture, Region region, int16 x_origin, int16 y_origin);

			[CCode (cname = "xcb_xfixes_set_cursor_name_checked")]
			public VoidCookie vala_set_cursor_name_checked (Xcb.Cursor cursor, uint16 nbytes, string name);
			[CCode (cname = "vala_xcb_xfixes_set_cursor_name_checked")]
			public VoidCookie set_cursor_name_checked (Xcb.Cursor cursor, string name) {
				this.vala_set_cursor_name_checked (cursor, (uint16) name.length, name);
			}
			[CCode (cname = "xcb_xfixes_set_cursor_name")]
			public VoidCookie vala_set_cursor_name (Xcb.Cursor cursor, uint16 nbytes, string name);
			[CCode (cname = "vala_xcb_xfixes_set_cursor_name")]
			public VoidCookie set_cursor_name (Xcb.Cursor cursor, string name) {
				this.vala_set_cursor_name (cursor, (uint16) name.length, name);
			}

			public GetCursorNameCookie get_cursor_name (Xcb.Cursor cursor);
			public GetCursorNameCookie get_cursor_name_unchecked (Xcb.Cursor cursor);
			public GetCursorNameReply? get_cursor_name_reply (GetCursorNameCookie cookie, out Xcb.GenericError? e = null);

			public GetCursorImageAndNameCookie get_cursor_image_and_name ();
			public GetCursorImageAndNameCookie get_cursor_image_and_name_unchecked ();
			public GetCursorImageAndNameReply? get_cursor_image_and_name_reply (GetCursorImageAndNameCookie cookie, out Xcb.GenericError? e = null);

			public VoidCookie change_cursor_checked (Xcb.Cursor source, Xcb.Cursor destination);
			public VoidCookie change_cursor (Xcb.Cursor source, Xcb.Cursor destination);

			[CCode (cname = "xcb_xfixes_change_cursor_by_name_checked")]
			public VoidCookie vala_change_cursor_by_name_checked (Xcb.Cursor src, uint16 nbytes, string name);
			[CCode (cname = "vala_xcb_xfixes_change_cursor_by_name_checked")]
			public VoidCookie change_cursor_by_name_checked (Xcb.Cursor src, string name) {
				this.vala_change_cursor_by_name_checked (src, (uint16) name.length, name);
			}
			[CCode (cname = "xcb_xfixes_change_cursor_by_name")]
			public VoidCookie vala_change_cursor_by_name (Xcb.Cursor src, uint16 nbytes, string name);
			[CCode (cname = "vala_xcb_xfixes_change_cursor_by_name")]
			public VoidCookie change_cursor_by_name (Xcb.Cursor src, string name) {
				this.vala_change_cursor_by_name (src, (uint16) name.length, name);
			}

			public VoidCookie expand_region_checked (Region source, Region destination, uint16 left, uint16 right, uint16 top, uint16 bottom);
			public VoidCookie expand_region (Region source, Region destination, uint16 left, uint16 right, uint16 top, uint16 bottom);

			public VoidCookie hide_cursor_checked (Xcb.Window window);
			public VoidCookie hide_cursor (Xcb.Window window);

			public VoidCookie show_cursor_checked (Xcb.Window window);
			public VoidCookie show_cursor (Xcb.Window window);

			public VoidCookie create_pointer_barrier_checked (Barrier barrier, Xcb.Window window, uint16 x1, uint16 y1, uint16 x2, uint16 y2, uint32 directions, [CCode (array_length_pos = 7.9, array_length_type = "uint16_t")] uint16[] devices);
			public VoidCookie create_pointer_barrier (Barrier barrier, Xcb.Window window, uint16 x1, uint16 y1, uint16 x2, uint16 y2, uint32 directions, [CCode (array_length_pos = 7.9, array_length_type = "uint16_t")] uint16[] devices);

			public VoidCookie delete_pointer_barrier_checked (Barrier barrier);
			public VoidCookie delete_pointer_barrier (Barrier barrier);
		}

		[CCode (cname = "xcb_xfixes_save_set_mode_t", cprefix = "XCB_XFIXES_SAVE_SET_MODE_", has_type_id = false)]
		public enum SaveSetMode
		{
			INSERT,
			DELETE
		}

		[CCode (cname = "xcb_xfixes_save_set_target_t", cprefix = "XCB_XFIXES_SAVE_SET_TARGET_", has_type_id = false)]
		public enum SaveSetTarget
		{
			NEAREST,
			ROOT
		}

		[CCode (cname = "xcb_xfixes_save_set_mapping_t", cprefix = "XCB_XFIXES_SAVE_SET_MAPPING_", has_type_id = false)]
		public enum SaveSetMapping
		{
			MAP,
			UNMAP
		}

		[CCode (cname = "xcb_xfixes_selection_event_t", cprefix = "XCB_XFIXES_SELECTION_EVENT_", has_type_id = false)]
		public enum SelectionEvent
		{
			SET_SELECTION_OWNER,
			SELECTION_WINDOW_DESTROY,
			SELECTION_CLIENT_CLOSE
		}

		[CCode (cname = "xcb_xfixes_selection_event_mask_t", cprefix = "XCB_XFIXES_SELECTION_EVENT_MASK_", has_type_id = false)]
		public enum SelectionEventMask
		{
			SET_SELECTION_OWNER,
			SELECTION_WINDOW_DESTROY,
			SELECTION_CLIENT_CLOSE
		}

		[SimpleType]
		[IntegerType (rank = 9)]
		[CCode (cname = "xcb_xfixes_region_t", has_type_id = false)]
		public struct Region {
		}

		[SimpleType]
		[IntegerType (rank = 9)]
		[CCode (cname = "xcb_xfixes_barrier_t", has_type_id = false)]
		public struct Barrier {
		}

		[SimpleType]
		[IntegerType (rank = 9)]
		[CCode (cname = "xcb_xfixes_query_version_cookie_t", has_type_id = false)]
		public struct QueryVersionCookie {
		}

		[Compact]
		[CCode (cname = "xcb_xfixes_query_version_reply_t", ref_function = "", unref_function = "free")]
		public class QueryVersionReply : Xcb.GenericReply {
			public uint32 major_version;
			public uint32 minor_version;
		}

		[SimpleType]
		[IntegerType (rank = 9)]
		[CCode (cname = "xcb_xfixes_get_cursor_image_cookie_t", has_type_id = false)]
		public struct GetCursorImageCookie {
		}

		[Compact]
		[CCode (cname = "xcb_xfixes_get_cursor_image_reply_t", ref_function = "", unref_function = "free")]
		public class GetCursorImageReply : Xcb.GenericReply {
			public int16 x;
			public int16 y;
			public uint16 width;
			public uint16 height;
			public uint16 xhot;
			public uint16 yhot;
			public uint16 cursor_serial;
		}

		[SimpleType]
		[IntegerType (rank = 9)]
		[CCode (cname = "xcb_xfixes_fetch_region_cookie_t", has_type_id = false)]
		public struct FetchRegionCookie {
		}

		[Compact]
		[CCode (cname = "xcb_xfixes_fetch_region_reply_t", ref_function = "", unref_function = "free")]
		public class FetchRegionReply : Xcb.GenericReply {
			public Xcb.Rectangle extents;
		}

		[SimpleType]
		[IntegerType (rank = 9)]
		[CCode (cname = "xcb_xfixes_get_cursor_name_cookie_t", has_type_id = false)]
		public struct GetCursorNameCookie {
		}

		[Compact]
		[CCode (cname = "xcb_xfixes_get_cursor_name_reply_t", ref_function = "", unref_function = "free")]
		public class GetCursorNameReply : Xcb.GenericReply {
			public Xcb.Atom atom;
			private uint16 nbytes;
			[CCode (cname = "xcb_xfixes_get_cursor_name_name")]
			private unowned string vala_name ();
			public string name { owned get { return "%.*s".printf (nbytes, vala_name ()); } }
		}

		[SimpleType]
		[IntegerType (rank = 9)]
		[CCode (cname = "xcb_xfixes_get_cursor_image_and_name_cookie_t", has_type_id = false)]
		public struct GetCursorImageAndNameCookie {
		}

		[Compact]
		[CCode (cname = "xcb_xfixes_get_cursor_image_and_name_reply_t", ref_function = "", unref_function = "free")]
		public class GetCursorImageAndNameReply : Xcb.GenericReply {
			public int16 x;
			public int16 y;
			public uint16 width;
			public uint16 height;
			public uint16 xhot;
			public uint16 yhot;
			public uint16 cursor_serial;
			public Xcb.Atom cursor_atom;
			private uint16 nbytes;
			[CCode (cname = "xcb_xfixes_get_cursor_image_and_name_name")]
			private unowned string vala_name ();
			public string name { owned get { return "%.*s".printf (nbytes, vala_name ()); } }
		}
	}
}
