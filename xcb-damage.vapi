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

	[CCode (cprefix = "xcb_damage_", cheader_filename = "xcb/damage.h")]
	namespace Damage {
		public static Connection get_connection (Xcb.Connection c) {
			return (Connection) c;
		}

		[Compact]
		[CCode (cname = "xcb_connection_t", cprefix = "xcb_damage_", unref_function = "")]
		public class Connection : Xcb.Connection {
			public QueryVersionCookie query_version (uint32 client_major_version, uint32 client_minor_version);
			public QueryVersionCookie query_version_unchecked (uint32 client_major_version, uint32 client_minor_version);
			public QueryVersionReply query_version_reply (QueryVersionCookie cookie, out Xcb.GenericError? e = null);

			public VoidCookie create_checked (Damage damage, Xcb.Drawable drawable, ReportLevel level);
			public VoidCookie create (Damage damage, Xcb.Drawable drawable, ReportLevel level);

			public VoidCookie destroy_checked (Damage damage);
			public VoidCookie destroy (Damage damage);

			public VoidCookie subtract_checked (Damage damage, XFixes.Region repair, XFixes.Region parts);
			public VoidCookie subtract (Damage damage, XFixes.Region repair, XFixes.Region parts);

			public VoidCookie add_checked (Damage damage, Xcb.Drawable drawable, XFixes.Region region);
			public VoidCookie add (Damage damage, Xcb.Drawable drawable, XFixes.Region region);
		}

		[SimpleType]
		[CCode (cname = "xcb_damage_damage_t", has_type_id = false)]
		public struct Damage : uint32 {
		}

		[CCode (cname = "xcb_damage_report_level_t", has_type_id = false)]
		public enum ReportLevel
		{
			RAW_RECTANGLES,
			DELTA_RECTANGLES,
			BOUNDING_BOX,
			NON_EMPTY
		}

		[SimpleType]
		[IntegerType (rank = 9)]
		[CCode (cname = "xcb_damage_query_version_cookie_t", has_type_id = false)]
		public struct QueryVersionCookie {
		}

		[Compact]
		[CCode (cname = "xcb_damage_query_version_reply_t", ref_function = "", unref_function = "free")]
		public class QueryVersionReply : Xcb.GenericReply {
			public uint32 major_version;
			public uint32 minor_version;
		}
	}
}
