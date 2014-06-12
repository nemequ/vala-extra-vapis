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

	[CCode (cprefix = "xcb_xv_", cheader_filename = "xcb/xv.h")]
	namespace Xv {
		public static Connection get_connection (Xcb.Connection c) {
			return (Connection) c;
		}

		[Compact]
		[CCode (cname = "xcb_connection_t", cprefix = "xcb_xv_", unref_function = "")]
		public class Connection : Xcb.Connection {
			public QueryExtensionCookie query_extension ();
			public QueryExtensionCookie query_extension_unchecked ();
			public QueryExtensionReply? query_extension_reply (QueryExtensionCookie cookie, out GenericError? e = null);

			public QueryAdaptorsCookie query_adaptors (Xcb.Window window);
			public QueryAdaptorsCookie query_adaptors_unchecked (Xcb.Window window);
			public QueryAdaptorsReply? query_adaptors_reply (QueryAdaptorsCookie cookie, out GenericError? e = null);

			public QueryEncodingsCookie query_encodings (Port port);
			public QueryEncodingsCookie query_encodings_unchecked (Port port);
			public QueryEncodingsReply? query_encodings_reply (QueryEncodingsCookie cookie, out GenericError? e = null);

			public GrabPortCookie grab_port (Port port, Xcb.Timestamp time);
			public GrabPortCookie grab_port_unchecked (Port port, Xcb.Timestamp time);
			public GrabPortReply? grab_port_reply (GrabPortCookie cookie, out GenericError? e = null);

			public VoidCookie ungrab_port_checked (Port port, Xcb.Timestamp time);
			public VoidCookie ungrab_port (Port port, Xcb.Timestamp time);

			public VoidCookie put_video_checked (Port port, Xcb.Drawable drawable, Xcb.GContext gc, int16 vid_x, int16 vid_y, uint16 vid_w, uint16 vid_h);
			public VoidCookie put_video (Port port, Xcb.Drawable drawable, Xcb.GContext gc, int16 vid_x, int16 vid_y, uint16 vid_w, uint16 vid_h);

			public VoidCookie put_still_checked (Port port, Xcb.Drawable drawable, Xcb.GContext gc, int16 vid_x, int16 vid_y, uint16 vid_w, uint16 vid_h, int16 drw_x, int16 drw_y, uint16 drw_w, uint16 drw_h);
			public VoidCookie put_still (Port port, Xcb.Drawable drawable, Xcb.GContext gc, int16 vid_x, int16 vid_y, uint16 vid_w, uint16 vid_h, int16 drw_x, int16 drw_y, uint16 drw_w, uint16 drw_h);

			public VoidCookie get_video_checked (Port port, Xcb.Drawable drawable, Xcb.GContext gc, int16 vid_x, int16 vid_y, uint16 vid_w, uint16 vid_h, int16 drw_x, int16 drw_y, uint16 drw_w, uint16 drw_h);
			public VoidCookie get_video (Port port, Xcb.Drawable drawable, Xcb.GContext gc, int16 vid_x, int16 vid_y, uint16 vid_w, uint16 vid_h, int16 drw_x, int16 drw_y, uint16 drw_w, uint16 drw_h);

			public VoidCookie get_still_checked (Port port, Xcb.Drawable drawable, Xcb.GContext gc, int16 vid_x, int16 vid_y, uint16 vid_w, uint16 vid_h, int16 drw_x, int16 drw_y, uint16 drw_w, uint16 drw_h);
			public VoidCookie get_still (Port port, Xcb.Drawable drawable, Xcb.GContext gc, int16 vid_x, int16 vid_y, uint16 vid_w, uint16 vid_h, int16 drw_x, int16 drw_y, uint16 drw_w, uint16 drw_h);

			public VoidCookie stop_video_checked (Port port, Xcb.Drawable drawable);
			public VoidCookie stop_video (Port port, Xcb.Drawable drawable);

			public VoidCookie select_video_notify_checked (Xcb.Drawable drawable, uint8 onoff);
			public VoidCookie select_video_notify (Xcb.Drawable drawable, uint8 onoff);

			public VoidCookie select_port_notify_checked (Port port, uint8 onoff);
			public VoidCookie select_port_notify (Port port, uint8 onoff);

			public QueryBestSizeCookie query_best_size (Port port, uint16 vid_w, uint16 vid_h, uint16 drw_w, uint16 drw_h, uint8 motion);
			public QueryBestSizeCookie query_best_size_unchecked (Port port, uint16 vid_w, uint16 vid_h, uint16 drw_w, uint16 drw_h, uint8 motion);
			public QueryBestSizeReply? query_best_size_reply (QueryBestSizeCookie cookie, out GenericError? e = null);

			public VoidCookie set_port_attribute_checked (Port port, Xcb.Atom attribute, int32 value);
			public VoidCookie set_port_attribute (Port port, Xcb.Atom attribute, int32 value);

			public GetPortAttributeCookie get_port_attribute (Port port, Xcb.Atom attribute);
			public GetPortAttributeCookie get_port_attribute_unchecked (Port port, Xcb.Atom attribute);
			public GetPortAttributeReply? get_port_attribute_reply (GetPortAttributeCookie cookie, out GenericError? e = null);

			public QueryPortAttributesCookie query_port_attributes (Port port);
			public QueryPortAttributesCookie query_port_attributes_unchecked (Port port);
			public QueryPortAttributesReply? query_port_attributes_reply (QueryPortAttributesCookie cookie, out GenericError? e = null);

			public ListImageFormatsCookie list_image_formats (Port port);
			public ListImageFormatsCookie list_image_formats_unchecked (Port port);
			public ListImageFormatsReply? list_image_formats_reply (ListImageFormatsCookie cookie, out GenericError? e = null);

			public QueryImageAttributesCookie query_image_attributes (Port port, uint32 id, uint16 width, uint16 height);
			public QueryImageAttributesCookie query_image_attributes_unchecked (Port port, uint32 id, uint16 width, uint16 height);
			public QueryImageAttributesReply? query_image_attributes_reply (QueryImageAttributesCookie cookie, out GenericError? e = null);

			public VoidCookie put_image_checked (Port port, Xcb.Drawable drawable, Xcb.GContext gc, uint32 id, int16 src_x, int16 src_y, uint16 src_w, uint16 src_h, int16 drw_x, int16 drw_y, uint16 drw_w, uint16 drw_h, uint16 width, uint16 height, [CCode (array_length_pos = 14.9, array_length_type = "uint32_t")] uint8[] data);
			public VoidCookie put_image (Port port, Xcb.Drawable drawable, Xcb.GContext gc, uint32 id, int16 src_x, int16 src_y, uint16 src_w, uint16 src_h, int16 drw_x, int16 drw_y, uint16 drw_w, uint16 drw_h, uint16 width, uint16 height, [CCode (array_length_pos = 14.9, array_length_type = "uint32_t")] uint8[] data);

			public VoidCookie shm_put_image_checked (Port port, Xcb.Drawable drawable, Xcb.GContext gc, Shm.Seg shmseg, uint32 id, uint32 offset, int16 src_x, int16 src_y, uint16 src_w, uint16 src_h, int16 drw_x, int16 drw_y, uint16 drw_w, uint16 drw_h, uint16 width, uint16 height, uint8 send_event);
			public VoidCookie shm_put_image (Port port, Xcb.Drawable drawable, Xcb.GContext gc, Shm.Seg shmseg, uint32 id, uint32 offset, int16 src_x, int16 src_y, uint16 src_w, uint16 src_h, int16 drw_x, int16 drw_y, uint16 drw_w, uint16 drw_h, uint16 width, uint16 height, uint8 send_event);
		}

		[SimpleType]
		[CCode (cname = "xcb_xv_port_t", has_type_id = false)]
		public struct Port : uint32 {
		}

		[SimpleType]
		[CCode (cname = "xcb_xv_encoding_t", has_type_id = false)]
		public struct Encoding : uint32 {
		}

		[CCode (cname = "xcb_xv_type_t", cprefix = "XCB_XV_TYPE_", has_type_id = false)]
		public enum Type {
			INPUT_MASK,
			OUTPUT_MASK,
			VIDEO_MASK,
			STILL_MASK,
			IMAGE_MASK
		}

		[CCode (cname = "xcb_xv_image_format_info_type_t", cprefix = "XCB_XV_IMAGE_FORMAT_INFO_TYPE_", has_type_id = false)]
		public enum ImageFormatInfoType {
			RGB,
			YUV
		}

		[CCode (cname = "xcb_xv_image_format_info_format_t", cprefix = "XCB_XV_IMAGE_FORMAT_INFO_FORMAT_", has_type_id = false)]
		public enum ImageFormatInfoFormat {
			PACKED,
			PLANAR
		}

		[CCode (cname = "xcb_xv_attribute_t", cprefix = "XCB_XV_ATTRIBUTE_", has_type_id = false)]
		public enum Attribute {
			GETTABLE,
			SETTABLE
		}

		[CCode (cname = "xcb_xv_video_notify_reason_t", cprefix = "XCB_XV_VIDEO_NOTIFY_REASON_", has_type_id = false)]
		public enum VideoNotifyReason {
			STARTED,
			STOPPED,
			BUSY,
			PREEMPTED,
			HARD_ERROR
		}

		[CCode (cname = "xcb_xv_scanline_order_t", cprefix = "XCB_XV_SCANLINE_ORDER_", has_type_id = false)]
		public enum ScanlineOrder {
			TOP_TO_BOTTOM,
			BOTTOM_TO_TOP
		}

		[CCode (cname = "xcb_xv_grab_port_status_t", cprefix = "XCB_XV_GRAB_PORT_STATUS_", has_type_id = false)]
		public enum GrabPortStatus {
			SUCCESS,
			BAD_EXTENSION,
			ALREADY_GRABBED,
			INVALID_TIME,
			BAD_REPLY,
			BAD_ALLOC
		}

		[Compact]
		[CCode (cname = "xcb_xv_adaptor_info_t", ref_function = "", unref_function = "")]
		public class AdaptorInfo {
			private uint16 name_size;
			[CCode (cname = "xcb_xv_adaptor_info_name")]
			private unowned string vala_name ();
			public string name { owned get { return "%.*s".printf (name_size, vala_name ()); } }
			public Type type;
			public Port base_id;
			public uint16 num_ports;
			private uint16 num_formats;
			[CCode (cname = "xcb_xv_adaptor_info_formats")]
			private Format* vala_formats ();
			public unowned Format[] formats {
				get {
					unowned Format[] res = (Format[]) vala_formats ();
					res.length = num_formats;
					return res;
				}
			}
		}

		[SimpleType]
		[CCode (cname = "xcb_xv_format_t", has_type_id = false)]
		public struct Format {
			public Xcb.VisualID visual;
			public uint8 depth;
		}

		[Compact]
		[CCode (cname = "xcb_xv_encoding_info_t", ref_function = "", unref_function = "")]
		public class EncodingInfo {
			public Encoding encoding;
			private uint16 name_size;
			[CCode (cname = "xcb_xv_encoding_info_name")]
			private unowned string vala_name ();
			public string name { owned get { return "%.*s".printf (name_size, vala_name ()); } }
			public uint16 width;
			public uint16 height;
			public Rational rate;
		}

		[SimpleType]
		[CCode (cname = "xcb_xv_rational_t", has_type_id = false)]
		public struct Rational {
			public int32 numerator;
			public int32 denominator;
		}

		[SimpleType]
		[CCode (cname = "xcb_xv_encoding_info_iterator_t", has_type_id = false)]
		private struct EncodingInfoIterator {
			public unowned EncodingInfo data;
			[CCode (cname = "xcb_xv_adaptor_info_next")]
			public static void next (ref EncodingInfoIterator iter);
		}

		[SimpleType]
		[CCode (cname = "xcb_xv_adaptor_info_iterator_t", has_type_id = false)]
		private struct AdaptorInfoIterator {
			public unowned AdaptorInfo data;
			[CCode (cname = "xcb_xv_adaptor_info_next")]
			public static void next (ref AdaptorInfoIterator iter);
		}

		[SimpleType]
		[CCode (cname = "xcb_xv_image_format_info_t", has_type_id = false)]
		public struct ImageFormatInfo {
			public uint32 id;
			public ImageFormatInfoType type;
			public uint8 byte_order;
			public unowned uint8[] guid; // length = 16
			public uint8 bpp;
			public uint8 num_planes;
			public uint8 depth;
			public uint32 red_mask;
			public uint32 green_mask;
			public uint32 blue_mask;
			public ImageFormatInfoFormat format;
			public uint32 y_sample_bits;
			public uint32 u_sample_bits;
			public uint32 v_sample_bits;
			public unowned uint8[] vcomp_order; // length = 32
			public ScanlineOrder vscanline_order;
		}

		[SimpleType]
		[IntegerType (rank = 9)]
		[CCode (cname = "xcb_xv_query_extension_cookie_t", has_type_id = false)]
		public struct QueryExtensionCookie {
		}

		[Compact]
		[CCode (cname = "xcb_xv_query_extension_reply_t", ref_function = "", unref_function = "free")]
		public class QueryExtensionReply : Xcb.GenericReply {
			public uint16 major;
			public uint16 minor;
		}

		[SimpleType]
		[IntegerType (rank = 9)]
		[CCode (cname = "xcb_xv_query_adaptors_cookie_t", has_type_id = false)]
		public struct QueryAdaptorsCookie {
		}

		[Compact]
		[CCode (cname = "xcb_xv_query_adaptors_reply_t", ref_function = "", unref_function = "free")]
		public class QueryAdaptorsReply : Xcb.GenericReply {
			private uint16 num_adaptors;
			[CCode (cname = "xcb_xv_query_adaptors_info_iterator")]
			private AdaptorInfoIterator info_iterator ();
			public AdaptorInfo[] info {
				owned get {
					var value = new AdaptorInfo[num_adaptors];
					var iter = info_iterator ();
					for (var i = 0; i < value.length; i++) {
						value[i] = iter.data;
						AdaptorInfoIterator.next (ref iter);
					}
					return value;
				}
			}
		}

		[SimpleType]
		[IntegerType (rank = 9)]
		[CCode (cname = "xcb_xv_query_encodings_cookie_t", has_type_id = false)]
		public struct QueryEncodingsCookie {
		}

		[Compact]
		[CCode (cname = "xcb_xv_query_encodings_reply_t", ref_function = "", unref_function = "free")]
		public class QueryEncodingsReply : Xcb.GenericReply {
			private uint16 num_encodings;
			[CCode (cname = "xcb_xv_query_encodings_info_iterator")]
			private EncodingInfoIterator info_iterator ();
			public EncodingInfo[] info {
				owned get {
					var value = new EncodingInfo[num_encodings];
					var iter = info_iterator ();
					for (var i = 0; i < value.length; i++) {
						value[i] = iter.data;
						EncodingInfoIterator.next (ref iter);
					}
					return value;
				}
			}
		}

		[SimpleType]
		[IntegerType (rank = 9)]
		[CCode (cname = "xcb_xv_grab_port_cookie_t", has_type_id = false)]
		public struct GrabPortCookie {
		}

		[Compact]
		[CCode (cname = "xcb_xv_grab_port_reply_t", ref_function = "", unref_function = "free")]
		public class GrabPortReply : Xcb.GenericReply {
			public uint8 result;
		}

		[SimpleType]
		[IntegerType (rank = 9)]
		[CCode (cname = "xcb_xv_query_best_size_cookie_t", has_type_id = false)]
		public struct QueryBestSizeCookie {
		}

		[Compact]
		[CCode (cname = "xcb_xv_query_best_size_reply_t", ref_function = "", unref_function = "free")]
		public class QueryBestSizeReply : Xcb.GenericReply {
			public uint16 actual_width;
			public uint16 actual_height;
		}

		[SimpleType]
		[IntegerType (rank = 9)]
		[CCode (cname = "xcb_xv_get_port_attribute_cookie_t", has_type_id = false)]
		public struct GetPortAttributeCookie {
		}

		[Compact]
		[CCode (cname = "xcb_xv_get_port_attribute_reply_t", ref_function = "", unref_function = "free")]
		public class GetPortAttributeReply : Xcb.GenericReply {
			public int32 value;
		}

		[SimpleType]
		[IntegerType (rank = 9)]
		[CCode (cname = "xcb_xv_query_port_attributes_cookie_t", has_type_id = false)]
		public struct QueryPortAttributesCookie {
		}

		[Compact]
		[CCode (cname = "xcb_xv_query_port_attributes_reply_t", ref_function = "", unref_function = "free")]
		public class QueryPortAttributesReply : Xcb.GenericReply {
			private uint32 num_attributes;
			//[CCode (cname = "xcb_xv_query_port_attributes_attributes_iterator")]
			//private AttributeInfoIterator* attributes_iterator ();
			private uint32 text_size;
		}

		[SimpleType]
		[IntegerType (rank = 9)]
		[CCode (cname = "xcb_xv_list_image_formats_cookie_t", has_type_id = false)]
		public struct ListImageFormatsCookie {
		}

		[Compact]
		[CCode (cname = "xcb_xv_list_image_formats_reply_t", ref_function = "", unref_function = "free")]
		public class ListImageFormatsReply : Xcb.GenericReply {
			private uint32 num_formats;
			[CCode (cname = "xcb_xv_list_image_formats_format")]
			private ImageFormatInfo* vala_format ();
			public unowned ImageFormatInfo[] formats {
				get {
					unowned ImageFormatInfo[] res = (ImageFormatInfo[]) vala_format ();
					res.length = (int) num_formats;
					return res;
				}
			}
		}

		[SimpleType]
		[IntegerType (rank = 9)]
		[CCode (cname = "xcb_xv_query_image_attributes_cookie_t", has_type_id = false)]
		public struct QueryImageAttributesCookie {
		}

		[Compact]
		[CCode (cname = "xcb_xv_query_image_attributes_reply_t", ref_function = "", unref_function = "free")]
		public class QueryImageAttributesReply : Xcb.GenericReply {
			public int32 num_planes;
			public int32 data_size;
			public int16 width;
			public int16 height;
			[CCode (cname = "xcb_xv_query_image_attributes_pitches")]
			private uint32* vala_pitches ();
			[CCode (cname = "xcb_xv_query_image_attributes_offsets")]
			private uint32* vala_offsets ();
		}
	}
}
