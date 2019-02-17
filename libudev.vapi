/* libudev Vala Bindings
 * Copyright (c) 2019 Hannes Schulze <haschu0103@gmail.com>
 *
 * This library is free software; you can redistribute it and/or modify it
 * under the terms of the GNU Lesser General Public License as published by
 * the Free Software Foundation; either version 2.1 of the License, or
 * (at your option) any later version.
 *
 * This library is distributed in the hope that it will be useful, but
 * WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU
 * Lesser General Public License for more details.
 *
 * You should have received a copy of the GNU Lesser General Public License
 * along with this library; if not, write to the Free Software Foundation, Inc.,
 * 51 Franklin St, Fifth Floor, Boston, MA 02110, USA
 */

[CCode (cheader_filename = "libudev.h")]
namespace Udev {
    /**
     * reads the udev config and system environment
     * allows custom logging
     */
    [CCode (cname = "struct udev", ref_function = "udev_ref", unref_function = "udev_unref")]
    [Compact]
    public class Udev {
        [CCode (cname = "udev_new")]
        public Udev ();
    }

    /**
     * access to libudev generated lists
     */
    [CCode (cname = "struct udev_list_entry")]
    [Compact]
    public class ListEntry {
        public ListEntry? get_next ();
        public ListEntry? get_by_name (string name);
        public unowned string get_name ();
        public unowned string get_value ();
    }

    /**
     * access to sysfs/kernel devices
     */
    [CCode (cname = "struct udev_device", ref_function = "udev_device_ref", unref_function = "udev_device_unref")]
    [Compact]
    public class Device {
        public Device.from_syspath (Udev udev, string syspath);
        public Device.from_devnum (Udev udev, char type, Posix.dev_t devnum);
        public Device.from_subsystem_sysname (Udev udev, string subsystem, string sysname);
        public Device.from_device_id (Udev udev, string id);
        public Device.from_environment (Udev udev);
        public unowned Udev get_udev ();

        public Device? get_parent ();
        public Device? get_parent_with_subsystem_devtype (string subsystem, string devtype);
        public unowned string get_devpath ();
        public unowned string? get_subsystem ();
        public unowned string? get_devtype ();
        public unowned string get_syspath ();
        public unowned string get_sysname ();
        public unowned string get_sysnum ();
        public unowned string? get_devnode ();
        public int get_is_initialized ();
        public ListEntry get_devlinks_list_entry ();
        public ListEntry get_properties_list_entry ();
        public ListEntry get_tags_list_entry ();
        public ListEntry get_sysattr_list_entry ();
        public unowned string? get_property_value (string key);
        public unowned string? get_driver ();
        public Posix.dev_t get_devnum ();
        public unowned string? get_action ();
        public unowned string? get_sysattr_value (string sysattr);
        public int set_sysattr_value (string sysattr, string val);
        public int has_tag (string tag);
    }

    /**
     * access to kernel uevents and udev events
     */
    [CCode (cname = "struct udev_monitor", ref_function = "udev_monitor_ref", unref_function = "udev_monitor_unref")]
    [Compact]
    public class Monitor {
        public Monitor.from_netlink (Udev udev, string name);

        public unowned Udev get_udev ();
        public int enable_receiving ();
        public int set_receive_buffer_size (int size);
        public int get_fd ();
        public Device? receive_device ();
        public int filter_add_match_subsystem_devtype (string subsystem, string devtype);
        public int filter_add_match_tag (string tag);
        public int filter_update ();
        public int filter_remove ();
    }

    /**
     * search sysfs for specific devices and provide a sorted list
     */
    [CCode (cname = "struct udev_enumerate", ref_function = "udev_enumerate_ref", unref_function = "udev_enumerate_unref")]
    [Compact]
    public class Enumerate {
        public Enumerate (Udev udev);
        public unowned Udev get_udev ();
        public int add_match_subsystem (string subsystem);
        public int add_nomatch_subsystem (string subsystem);
        public int add_match_sysattr (string sysattr, string value);
        public int add_nomatch_sysattr (string sysattr, string value);
        public int add_match_property (string property, string value);
        public int add_match_sysname (string sysname);
        public int add_match_tag (string tag);
        public int add_match_parent (Device parent);
        public int add_match_is_initialized ();
        public int add_syspath (string syspath);
        public int scan_devices ();
        public int scan_subsystems ();
        public ListEntry get_list_entry ();
    }

    /**
     * access to the currently running udev events
     */
    [CCode (cname = "struct udev_queue", ref_function = "udev_queue_ref", unref_function = "udev_queue_unref")]
    [Compact]
    public class Queue {
        public unowned Udev get_udev ();
        public Queue (Udev udev);
        public int get_udev_is_active ();
        public int get_queue_is_empty ();
        public int get_fd ();
        public int flush ();
    }

    /**
     * access to the static hardware properties database
     */
    [CCode (cname = "struct udev_hwdb", ref_function = "udev_hwdb_ref", unref_function = "udev_hwdb_unref")]
    [Compact]
    public class Hwdb {
        public Hwdb (Udev udev);
        public ListEntry get_properties_list_entry (string modalias, uint flags);
    }

    /**
     * udev specific utilities
     */
    [CCode (cname = "udev_util")]
    [Compact]
    public class Util {
        public static int encode_string (string str, string str_enc, size_t len);
    }
}
