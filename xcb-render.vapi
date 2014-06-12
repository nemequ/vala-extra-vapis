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

	[CCode (lower_case_cprefix = "xcb_render_", cheader_filename = "xcb/render.h")]
	namespace Render {
		public static Connection get_connection (Xcb.Connection c) {
			return (Connection) c;
		}

		[Compact]
		[CCode (cname = "xcb_connection_t", cprefix = "xcb_render_", unref_function = "")]
		public class Connection : Xcb.Connection {
			public QueryVersionCookie query_version (uint32 client_major_version, uint32 client_minor_version);
			public QueryVersionCookie query_version_unchecked (uint32 client_major_version, uint32 client_minor_version);
			public QueryVersionReply query_version_reply (QueryVersionCookie cookie, out Xcb.GenericError? e = null);

			public QueryPictFormatsCookie query_pict_formats ();
			public QueryPictFormatsCookie query_pict_formats_unchecked ();
			public QueryPictFormatsReply query_pict_formats_reply (QueryPictFormatsCookie cookie, out GenericError? e = null);

			public QueryPictIndexValuesCookie query_pict_index_values (PictFormat format);
			public QueryPictIndexValuesCookie query_pict_index_values_unchecked (PictFormat format);
			public QueryPictIndexValuesReply query_pict_index_values_reply (QueryPictIndexValuesCookie cookie, out GenericError? e = null);

			public VoidCookie create_picture_checked (Picture pid, Xcb.Drawable drawable, PictFormat format, CP value_mask = 0, [CCode (array_length = false)] uint32[]? value_list = null);
			public VoidCookie create_picture (Picture pid, Xcb.Drawable drawable, PictFormat format, CP value_mask = 0, [CCode (array_length = false)] uint32[]? value_list = null);

			public VoidCookie change_picture_checked (Picture picture, CP value_mask, [CCode (array_length = false)] uint32[] value_list);
			public VoidCookie change_picture (Picture picture, CP value_mask, [CCode (array_length = false)] uint32[] value_list);

			public VoidCookie set_picture_clip_rectangles_checked (Picture picture, int16 clip_x_origin, int16 clip_y_origin, [CCode (array_length_pos = 3.9, array_length_type = "uint32_t")] Xcb.Rectangle[] rectangles);
			public VoidCookie set_picture_clip_rectangles (Picture picture, int16 clip_x_origin, int16 clip_y_origin, [CCode (array_length_pos = 3.9, array_length_type = "uint32_t")] Xcb.Rectangle[] rectangles);

			public VoidCookie free_picture_checked (Picture picture);
			public VoidCookie free_picture (Picture picture);

			public VoidCookie composite_checked (PictOp op, Picture src, Picture mask, Picture dst, int16 src_x, int16 src_y, int16 mask_x, int16 mask_y, int16 dst_x, int16 dst_y, uint16 width, uint16 height);
			public VoidCookie composite (PictOp op, Picture src, Picture mask, Picture dst, int16 src_x, int16 src_y, int16 mask_x, int16 mask_y, int16 dst_x, int16 dst_y, uint16 width, uint16 height);

			public VoidCookie trapezoids_checked (PictOp op, Picture src, Picture dst, PictFormat mask_format, int16 src_x, int16 src_y,  [CCode (array_length_pos = 6.9, array_length_type = "uint32_t")] Trapezoid[] traps);
			public VoidCookie trapezoids (PictOp op, Picture src, Picture dst, PictFormat mask_format, int16 src_x, int16 src_y,  [CCode (array_length_pos = 6.9, array_length_type = "uint32_t")] Trapezoid[] traps);

			public VoidCookie triangles_checked (PictOp op, Picture src, Picture dst, PictFormat mask_format, int16 src_x, int16 src_y,  [CCode (array_length_pos = 6.9, array_length_type = "uint32_t")] Triangle[] triangles);
			public VoidCookie triangles (PictOp op, Picture src, Picture dst, PictFormat mask_format, int16 src_x, int16 src_y,  [CCode (array_length_pos = 6.9, array_length_type = "uint32_t")] Triangle[] triangles);

			public VoidCookie tri_strip_checked (PictOp op, Picture src, Picture dst, PictFormat mask_format, int16 src_x, int16 src_y, [CCode (array_length_pos = 6.9, array_length_type = "uint32_t")] PointFix[] points);
			public VoidCookie tri_strip (PictOp op, Picture src, Picture dst, PictFormat mask_format, int16 src_x, int16 src_y, [CCode (array_length_pos = 6.9, array_length_type = "uint32_t")] PointFix[] points);

			public VoidCookie tri_fan_checked (PictOp op, Picture src, Picture dst, PictFormat mask_format, int16 src_x, int16 src_y, [CCode (array_length_pos = 6.9, array_length_type = "uint32_t")] PointFix[] points);
			public VoidCookie tri_fan (PictOp op, Picture src, Picture dst, PictFormat mask_format, int16 src_x, int16 src_y, [CCode (array_length_pos = 6.9, array_length_type = "uint32_t")] PointFix[] points);

			public VoidCookie create_glyph_set_checked (GlyphSet gsid, PictFormat format);
			public VoidCookie create_glyph_set (GlyphSet gsid, PictFormat format);

			public VoidCookie reference_glyph_set_checked (GlyphSet gsid, GlyphSet existing);
			public VoidCookie reference_glyph_set (GlyphSet gsid, GlyphSet existing);

			public VoidCookie free_glyph_set_checked (GlyphSet glyphset);
			public VoidCookie free_glyph_set (GlyphSet glyphset);

			public VoidCookie add_glyphs_checked (GlyphSet glyphset, [CCode (array_length_pos = 1.9, array_length_type = "uint32_t")] Glyph[] glyphids, [CCode (array_length = false)] GlyphInfo[] glyphs, [CCode (array_length_pos = 4.9, array_length_type = "uint32_t")] uint8[] data);
			public VoidCookie add_glyphs (GlyphSet glyphset, [CCode (array_length_pos = 1.9, array_length_type = "uint32_t")] Glyph[] glyphids, [CCode (array_length = false)] GlyphInfo[] glyphs, [CCode (array_length_pos = 4.9, array_length_type = "uint32_t")] uint8[] data);

			public VoidCookie free_glyphs_checked (GlyphSet glyphset, [CCode (array_length_pos = 1.9, array_length_type = "uint32_t")] Glyph[] glyphs);
			public VoidCookie free_glyphs (GlyphSet glyphset, [CCode (array_length_pos = 1.9, array_length_type = "uint32_t")] Glyph[] glyphs);

			public VoidCookie composite_glyphs_8_checked (PictOp op, Picture src, Picture dst, PictFormat mask_format, GlyphSet glyphset, int16 src_x, int16 src_y, [CCode (array_length_pos = 7.9, array_length_type = "uint32_t")] uint8[] glyphcmds);
			public VoidCookie composite_glyphs_8 (PictOp op, Picture src, Picture dst, PictFormat mask_format, GlyphSet glyphset, int16 src_x, int16 src_y, [CCode (array_length_pos = 7.9, array_length_type = "uint32_t")] uint8[] glyphcmds);

			public VoidCookie composite_glyphs_16_checked (PictOp op, Picture src, Picture dst, PictFormat mask_format, GlyphSet glyphset, int16 src_x, int16 src_y, [CCode (array_length_pos = 7.9, array_length_type = "uint32_t")] uint8[] glyphcmds);
			public VoidCookie composite_glyphs_16 (PictOp op, Picture src, Picture dst, PictFormat mask_format, GlyphSet glyphset, int16 src_x, int16 src_y, [CCode (array_length_pos = 7.9, array_length_type = "uint32_t")] uint8[] glyphcmds);

			public VoidCookie composite_glyphs_32_checked (PictOp op, Picture src, Picture dst, PictFormat mask_format, GlyphSet glyphset, int16 src_x, int16 src_y, [CCode (array_length_pos = 7.9, array_length_type = "uint32_t")] uint8[] glyphcmds);
			public VoidCookie composite_glyphs_32 (PictOp op, Picture src, Picture dst, PictFormat mask_format, GlyphSet glyphset, int16 src_x, int16 src_y, [CCode (array_length_pos = 7.9, array_length_type = "uint32_t")] uint8[] glyphcmds);

			public VoidCookie fill_rectangles_checked (PictOp op, Picture dst, Color color, [CCode (array_length_pos = 3.9, array_length_type = "uint32_t")] Xcb.Rectangle[] rects);
			public VoidCookie fill_rectangles (PictOp op, Picture dst, Color color, [CCode (array_length_pos = 3.9, array_length_type = "uint32_t")] Xcb.Rectangle[] rects);

			public VoidCookie create_cursor_checked (Xcb.Cursor cid, Picture source, uint16 x, uint16 y);
			public VoidCookie create_cursor (Xcb.Cursor cid, Picture source, uint16 x, uint16 y);

			public VoidCookie set_picture_transform_checked (Picture picture, Transform transform);
			public VoidCookie set_picture_transform (Picture picture, Transform transform);

			public QueryFiltersCookie query_filters (Xcb.Drawable drawable);
			public QueryFiltersCookie query_filters_unchecked (Xcb.Drawable drawable);
			public QueryFiltersReply query_filters_reply (QueryFiltersCookie cookie, out GenericError? e = null);

			[CCode (cname = "xcb_render_set_picture_filter_checked")]
			private VoidCookie vala_set_picture_filter_checked (Picture picture, uint16 filter_len, string filter, [CCode (array_length_pos = 3.9, array_length_type = "uint32_t")] Fixed[] values);
			[CCode (cname = "vala_xcb_render_set_picture_filter_checked")]
			public VoidCookie set_picture_filter_checked (Picture picture, string filter, Fixed[] values) {
				this.vala_set_picture_filter_checked (picture, (uint16) filter.length, filter, values);
			}
			[CCode (cname = "xcb_render_set_picture_filter")]
			private VoidCookie vala_set_picture_filter (Picture picture, uint16 filter_len, string filter, [CCode (array_length_pos = 3.9, array_length_type = "uint32_t")] Fixed[] values);
			[CCode (cname = "vala_xcb_render_set_picture_filter")]
			public VoidCookie set_picture_filter (Picture picture, string filter, Fixed[]? values = null) {
				this.vala_set_picture_filter (picture, (uint16) filter.length, filter, values);
			}

			public VoidCookie create_anim_cursor_checked (Xcb.Cursor cid, [CCode (array_length_pos = 1.9, array_length_type = "uint32_t")] AnimCursorELT []cursors);
			public VoidCookie create_anim_cursor (Xcb.Cursor cid, [CCode (array_length_pos = 1.9, array_length_type = "uint32_t")] AnimCursorELT []cursors);

			public VoidCookie add_traps_checked (Picture picture, int16 x_off, int16 y_off, [CCode (array_length_pos = 1.9, array_length_type = "uint32_t")] Trap[] traps);
			public VoidCookie add_traps (Picture picture, int16 x_off, int16 y_off, [CCode (array_length_pos = 1.9, array_length_type = "uint32_t")] Trap[] traps);

			public VoidCookie create_solid_fill_checked (Picture picture, Color color);
			public VoidCookie create_solid_fill (Picture picture, Color color);

			public VoidCookie create_linear_gradient_checked (Picture picture, PointFix p1, PointFix p2, [CCode (array_length_pos = 3.9, array_length_type = "uint32_t")] Fixed[] stops, [CCode (array_length = false)] Color[] colors);
			public VoidCookie create_linear_gradient (Picture picture, PointFix p1, PointFix p2, [CCode (array_length_pos = 3.9, array_length_type = "uint32_t")] Fixed[] stops, [CCode (array_length = false)] Color[] colors);

			public VoidCookie create_conical_gradient_checked (Picture picture, PointFix center, Fixed angle, [CCode (array_length_pos = 3.9, array_length_type = "uint32_t")] Fixed[] stops, [CCode (array_length = false)] Color[] colors);
			public VoidCookie create_conical_gradient (Picture picture, PointFix center, Fixed angle, [CCode (array_length_pos = 3.9, array_length_type = "uint32_t")] Fixed[] stops, [CCode (array_length = false)] Color[] colors);
		}

		[CCode (cname = "xcb_render_pict_type_t", cprefix = "XCB_RENDER_PICT_TYPE_", has_type_id = false)]
		public enum PictType
		{
			INDEXED,
			DIRECT
		}

		[CCode (cname = "xcb_render_picture_enum_t", cprefix = "XCB_RENDER_PICTURE_ENUM_", has_type_id = false)]
		public enum PictureEnum
		{
			NONE
		}

		[CCode (cname = "xcb_render_pict_op_t", cprefix = "XCB_RENDER_PICT_OP_", has_type_id = false)]
		public enum PictOp
		{
			CLEAR,
			SRC,
			DST,
			OVER,
			OVER_REVERSE,
			IN,
			IN_REVERSE,
			OUT,
			OUT_REVERSE,
			ATOP,
			ATOP_REVERSE,
			XOR,
			ADD,
			SATURATE,
			DISJOINT_CLEAR,
			DISJOINT_SRC,
			DISJOINT_DST,
			DISJOINT_OVER,
			DISJOINT_OVER_REVERSE,
			DISJOINT_IN,
			DISJOINT_IN_REVERSE,
			DISJOINT_OUT,
			DISJOINT_OUT_REVERSE,
			DISJOINT_ATOP,
			DISJOINT_ATOP_REVERSE,
			DISJOINT_XOR,
			CONJOINT_CLEAR,
			CONJOINT_SRC,
			CONJOINT_DST,
			CONJOINT_OVER,
			CONJOINT_OVER_REVERSE,
			CONJOINT_IN,
			CONJOINT_IN_REVERSE,
			CONJOINT_OUT,
			CONJOINT_OUT_REVERSE,
			CONJOINT_ATOP,
			CONJOINT_ATOP_REVERSE,
			CONJOINT_XOR,
			MULTIPLY,
			SCREEN,
			OVERLAY,
			DARKEN,
			LIGHTEN,
			COLOR_DODGE,
			COLOR_BURN,
			HARD_LIGHT,
			SOFT_LIGHT,
			DIFFERENCE,
			EXCLUSION,
			HSL_HUE,
			HSL_SATURATION,
			HSL_COLOR,
			HSL_LUMINOSITY
		}

		[CCode (cname = "xcb_render_poly_edge_t", cprefix = "XCB_RENDER_POLY_EDGE_", has_type_id = false)]
		public enum PolyEdge
		{
			SHARP,
			SMOOTH
		}

		[CCode (cname = "xcb_render_poly_mode_t", cprefix = "XCB_RENDER_POLY_MODE_", has_type_id = false)]
		public enum PolyMode
		{
			PRECISE,
			IMPRECISE
		}

		[CCode (cname = "xcb_render_cp_t", cprefix = "XCB_RENDER_CP_", has_type_id = false)]
		public enum CP
		{
			REPEAT,
			ALPHA_MAP,
			ALPHA_X_ORIGIN,
			ALPHA_Y_ORIGIN,
			CLIP_X_ORIGIN,
			CLIP_Y_ORIGIN,
			CLIP_MASK,
			GRAPHICS_EXPOSURE,
			SUBWINDOW_MODE,
			POLY_EDGE,
			POLY_MODE,
			DITHER,
			COMPONENT_ALPHA
		}

		[CCode (cname = "xcb_render_sub_pixel_t", cprefix = "XCB_RENDER_SUB_PIXEL_", has_type_id = false)]
		public enum SubPixel
		{
			UNKNOWN,
			HORIZONTAL_RGB,
			HORIZONTAL_BGR,
			VERTICAL_RGB,
			VERTICAL_BGR,
			NONE
		}

		[CCode (cname = "xcb_render_repeat_t", cprefix = "XCB_RENDER_REPEAT_", has_type_id = false)]
		public enum Repeat
		{
			NONE,
			NORMAL,
			PAD,
			REFLECT
		}

		[SimpleType]
		[IntegerType (rank = 9)]
		[CCode (cname = "xcb_render_glyph_t", has_type_id = false)]
		public struct Glyph {
		}

		[SimpleType]
		[IntegerType (rank = 9)]
		[CCode (cname = "xcb_render_glyphset_t", has_type_id = false)]
		public struct GlyphSet {
		}

		[SimpleType]
		[IntegerType (rank = 9)]
		[CCode (cname = "xcb_render_picture_t", has_type_id = false)]
		public struct Picture {
		}

		[SimpleType]
		[IntegerType (rank = 9)]
		[CCode (cname = "xcb_render_pictformat_t", has_type_id = false)]
		public struct PictFormat {
		}

		[SimpleType]
		[IntegerType (rank = 9)]
		[CCode (cname = "xcb_render_fixed_t", has_type_id = false)]
		public struct Fixed {
		}

		[SimpleType]
		[CCode (cname = "xcb_render_directformat_t", has_type_id = false)]
		public struct DirectFormat {
			public uint16 red_shift;
			public uint16 red_mask;
			public uint16 green_shift;
			public uint16 green_mask;
			public uint16 blue_shift;
			public uint16 blue_mask;
			public uint16 alpha_shift;
			public uint16 alpha_mask;
		}

		[SimpleType]
		[CCode (cname = "xcb_render_pictforminfo_t", has_type_id = false)]
		public struct PictFormatInfo {
			public PictFormat id;
			public PictType type;
			public uint8 depth;
			public DirectFormat direct;
			public Xcb.Colormap colormap;
		}

		[SimpleType]
		[CCode (cname = "xcb_render_pictvisual_t", has_type_id = false)]
		public struct PictVisual {
			public Xcb.VisualID visual;
			public PictFormat format;
		}

		[Compact]
		[CCode (cname = "xcb_render_pictdepth_t", ref_function = "", unref_function = "")]
		public class PictDepth {
			public uint8 depth;
			private uint16 num_visuals;
			[CCode (cname = "xcb_render_pictdepth_visuals")]
			private PictVisual* vala_visuals ();
			public PictVisual[] visuals
			{
				get
				{
					unowned PictVisual[] res = (PictVisual[]) vala_visuals ();
					res.length = (int) num_visuals;
					return res;
				}
			}
		}

		[SimpleType]
		[CCode (cname = "xcb_render_pictdepth_iterator_t", has_type_id = false)]
		private struct PictDepthIterator {
			public unowned PictDepth data;
			[CCode (cname = "xcb_render_pictdepth_next")]
			public static void next (ref PictDepthIterator iter);
		}

		[Compact]
		[CCode (cname = "xcb_render_pictscreen_t", ref_function = "", unref_function = "")]
		public class PictScreen {
			public PictFormat fallback;
			private uint32 num_depths;
			[CCode (cname = "xcb_render_pictscreen_depths_iterator")]
			private PictDepthIterator depths_iterator ();
			public PictDepth[] depths
			{
				owned get
				{
					var value = new PictDepth[num_depths];
					var iter = depths_iterator ();
					for (var i = 0; i < value.length; i++)
					{
						value[i] = iter.data;
						PictDepthIterator.next (ref iter);
					}
					return value;
				}
			}
		}

		[SimpleType]
		[CCode (cname = "xcb_render_pictscreen_iterator_t", has_type_id = false)]
		private struct PictScreenIterator {
			public unowned PictScreen data;
			[CCode (cname = "xcb_render_pictscreen_next")]
			public static void next (ref PictScreenIterator iter);
		}

		[SimpleType]
		[CCode (cname = "xcb_render_indexvalue_t", has_type_id = false)]
		public struct IndexValue {
			public uint32 pixel;
			public uint16 red;
			public uint16 green;
			public uint16 blue;
			public uint16 alpha;
		}

		[SimpleType]
		[CCode (cname = "xcb_render_color_t", has_type_id = false)]
		public struct Color {
			public uint16 red;
			public uint16 green;
			public uint16 blue;
			public uint16 alpha;
		}

		[SimpleType]
		[CCode (cname = "xcb_render_pointfix_t", has_type_id = false)]
		public struct PointFix {
			public Fixed x;
			public Fixed y;
		}

		[SimpleType]
		[CCode (cname = "xcb_render_linefix_t", has_type_id = false)]
		public struct LineFix {
			public PointFix p1;
			public PointFix p2;
		}

		[SimpleType]
		[CCode (cname = "xcb_render_triangle_t", has_type_id = false)]
		public struct Triangle {
			public PointFix p1;
			public PointFix p2;
			public PointFix p3;
		}

		[SimpleType]
		[CCode (cname = "xcb_render_trapezoid_t", has_type_id = false)]
		public struct Trapezoid {
			public Fixed top;
			public Fixed bottom;
			public LineFix left;
			public LineFix right;
		}

		[SimpleType]
		[CCode (cname = "xcb_render_glyphinfo_t", has_type_id = false)]
		public struct GlyphInfo {
			public uint16 width;
			public uint16 height;
			public int16 x;
			public int16 y;
			public int16 x_off;
			public int16 y_off;
		}

		[SimpleType]
		[CCode (cname = "xcb_render_transform_t", has_type_id = false)]
		public struct Transform {
			public Fixed matrix11;
			public Fixed matrix12;
			public Fixed matrix13;
			public Fixed matrix21;
			public Fixed matrix22;
			public Fixed matrix23;
			public Fixed matrix31;
			public Fixed matrix32;
			public Fixed matrix33;
		}

		[SimpleType]
		[CCode (cname = "xcb_render_animcursorelt_t", has_type_id = false)]
		public struct AnimCursorELT {
			public Xcb.Cursor cursor;
			public uint32 delay;
		}

		[SimpleType]
		[CCode (cname = "xcb_render_spanfix_t", has_type_id = false)]
		public struct SpanFix {
			public Fixed l;
			public Fixed r;
			public Fixed y;
		}

		[SimpleType]
		[CCode (cname = "xcb_render_trap_t", has_type_id = false)]
		public struct Trap {
			public SpanFix top;
			public SpanFix bot;
		}

		[SimpleType]
		[IntegerType (rank = 9)]
		[CCode (cname = "xcb_render_query_version_cookie_t", has_type_id = false)]
		public struct QueryVersionCookie {
		}

		[Compact]
		[CCode (cname = "xcb_render_query_version_reply_t", ref_function = "", unref_function = "free")]
		public class QueryVersionReply : Xcb.GenericReply {
			public uint32 major_version;
			public uint32 minor_version;
		}

		[SimpleType]
		[IntegerType (rank = 9)]
		[CCode (cname = "xcb_render_query_pict_formats_cookie_t", has_type_id = false)]
		public struct QueryPictFormatsCookie {
		}

		[Compact]
		[CCode (cname = "xcb_render_query_pict_formats_reply_t", ref_function = "", unref_function = "free")]
		public class QueryPictFormatsReply : Xcb.GenericReply {
			public uint32 num_depths; /* Total number of depths */
			public uint32 num_visuals; /* Total number of visuals */
			private uint32 num_formats;
			[CCode (cname = "xcb_render_query_pict_formats_formats")]
			private PictFormatInfo* vala_formats ();
			public PictFormatInfo[] formats
			{
				get
				{
					unowned PictFormatInfo[] res = (PictFormatInfo[]) vala_formats ();
					res.length = (int) num_formats;
					return res;
				}
			}
			private uint32 num_screens;
			[CCode (cname = "xcb_render_query_pict_formats_screens_iterator")]
			private PictScreenIterator screens_iterator ();
			public PictScreen[] screens
			{
				owned get
				{
					var value = new PictScreen[num_screens];
					var iter = screens_iterator ();
					for (var i = 0; i < value.length; i++)
					{
						value[i] = iter.data;
						PictScreenIterator.next (ref iter);
					}
					return value;
				}
			}
			private uint32 num_subpixel;
			[CCode (cname = "xcb_render_query_pict_formats_subpixels")]
			private uint32* vala_subpixels ();
			public uint32[] subpixels
			{
				get
				{
					unowned uint32[] res = (uint32[]) vala_subpixels ();
					res.length = (int) num_subpixel;
					return res;
				}
			}
		}

		[SimpleType]
		[IntegerType (rank = 9)]
		[CCode (cname = "xcb_render_query_pict_index_values_cookie_t", has_type_id = false)]
		public struct QueryPictIndexValuesCookie {
		}

		[Compact]
		[CCode (cname = "xcb_render_query_pict_index_values_reply_t", ref_function = "", unref_function = "free")]
		public class QueryPictIndexValuesReply : Xcb.GenericReply {
			private uint32 num_values;
			[CCode (cname = "xcb_render_query_pict_index_values_values")]
			private IndexValue* vala_values ();
			public IndexValue[] values
			{
				get
				{
					unowned IndexValue[] res = (IndexValue[]) vala_values ();
					res.length = (int) num_values;
					return res;
				}
			}
		}

		[SimpleType]
		[IntegerType (rank = 9)]
		[CCode (cname = "xcb_render_query_filters_cookie_t", has_type_id = false)]
		public struct QueryFiltersCookie {
		}

		[Compact]
		[CCode (cname = "xcb_render_query_filters_reply_t", ref_function = "", unref_function = "free")]
		public class QueryFiltersReply : Xcb.GenericReply {
			private uint32 num_aliases;
			[CCode (cname = "xcb_render_query_filters_aliases")]
			private uint16* vala_aliases ();
			public uint16[] aliases
			{
				get
				{
					unowned uint16[] res = (uint16[]) vala_aliases ();
					res.length = (int) num_aliases;
					return res;
				}
			}
			private uint32 num_filters;
			[CCode (cname = "xcb_render_query_filters_filters_iterator")]
			private Xcb.StrIterator filters_iterator ();
			public string[] filters
			{
				owned get
				{
					var value = new string[num_filters];
					var iter = filters_iterator ();
					for (var i = 0; i < value.length; i++)
					{
						value[i] = iter.data.name;
						Xcb.StrIterator.next (ref iter);
					}
					return value;
				}
			}
		}
	}
}
