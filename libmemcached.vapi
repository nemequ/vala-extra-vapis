/* libmemcached Vala Bindings
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

[CCode (cheader_filename = "libmemcached/memcached.h")]
namespace Memcached {

  public const in_port_t DEFAULT_PORT;

  [SimpleType]
  [IntegerType (rank = 6), CCode (cname = "in_port_t")]
  public struct in_port_t {}

  [Compact, CCode (cname = "memcached_st", lower_case_cprefix = "memcached_")]
  public class Context {
    // memcached.h
    public void servers_reset ();
    [CCode (cname = "memcached_create")]
    private static Memcached.Context _create (Memcached.Context? ptr = null);
    [CCode (cname = "memcached")]
    public Context (string? str = null, size_t length = 0);
    public Memcached.ReturnCode reset ();
    public void reset_last_disconnected_server ();
    [CCode (cname = "_vala_memcached_clone")]
    public Memcached.Context clone () {
      return Memcached.Context._create (this);
    }
    public void set_user_data<T> (T data);
    public T get_user_data<T> ();
    public Memcached.ReturnCode push (Memcached.Context source);
    public Memcached.Instance server_instance_by_position (uint32 server_key);
    public uint32 server_count ();
    public uint64 query_id ();

    // auto.h
    public Memcached.ReturnCode increment ([CCode (array_length_type = "size_t")] uint8[] key, uint32 offset, out uint64 value);
    public Memcached.ReturnCode increment_by_key ([CCode (array_length_type = "size_t")] uint8[] group_key, [CCode (array_length_type = "size_t")] uint8[] key, uint64 offset, out uint64 value);
    public Memcached.ReturnCode increment_with_initial ([CCode (array_length_type = "size_t")] uint8[] key, uint64 offset, uint64 initial, time_t expiration, out uint64 value);
    public Memcached.ReturnCode increment_with_initial_by_key ([CCode (array_length_type = "size_t")] uint8[] group_key, [CCode (array_length_type = "size_t")] uint8[] key, uint64 offset, uint64 initial, time_t expiration, out uint64 value);
    public Memcached.ReturnCode decrement ([CCode (array_length_type = "size_t")] uint8[] key, uint32 offset, out uint64 value);
    public Memcached.ReturnCode decrement_by_key ([CCode (array_length_type = "size_t")] uint8[] group_key, [CCode (array_length_type = "size_t")] uint8[] key, uint64 offset, out uint64 value);
    public Memcached.ReturnCode decrement_with_initial ([CCode (array_length_type = "size_t")] uint8[] key, uint64 offset, uint64 initial, time_t expiration, out uint64 value);
    public Memcached.ReturnCode decrement_with_initial_by_key ([CCode (array_length_type = "size_t")] uint8[] group_key, [CCode (array_length_type = "size_t")] uint8[] key, uint64 offset, uint64 initial, time_t expiration, out uint64 value);

    // delete.h
    public Memcached.ReturnCode @delete ([CCode (array_length_type = "size_t")] uint8[] key, time_t expiration);
    public Memcached.ReturnCode delete_by_key ([CCode (array_length_type = "size_t")] uint8[] group_key, [CCode (array_length_type = "size_t")] uint8[] key, time_t expiration);

    // error.h
    public unowned string error ();
    public unowned string last_error_message ();
    public void error_print ();
    public Memcached.ReturnCode last_error ();
    public int last_error_errno ();

    // exist.h
    public Memcached.ReturnCode exist ([CCode (array_length_type = "size_t")] uint8[] key);
    public Memcached.ReturnCode exist_by_key ([CCode (array_length_type = "size_t")] uint8[] group_key, [CCode (array_length_type = "size_t")] uint8[] key);

    // flush_buffers.h
    public Memcached.ReturnCode flush_buffers ();

    // flush.h
    public Memcached.ReturnCode flush (time_t expiration);

    // get.h
    [CCode (array_length_pos = 1.5, array_length_type = "size_t")]
    public uint8[]? @get ([CCode (array_length_type = "size_t")] uint8[] key, out uint32 flags, out Memcached.ReturnCode error);
    public Memcached.ReturnCode mget ([CCode (array_length_type = "size_t", array_length_pos = 2.5)] uint8*[] keys, [CCode (array_length = false)] size_t[] keys_length);
    [CCode (array_length_pos = 2.5, array_length_type = "size_t")]
    public uint8[]? get_by_key ([CCode (array_length_type = "size_t")] uint8[] group_key, [CCode (array_length_type = "size_t")] uint8[] key, out uint32 flags, out Memcached.ReturnCode error);

    // server.h
    public Memcached.Instance server_by_key ([CCode (array_length_type = "size_t")] uint8[] key, out Memcached.ReturnCode error);
    public Memcached.Instance server_get_last_disconnected ();
    public Memcached.ReturnCode server_add_udp (string hostname, in_port_t port = Memcached.DEFAULT_PORT);
    public Memcached.ReturnCode server_add_unix_socket (string filename);
    public Memcached.ReturnCode server_add (string hostname, in_port_t port = Memcached.DEFAULT_PORT);
    public Memcached.ReturnCode server_add_udp_with_weight (string hostname, in_port_t port, uint32 weight);
    public Memcached.ReturnCode server_add_unix_socket_with_weight (string filename, uint32 weight);
    public Memcached.ReturnCode server_add_with_weight (string hostname, in_port_t port, uint32 weight);

    // server_list.h
    public Memcached.ReturnCode server_push (Memcached.ServerList list);

    // storage.h
    public Memcached.ReturnCode @set ([CCode (array_length_type = "size_t")] uint8[] key, [CCode (array_length_type = "size_t")] uint8[] value, time_t expiration, uint32 flags);
    public Memcached.ReturnCode add ([CCode (array_length_type = "size_t")] uint8[] key, [CCode (array_length_type = "size_t")] uint8[] value, time_t expiration, uint32 flags);
    public Memcached.ReturnCode replace ([CCode (array_length_type = "size_t")] uint8[] key, [CCode (array_length_type = "size_t")] uint8[] value, time_t expiration, uint32 flags);
    public Memcached.ReturnCode append ([CCode (array_length_type = "size_t")] uint8[] key, [CCode (array_length_type = "size_t")] uint8[] value, time_t expiration, uint32 flags);
    public Memcached.ReturnCode prepend ([CCode (array_length_type = "size_t")] uint8[] key, [CCode (array_length_type = "size_t")] uint8[] value, time_t expiration, uint32 flags);
    public Memcached.ReturnCode cas ([CCode (array_length_type = "size_t")] uint8[] key, [CCode (array_length_type = "size_t")] uint8[] value, time_t expiration, uint32 flags, uint64 cas);
    public Memcached.ReturnCode set_by_key ([CCode (array_length_type = "size_t")] uint8[] group_key, [CCode (array_length_type = "size_t")] uint8[] key, [CCode (array_length_type = "size_t")] uint8[] value, time_t expiration, uint32 flags);
    public Memcached.ReturnCode add_by_key ([CCode (array_length_type = "size_t")] uint8[] group_key, [CCode (array_length_type = "size_t")] uint8[] key, [CCode (array_length_type = "size_t")] uint8[] value, time_t expiration, uint32 flags);
    public Memcached.ReturnCode prepend_by_key ([CCode (array_length_type = "size_t")] uint8[] group_key, [CCode (array_length_type = "size_t")] uint8[] key, [CCode (array_length_type = "size_t")] uint8[] value, time_t expiration, uint32 flags);
    public Memcached.ReturnCode append_by_key ([CCode (array_length_type = "size_t")] uint8[] group_key, [CCode (array_length_type = "size_t")] uint8[] key, [CCode (array_length_type = "size_t")] uint8[] value, time_t expiration, uint32 flags);
    public Memcached.ReturnCode cas_by_key ([CCode (array_length_type = "size_t")] uint8[] group_key, [CCode (array_length_type = "size_t")] uint8[] key, [CCode (array_length_type = "size_t")] uint8[] value, time_t expiration, uint32 flags, uint64 cas);

    // strerror.h
    public unowned string strerror (Memcached.ReturnCode rc);

    // touch.h
    public Memcached.ReturnCode touch ([CCode (array_length_type = "size_t")] uint8[] key, time_t expiration, uint32 flags);
    public Memcached.ReturnCode touch_by_key ([CCode (array_length_type = "size_t")] uint8[] group_key, [CCode (array_length_type = "size_t")] uint8[] key, time_t expiration, uint32 flags);

    // quit.h
    public void quit ();
  }

  // result.h
  [Compact]
  public class Result {
    [CCode (array_length = false)]
    private unowned uint8[] key_value ();
    private size_t key_length ();
    [CCode (cname = "_vala_memcached_result_key")]
    public unowned uint8[] key () {
      unowned uint8[] k = this.key_value ();
      k.length = (int) this.key_length ();
      return k;
    }

    [CCode (cname = "memcached_result_value", array_length = false)]
    private unowned uint8[] value_value ();
    [CCode (cname = "memcached_result_length")]
    private size_t value_length ();
    [CCode (cname = "_vala_memcached_result_value")]
    public unowned uint8[] value () {
      unowned uint8[] v = this.value_value ();
      v.length = (int) this.value_length ();
      return v;
    }

    public uint32 flags ();
    public uint64 cas ();
  }

  // return.h
  [CCode (cname = "memcached_return_t", cprefix = "MEMCACHED_", lower_case_cprefix = "memcached_")]
  public enum ReturnCode {
    SUCCESS,
    FAILURE,
    HOST_LOOKUP_FAILURE,
    CONNECTION_FAILURE,
    WRITE_FAILURE,
    READ_FAILURE,
    UNKNOWN_READ_FAILURE,
    PROTOCOL_ERROR,
    CLIENT_ERROR,
    SERVER_ERROR,
    DATA_EXISTS,
    DATA_DOES_NOT_EXIST,
    NOTSTORED,
    STORED,
    NOTFOUND,
    MEMORY_ALLOCATION_FAILURE,
    PARTIAL_READ,
    SOME_ERRORS,
    NO_SERVERS,
    END,
    DELETED,
    VALUE,
    STAT,
    ITEM,
    ERRNO,
    NOT_SUPPORTED,
    FETCH_NOTFINISHED,
    TIMEOUT,
    BUFFERED,
    BAD_KEY_PROVIDED,
    INVALID_HOST_PROTOCOL,
    SERVER_MARKED_DEAD,
    UNKNOWN_STAT_KEY,
    E2BIG,
    INVALID_ARGUMENTS,
    KEY_TOO_BIG,
    AUTH_PROBLEM,
    AUTH_FAILURE,
    AUTH_CONTINUE,
    PARSE_ERROR,
    PARSE_USER_ERROR,
    DEPRECATED,
    IN_PROGRESS,
    SERVER_TEMPORARILY_DISABLED,
    SERVER_MEMORY_ALLOCATION_FAILURE,
    MAXIMUM_RETURN;

    public bool success ();
    public bool failed ();
    public bool fatal ();
  }

  // parse.h
  public Memcached.ServerList servers_parse (string server_strings);

  // server.h
  [Compact, CCode (cname = "memcached_instance_st", has_type_id = false, lower_case_cprefix = "memcached_server_")]
  public class Instance {
    public uint32 response_count ();
    public unowned string name ();
    public in_port_t port ();
    public in_port_t srcport ();
    public void next_retry (time_t absolute_time);
    public unowned string type ();
    public uint8 major_version ();
    public uint8 minor_version ();
    public uint8 micro_version ();

    // error.h
    public unowned string error ();
    public Memcached.ReturnCode error_return ();
  }

  [CCode (cname = "memcached_server_list_st", has_type_id = false)]
  [SimpleType]
  public struct ServerList {
    public Memcached.ServerList append (string hostname, in_port_t port, out Memcached.ReturnCode error);
    public Memcached.ServerList append_with_weight (string hostname, in_port_t port, uint32 weight, out Memcached.ReturnCode error);
    public uint32 count ();
  }
}
