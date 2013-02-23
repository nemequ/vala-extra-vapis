/* cpufreq.vapi
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

// note that this vapi is based on headers and sources of cpufrequtils-008

[CCode (lower_case_cprefix = "cpufreq_", cheader_filename = "cpufreq.h")]
namespace CpuFreq {
    // units
    [SimpleType]
    [CCode (cname = "unsigned long")]
    public struct Hz : ulong {
        public MHz mhz { get {  return this / 1000000f; } }
    }

    [SimpleType]
    [CCode (cname = "float")]
    public struct MHz : float {
        public Hz hz { get {  return (Hz)(this * 1000000f); } }
    }

    [Compact]
    [CCode (cname = "char", free_function = "cpufreq_put_driver")]
    public class Driver : string {
    }

    [Compact]
    [CCode (cname = "struct cpufreq_policy", free_function = "cpufreq_put_policy")]
    public class Policy {
        public Hz min;
        public Hz max;
        public unowned string governor;
    }

    [Compact]
    [CCode (cname = "struct cpufreq_available_governors", free_function = "cpufreq_put_available_governors")]
    public class AvailableGovernors {
        public unowned string governor;
        public unowned AvailableGovernors next;
        public unowned AvailableGovernors first;
    }

    [Compact]
    [CCode (cname = "struct cpufreqb_available_frequencies", free_function = "cpufreq_put_available_frequencies")]
    public class AvailableFrequencies {
        public Hz frequency;
        public unowned AvailableFrequencies next;
        public unowned AvailableFrequencies first;
    }

    [Compact]
    [CCode (cname = "struct cpufreq_affected_cpus", free_function = "cpufreq_put_affected_cpus")]
    public class AffectedCpus {
        public Cpu cpu;
        public unowned AffectedCpus next;
        public unowned AffectedCpus first;
    }

    [Compact]
    [CCode (cname = "struct cpufreq_affected_cpus", free_function = "cpufreq_put_related_cpus")]
    public class RelatedCpus {
        public Cpu cpu;
        public unowned RelatedCpus next;
        public unowned RelatedCpus first;
    }

    [Compact]
    [CCode (cname = "struct cpufreq_stats", free_function = "cpufreq_put_stats")]
    public class Stats {
        public Hz frequency;
        public uint64 time_in_state;
        public unowned Stats next;
        public unowned Stats first;
    }

    [SimpleType]
    [CCode (cname = "unsigned int", lower_case_cprefix = "cpufreq_")]
    public struct Cpu : uint {
        public int cpu_exists();
        public bool exists { get { return cpu_exists() == 0; } }

        public Hz freq_kernel { get; }
        public Hz freq_hardware { get; }
        public Hz frequency {
            [CCode (cname = "cpufreq_get")]
            get;
            set;
        }

        public ulong transition_latency { get; }

        public int get_hardware_limits(out Hz min, out Hz max);

        public Driver driver { owned get; }

        public Policy policy { owned get; set; }
        public int modify_policy_min(Hz min_freq);
        public int modify_policy_max(Hz min_freq);
        public int modify_policy_governor(string governor);

        public AvailableGovernors available_governors { owned get; }
        public AvailableFrequencies available_frequencies { owned get; }
        public AffectedCpus affected_cpus { owned get; }
        public RelatedCpus related_cpus { owned get; }

        public Stats stats { owned get; }
        public ulong transitions { get; }
    }
}
