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

	[CCode (cprefix = "xcb_shape_", cheader_filename = "xcb/shape.h")]
	namespace Shape {
		public static Connection get_connection (Xcb.Connection c) {
			return (Connection) c;
		}

		[Compact]
		[CCode (cname = "xcb_connection_t", cprefix = "xcb_shape_", unref_function = "")]
		public class Connection : Xcb.Connection {
			public QueryVersionCookie query_version ();
			public QueryVersionCookie query_version_unchecked ();
			public QueryVersionReply? query_version_reply (QueryVersionCookie cookie, out Xcb.GenericError? e = null);

			public VoidCookie rectangles_checked (Op operation, Kind destination_kind, uint8 ordering, Xcb.Window destination_window, int16 x_offset, int16 y_offset, [CCode (array_length_pos = 6.9, array_length_type = "uint32_t")] Xcb.Rectangle[] rectangles);
			public VoidCookie rectangles (Op operation, Kind destination_kind, uint8 ordering, Xcb.Window destination_window, int16 x_offset, int16 y_offset, [CCode (array_length_pos = 6.9, array_length_type = "uint32_t")] Xcb.Rectangle[] rectangles);

			public VoidCookie shape_mask_checked (Op operation, Kind destination_kind, uint8 ordering, Xcb.Window destination_window, int16 x_offset, int16 y_offset, Xcb.Pixmap source_bitmap);
			public VoidCookie shape_mask (Op operation, Kind destination_kind, uint8 ordering, Xcb.Window destination_window, int16 x_offset, int16 y_offset, Xcb.Pixmap source_bitmap);

			public VoidCookie shape_combine_checked (Op operation, Kind destination_kind, Kind source_kind, Xcb.Window destination_window, int16 x_offset, int16 y_offset, Xcb.Window source_window);
			public VoidCookie shape_combine (Op operation, Kind destination_kind, Kind source_kind, Xcb.Window destination_window, int16 x_offset, int16 y_offset, Xcb.Window source_window);

			public VoidCookie shape_offset_checked (Kind destination_kind, Xcb.Window destination_window, int16 x_offset, int16 y_offset);
			public VoidCookie shape_offset (Kind destination_kind, Xcb.Window destination_window, int16 x_offset, int16 y_offset);

			public QueryExtentsCookie query_extents (Xcb.Window destination_window);
			public QueryExtentsCookie query_extents_unchecked (Xcb.Window destination_window);
			public QueryExtentsReply query_extents_reply (QueryExtentsCookie cookie, out Xcb.GenericError? e = null);

			public VoidCookie select_input_checked (Xcb.Window destination_window, bool enable);
			public VoidCookie select_input (Xcb.Window destination_window, bool enable);

			public InputSelectedCookie input_selected (Xcb.Window destination_window);
			public InputSelectedCookie input_selected_unchecked (Xcb.Window destination_window);
			public InputSelectedReply input_selected_reply (InputSelectedCookie cookie, out Xcb.GenericError? e = null);

			public GetRectanglesCookie get_rectangles (Xcb.Window window, Kind source_kind);
			public GetRectanglesCookie get_rectangles_unchecked (Xcb.Window window, Kind source_kind);
			public GetRectanglesReply get_rectangles_reply (GetRectanglesCookie cookie, out Xcb.GenericError? e = null);
		}

		[SimpleType]
		[CCode (cname = "xcb_shape_op_t", has_type_id = false)]
		public struct Op : uint8 {
		}

		[SimpleType]
		[CCode (cname = "xcb_shape_kind_t", has_type_id = false)]
		public struct Kind : uint8 {
		}

		[CCode (cname = "xcb_shape_so_t", has_type_id = false)]
		public enum SO // FIXME: Does this replace Op?
		{
			SET,
			UNION,
			INTERSECT,
			SUBTRACT,
			INVERT
		}

		[CCode (cname = "xcb_shape_sk_t", has_type_id = false)]
		public enum SK // FIXME: Does this replace Kind?
		{
			BOUNDING,
			CLIP,
			INPUT
		}

		[SimpleType]
		[IntegerType (rank = 9)]
		[CCode (cname = "xcb_shape_query_version_cookie_t", has_type_id = false)]
		public struct QueryVersionCookie {
		}

		[Compact]
		[CCode (cname = "xcb_shape_query_version_reply_t", ref_function = "", unref_function = "free")]
		public struct QueryVersionReply {
			public uint16 major_version;
			public uint16 minor_version;
		}

		[SimpleType]
		[IntegerType (rank = 9)]
		[CCode (cname = "xcb_shape_query_extents_cookie_t", has_type_id = false)]
		public struct QueryExtentsCookie {
		}

		[Compact]
		[CCode (cname = "xcb_shape_query_extents_reply_t", ref_function = "", unref_function = "free")]
		public struct QueryExtentsReply {
			public bool bounding_shaped;
			public bool clip_shaped;
			public uint16 bounding_shape_extents_x;
			public uint16 bounding_shape_extents_y;
			public uint16 bounding_shape_extents_width;
			public uint16 bounding_shape_extents_height;
			public uint16 clip_shape_extents_x;
			public uint16 clip_shape_extents_y;
			public uint16 clip_shape_extents_width;
			public uint16 clip_shape_extents_height;
		}

		[SimpleType]
		[IntegerType (rank = 9)]
		[CCode (cname = "xcb_shape_input_selected_cookie_t", has_type_id = false)]
		public struct InputSelectedCookie {
		}

		[Compact]
		[CCode (cname = "xcb_shape_input_selected_reply_t", ref_function = "", unref_function = "free")]
		public struct InputSelectedReply {
			public bool enabled;
		}

		[SimpleType]
		[IntegerType (rank = 9)]
		[CCode (cname = "xcb_shape_get_rectangles_cookie_t", has_type_id = false)]
		public struct GetRectanglesCookie {
		}

		[Compact]
		[CCode (cname = "xcb_shape_get_rectangles_reply_t", ref_function = "", unref_function = "free")]
		public struct GetRectanglesReply {
			private uint8 ordering; // FIXME: What type?
			private uint32 rectangles_len;
			[CCode (cname = "xcb_shape_get_rectangles_rectangles")]
			private Xcb.Rectangle* vala_rectangles ();
			public Xcb.Rectangle[] rectangles
			{
				get {
					unowned Xcb.Rectangle[] res = (Xcb.Rectangle[]) vala_rectangles ();
					res.length = (int) rectangles_len;
					return res;
				}
			}
		}
	}
}
