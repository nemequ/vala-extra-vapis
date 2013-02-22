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
  [Compact, CCode (cname = "memcached_st", lower_case_cprefix = "memcached_")]
  public class Context {
    [CCode (cname = "memcached")]
    public Context (string? str = null, size_t length = 0);
    [CCode (cname = "memcached_create")]
    private static Memcached.Context _create (Memcached.Context? ptr = null);
    public void servers_reset ();
    // public Memcached.Context create ();
    public Memcached.ReturnCode reset ();
    public void reset_last_disconnected_server ();
    [CCode (cname = "_vala_memcached_clone")]
    public Memcached.Context clone () {
      return Memcached.Context._create (this);
    }
    public void set_user_data<T> (T data);
    public T get_user_data<T> ();
    // public Memcached.ServerInstance server_instance_by_position (uint32 server_key);
    public uint32 server_count ();
    public uint64 query_id ();

    public Memcached.ReturnCode increment ([CCode (array_length_type = "size_t")] uint8[] key, uint32 offset, out uint64 value);
    public Memcached.ReturnCode increment_by_key ([CCode (array_length_type = "size_t")] uint8[] group_key, [CCode (array_length_type = "size_t")] uint8[] key, uint64 offset, out uint64 value);
    public Memcached.ReturnCode increment_with_initial ([CCode (array_length_type = "size_t")] uint8[] key, uint64 offset, uint64 initial, time_t expiration, out uint64 value);
    public Memcached.ReturnCode increment_with_initial_by_key ([CCode (array_length_type = "size_t")] uint8[] group_key, [CCode (array_length_type = "size_t")] uint8[] key, uint64 offset, uint64 initial, time_t expiration, out uint64 value);
    public Memcached.ReturnCode decrement ([CCode (array_length_type = "size_t")] uint8[] key, uint32 offset, out uint64 value);
    public Memcached.ReturnCode decrement_by_key ([CCode (array_length_type = "size_t")] uint8[] group_key, [CCode (array_length_type = "size_t")] uint8[] key, uint64 offset, out uint64 value);
    public Memcached.ReturnCode decrement_with_initial ([CCode (array_length_type = "size_t")] uint8[] key, uint64 offset, uint64 initial, time_t expiration, out uint64 value);
    public Memcached.ReturnCode decrement_with_initial_by_key ([CCode (array_length_type = "size_t")] uint8[] group_key, [CCode (array_length_type = "size_t")] uint8[] key, uint64 offset, uint64 initial, time_t expiration, out uint64 value);
    public Memcached.ReturnCode @delete ([CCode (array_length_type = "size_t")] uint8[] key, time_t expiration);
    public Memcached.ReturnCode delete_by_key ([CCode (array_length_type = "size_t")] uint8[] group_key, [CCode (array_length_type = "size_t")] uint8[] key, time_t expiration);
    public Memcached.ReturnCode exist ([CCode (array_length_type = "size_t")] uint8[] key);
    public Memcached.ReturnCode exist_by_key ([CCode (array_length_type = "size_t")] uint8[] group_key, [CCode (array_length_type = "size_t")] uint8[] key);
    public Memcached.ReturnCode flush_buffers ();
    public Memcached.ReturnCode flush (time_t expiration);
    [CCode (array_length_pos = 1.5, array_length_type = "size_t")]
    public uint8[] get (uint8[] key, out uint32 flags, out Memcached.ReturnCode error);
    public Memcached.ReturnCode mget ([CCode (array_length_type = "size_t", array_length_pos = 2.5)] uint8*[] keys, [CCode (array_length = false)] size_t[] keys_length);
  }

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
}
