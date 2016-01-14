/* Vala bindings for the C Proton AMQP library
 * Copyright 2013 Evan Nemerson <evan@coeus-group.com>
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

/* As of ba6d7929193ee590ab330b65acb9360e4a183521 the following
 * headers are bound completely:
 *
 *  * messenger.h
 *  * codec.h
 *  * types.h
 *  * message.h
 *  * buffer.h
 *  * error.h
 *
 * All other headers are completely unbound.
 *
 * Lots of methods return int when they could return Proton.ErrorCode.
 * I haven't decided whether or not to do anything about it...  I
 * would feel better about changing it if proton had a typedef like
 * proton_error_code_t to int and returned that instead of int.
 */

[CCode (lower_case_cprefix = "pn_")]
namespace Proton {
	[CCode (cname = "pn_accept_mode_t", has_type_id = false, cheader_filename = "proton/messenger.h")]
	public enum AcceptMode {
		AUTO,
		MANUAL
	}

	[SimpleType, CCode (cname = "pn_atom_t", cheader_filename = "proton/codec.h")]
	public struct Atom {
		public Proton.Type type;
		[CCode (cname = "u.as_bool")]
		public bool as_bool;
		[CCode (cname = "u.as_ubyte")]
		public uint8 as_ubyte;
		[CCode (cname = "u.as_byte")]
		public int8 as_byte;
		[CCode (cname = "u.as_ushort")]
		public uint16 as_ushort;
		[CCode (cname = "u.as_short")]
		public int16 as_short;
		[CCode (cname = "u.as_uint")]
		public uint32 as_uint;
		[CCode (cname = "u.as_int")]
		public int32 as_int;
		[CCode (cname = "u.as_char")]
		public Proton.Char as_char;
		[CCode (cname = "u.as_ulong")]
		public uint64 as_ulong;
		[CCode (cname = "u.as_long")]
		public int64 as_long;
		[CCode (cname = "u.as_timestamp")]
		public Proton.Timestamp as_timestamp;
		[CCode (cname = "u.as_float")]
		public float as_float;
		[CCode (cname = "u.as_double")]
		public double as_double;
		[CCode (cname = "u.as_decimal32")]
		public Proton.Decimal32 as_decimal32;
		[CCode (cname = "u.as_decimal64")]
		public Proton.Decimal64 as_decimal64;
		[CCode (cname = "u.as_decimal128")]
		public Proton.Decimal128 as_decimal128;
		[CCode (cname = "u.as_uuid")]
		public Proton.UUID as_uuid;
		[CCode (cname = "u.as_bytes")]
		public Proton.Bytes as_bytes;
		[CCode (cname = "u.as_count")]
		public size_t as_count;
	}

	[Compact, CCode (cname = "pn_buffer_t", cheader_filename = "proton/buffer.h")]
	public class Buffer {
		[CCode (cname = "pn_buffer")]
		public Buffer (size_t capacity);
		public size_t size { [CCode (cname = "pn_buffer_size")] get; }
		public size_t capacity { [CCode (cname = "pn_buffer_capacity")] get; }
		public size_t available { [CCode (cname = "pn_buffer_available")] get; }
		public int ensure (size_t size);
		public int append ([CCode (type = "const char*", array_length_type = "size_t")] uint8[] bytes);
		public int prepend ([CCode (type = "const char*", array_length_type = "size_t")] uint8[] bytes);
		public size_t get (size_t offset, [CCode (type = "char*", array_length_pos = 1.5)] uint8[] dst);
		public int trim (size_t left, size_t right);
		public void clear ();
		public int defrag ();
		public Proton.Bytes bytes ();
		public int print ();
	}

	// TODO: a pn_bytes_free would be nice.
	[SimpleType, CCode (cname = "pn_bytes_t", cheader_filename = "proton/types.h")]
	public struct Bytes {
		[CCode (cname = "start", array_length_cname = "size", array_length_type = "size_t")]
		public uint8[] data;
		[CCode (cname = "pn_bytes")]
		public Bytes ([CCode (type = "char*", array_length_pos = 0.9, array_length_type = "size_t")] uint8[] data);
		[CCode (cname = "pn_bytes_dup")]
		public Bytes.dup ([CCode (type = "char*", array_length_pos = 0.9, array_length_type = "size_t")] uint8[] data);
		[CCode (cname = "pn_bytes")]
		public Bytes.take ([CCode (type = "char*", array_length_pos = 0.9, array_length_type = "size_t")] owned uint8[] data);
	}

	// TODO: what is this?  UTF-32?  If so, inherit from unichar instead of uint32
	[SimpleType, IntegerType (rank = 7)]
	[CCode (cname = "pn_char_t", cheader_filename = "proton/types.h")]
	public struct Char : uint32 { }

	[CCode (cname = "PN_CUMULATIVE")]
	public const int CUMULATIVE;

	[Compact, CCode (cname = "pn_data_t", cheader_filename = "proton/codec.h")]
	public class Data {
		public Data (size_t capacity);

		public int errno { [CCode (cname = "pn_data_errno")] get; }
		public string? error { [CCode (cname = "pn_data_error")] get; }

		public int vfill (string fmt, va_list ap);
		public int fill (string fmt, ...);
		public int vscan (string fmt, va_list ap);
		public int scan (string fmt, ...);

		public void clear ();
		public size_t size { [CCode (cname = "pn_data_size")] get; }
		public void rewind ();
		public bool next ();
		public bool prev ();
		public bool enter ();
		public bool exit ();

		public Proton.Type type { [CCode (cname = "pn_data_type")] get; }

		public int print ();
		public int format ([CCode (type = "char*", array_length = false)] uint8[] bytes, ref size_t size);
		public size_t encode ([CCode (type = "char*", array_length_type = "size_t")] uint8[] bytes);
		public size_t decode ([CCode (type = "char*", array_length_type = "size_t")] uint8[] bytes);

		public int put_list ();
		public int put_map ();
		public int put_array (bool described, Proton.Type type);
		public int put_described ();
		public int put_null ();
		public int put_bool (bool b);
		public int put_ubyte (uint8 ub);
		public int put_byte (int8 b);
		public int put_ushort (uint16 us);
		public int put_short (int16 s);
		public int put_uint (uint ui);
		public int put_int (uint i);
		public int put_char (Proton.Char c);
		public int put_ulong (uint64 ul);
		public int put_long (int64 l);
		public int put_timestamp (Proton.Timestamp t);
		public int put_float (float f);
		public int put_double (double d);
		public int put_decimal (Proton.Decimal32 d);
		public int put_decimal64 (Proton.Decimal64 d);
		public int put_decimal128 (Proton.Decimal128 d);
		public int put_uuid (Proton.UUID u);
		public int put_binary (Proton.Bytes bytes);
		public int put_string (Proton.Bytes str);
		public int put_symbol (Proton.Bytes symbol);
		public int put_atom (Proton.Atom atom);

		public size_t get_list ();
		public size_t get_map ();
		public size_t get_array ();
		public bool is_array_described ();
		public Proton.Type get_array_type ();
		public bool is_described ();
		public bool is_null ();
		public bool get_bool ();
		public uint8 get_ubyte ();
		public int8 get_byte ();
		public uint16 get_ushort ();
		public int16 get_short ();
		public uint32 get_uint ();
		public int32 get_int ();
		public Proton.Char get_char ();
		public uint64 get_ulong ();
		public int64 get_long ();
		public Proton.Timestamp get_timestamp ();
		public float get_float ();
		public double get_double ();
		public Proton.Decimal32 get_decimal32 ();
		public Proton.Decimal64 get_decimal64 ();
		public Proton.Decimal128 get_decimal128 ();
		public Proton.UUID get_uuid ();
		public Proton.Bytes get_binary ();
		public Proton.Bytes get_string ();
		public Proton.Bytes get_symbol ();
		public Proton.Bytes get_bytes ();
		public Proton.Atom get_atom ();

		public int copy (Proton.Data src);
		public int append (Proton.Data src);
		public int appendn (Proton.Data src, int limit);
		public void narrow ();
		public void widen ();

		public void dump ();
	}

	[SimpleType, IntegerType (rank = 7)]
	[CCode (cname = "pn_decimal32_t", cheader_filename = "proton/types.h")]
	public struct Decimal32 : uint32 { }

	[SimpleType, IntegerType (rank = 11)]
	[CCode (cname = "pn_decimal64_t", cheader_filename = "proton/types.h")]
	public struct Decimal64 : uint64 { }

	[SimpleType, CCode (cname = "pn_decimal128_t", cheader_filename = "proton/types.h")]
	public struct Decimal128 {
		public uint8 bytes[16];
	}

	[Compact, CCode (cname = "pn_error_t", cheader_filename = "proton/error.h")]
	public class Error {
		[CCode (cname = "pn_error")]
		public Error ();

		public void clear ();
		public int set (int code, string text);
		public int vformat (int code, string fmt, va_list ap);
		public int format (int code, string fmt);

		public int code { [CCode (cname = "pn_error_code")] get; }
		public string text { [CCode (cname = "pn_error_text")] get; }
	}

	[SimpleType, IntegerType (rank = 6), CCode (cname = "int", lower_case_cprefix = "pn_", cheader_filename = "proton/error.h")]
	public struct ErrorCode {
		public const Proton.ErrorCode EOS;
		public const Proton.ErrorCode ERR;
		public const Proton.ErrorCode OVERFLOW;
		public const Proton.ErrorCode UNDERFLOW;
		public const Proton.ErrorCode STATE_ERR;
		public const Proton.ErrorCode ARG_ERR;
		public const Proton.ErrorCode TIMEOUT;
		public const Proton.ErrorCode INTR;

		[CCode (cname = "pn_code")]
		public unowned string to_string ();
	}

	[CCode (cname = "pn_format_t", cprefix = "PN_", has_type_id = false)]
	public enum Format {
		DATA,
		TEXT,
		AMQP,
		JSON
	}

	[CCode (cname = "PN_DEFAULT_PRIORITY")]
	public const int DEFAULT_PRIORITY;

	[Compact, CCode (cname = "pn_message_t", cheader_filename = "proton/message.h")]
	public class Message {
		[CCode (cname = "pn_message")]
		public Message ();

		public void clear ();
		public int errno { [CCode (cname = "pn_message_errno")] get; }
		public string? error { [CCode (cname = "pn_message_error")] get; }

		public bool inferred { [CCode (cname = "pn_message_is_inferred")] get; set; }
		public bool durable { [CCode (cname = "pn_message_is_durable")] get; set; }
		public uint8 priority { get; set; }
		public Proton.Millis ttl { get; set; }
		public bool first_acquirer { [CCode (cname = "pn_message_is_first_acquirer")] get; set; }
		public uint32 delivery_count { get; set; }

		[CCode (cname = "pn_message_id")]
		public Proton.Data id_data ();
		public Proton.Atom id { get; set; }
		public Proton.Bytes user_id { get; set; }
		public string address { get; set; }
		public string subject { get; set; }
		public string reply_to { get; set; }
		[CCode (cname = "pn_correlation_id")]
		public Proton.Data correlation_id_data ();
		public Proton.Atom correlation_id { get; set; }
		public string content_type { get; set; }
		public string content_encoding { get; set; }
		public Proton.Timestamp expiry_time { get; set; }
		public Proton.Timestamp creation_time { get; set; }
		public string group_id { get; set; }
		public Proton.Sequence group_sequence { get; set; }
		public string reply_to_group_id { get; set; }
		public Proton.Format format { get; set; }

		public int load ([CCode (type = "const char *", array_length_type = "size_t")] uint8[] data);
		public int load_data ([CCode (type = "const char *", array_length_type = "size_t")] uint8[] data);
		public int load_text ([CCode (type = "const char *", array_length_type = "size_t")] uint8[] data);
		public int load_amqp ([CCode (type = "const char *", array_length_type = "size_t")] uint8[] data);
		public int load_json ([CCode (type = "const char *", array_length_type = "size_t")] uint8[] data);

		public int save ([CCode (type = "char *", array_length = false)] uint8[] data, out size_t size);
		public int save_data ([CCode (type = "char *", array_length = false)] uint8[] data, out size_t size);
		public int save_text ([CCode (type = "char *", array_length = false)] uint8[] data, out size_t size);
		public int save_amqp ([CCode (type = "char *", array_length = false)] uint8[] data, out size_t size);
		public int save_json ([CCode (type = "char *", array_length = false)] uint8[] data, out size_t size);

		public Proton.Data instructions { [CCode (cname = "pn_message_instructions")] get; }
		public Proton.Data annotations { [CCode (cname = "pn_message_annotations")] get; }
		public Proton.Data properties { [CCode (cname = "pn_message_properties")] get; }
		public Proton.Data body { [CCode (cname = "pn_message_body")] get; }

		public int decode ([CCode (type = "const char *", array_length_type = "size_t")] uint8[] bytes);
		public int encode ([CCode (type = "const char *", array_length_type = "size_t")] uint8[] bytes);

		public static size_t data ([CCode (type = "char *", array_length_type = "size_t")] uint8[] dst, [CCode (type = "const char *", array_length_type = "size_t")] uint8[] src);
	}

	[Compact, CCode (cname = "pn_messenger_t", cheader_filename = "proton/messenger.h")]
	public class Messenger {
		[CCode (cname = "pn_messenger")]
		public Messenger (string? name = null);

		public unowned string name ();

		// Using properties means we don't expose the return value of
		// the setters.  AFAICT they all just return 0, but in the
		// future we can supplement the properties with setters if the
		// need arises.
		public string? certificate { get; set; }
		public string? private_key { get; set; }
		public string? password { get; set; }
		public string? trusted_certificates { get; set; }
		public int timeout { get; set; }
		public Proton.AcceptMode accept_mode { get; set; }
		public int outgoing_window { get; set; }
		public int incoming_window { get; set; }

		public int errno { [CCode (cname = "pn_messenger_errno")] get; }
		public string? error { [CCode (cname = "pn_messenger_error")] get; }

		public int start ();
		public int stop ();

		public unowned Proton.Subscription subscribe (string source);

		public int put (Proton.Message msg);
		public Proton.Status status (Proton.Tracker tracker);
		public int settle (Proton.Tracker tracker, int flags = 0);
		public Proton.Tracker outgoing_tracker { [CCode (cname = "pn_messenger_outgoing_tracker")] get; }
		public int send ();
		public int recv (int n);
		public int get (Proton.Message msg);
		public Proton.Tracker incoming_tracker { [CCode (cname = "pn_messenger_incoming_tracker")] get; }
		public unowned Proton.Subscription incoming_subscription { [CCode (cname = "pn_messenger_incoming_subscription")] get; }

		// TODO: make flags an enum?
		public int accept (Proton.Tracker tracker, int flags);
		public int reject (Proton.Tracker tracker, int flags);

		public int outgoing { [CCode (cname = "pn_messenger_outgoing")] get; }
		public int incoming { [CCode (cname = "pn_messenger_incoming")] get; }
	}

	[SimpleType, IntegerType (rank = 7)]
	[CCode (cname = "pn_millis_t", cheader_filename = "proton/types.h")]
	public struct Millis : uint32 { }

	[SimpleType, IntegerType (rank = 7)]
	[CCode (cname = "pn_seconds_t", cheader_filename = "proton/types.h")]
	public struct Seconds : uint32 { }

	[SimpleType, IntegerType (rank = 6)]
	[CCode (cname = "pn_sequence_t", cheader_filename = "proton/types.h")]
	public struct Sequence : int32 { }

	[CCode (cname = "pn_status_t", has_type_id = false, cheader_filename = "proton/messenger.h")]
	public enum Status {
		UNKNOWN,
		PENDING,
		ACCEPTED,
		REJECTED
	}

	[Compact, CCode (cname = "pn_subscription_t", cheader_filename = "proton/messenger.h")]
	public class Subscription {
		public void* context { get; set; }
	}

	[SimpleType, IntegerType (rank = 10)]
	[CCode (cname = "pn_timestamp_t", cheader_filename = "proton/types.h")]
	public struct Timestamp : int64 { }

	[SimpleType, IntegerType (rank = 10)]
	[CCode (cname = "pn_tracker_t", cheader_filename = "proton/messenger.h")]
	public struct Tracker : int64 {
	}

	[CCode (cname = "pn_type_t", cprefix = "PN_", has_type_id = false, cheader_filename = "proton/codec.h")]
	public enum Type {
		NULL,
		BOOL,
		UBYTE,
		BYTE,
		USHORT,
		SHORT,
		UINT,
		INT,
		CHAR,
		ULONG,
		LONG,
		TIMESTAMP,
		FLOAT,
		DOUBLE,
		DECIMAL32,
		DECIMAL64,
		DECIMAL128,
		UUID,
		BINARY,
		STRING,
		SYMBOL,
		DESCRIBED,
		ARRAY,
		LIST,
		MAP
	}

	[SimpleType, CCode (cname = "pn_uuid_t", cheader_filename = "proton/types.h")]
	public struct UUID {
		public uint8 bytes[16];
	}
}
