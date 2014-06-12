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

	[CCode (cprefix = "xcb_dri3_", cheader_filename = "xcb/dri3.h")]
	namespace DRI3 {
		public static Connection get_connection (Xcb.Connection c) {
			return (Connection) c;
		}

		[Compact]
		[CCode (cname = "xcb_connection_t", cprefix = "xcb_dri3_", unref_function = "")]
		public class Connection : Xcb.Connection {
			public QueryVersionCookie query_version (uint32 major_version, uint32 minor_version);
			public QueryVersionCookie query_version_unchecked (uint32 major_version, uint32 minor_version);
			public QueryVersionReply? query_version_reply (QueryVersionCookie cookie, out Xcb.GenericError? e = null);

			public OpenCookie open (Xcb.Drawable drawable, uint32 provider);
			public OpenCookie open_unchecked (Xcb.Drawable drawable, uint32 provider);
			public OpenReply? open_reply (OpenCookie cookie, out Xcb.GenericError? e = null);

			public VoidCookie pixmap_from_buffer_checked (Pixmap pixmap, Drawable drawable, uint32 size, uint16 width, uint16 height, uint16 stride, uint8 depth, uint8 bpp, int32 pixmap_fd);
			public VoidCookie pixmap_from_buffer (Pixmap pixmap, Drawable drawable, uint32 size, uint16 width, uint16 height, uint16 stride, uint8 depth, uint8 bpp, int32 pixmap_fd);

			public BufferFromPixmapCookie buffer_from_pixmap (Pixmap pixmap);
			public BufferFromPixmapCookie buffer_from_pixmap_unchecked (Pixmap pixmap);
			public BufferFromPixmapReply? buffer_from_pixmap_reply (BufferFromPixmapCookie cookie, out Xcb.GenericError? e = null);

			public VoidCookie fence_from_fd_checked (Pixmap pixmap, Drawable drawable, uint32 fence, bool initially_triggered, int32 fence_fd);
			public VoidCookie fence_from_fd (Pixmap pixmap, Drawable drawable, uint32 fence, bool initially_triggered, int32 fence_fd);

			public FDFromFenceCookie fd_from_fence (Drawable drawable, uint32 fence);
			public FDFromFenceCookie fd_from_fence_unchecked (Drawable drawable, uint32 fence);
			public FDFromFenceReply? fd_from_fence_reply (FDFromFenceCookie cookie, out Xcb.GenericError? e = null);
		}

		[SimpleType]
		[IntegerType (rank = 9)]
		[CCode (cname = "xcb_dri3_query_version_cookie_t", has_type_id = false)]
		public struct QueryVersionCookie {
		}

		[Compact]
		[CCode (cname = "xcb_dri3_query_version_reply_t", ref_function = "", unref_function = "free")]
		public struct QueryVersionReply {
			public uint32 major_version;
			public uint32 minor_version;
		}

		[SimpleType]
		[IntegerType (rank = 9)]
		[CCode (cname = "xcb_dri3_open_cookie_t", has_type_id = false)]
		public struct OpenCookie {
		}

		[Compact]
		[CCode (cname = "xcb_dri3_open_reply_t", ref_function = "", unref_function = "free")]
		public struct OpenReply {
			private uint8 nfd;
			[CCode (cname = "xcb_dri3_open_reply_fds")]
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

		[SimpleType]
		[IntegerType (rank = 9)]
		[CCode (cname = "xcb_dri3_buffer_from_pixmap_cookie_t", has_type_id = false)]
		public struct BufferFromPixmapCookie {
		}

		[Compact]
		[CCode (cname = "xcb_dri3_buffer_from_pixmap_reply_t", ref_function = "", unref_function = "free")]
		public struct BufferFromPixmapReply {
			public uint16 width;
			public uint16 height;
			public uint16 stride;
			public uint8 depth;
			public uint8 bpp;
			private uint8 nfd;
			[CCode (cname = "xcb_dri3_buffer_from_pixmap_reply_fds")]
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

		[SimpleType]
		[IntegerType (rank = 9)]
		[CCode (cname = "xcb_dri3_fd_from_fence_cookie_t", has_type_id = false)]
		public struct FDFromFenceCookie {
		}

		[Compact]
		[CCode (cname = "xcb_dri3_fd_from_fence_reply_t", ref_function = "", unref_function = "free")]
		public struct FDFromFenceReply {
			private uint8 nfd;
			[CCode (cname = "xcb_dri3_fd_from_fence_reply_fds")]
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
