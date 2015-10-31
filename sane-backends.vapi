/*
  Copyright (C) 2015 Robin Hellen
  Permission is hereby granted, free of charge, to any person obtaining a copy of
  this software and associated documentation files (the "Software"), to deal in
  the Software without restriction, including without limitation the rights to
  use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies
  of the Software, and to permit persons to whom the Software is furnished to do
  so, subject to the following conditions:
  The above copyright notice and this permission notice shall be included in all
  copies or substantial portions of the Software.
  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
  SOFTWARE.
*/

[CCode(cheader_filename="sane/sane.h", cprefix="SANE_", lower_case_cprefix="sane_")]
namespace Sane
{
    [CCode (cprefix="SANE_STATUS_", has_type_id = false)]
    public enum Status
    {
        GOOD,
        UNSUPPORTED,
        CANCELLED,
        DEVICE_BUSY,
        INVAL,
        EOF,
        JAMMED,
        NO_DOCS,
        COVER_OPEN,
        IO_ERROR,
        NO_MEM,
        ACCESS_DENIED;

        [CCode(cname="sane_strstatus")]
        public unowned StringConst to_string();
    }

    [SimpleType]
    [IntegerType(rank = 6)] // basically defined to be a 32-bit type of some sort, undefined interpretation.
    [CCode(has_type_id = false)]
    public struct Word {}

    [SimpleType]
    [IntegerType(rank = 6)] // defined to be a type that can hold from -2^31 to (2^31 - 1), equivalent to gint32
    [CCode(has_type_id = false)]
    public struct Int {}

    [SimpleType]
    [IntegerType(rank = 6)] // defined to be a type that can hold from -2^31 to (2^31 - 1), equivalent to gint32
    [CCode(has_type_id = false)]
    public struct Fixed
    {
        [CCode(cname="SANE_FIX")]
        public static Fixed from_double(double d);

        [CCode(cname="SANE_UNFIX")]
        public double to_double();

        [CCode(cname="SANE_FIXED_SCALE_SHIFT")]
        public static int scale_shift;
    }

    [SimpleType]
    [IntegerType(rank = 2)] // defined to be a type that can hold from 0 to (255), equivalent to gchar
    [CCode(has_type_id = false)]
    public struct Byte {}

    [SimpleType]
    [IntegerType(rank = 2)] // defined to be a type that can hold from 0 to (255), equivalent to gchar
    [CCode(has_type_id = false)]
    public struct Char {}

    [CCode(has_type_id = false)]
    [Compact]
    public class String : string{}

    [CCode(has_type_id = false)]
    public enum Bool
    {
        [CCode(cname="SANE_FALSE")]
        FALSE,
        [CCode(cname="SANE_TRUE")]
        TRUE
    }

    [CCode(cname="const SANE_Char", has_type_id = false)]
    [PointerType]
    public class StringConst : string {}

    [CCode(cname="SANE_Device", has_copy_function = false, has_destroy_function = false, has_type_id = false)]
    public struct Device
    {
        public unowned StringConst name;
        public unowned StringConst vendor;
        public unowned StringConst model;
        public unowned StringConst type;
    }

    [CCode(cname="SANE_Option_Descriptor", has_type_id = false, ref_function = "", unref_function = "")]
    [SimpleType]
    public class OptionDescriptor
    {
        public unowned StringConst name;
        public unowned StringConst title;
        public unowned StringConst desc;
        public ValueType type;
        public Unit unit;
        public Int size;
        public Capability cap;
        public ConstraintType constraint_type;

        [CCode(array_null_terminated = true, cname="constraint.string_list")]
        public unowned StringConst[] string_list;

        [CCode(array_length = false, cname="constraint.word_list")] // Array length is first element of the array
        public unowned Word[] word_list;

        [CCode(cname="constraint.range")]
        public Range range;
    }

    [CCode(has_type_id = false)]
    public struct Range
    {
        Word min;
        Word max;
        Word quant;
    }

    [CCode(has_type_id = false)]
    public struct Parameters
    {
        Frame format;
        Bool last_frame;
        Int bytes_per_line;
        Int pixels_per_line;
        Int lines;
        Int depth;
    }

    [CCode(cname="SANE_Value_Type", cprefix="SANE_TYPE_", has_type_id = false)]
    public enum ValueType
    {
        BOOL,
        INT,
        FIXED,
        STRING,
        BUTTON,
        GROUP
    }

    [CCode(cprefix="SANE_UNIT_", has_type_id = false)]
    public enum Unit
    {
        NONE,
        PIXEL,
        BIT,
        MM,
        DPI,
        PERCENT,
        MICROSECOND
    }

    [CCode(cname="SANE_Constraint_Type", cprefix="SANE_CONSTRAINT_", has_type_id = false)]
    public enum ConstraintType
    {
        NONE,
        RANGE,
        WORD_LIST,
        STRING_LIST
    }

    [CCode(cprefix="SANE_ACTION_", has_type_id = false)]
    public enum Action
    {
        GET_VALUE,
        SET_VALUE,
        SET_AUTO
    }

    [CCode(cprefix="SANE_FRAME_", has_type_id = false)]
    public enum Frame
    {
        GRAY,
        RGB,
        RED,
        GREEN,
        BLUE
    }

    [CCode(cname="SANE_Int", cprefix="SANE_INFO_", has_type_id = false)]
    [Flags]
    public enum Info
    {
        INEXACT,
        RELOAD_OPTIONS,
        RELOAD_PARAMS
    }

    [CCode(cname="SANE_Int", cprefix="SANE_CAP_", has_type_id = false)]
    [Flags]
    public enum Capability
    {
        SOFT_SELECT,
        HARD_SELECT,
        SOFT_DETECT,
        EMULATED,
        AUTOMATIC,
        INACTIVE,
        ADVANCED;

        [CCode(cname="SANE_OPTION_IS_ACTIVE")]
        public Bool is_active();

        [CCode(cname="SANE_OPTION_IS_SETTABLE")]
        public Bool is_settable();
    }

    [CCode(cname = "void", has_construct_function = false, has_type_id = false, ref_function = "", unref_function = "")]
    public class Handle
    {
        [CCode(cname="sane_open")]
        public static Status open(StringConst name, out Handle h);

        [CCode(cname="sane_close")]
        [DestroysInstance]
        public void close();

        [CCode(cname="sane_get_option_descriptor")]
        public unowned OptionDescriptor get_option_descriptor(Int n);

        [CCode(cname="sane_control_option")]
        public Status control_option(Int n, Action a, void *v, out Int i);

        [CCode(cname="sane_get_parameters")]
        public Status get_parameters(out Parameters p);

        [CCode(cname="sane_start")]
        public Status start();

        [CCode(cname="sane_read")]
        public Status read([CCode(array_length_pos = 1.1)]Byte[] buf, out Int len);

        [CCode(cname="sane_cancel")]
        public void cancel();

        [CCode(cname="sane_set_io_mode")]
        public Status set_io_mode(Bool m);

        [CCode(cname="sane_get_select_fd")]
        public Status get_select_fd(out Int fd);
    }

    [CCode(cname="SANE_Authorization_Callback", has_target = false)]
    public delegate void AuthorizationCallback(
        StringConst resource,
        [CCode(array_length_cexpr="SANE_MAX_USERNAME_LEN")]Char username[],
        [CCode(array_length_cexpr="SANE_MAX_PASSWORD_LEN")]Char password[]
    );

    public Status init(out Int version_code, AuthorizationCallback? authorize);

    public void exit();

    public Status get_devices([CCode(array_null_terminated = true, array_length = false)]out unowned Device?[] device_list, Bool local_only);
}
