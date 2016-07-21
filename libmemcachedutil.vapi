namespace Memcached {
  [Compact, CCode (cname = "memcached_pool_st", has_type_id = false, free_function = "memcached_pool_destroy", cheader_filename = "libmemcachedutil-1.0/pool.h")]
  public class Pool {
    [CCode (cname = "memcached_pool")]
    public Pool ([CCode (array_length_type = "size_t")] uint8[] option_string);
    [Version (deprecated = true, deprecated_since = "0.46", replacement = "Pool"), CCode (cname = "memcached_pool_create")]
    public Pool.from_context (Memcached.Context mmc, uint32 initial, uint32 max);
    [Version (deprecated = true, deprecated_since = "0.53", replacement = "fetch")]
    public unowned Memcached.Context pop (bool block, out Memcached.ReturnCode rc);
    [Version (deprecated = true, deprecated_since = "0.53", replacement = "release")]
    public Memcached.ReturnCode push (Memcached.Context mmc);
    public Memcached.ReturnCode release (Memcached.Context mmc);
    public unowned Memcached.Context fetch (Posix.timespec relative_time, out Memcached.ReturnCode rc);
    public Memcached.ReturnCode behavior_set (Memcached.Behavior flag, uint64 data);
    public Memcached.ReturnCode behavior_get (Memcached.Behavior flag, out uint64 data);
  }
  [CCode (cprefix = "libmemcached_util_", cheader_filename = "libmemcachedutil-1.0/util.h")]
  namespace Util {
    // flush.h
    public bool flush (string hostname, in_port_t port, out Memcached.ReturnCode ret);
    // pid.h
    public Posix.pid_t getpid (string hostname, in_port_t port, out Memcached.ReturnCode ret);
    public Posix.pid_t getpid2 (string hostname, in_port_t port, string username, string password, out Memcached.ReturnCode ret);
    // ping.h
    public bool ping (string hostname, in_port_t port, out Memcached.ReturnCode ret);
    public bool ping2 (string hostname, in_port_t port, string username, string password, out Memcached.ReturnCode ret);
    // version.h
    public bool version_check (Memcached.Context mmc, uint8 major_version, uint8 minor_version, uint8 micro_version);
  }
}
