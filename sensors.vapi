/* sensors.vapi
 *
 * Copyright (C) 2011 Nikolay Orlyuk
 *
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
 *
 * Author:
 * 	Nikolay Orlyuk <virkony@gmail.com>
 */


[CCode (lower_case_cprefix = "sensors_", cheader_filename = "sensors/sensors.h")]
namespace Sensors {

    [CCode (cname = "libsensors_version")]
    public const string version;

    [CCode (cname = "SENSORS_API_VERSION")]
    public const int api;


    /* Data structures */

    [CCode (cname = "sensors_feature_type", cprefix = "SENSORS_FEATURE_")]
    public enum FeatureType {
        IN,
        FAN,
        TEMP,
        POWER,
        ENERGY,
        CURR,
        HUMIDITY,
        MAX_MAIN,
        VID,
        INTRUSION,
        BEEP_ENABLE,
        UNKNOWN
    }

    [CCode (cname = "sensors_subfeature_type", cprefix = "SENSORS_SUBFEATURE_")]
    public enum SubFeatureType {
        IN_INPUT,
        IN_MIN,
        IN_MAX,
        IN_LCRIT,
        IN_CRIT,
        IN_ALARM,
        IN_MIN_ALARM,
        IN_MAX_ALARM,
        IN_BEEP,
        IN_LCRIT_ALARM,
        IN_CRIT_ALARM,

        FAN_INPUT,
        FAN_MIN,
        FAN_ALARM,
        FAN_FAULT,
        FAN_DIV,
        FAN_BEEP,
        FAN_PULSES,

        TEMP_INPUT,
        TEMP_MAX,
        TEMP_MAX_HYST,
        TEMP_MIN,
        TEMP_CRIT,
        TEMP_CRIT_HYST,
        TEMP_LCRIT,
        TEMP_EMERGENCY,
        TEMP_EMERGENCY_HYST,
        TEMP_ALARM,
        TEMP_MAX_ALARM,
        TEMP_MIN_ALARM,
        TEMP_CRIT_ALARM,
        TEMP_FAULT,
        TEMP_TYPE,
        TEMP_OFFSET,
        TEMP_BEEP,
        TEMP_EMERGENCY_ALARM,
        TEMP_LCRIT_ALARM,

        POWER_AVERAGE,
        POWER_AVERAGE_HIGHEST,
        POWER_AVERAGE_LOWEST,
        POWER_INPUT,
        POWER_INPUT_HIGHEST,
        POWER_INPUT_LOWEST,
        POWER_CAP,
        POWER_CAP_HYST,
        POWER_MAX,
        POWER_CRIT,
        POWER_AVERAGE_INTERVAL,
        POWER_ALARM,
        POWER_CAP_ALARM,
        POWER_MAX_ALARM,
        POWER_CRIT_ALARM,

        ENERGY_INPUT,

        CURR_INPUT,
        CURR_MIN,
        CURR_MAX,
        CURR_LCRIT,
        CURR_CRIT,
        CURR_ALARM,
        CURR_MIN_ALARM,
        CURR_MAX_ALARM,
        CURR_BEEP,
        CURR_LCRIT_ALARM,
        CURR_CRIT_ALARM,

        HUMIDITY_INPUT,

        VID,

        INTRUSION_ALARM,
        INTRUSION_BEEP,

        BEEP_ENABLE,

        UNKNOWN
    }

    [CCode (cprefix = "SENSORS_BUS_TYPE_")]
    public enum BusType {
        ANY,
        I2C,
        ISA,
        PCI,
        SPI,
        VIRTUAL,
        ACPI,
        HID
    }

    [CCode (cname = "SENSORS_BUS_NR_ANY")]
    public const short bus_nr_any;

    [CCode (cname = "SENSORS_BUS_NR_IGNORE")]
    public const short bus_nr_ignore;

    /* Note Feature and SubFeature refs to objects that cleaned up somewhere else */
    [CCode (cname = "sensors_feature", ref_function = "", unref_function = "")]
    public class Feature {
        public unowned string name;
        public int number;
        public FeatureType type;
    }

    [CCode (cname = "sensors_subfeature", ref_function = "", unref_function = "")]
    public class SubFeature {
        public unowned string name; // I guess it should be const in library
        public int number;
        public SubFeatureType type;
        public int mapping;
        public uint flags;
    }

    [CCode (cname = "sensors_bus_id", lower_case_cprefix = "sensors_")]
    public struct BusId {
        public BusType type;
        public short nr;

        public unowned string get_adapter_name();
    }

    /* ChipName and features enumeration
       Note: chips have no copy implementation, so no cast from (unowned) to (owned)
       */
    [CCode (cname = "sensors_chip_name", lower_case_cprefix = "sensors_", lower_case_csuffix = "_chip_name", destroy_function = "sensors_free_chip_name")]
    public struct ChipName {
        [CCode (default_value = "SENSORS_CHIP_NAME_PREFIX_ANY")]
        public string prefix;
        public BusId bus;
        [CCode (default_value = "SENSORS_CHIP_NAME_ADDR_ANY")]
        public int addr;
        public string path;

        [CCode (cname = "sensors_parse_chip_name", instance_pos = -1)]
        public ChipName(string orig_name);

        [CCode (cname = "sensors_parse_chip_name", instance_pos = -1)]
        public int parse(string orig_name);

        [CCode (cname = "sensors_snprintf_chip_name", instance_pos = -1)]
        public int snprintf(char[] buf);

        public Feature? get_features(ref int nr);

        [CCode (cname = "sensors_get_all_subfeatures")]
        public SubFeature? get_subfeatures(Feature feature, ref int nr);

        public string get_label(Feature feature);

        public string? to_string()
        {
            int n;
            {
                char buf[128];
                n = snprintf(buf);
                if (n < 0 ) return null;
                if (n <= buf.length) return (string)buf;
            }

            // for rare cases
            var bigbuf = new char[n];
            n = snprintf(bigbuf);
            if (n < 0 ) return null;
            if (n <= bigbuf.length) return (string)bigbuf;
        }
    }


    /* Library initialization and clean-up */
    public int init(Posix.FILE? config = null);

    public int init_filename(string name)
    { return init(Posix.FILE.open(name, "r")); }

    public void cleanup();

    public unowned ChipName? get_detected_chips(ChipName? match, ref int nr);

    public string get_label(ChipName name, Feature feature);
    public int get_value(ChipName name, int subfeat_nr, out double value);
    public int set_value(ChipName name, int subfeat_nr, double value);

    /* Error decoding */
    [CCode (cheader_file = "sensors/error.h")]
    public unowned string strerror(int errnum);
}
