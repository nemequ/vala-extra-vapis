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

	[CCode (cprefix = "xcb_dri2_", cheader_filename = "xcb/dri2.h")]
	namespace DRI2 {
		public static Connection get_connection (Xcb.Connection c) {
			return (Connection) c;
		}

		[Compact]
		[CCode (cname = "xcb_connection_t", cprefix = "xcb_dri2_", unref_function = "")]
		public class Connection : Xcb.Connection {
			public QueryVersionCookie query_version (uint32 major_version, uint32 minor_version);
			public QueryVersionCookie query_version_unchecked (uint32 major_version, uint32 minor_version);
			public QueryVersionReply? query_version_reply (QueryVersionCookie cookie, out Xcb.GenericError? e = null);

			public ConnectCookie connect (Xcb.Window window, uint32 driver_type);
			public ConnectCookie connect_unchecked (Xcb.Window window, uint32 driver_type);
			public ConnectReply? connect_reply (ConnectCookie cookie, out Xcb.GenericError? e = null);

			public AuthenticateCookie authenticate (Xcb.Window window, uint32 magic);
			public AuthenticateCookie authenticate_unchecked (Xcb.Window window, uint32 magic);
			public AuthenticateReply? authenticate_reply (AuthenticateCookie cookie, out Xcb.GenericError? e = null);

			public VoidCookie create_drawable_checked (Xcb.Drawable drawable);
			public VoidCookie create_drawable (Xcb.Drawable drawable);

			public VoidCookie destroy_drawable_checked (Xcb.Drawable drawable);
			public VoidCookie destroy_drawable (Xcb.Drawable drawable);

			// NOTE: XCB has an error and has two fields for the length of attachments - this can't be fixed without breaking API
			[CCode (cname = "xcb_dri2_get_buffers")]
			public GetBuffersCookie vala_get_buffers (Xcb.Drawable drawable, uint32 count, [CCode (array_length_pos = 2.9, array_length_type = "uint32_t")] uint32[] attachments);
			[CCode (cname = "vala_xcb_dri2_get_buffers")]
			public GetBuffersCookie get_buffers (Xcb.Drawable drawable, uint32[] attachments) {
				this.vala_get_buffers (drawable, attachments.length, attachments);
			}
			[CCode (cname = "xcb_dri2_get_buffers_unchecked")]
			public GetBuffersCookie vala_get_buffers_unchecked (Xcb.Drawable drawable, uint32 count, [CCode (array_length_pos = 2.9, array_length_type = "uint32_t")] uint32[] attachments);
			[CCode (cname = "vala_xcb_dri2_get_buffers_unchecked")]
			public GetBuffersCookie get_buffers_unchecked (Xcb.Drawable drawable, uint32[] attachments) {
				this.vala_get_buffers_unchecked (drawable, attachments.length, attachments);
			}
			public GetBuffersReply? get_buffers_reply (GetBuffersCookie cookie, out Xcb.GenericError? e = null);

			public CopyRegionCookie copy_region (Xcb.Drawable drawable, uint32 region, uint32 dest, uint32 src);
			public CopyRegionCookie copy_region_unchecked (Xcb.Drawable drawable, uint32 region, uint32 dest, uint32 src);
			public CopyRegionReply? copy_region_reply (CopyRegionCookie cookie, out Xcb.GenericError? e = null);

			// NOTE: XCB has an error and has two fields for the length of attachments - this can't be fixed without breaking API
			[CCode (cname = "xcb_dri2_get_buffers_with_format")]
			public GetBuffersWithFormatCookie vala_get_buffers_with_format (Xcb.Drawable drawable, uint32 count, [CCode (array_length_pos = 2.9, array_length_type = "uint32_t")] AttachFormat[] attachments);
			[CCode (cname = "vala_xcb_dri2_get_buffers_with_format")]
			public GetBuffersWithFormatCookie get_buffers_with_format (Xcb.Drawable drawable, AttachFormat[] attachments) {
				this.vala_get_buffers_with_format (drawable, attachments.length, attachments);
			}
			[CCode (cname = "xcb_dri2_get_buffers_with_format_unchecked")]
			public GetBuffersWithFormatCookie vala_get_buffers_with_format_unchecked (Xcb.Drawable drawable, uint32 count, [CCode (array_length_pos = 2.9, array_length_type = "uint32_t")] AttachFormat[] attachments);
			[CCode (cname = "vala_xcb_dri2_get_buffers_with_format_unchecked")]
			public GetBuffersWithFormatCookie get_buffers_with_format_unchecked (Xcb.Drawable drawable, AttachFormat[] attachments) {
				this.vala_get_buffers_with_format_unchecked (drawable, attachments.length, attachments);
			}
			public GetBuffersWithFormatReply? get_buffers_with_format_reply (GetBuffersWithFormatCookie cookie, out Xcb.GenericError? e = null);

			[CCode (cname = "xcb_dri2_swap_buffers")]
			private SwapBuffersCookie vala_swap_buffers (Xcb.Drawable drawable, uint32 target_msc_hi, uint32 target_msc_lo, uint32 divisor_hi, uint32 divisor_lo, uint32 remainder_hi, uint32 remainder_lo);
			[CCode (cname = "vala_xcb_dri2_swap_buffers")]
			public SwapBuffersCookie swap_buffers (Xcb.Drawable drawable, uint64 target_msc, uint64 divisor, uint64 remainder) {
				return this.vala_swap_buffers (drawable, (uint32) (target_msc >> 32), (uint32) (target_msc & 0xFFFFFFFF), (uint32) (divisor >> 32), (uint32) (divisor & 0xFFFFFFFF), (uint32) (remainder >> 32), (uint32) (remainder & 0xFFFFFFFF));
			}
			[CCode (cname = "xcb_dri2_swap_buffers_unchecked")]
			private SwapBuffersCookie vala_swap_buffers_unchecked (Xcb.Drawable drawable, uint32 target_msc_hi, uint32 target_msc_lo, uint32 divisor_hi, uint32 divisor_lo, uint32 remainder_hi, uint32 remainder_lo);
			[CCode (cname = "vala_xcb_dri2_swap_buffers_unchecked")]
			public SwapBuffersCookie swap_buffers_unchecked (Xcb.Drawable drawable, uint64 target_msc, uint64 divisor, uint64 remainder) {
				return this.vala_swap_buffers_unchecked (drawable, (uint32) (target_msc >> 32), (uint32) (target_msc & 0xFFFFFFFF), (uint32) (divisor >> 32), (uint32) (divisor & 0xFFFFFFFF), (uint32) (remainder >> 32), (uint32) (remainder & 0xFFFFFFFF));
			}
			public SwapBuffersReply? swap_buffers_reply (SwapBuffersCookie cookie, out Xcb.GenericError? e = null);

			public GetMSCCookie get_msc (Xcb.Drawable drawable);
			public GetMSCCookie get_msc_unchecked (Xcb.Drawable drawable);
			public GetMSCReply? get_msc_reply (GetMSCCookie cookie, out Xcb.GenericError? e = null);

			[CCode (cname = "xcb_dri2_wait_msc")]
			private WaitMSCCookie vala_wait_msc (Xcb.Drawable drawable, uint32 target_msc_hi, uint32 target_msc_lo, uint32 divisor_hi, uint32 divisor_lo, uint32 remainder_hi, uint32 remainder_lo);
			[CCode (cname = "vala_xcb_dri2_wait_msc")]
			public SwapBuffersCookie wait_msc (Xcb.Drawable drawable, uint64 target_msc, uint64 divisor, uint64 remainder) {
				return this.vala_wait_msc (drawable, (uint32) (target_msc >> 32), (uint32) (target_msc & 0xFFFFFFFF), (uint32) (divisor >> 32), (uint32) (divisor & 0xFFFFFFFF), (uint32) (remainder >> 32), (uint32) (remainder & 0xFFFFFFFF));
			}
			[CCode (cname = "xcb_dri2_wait_msc_unchecked")]
			private WaitMSCCookie vala_wait_msc_unchecked (Xcb.Drawable drawable, uint32 target_msc_hi, uint32 target_msc_lo, uint32 divisor_hi, uint32 divisor_lo, uint32 remainder_hi, uint32 remainder_lo);
			[CCode (cname = "vala_xcb_dri2_wait_msc")]
			public SwapBuffersCookie wait_msc_unchecked (Xcb.Drawable drawable, uint64 target_msc, uint64 divisor, uint64 remainder) {
				return this.vala_wait_msc_unchecked (drawable, (uint32) (target_msc >> 32), (uint32) (target_msc & 0xFFFFFFFF), (uint32) (divisor >> 32), (uint32) (divisor & 0xFFFFFFFF), (uint32) (remainder >> 32), (uint32) (remainder & 0xFFFFFFFF));
			}
			public WaitMSCReply? wait_msc_reply (WaitMSCCookie cookie, out Xcb.GenericError? e = null);

			[CCode (cname = "xcb_dri2_wait_sbc")]
			private WaitSBCCookie vala_wait_sbc (Xcb.Drawable drawable, uint32 target_sbc_hi, uint32 target_sbc_lo);
			[CCode (cname = "vala_xcb_dri2_wait_sbc")]
			public SwapBuffersCookie wait_sbc (Xcb.Drawable drawable, uint64 target_sbc) {
				return this.vala_wait_sbc (drawable, (uint32) (target_sbc >> 32), (uint32) (target_sbc & 0xFFFFFFFF));
			}
			[CCode (cname = "xcb_dri2_wait_sbc_unchecked")]
			private WaitSBCCookie vala_wait_sbc_unchecked (Xcb.Drawable drawable, uint32 target_sbc_hi, uint32 target_sbc_lo);
			[CCode (cname = "vala_xcb_dri2_wait_sbc")]
			public SwapBuffersCookie wait_sbc_unchecked (Xcb.Drawable drawable, uint32 target_sbc) {
				return this.vala_wait_sbc_unchecked (drawable, (uint32) (target_sbc >> 32), (uint32) (target_sbc & 0xFFFFFFFF));
			}
			public WaitSBCReply? wait_sbc_reply (WaitSBCCookie cookie, out Xcb.GenericError? e = null);

			public VoidCookie swap_interval_checked (Xcb.Drawable drawable, uint32 interval);
			public VoidCookie swap_interval (Xcb.Drawable drawable, uint32 interval);

			public GetParamCookie get_param (Xcb.Drawable drawable, uint32 param);
			public GetParamCookie get_param_unchecked (Xcb.Drawable drawable, uint32 param);
			public GetParamReply? get_param_reply (GetParamCookie cookie, out Xcb.GenericError? e = null);
		}

		[CCode (cname = "xcb_dri2_attachment_t", cprefix = "XCB_DRI2_ATTACHMENT_", has_type_id = false)]
		public enum Attachment {
			BUFFER_FRONT_LEFT,
			BUFFER_BACK_LEFT,
			BUFFER_FRONT_RIGHT,
			BUFFER_BACK_RIGHT,
			BUFFER_DEPTH,
			BUFFER_STENCIL,
			BUFFER_ACCUM,
			BUFFER_FAKE_FRONT_LEFT,
			BUFFER_FAKE_FRONT_RIGHT,
			BUFFER_DEPTH_STENCIL,
			BUFFER_HIZ
		}

		[CCode (cname = "xcb_dri2_driver_type_t", cprefix = "XCB_DRI2_DRIVER_TYPE_", has_type_id = false)]
		public enum DriverType {
			DRI,
			VDPAU
		}

		[CCode (cname = "xcb_dri2_event_type_t", cprefix = "XCB_DRI2_EVENT_TYPE_", has_type_id = false)]
		public enum EventType {
			EXCHANGE_COMPLETE,
			BLIT_COMPLETE,
			FLIP_COMPLETE
		}

		[SimpleType]
		[IntegerType (rank = 9)]
		[CCode (cname = "xcb_dri2_buffer_t", has_type_id = false)]
		public struct Buffer {
			public Attachment attachment;
			public uint32 name;
			public uint32 pitch;
			public uint32 cpp;
			public uint32 flags;
		}

		[SimpleType]
		[IntegerType (rank = 9)]
		[CCode (cname = "xcb_dri2_attach_format_t", has_type_id = false)]
		public struct AttachFormat {
			public Attachment attachment;
			public uint32 format;
		}

		[SimpleType]
		[IntegerType (rank = 9)]
		[CCode (cname = "xcb_dri2_query_version_cookie_t", has_type_id = false)]
		public struct QueryVersionCookie {
		}

		[Compact]
		[CCode (cname = "xcb_dri2_query_version_reply_t", ref_function = "", unref_function = "free")]
		public struct QueryVersionReply {
			public uint32 major_version;
			public uint32 minor_version;
		}

		[SimpleType]
		[IntegerType (rank = 9)]
		[CCode (cname = "xcb_dri2_connect_cookie_t", has_type_id = false)]
		public struct ConnectCookie {
		}

		[Compact]
		[CCode (cname = "xcb_dri2_connect_reply_t", ref_function = "", unref_function = "free")]
		public struct ConnectReply {
			private uint32 driver_name_length;
			[CCode (cname = "xcb_dri2_connect_driver_name")]
			private char* vala_driver_name ();
			public string driver_name { owned get { return "%.*s".printf (driver_name_length, vala_driver_name ()); } }
			private uint32 device_name_length;
			[CCode (cname = "xcb_dri2_connect_device_name")]
			private char* vala_device_name ();
			public string device_name { owned get { return "%.*s".printf (device_name_length, vala_device_name ()); } }
		}

		[SimpleType]
		[IntegerType (rank = 9)]
		[CCode (cname = "xcb_dri2_authenticate_cookie_t", has_type_id = false)]
		public struct AuthenticateCookie {
		}

		[Compact]
		[CCode (cname = "xcb_dri2_authenticate_reply_t", ref_function = "", unref_function = "free")]
		public struct AuthenticateReply {
			private bool authenticated;
		}

		[SimpleType]
		[IntegerType (rank = 9)]
		[CCode (cname = "xcb_dri2_get_buffers_cookie_t", has_type_id = false)]
		public struct GetBuffersCookie {
		}

		[Compact]
		[CCode (cname = "xcb_dri2_get_buffers_reply_t", ref_function = "", unref_function = "free")]
		public struct GetBuffersReply {
			public uint32 width;
			public uint32 height;
			private uint32 count;
			[CCode (cname = "xcb_dri2_get_buffers_buffers")]
			private Buffer* vala_buffers ();
			public Buffer[] buffers
			{
				get {
					unowned Buffer[] res = (Buffer[]) vala_buffers ();
					res.length = (int) count;
					return res;
				}
			}
		}

		[SimpleType]
		[IntegerType (rank = 9)]
		[CCode (cname = "xcb_dri2_copy_region_cookie_t", has_type_id = false)]
		public struct CopyRegionCookie {
		}

		[Compact]
		[CCode (cname = "xcb_dri2_copy_region_reply_t", ref_function = "", unref_function = "free")]
		public struct CopyRegionReply {
			/* (intentionally empty) */
		}

		[SimpleType]
		[IntegerType (rank = 9)]
		[CCode (cname = "xcb_dri2_get_buffers_with_format_cookie_t", has_type_id = false)]
		public struct GetBuffersWithFormatCookie {
		}

		[Compact]
		[CCode (cname = "xcb_dri2_get_buffers_with_format_reply_t", ref_function = "", unref_function = "free")]
		public struct GetBuffersWithFormatReply {
			public uint32 width;
			public uint32 height;
			private uint32 count;
			[CCode (cname = "xcb_dri2_get_buffers_with_format_buffers")]
			private Buffer* vala_buffers ();
			public Buffer[] buffers
			{
				get {
					unowned Buffer[] res = (Buffer[]) vala_buffers ();
					res.length = (int) count;
					return res;
				}
			}
		}

		[SimpleType]
		[IntegerType (rank = 9)]
		[CCode (cname = "xcb_dri2_swap_buffers_cookie_t", has_type_id = false)]
		public struct SwapBuffersCookie {
		}

		[Compact]
		[CCode (cname = "xcb_dri2_swap_buffers_reply_t", ref_function = "", unref_function = "free")]
		public struct SwapBuffersReply {
			private uint32 swap_hi;
			private uint32 swap_lo;
			public uint64 swap { get { return swap_hi << 32 | swap_lo; } }
		}

		[SimpleType]
		[IntegerType (rank = 9)]
		[CCode (cname = "xcb_dri2_get_msc_cookie_t", has_type_id = false)]
		public struct GetMSCCookie {
		}

		[Compact]
		[CCode (cname = "xcb_dri2_get_msc_reply_t", ref_function = "", unref_function = "free")]
		public struct GetMSCReply {
			private uint32 ust_hi;
			private uint32 ust_lo;
			public uint64 ust { get { return ust_hi << 32 | ust_lo; } }
			private uint32 msc_hi;
			private uint32 msc_lo;
			public uint64 msc { get { return msc_hi << 32 | msc_lo; } }
			private uint32 sbc_hi;
			private uint32 sbc_lo;
			public uint64 sbc { get { return sbc_hi << 32 | sbc_lo; } }
		}

		[SimpleType]
		[IntegerType (rank = 9)]
		[CCode (cname = "xcb_dri2_wait_msc_cookie_t", has_type_id = false)]
		public struct WaitMSCCookie {
		}

		[Compact]
		[CCode (cname = "xcb_dri2_wait_msc_reply_t", ref_function = "", unref_function = "free")]
		public struct WaitMSCReply {
			private uint32 ust_hi;
			private uint32 ust_lo;
			public uint64 ust { get { return ust_hi << 32 | ust_lo; } }
			private uint32 msc_hi;
			private uint32 msc_lo;
			public uint64 msc { get { return msc_hi << 32 | msc_lo; } }
			private uint32 sbc_hi;
			private uint32 sbc_lo;
			public uint64 sbc { get { return sbc_hi << 32 | sbc_lo; } }
		}

		[SimpleType]
		[IntegerType (rank = 9)]
		[CCode (cname = "xcb_dri2_wait_sbc_cookie_t", has_type_id = false)]
		public struct WaitSBCCookie {
		}

		[Compact]
		[CCode (cname = "xcb_dri2_wait_sbc_reply_t", ref_function = "", unref_function = "free")]
		public struct WaitSBCReply {
			private uint32 ust_hi;
			private uint32 ust_lo;
			public uint64 ust { get { return ust_hi << 32 | ust_lo; } }
			private uint32 msc_hi;
			private uint32 msc_lo;
			public uint64 msc { get { return msc_hi << 32 | msc_lo; } }
			private uint32 sbc_hi;
			private uint32 sbc_lo;
			public uint64 sbc { get { return sbc_hi << 32 | sbc_lo; } }
		}

		[SimpleType]
		[IntegerType (rank = 9)]
		[CCode (cname = "xcb_dri2_get_param_cookie_t", has_type_id = false)]
		public struct GetParamCookie {
		}

		[Compact]
		[CCode (cname = "xcb_dri2_get_param_reply_t", ref_function = "", unref_function = "free")]
		public struct GetParamReply {
			public bool is_param_recognized;
			private uint32 value_hi;
			private uint32 value_lo;
			public uint64 value { get { return value_hi << 32 | value_lo; } }
		}
	}
}
