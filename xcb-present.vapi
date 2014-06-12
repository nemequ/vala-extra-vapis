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

	[CCode (cprefix = "xcb_present_", cheader_filename = "xcb/present.h")]
	namespace Present {
		public static Connection get_connection (Xcb.Connection c) {
			return (Connection) c;
		}

		[Compact]
		[CCode (cname = "xcb_connection_t", cprefix = "xcb_present_", unref_function = "")]
		public class Connection : Xcb.Connection {
			public QueryVersionCookie query_version (uint32 major_version, uint32 minor_version);
			public QueryVersionCookie query_version_unchecked (uint32 major_version, uint32 minor_version);
			public QueryVersionReply? query_version_reply (QueryVersionCookie cookie, out GenericError? e = null);

			public VoidCookie pixmap_checked (Xcb.Window window, Xcb.Pixmap pixmap, uint32 serial, XFixes.Region valid, XFixes.Region update, int16 x_off, int16 y_off, RandR.Crtc target_crtc, Sync.Fence wait_fence, Sync.Fence idle_fence, Option options, uint64 target_msc, uint64 divisor, uint64 remainder, [CCode (array_length_pos = 14.9, array_length_type = "uint32_t")] Notify[] notifies);
			public VoidCookie pixmap (Xcb.Window window, Xcb.Pixmap pixmap, uint32 serial, XFixes.Region valid, XFixes.Region update, int16 x_off, int16 y_off, RandR.Crtc target_crtc, Sync.Fence wait_fence, Sync.Fence idle_fence, Option options, uint64 target_msc, uint64 divisor, uint64 remainder, [CCode (array_length_pos = 14.9, array_length_type = "uint32_t")] Notify[] notifies);

			public VoidCookie notify_msc_checked (Xcb.Window window, uint32 serial, uint64 target_msc, uint64 divisor, uint64 remainder);
			public VoidCookie notify_msc (Xcb.Window window, uint32 serial, uint64 target_msc, uint64 divisor, uint64 remainder);

			public VoidCookie select_input_checked (Event eid, Xcb.Window window, EventMask event_mask);
			public VoidCookie select_input (Event eid, Xcb.Window window, EventMask event_mask);

			public QueryCapabilitiesCookie query_capabilities (Xcb.Window window, uint32 target);
			public QueryCapabilitiesCookie query_capabilities_unchecked (Xcb.Window window, uint32 target);
			public QueryCapabilitiesReply? query_capabilities_reply (QueryCapabilitiesCookie cookie, out GenericError? e = null);
		}

		[SimpleType]
		[IntegerType (rank = 9)]
		[CCode (cname = "xcb_present_event_t", has_type_id = false)]
		public struct Event {
		}

		[CCode (cname = "xcb_present_event_enum_t", cprefix = "XCB_PRESENT_EVENT_", has_type_id = false)]
		public enum EventEnum {
			CONFIGURE_NOTIFY,
			COMPLETE_NOTIFY,
			IDLE_NOTIFY,
			REDIRECT_NOTIFY
		}

		[CCode (cname = "xcb_present_event_mask_t", cprefix = "XCB_PRESENT_EVENT_MASK_", has_type_id = false)]
		public enum EventMask {
			NO_EVENT,
			CONFIGURE_NOTIFY,
			COMPLETE_NOTIFY,
			IDLE_NOTIFY,
			REDIRECT_NOTIFY
		}

		[CCode (cname = "xcb_present_option_t", cprefix = "XCB_PRESENT_OPTION_", has_type_id = false)]
		public enum Option {
			NONE,
			ASYNC,
			COPY,
			UST
		}

		[CCode (cname = "xcb_present_capability_t", cprefix = "XCB_PRESENT_CAPABILITY_", has_type_id = false)]
		public enum Capability {
			NONE,
			ASYNC,
			FENCE,
			UST
		}

		[CCode (cname = "xcb_present_kind_t", cprefix = "XCB_PRESENT_COMPLETE_KIND_", has_type_id = false)]
		public enum CompleteKind {
			PIXMAP,
			NOTIFY_MSC
		}

		[CCode (cname = "xcb_present_complete_mode_t", cprefix = "XCB_PRESENT_COMPLETE_MODE_", has_type_id = false)]
		public enum CompleteMode {
			COPY,
			FLIP,
			SKIP
		}

		[SimpleType]
		[CCode (cname = "xcb_present_notify_t", has_type_id = false)]
		public struct Notify {
			public Xcb.Window window;
			public uint32 serial;
		}

		[SimpleType]
		[IntegerType (rank = 9)]
		[CCode (cname = "xcb_present_query_version_cookie_t", has_type_id = false)]
		public struct QueryVersionCookie {
		}

		[Compact]
		[CCode (cname = "xcb_present_query_version_reply_t", ref_function = "", unref_function = "free")]
		public struct QueryVersionReply {
			public uint32 major_version;
			public uint32 minor_version;
		}

		[SimpleType]
		[IntegerType (rank = 9)]
		[CCode (cname = "xcb_present_query_capabilities_cookie_t", has_type_id = false)]
		public struct QueryCapabilitiesCookie {
		}

		[Compact]
		[CCode (cname = "xcb_present_query_capabilities_reply_t", ref_function = "", unref_function = "free")]
		public struct QueryCapabilitiesReply {
			public Capability capabilities;
		}
	}
}
