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

	[CCode (lower_case_cprefix = "xcb_res_", cheader_filename = "xcb/res.h")]
	namespace Res {
		public static Connection get_connection (Xcb.Connection c) {
			return (Connection) c;
		}

		[Compact]
		[CCode (cname = "xcb_connection_t", cprefix = "xcb_res_", unref_function = "")]
		public class Connection : Xcb.Connection {
			public QueryVersionCookie query_version (uint8 major_version, uint8 minor_version);
			public QueryVersionCookie query_version_unchecked (uint8 major_version, uint8 minor_version);
			public QueryVersionReply query_version_reply (QueryVersionCookie cookie, out Xcb.GenericError? e = null);

			public QueryClientsCookie query_clients ();
			public QueryClientsCookie query_clients_unchecked ();
			public QueryClientsReply query_clients_reply (QueryClientsCookie cookie, out GenericError? e = null);

			public QueryClientResourcesCookie query_client_resources (uint32 xid);
			public QueryClientResourcesCookie query_client_resources_unchecked (uint32 xid);
			public QueryClientResourcesReply query_client_resources_reply (QueryClientResourcesCookie cookie, out GenericError? e = null);

			public QueryClientPixmapBytesCookie query_client_pixmap_bytes (uint32 xid);
			public QueryClientPixmapBytesCookie query_client_pixmap_bytes_unchecked (uint32 xid);
			public QueryClientPixmapBytesReply query_client_pixmap_bytes_reply (QueryClientPixmapBytesCookie cookie, out GenericError? e = null);

			public QueryClientIdsCookie query_client_ids ([CCode (array_length_pos = 0.9, array_length_type = "uint32_t")] ClientIdSpec[] specs);
			public QueryClientIdsCookie query_client_ids_unchecked ([CCode (array_length_pos = 0.9, array_length_type = "uint32_t")] ClientIdSpec[] specs);
			public QueryClientIdsReply query_client_ids_reply (QueryClientIdsCookie cookie, out GenericError? e = null);

			public QueryResourceBytesCookie query_resource_bytes (uint32 client, [CCode (array_length_pos = 1.9, array_length_type = "uint32_t")] ResourceIdSpec[] specs);
			public QueryResourceBytesCookie query_resource_bytes_unchecked (uint32 client, [CCode (array_length_pos = 1.9, array_length_type = "uint32_t")] ResourceIdSpec[] specs);
			public QueryResourceBytesReply query_resource_bytes_reply (QueryResourceBytesCookie cookie, out GenericError? e = null);
		}

		[SimpleType]
		[CCode (cname = "xcb_res_client_t", has_type_id = false)]
		public struct Client {
			public uint32 resource_base;
			public uint32 resource_mask;
		}

		[SimpleType]
		[CCode (cname = "xcb_res_type_t", has_type_id = false)]
		public struct Type {
			public Xcb.Atom resource_type;
			public uint32 count;
		}

		[CCode (cname = "xcb_res_client_id_mask_t", cprefix = "XCB_RES_CLIENT_ID_MASK_", has_type_id = false)]
		public enum ClientIdMask
		{
			CLIENT_XID,
			LOCAL_CLIENT_PID
		}

		[SimpleType]
		[CCode (cname = "xcb_res_client_id_spec_t", has_type_id = false)]
		public struct ClientIdSpec {
			public uint32 client;
			public ClientIdMask mask;
		}

		[Compact]
		[CCode (cname = "xcb_res_client_id_value_t", ref_function = "", unref_function = "")]
		public class ClientIdValue {
			public ClientIdSpec spec;
			public uint32 length;
		}

		[SimpleType]
		[CCode (cname = "xcb_res_client_id_value_iterator_t", has_type_id = false)]
		private struct ClientIdValueIterator {
			public unowned ClientIdValue data;
			[CCode (cname = "xcb_res_client_id_value_next")]
			public static void next (ref ClientIdValueIterator iter);
		}

		[SimpleType]
		[CCode (cname = "xcb_res_resource_id_spec_t", has_type_id = false)]
		public struct ResourceIdSpec {
			public uint32 resource;
			public uint32 type;
		}

		[SimpleType]
		[CCode (cname = "xcb_res_resource_size_spec_t", has_type_id = false)]
		public struct ResourceSizeSpec {
			public ResourceIdSpec spec;
			public uint32 bytes;
			public uint32 ref_count;
			public uint32 use_count;
		}

		[Compact]
		[CCode (cname = "xcb_res_resource_size_value_t", ref_function = "", unref_function = "")]
		public class ResourceSizeValue {
			public ResourceSizeSpec spec;
			public uint32 num_cross_references;
		}

		[SimpleType]
		[CCode (cname = "xcb_res_resource_size_value_iterator_t", has_type_id = false)]
		private struct ResourceSizeValueIterator {
			public unowned ResourceSizeValue data;
			[CCode (cname = "xcb_res_resource_size_value_next")]
			public static void next (ref ResourceSizeValueIterator iter);
		}

		[SimpleType]
		[IntegerType (rank = 9)]
		[CCode (cname = "xcb_res_query_version_cookie_t", has_type_id = false)]
		public struct QueryVersionCookie {
		}

		[Compact]
		[CCode (cname = "xcb_res_query_version_reply_t", ref_function = "", unref_function = "free")]
		public class QueryVersionReply : Xcb.GenericReply {
			public uint32 server_major;
			public uint32 server_minor;
		}

		[SimpleType]
		[IntegerType (rank = 9)]
		[CCode (cname = "xcb_res_query_clients_cookie_t", has_type_id = false)]
		public struct QueryClientsCookie {
		}

		[Compact]
		[CCode (cname = "xcb_res_query_clients_reply_t", ref_function = "", unref_function = "free")]
		public class QueryClientsReply : Xcb.GenericReply {
			private uint32 num_clients;
			[CCode (cname = "xcb_res_query_clients_clients")]
			private Client* vala_clients ();
			public unowned Client[] clients
			{
				get
				{
					unowned Client[] res = (Client[]) vala_clients ();
					res.length = (int) num_clients;
					return res;
				}
			}
		}

		[SimpleType]
		[IntegerType (rank = 9)]
		[CCode (cname = "xcb_res_query_client_resources_cookie_t", has_type_id = false)]
		public struct QueryClientResourcesCookie {
		}

		[Compact]
		[CCode (cname = "xcb_res_query_client_resources_reply_t", ref_function = "", unref_function = "free")]
		public class QueryClientResourcesReply : Xcb.GenericReply {
			private uint32 num_types;
			[CCode (cname = "xcb_res_query_client_resources_types")]
			private Type* vala_types ();
			public unowned Type[] types
			{
				get
				{
					unowned Type[] res = (Type[]) vala_types ();
					res.length = (int) num_types;
					return res;
				}
			}
		}

		[SimpleType]
		[IntegerType (rank = 9)]
		[CCode (cname = "xcb_res_query_client_pixmap_bytes_cookie_t", has_type_id = false)]
		public struct QueryClientPixmapBytesCookie {
		}

		[Compact]
		[CCode (cname = "xcb_res_query_client_pixmap_bytes_reply_t", ref_function = "", unref_function = "free")]
		public class QueryClientPixmapBytesReply : Xcb.GenericReply {
			public uint32 bytes;
			public uint32 bytes_overflow;
		}

		[SimpleType]
		[IntegerType (rank = 9)]
		[CCode (cname = "xcb_res_query_client_ids_cookie_t", has_type_id = false)]
		public struct QueryClientIdsCookie {
		}

		[Compact]
		[CCode (cname = "xcb_res_query_client_ids_reply_t", ref_function = "", unref_function = "free")]
		public class QueryClientIdsReply : Xcb.GenericReply {
			private uint32 num_ids;
			[CCode (cname = "xcb_res_query_client_ids_ids_iterator")]
			private ClientIdValueIterator ids_iterator ();
			public ClientIdValue[] ids
			{
				owned get {
					var value = new ClientIdValue[num_ids];
					var iter = ids_iterator ();
					for (var i = 0; i < value.length; i++)
					{
						value[i] = iter.data;
						ClientIdValueIterator.next (ref iter);
					}
					return value;
				}
			}
		}

		[SimpleType]
		[IntegerType (rank = 9)]
		[CCode (cname = "xcb_res_query_resource_bytes_cookie_t", has_type_id = false)]
		public struct QueryResourceBytesCookie {
		}

		[Compact]
		[CCode (cname = "xcb_res_query_resource_bytes_reply_t", ref_function = "", unref_function = "free")]
		public class QueryResourceBytesReply : Xcb.GenericReply {
			private uint32 num_sizes;
			[CCode (cname = "xcb_res_query_resource_bytes_sizes_iterator")]
			private ResourceSizeValueIterator sizes_iterator ();
			public ResourceSizeValue[] sizes
			{
				owned get {
					var value = new ResourceSizeValue[num_sizes];
					var iter = sizes_iterator ();
					for (var i = 0; i < value.length; i++)
					{
						value[i] = iter.data;
						ResourceSizeValueIterator.next (ref iter);
					}
					return value;
				}
			}
		}
	}
}
