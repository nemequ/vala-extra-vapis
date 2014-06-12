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

	[CCode (cprefix = "xcb_sync_", cheader_filename = "xcb/sync.h")]
	namespace Sync {
		public static Connection get_connection (Xcb.Connection c) {
			return (Connection) c;
		}

		[Compact]
		[CCode (cname = "xcb_connection_t", cprefix = "xcb_sync_", unref_function = "")]
		public class Connection : Xcb.Connection {
			public InitializeCookie initialize (uint8 desired_major_version, uint8 desired_minor_version);
			public InitializeCookie initialize_unchecked (uint8 desired_major_version, uint8 desired_minor_version);
			public InitializeReply initialize_reply (InitializeCookie cookie, out Xcb.GenericError? e = null);

			public ListSystemCountersCookie list_system_counters ();
			public ListSystemCountersCookie list_system_counters_unchecked ();
			public ListSystemCountersReply list_system_counters_reply (ListSystemCountersCookie cookie, out Xcb.GenericError? e = null);

			public VoidCookie create_counter_checked (Counter id, Int64 initial_value);
			public VoidCookie create_counter (Counter id, Int64 initial_value);

			public VoidCookie destroy_counter_checked (Counter counter);
			public VoidCookie destroy_counter (Counter counter);

			public QueryCounterCookie query_counter (Counter counter);
			public QueryCounterCookie query_counter_unchecked (Counter counter);
			public QueryCounterReply query_counter_reply (QueryCounterCookie cookie, out Xcb.GenericError? e = null);

			public VoidCookie await_checked ([CCode (array_length_pos = 0.9, array_length_type = "uint32_t")] WaitCondition[] wait_list);
			public VoidCookie await ([CCode (array_length_pos = 0.9, array_length_type = "uint32_t")] WaitCondition[] wait_list);

			public VoidCookie change_counter_checked (Counter counter, Int64 amount);
			public VoidCookie change_counter (Counter counter, Int64 amount);

			public VoidCookie set_counter_checked (Counter counter, Int64 value);
			public VoidCookie set_counter (Counter counter, Int64 value);

			//public int create_alarm_value_list_serialize (void **_buffer, uint32 value_mask, CreateAlarmValueList *_aux);
			//public int create_alarm_value_list_unpack (const void *_buffer, uint32 value_mask, CreateAlarmValueList *_aux);

			//public VoidCookie create_alarm_checked (Alarm id, CA value_mask, const void *value_list);
			//public VoidCookie create_alarm (Alarm id, CA value_mask, const void *value_list);

			//public VoidCookie create_alarm_aux_checked (Alarm id, CA value_mask, CreateAlarmValueList *value_list);
			//public VoidCookie create_alarm_aux (Alarm id, CA value_mask, CreateAlarmValueList *value_list);

			//public int change_alarm_value_list_serialize (void **_buffer, uint32 value_mask, ChangeAlarmValueList *_aux);
			//public int change_alarm_value_list_unpack (const void *_buffer, uint32 value_mask, change_alarm_value_list_t *_aux);

			//public VoidCookie change_alarm_checked (Alarm id, uint32 value_mask, const void *value_list);
			//public VoidCookie change_alarm (Alarm id, uint32 value_mask, const void *value_list);

			//public VoidCookie change_alarm_aux_checked (Alarm id, uint32 value_mask, ChangeAlarmValueList *value_list);
			//public VoidCookie change_alarm_aux (Alarm id, uint32 value_mask, ChangeAlarmValueList *value_list);

			public VoidCookie destroy_alarm_checked (Alarm alarm);
			public VoidCookie destroy_alarm (Alarm alarm);

			public QueryAlarmCookie query_alarm (Alarm alarm);
			public QueryAlarmCookie query_alarm_unchecked (Alarm alarm);
			public QueryAlarmReply query_alarm_reply (QueryAlarmCookie cookie, out Xcb.GenericError? e = null);

			public VoidCookie set_priority_checked (uint32 id, int32 priority);
			public VoidCookie set_priority (uint32 id, int32 priority);

			public GetPriorityCookie get_priority (uint32 id);
			public GetPriorityCookie get_priority_unchecked (uint32 id);
			public GetPriorityReply get_priority_reply (GetPriorityCookie cookie, out Xcb.GenericError? e = null);

			public VoidCookie create_fence_checked (Xcb.Drawable drawable, Fence fence, bool initially_triggered);
			public VoidCookie create_fence (Xcb.Drawable drawable, Fence fence, bool initially_triggered);

			public VoidCookie trigger_fence_checked (Fence fence);
			public VoidCookie trigger_fence (Fence fence);

			public VoidCookie reset_fence_checked (Fence fence);
			public VoidCookie reset_fence (Fence fence);

			public VoidCookie destroy_fence_checked (Fence fence);
			public VoidCookie destroy_fence (Fence fence);

			public QueryFenceCookie query_fence (Fence fence);
			public QueryFenceCookie query_fence_unchecked (Fence fence);
			public QueryFenceReply query_fence_reply (QueryFenceCookie cookie, out Xcb.GenericError? e = null);

			public VoidCookie await_fence_checked ([CCode (array_length_pos = 0.9, array_length_type = "uint32_t")] Fence[] fence_list);
			public VoidCookie await_fence ([CCode (array_length_pos = 0.9, array_length_type = "uint32_t")] Fence[] fence_list);
		}

		[SimpleType]
		[CCode (cname = "xcb_sync_alarm_t", has_type_id = false)]
		public struct Alarm : uint32 {
		}

		[SimpleType]
		[CCode (cname = "xcb_sync_counter_t", has_type_id = false)]
		public struct Counter : uint32 {
		}

		[SimpleType]
		[CCode (cname = "xcb_sync_fence_t", has_type_id = false)]
		public struct Fence : uint32 {
		}

		[CCode (cname = "xcb_sync_alarmstate_t", has_type_id = false)]
		public enum AlarmState
		{
			ACTIVE,
			INACTIVE,
			DESTROYED
		}

		[CCode (cname = "xcb_sync_testtype_t", has_type_id = false)]
		public enum TestType
		{
			POSITIVE_TRANSITION,
			NEGATIVE_TRANSITION,
			POSITIVE_COMPARISON,
			NEGATIVE_COMPARISON
		}

		[CCode (cname = "xcb_sync_valuetype_t", has_type_id = false)]
		public enum ValueType
		{
			ABSOLUTE,
			RELATIVE
		}

		[CCode (cname = "xcb_sync_ca_t", has_type_id = false)]
		public enum CA
		{
			COUNTER,
			VALUE_TYPE,
			VALUE,
			TEST_TYPE,
			DELTA,
			EVENTS
		}

		[SimpleType]
		[CCode (cname = "xcb_sync_int64_t", has_type_id = false)]
		public struct Int64
		{
			public int32 hi;
			public uint32 lo;
		}

		[Compact]
		[CCode (cname = "xcb_sync_systemcounter_t", ref_function = "", unref_function = "")]
		public class SystemCounter
		{
			public Counter counter;
			public Int64 resolution;
			private uint16 name_len;
			[CCode (cname = "xcb_sync_systemcounter_name")]
			private unowned string vala_name ();
			public string name { owned get { return "%.*s".printf (name_len, vala_name ()); } }
		}

		[SimpleType]
		[CCode (cname = "xcb_sync_systemcounter_iterator_t", has_type_id = false)]
		private struct SystemCounterIterator {
			public unowned SystemCounter data;
			[CCode (cname = "xcb_sync_systemcounter_next")]
			public static void next (ref SystemCounterIterator iter);
		}

		[SimpleType]
		[CCode (cname = "xcb_sync_trigger_t", has_type_id = false)]
		public struct Trigger
		{
			public Counter counter;
			public uint32 wait_type; // FIXME type
			public Int64 wait_value;
			public TestType test_type;
		}

		[SimpleType]
		[CCode (cname = "xcb_sync_waitcondition_t", has_type_id = false)]
		public struct WaitCondition
		{
			public Trigger trigger;
			public Int64 event_threshold;
		}

		[SimpleType]
		[IntegerType (rank = 9)]
		[CCode (cname = "xcb_sync_initialize_cookie_t", has_type_id = false)]
		public struct InitializeCookie {
		}

		[Compact]
		[CCode (cname = "xcb_sync_initialize_reply_t", ref_function = "", unref_function = "free")]
		public class InitializeReply : Xcb.GenericReply {
			public uint8 major_version;
			public uint8 minor_version;
		}

		[SimpleType]
		[IntegerType (rank = 9)]
		[CCode (cname = "xcb_sync_list_system_counters_cookie_t", has_type_id = false)]
		public struct ListSystemCountersCookie {
		}

		[Compact]
		[CCode (cname = "xcb_sync_list_system_counters_reply_t", ref_function = "", unref_function = "free")]
		public class ListSystemCountersReply : Xcb.GenericReply {
			private uint32 counters_len;
			[CCode (cname = "xcb_sync_list_system_counters_counters_iterator")]
			private SystemCounterIterator counters_iterator ();
			public SystemCounter[] counters
			{
				owned get
				{
					var value = new SystemCounter[counters_len];
					var iter = counters_iterator ();
					for (var i = 0; i < value.length; i++)
					{
						value[i] = iter.data;
						SystemCounterIterator.next (ref iter);
					}
					return value;
				}
			}
		}

		[SimpleType]
		[IntegerType (rank = 9)]
		[CCode (cname = "xcb_sync_query_counter_cookie_t", has_type_id = false)]
		public struct QueryCounterCookie {
		}

		[Compact]
		[CCode (cname = "xcb_sync_query_counter_reply_t", ref_function = "", unref_function = "free")]
		public class QueryCounterReply : Xcb.GenericReply {
			public Int64 counter_value;
		}

		[SimpleType]
		[IntegerType (rank = 9)]
		[CCode (cname = "xcb_sync_query_alarm_cookie_t", has_type_id = false)]
		public struct QueryAlarmCookie {
		}

		[Compact]
		[CCode (cname = "xcb_sync_query_alarm_reply_t", ref_function = "", unref_function = "free")]
		public class QueryAlarmReply : Xcb.GenericReply {
			public Trigger trigger;
			public Int64 delta;
			public uint8 events; // FIXME type
			public AlarmState state;
		}

		[SimpleType]
		[IntegerType (rank = 9)]
		[CCode (cname = "xcb_sync_get_priority_cookie_t", has_type_id = false)]
		public struct GetPriorityCookie {
		}

		[Compact]
		[CCode (cname = "xcb_sync_get_priority_reply_t", ref_function = "", unref_function = "free")]
		public class GetPriorityReply : Xcb.GenericReply {
			public int32 priority;
		}

		[SimpleType]
		[IntegerType (rank = 9)]
		[CCode (cname = "xcb_sync_query_fence_cookie_t", has_type_id = false)]
		public struct QueryFenceCookie {
		}

		[Compact]
		[CCode (cname = "xcb_sync_query_fence_reply_t", ref_function = "", unref_function = "free")]
		public class QueryFenceReply : Xcb.GenericReply {
			public bool triggered;
		}
	}
}
