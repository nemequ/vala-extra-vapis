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

	[CCode (cprefix = "xcb_shm_", cheader_filename = "xcb/shm.h")]
	namespace Shm {
		public static Connection get_connection (Xcb.Connection c) {
			return (Connection) c;
		}

		[Compact]
		[CCode (cname = "xcb_connection_t", cprefix = "xcb_shm_", unref_function = "")]
		public class Connection : Xcb.Connection {
			public QueryVersionCookie query_version ();
			public QueryVersionCookie query_version_unchecked ();
			public QueryVersionReply query_version_reply (QueryVersionCookie cookie, out Xcb.GenericError? e = null);

			public VoidCookie attach_checked (Seg shmseg, uint32 shmid, bool read_only);
			public VoidCookie attach (Seg shmseg, uint32 shmid, bool read_only);

			public VoidCookie detach_checked (Seg shmseg);
			public VoidCookie detach (Seg shmseg);

			public VoidCookie put_image_checked (Xcb.Drawable drawable, Xcb.GC gc, uint16 total_width, uint16 total_height, uint16 src_x, uint16 src_y, uint16 src_width, uint16 src_height, int16 dst_x, int16 dest_y, uint8 depth, uint8 format, bool send_event, Seg shmseg, uint32 offset);
			public VoidCookie put_image (Xcb.Drawable drawable, Xcb.GC gc, uint16 total_width, uint16 total_height, uint16 src_x, uint16 src_y, uint16 src_width, uint16 src_height, int16 dst_x, int16 dest_y, uint8 depth, uint8 format, bool send_event, Seg shmseg, uint32 offset);

			public GetImageCookie get_image (Xcb.Drawable drawable, int16 x, int16 y, uint16 width, uint16 height, uint32 plane_mask, uint8 format, Seg shmseg, uint32 offset);
			public GetImageCookie get_image_unchecked (Xcb.Drawable drawable, int16 x, int16 y, uint16 width, uint16 height, uint32 plane_mask, uint8 format, Seg shmseg, uint32 offset);
			public GetImageReply? get_image_reply (GetImageCookie cookie, out Xcb.GenericError? e = null);

			public VoidCookie create_pixmap_checked (Xcb.Pixmap pid, Xcb.Drawable drawable, uint16 width, uint16 height, uint8 depth, Seg shmseg, uint32 offset);
			public VoidCookie create_pixmap (Xcb.Pixmap pid, Xcb.Drawable drawable, uint16 width, uint16 height, uint8 depth, Seg shmseg, uint32 offset);

			public VoidCookie attach_fd_checked (Seg shmseg, int32 shm_fd, bool read_only);
			public VoidCookie attach_fd (Seg shmseg, int32 shm_fd, bool read_only);

			public CreateSegmentCookie create_segment (Seg shmseg, uint32 size, bool read_only);
			public CreateSegmentCookie create_segment_unchecked (Seg shmseg, uint32 size, bool read_only);
			public CreateSegmentReply? create_segment_reply (CreateSegmentCookie cookie, out Xcb.GenericError? e = null);
		}

		[SimpleType]
		[CCode (cname = "xcb_shm_seg_t", has_type_id = false)]
		public struct Seg : uint32 {
		}

		[SimpleType]
		[IntegerType (rank = 9)]
		[CCode (cname = "xcb_shm_query_version_cookie_t", has_type_id = false)]
		public struct QueryVersionCookie {
		}

		[Compact]
		[CCode (cname = "xcb_shm_query_version_reply_t", ref_function = "", unref_function = "free")]
		public class QueryVersionReply : Xcb.GenericReply {
			public bool shared_pixmaps;
			public uint16 major_version;
			public uint16 minor_version;
			public uint16 uid;
			public uint16 gid;
			public uint8 pixmap_format; // FIXME enum?
		}

		[SimpleType]
		[IntegerType (rank = 9)]
		[CCode (cname = "xcb_shm_get_image_cookie_t", has_type_id = false)]
		public struct GetImageCookie {
		}

		[Compact]
		[CCode (cname = "xcb_shm_get_image_reply_t", ref_function = "", unref_function = "free")]
		public class GetImageReply : Xcb.GenericReply {
			public uint8 depth;
			public Xcb.VisualID visual;
			public uint32 size;
		}

		[SimpleType]
		[IntegerType (rank = 9)]
		[CCode (cname = "xcb_shm_create_segment_cookie_t", has_type_id = false)]
		public struct CreateSegmentCookie {
		}

		[Compact]
		[CCode (cname = "xcb_shm_create_segment_reply_t", ref_function = "", unref_function = "free")]
		public class CreateSegmentReply : Xcb.GenericReply {
			private uint8 nfd;
			[CCode (cname = "xcb_shm_create_segment_reply_fds")]
			private int* vala_fds ();
			public int[] fds
			{
				get {
					unowned int[] res = (int[]) vala_fds ();
					res.length = nfd;
					return res;
				}
			}
		}
	}
}
