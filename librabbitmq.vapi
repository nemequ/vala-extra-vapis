/* librabbitmq Vala Bindings
 * Copyright 2012 Evan Nemerson <evan@coeus-group.com>
 *
 * Permission is hereby granted, free of charge, to any person
 * obtaining a copy of this software and associated documentation
 * files (the "Software"), to deal in the Software without
 * restriction, including without limitation the rights to use, copy,
 * modify, merge, publish, distribute, sublicense, and/or sell copies
 * of the Software, and to permit persons to whom the Software is
 * furnished to do so, subject to the following conditions:
 *
 * The above copyright notice and this permission notice shall be
 * included in all copies or substantial portions of the Software.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
 * EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
 * MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
 * NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS
 * BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN
 * ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN
 * CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
 * SOFTWARE.
 */

[CCode (cprefix = "amqp_", lower_case_cprefix = "amqp_", cheader_filename = "stdint.h,amqp.h")]
namespace AMQP {
  [SimpleType, CCode (cname = "amqp_method_number_t")]
  public struct MethodNumber : uint32 { }
  [SimpleType, CCode (cname = "amqp_flags_t")]
  public struct Flags : uint32 { }
  [SimpleType, CCode (cname = "amqp_channel_t")]
  public struct Channel : uint32 { }

  [SimpleType, CCode (cname = "amqp_bytes_t", copy_function = "amqp_bytes_malloc_dup", destroy_function = "amqp_bytes_free")]
  public struct Bytes {
    [CCode (cname = "amqp_bytes_malloc")]
    public Bytes (size_t amount);
    //[CCode (cname = "amqp_cstring_bytes")]
    //public Bytes.from_string (string cstr);
    public static AMQP.Bytes from_string (string cstr) {
      AMQP.Bytes bytes = AMQP.Bytes (cstr.length);
      GLib.Memory.copy (bytes.bytes, cstr, bytes.bytes.length);
      return bytes;
    }

    [CCode (array_length_cname = "len", array_length_type = "size_t")]
    public uint8[] bytes;

    [CCode (cname = "amqp_empty_bytes")]
    public static const AMQP.Bytes EMPTY;
  }

  [SimpleType, CCode (cname = "amqp_decimal_t")]
  public struct Decimal {
    public uint8 decimals;
    public uint32 value;
  }

  [CCode (cname = "amqp_table_t")]
  public struct Table {
    [CCode (array_length_cname = "num_entries")]
    public AMQP.TableEntry[] entries;

    [CCode (instance_pos = 2.9, cname = "amqp_decode_table")]
    public Table.decode (AMQP.Bytes encoded, AMQP.Pool pool, ref size_t offset);

    [CCode (cname = "amqp_encode_table", instance_pos = 1.9)]
    public int encode (AMQP.Bytes encoded, ref size_t offset);

    [CCode (cname = "amqp_empty_table")]
    public static const AMQP.Table EMPTY;
  }

  [CCode (cname = "amqp_array_t")]
  public struct Array {
    [CCode (array_length_cname = "num_entries")]
    public AMQP.FieldValue[] entries;

    [CCode (cname = "amqp_empty_array")]
    public static const AMQP.Array EMPTY;
  }

  [CCode (cname = "amqp_field_value_t")]
  public class FieldValue {
    public uint8 kind;
    [CCode (cname = "value.boolean")]
    public bool value_boolean;
    [CCode (cname = "value.i8")]
    public int8 value_i8;
    [CCode (cname = "value.u8")]
    public uint8 value_u8;
    [CCode (cname = "value.i16")]
    public int16 value_i16;
    [CCode (cname = "value.u16")]
    public uint16 value_u16;
    [CCode (cname = "value.i32")]
    public int32 value_i32;
    [CCode (cname = "value.u32")]
    public uint32 value_u32;
    [CCode (cname = "value.i64")]
    public int64 value_i64;
    [CCode (cname = "value.u64")]
    public uint64 value_u64;
    [CCode (cname = "value.f32")]
    public float value_f32;
    [CCode (cname = "value.f64")]
    public double value_f64;
    [CCode (cname = "value.decimal")]
    public AMQP.Decimal value_decimal;
    [CCode (cname = "value.bytes")]
    public AMQP.Bytes value_bytes;
    [CCode (cname = "value.table")]
    public AMQP.Table value_table;
    [CCode (cname = "value.array")]
    public AMQP.Array value_array;
  }

  [CCode (cname = "amqp_table_entry_t")]
  public struct TableEntry {
    public AMQP.Bytes key;
    public AMQP.FieldValue value;

    public static int compare ([CCode (type = "void const *")] AMQP.TableEntry entry1, [CCode (type = "void const *")] AMQP.TableEntry entry2);
  }

  [CCode (cname = "amqp_field_value_kind_t", cprefix = "AMQP_FIELD_KIND_")]
  public enum ValueKind {
    BOOLEAN,
    I8,
    U8,
    I16,
    U16,
    I32,
    U32,
    I64,
    U64,
    F32,
    F64,
    DECIMAL,
    UTF8,
    ARRAY,
    TIMESTAMP,
    TABLE,
    VOID,
    BYTES
  }

  [CCode (cname = "amqp_pool_blocklist_t")]
  public struct PoolBlocklist {
    [CCode (array_length_cname = "num_blocks")]
    public void*[] blocklist;
  }

  [CCode (cname = "amqp_pool_t")]
  public struct Pool {
    public size_t pagesize;

    public AMQP.PoolBlocklist pages;
    public AMQP.PoolBlocklist large_blocks;

    public int next_page;
    public char* alloc_block;
    public size_t alloc_used;

    [CCode (cname = "init_amqp_pool")]
    public Pool ();
    [CCode (cname = "recycle_amqp_pool")]
    public void recycle ();
    [CCode (cname = "empty_amqp_pool")]
    public void empty ();
    public void* alloc (size_t amount);
    public void alloc_bytes (size_t amount, out AMQP.Bytes output);
  }

  [CCode (cname = "amqp_method_t")]
  public struct Method {
    public AMQP.MethodNumber id;
    public void* decoded;
  }

  [CCode (cname = "amqp_frame_t")]
  public struct Frame {
    public uint8 frame_type;

    public AMQP.Channel channel;

    [CCode (cname = "payload.method")]
    public AMQP.Method payload_method;

    [CCode (cname = "payload.properties.class_id")]
    public uint16 payload_properties_class_id;
    [CCode (cname = "payload.properties.body_size")]
    public uint64 payload_properties_body_size;
    [CCode (cname = "payload.properties.decoded")]
    public void* payload_properties_decoded;
    [CCode (cname = "payload.properties.raw")]
    public AMQP.Bytes payload_properties_raw;

    [CCode (cname = "payload.body_fragment")]
    public AMQP.Bytes payload_body_fragment;

    [CCode (cname = "payload.protocol_header.high")]
    public uint8 payload_protocol_header_high;
    [CCode (cname = "payload.protocol_header.low")]
    public uint8 payload_protocol_header_low;
    [CCode (cname = "payload.protocol_header.protocol_version_major")]
    public uint8 payload_protocol_header_protocol_version_major;
    [CCode (cname = "payload.protocol_header.protocol_version_minor")]
    public uint8 payload_protocol_header_protocol_version_minor;
  }

  [CCode (cname = "amqp_response_type_enum", cprefix = "AMQP_RESPONSE_")]
  public enum ResponseType {
    NONE,
    NORMAL,
    LIBRARY_EXCEPTION,
    SERVER_EXCEPTION
  }

  [SimpleType, CCode (cname = "amqp_rpc_reply_t")]
  public struct RPCReply {
    public AMQP.ResponseType reply_type;
    public AMQP.Method reply;
    public int library_error;
  }

  [CCode (cname = "amqp_sasl_method_enum")]
  public enum SASLMethod {
    PLAIN
  }

  [CCode (lower_case_cprefix = "amqp_", cheader_filename = "amqp_framing.h")]
  namespace Response {
    [Compact, CCode (cname = "void", free_function = "")]
    public class Method { }

    [Compact, CCode (cname = "amqp_channel_open_ok_t")]
    public class ChannelOpen : Method {
      public AMQP.Bytes channel_id;
    }
  }

  [Compact, CCode (cname = "struct amqp_connection_state_t_", lower_case_cprefix = "amqp_", free_function = "amqp_destroy_connection")]
  public class Connection {
    [CCode (cname = "amqp_new_connection")]
    public Connection ();
    public int get_sockfd ();
    public void set_sockfd (int sockfd);
    [CCode (cname = "amqp_tune_connection")]
    public int tune (int channel_max, int frame_max, int heartbeat);
    public int get_channel_max ();
    public int handle_input (AMQP.Bytes received_data, AMQP.Frame decoded_frame);
    public bool buffers_ok;
    public void release_buffers ();
    public void maybe_release_buffers ();
    public int send_frame (AMQP.Frame frame);
    public int send_header ();
    public bool frames_enqeued ();
    public int simple_wait_frame (AMQP.Frame decoded_frame);
    public int simple_wait_method (AMQP.Channel expected_channel, AMQP.Method expected_method, out AMQP.Method output);
    public int send_method (AMQP.Channel channel, AMQP.MethodNumber id, void* decoded);
    public AMQP.RPCReply simple_rpc (AMQP.Channel channel, AMQP.MethodNumber request_id, out AMQP.MethodNumber expected_reply_ids, void* decoded_request_method);
    public void* simple_rpc_decoded (AMQP.Channel channel, AMQP.MethodNumber request_id, AMQP.MethodNumber reply_id, void* decoded_request_method);
    public AMQP.RPCReply get_rpc_reply ();
    public AMQP.RPCReply login (string vhost, int channel_max, int frame_max, int heartbeat, AMQP.SASLMethod sasl_method, ...);
    public int basic_publish (AMQP.Channel channel, AMQP.Bytes exchange, AMQP.Bytes routing_key, bool mandatory, bool immediate, AMQP.BasicProperties? properties, AMQP.Bytes body);
    public AMQP.RPCReply channel_close (AMQP.Channel channel, int code);
    public AMQP.RPCReply close (int code);
    public AMQP.RPCReply basic_get (AMQP.Channel channel, AMQP.Bytes queue, bool no_ack);
    public int basic_reject (AMQP.Channel channel, uint64 delivery_tag, bool requeue);
    public bool data_in_buffer ();

    public unowned Response.ChannelOpen channel_open (AMQP.Channel channel);
  }

  [Flags, CCode (cname = "amqp_flags_t")]
  public enum BasicType {
    [CCode (cname = "AMQP_BASIC_CLASS")]
    CLASS,
    [CCode (cname = "AMQP_BASIC_CONTENT_TYPE_FLAG")]
    CONTENT_TYPE,
    [CCode (cname = "AMQP_BASIC_CONTENT_ENCODING_FLAG")]
    CONTENT_ENCODING,
    [CCode (cname = "AMQP_BASIC_HEADERS_FLAG")]
    HEADERS,
    [CCode (cname = "AMQP_BASIC_DELIVERY_MODE_FLAG")]
    DELIVERY_MODE,
    [CCode (cname = "AMQP_BASIC_PRIORITY_FLAG")]
    PRIORITY,
    [CCode (cname = "AMQP_BASIC_CORRELATION_ID_FLAG")]
    CORRELATION_ID,
    [CCode (cname = "AMQP_BASIC_REPLY_TO_FLAG")]
    REPLY_TO,
    [CCode (cname = "AMQP_BASIC_EXPIRATION_FLAG")]
    EXPIRATION,
    [CCode (cname = "AMQP_BASIC_MESSAGE_ID_FLAG")]
    MESSAGE_ID,
    [CCode (cname = "AMQP_BASIC_TIMESTAMP_FLAG")]
    TIMESTAMP,
    [CCode (cname = "AMQP_BASIC_TYPE_FLAG")]
    TYPE,
    [CCode (cname = "AMQP_BASIC_USER_ID_FLAG")]
    USER_ID,
    [CCode (cname = "AMQP_BASIC_APP_ID_FLAG")]
    APP_ID,
    [CCode (cname = "AMQP_BASIC_CLUSTER_ID_FLAG")]
    CLUSTER_ID
  }

  [CCode (cname = "amqp_basic_properties_t", cheader_filename = "amqp_framing.h", destroy_function = "")]
  public struct BasicProperties {
    [CCode (cname = "_flags")]
    public AMQP.BasicType flags;
    public AMQP.Bytes content_type;
    public AMQP.Bytes content_encoding;
    public AMQP.Table headers;
    public uint8 delivery_mode;
    public uint8 priority;
    public AMQP.Bytes correlation_id;
    public AMQP.Bytes reply_to;
    public AMQP.Bytes expiration;
    public AMQP.Bytes message_id;
    public uint64 timestamp;
    public AMQP.Bytes type;
    public AMQP.Bytes user_id;
    public AMQP.Bytes app_id;
    public AMQP.Bytes cluster_id;
  }

  public static int version ();
  public string error_string (int err);
  public int open_socket(string hostname, int portnumber);
}
