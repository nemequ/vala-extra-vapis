/* libserialport Vala Bindings
 * Copyright 2015 Matrix Zhang <pigex.zhang@gmail.com>
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

[CCode (lower_case_cprefix = "", cheader_filename = "libserialport.h")]
namespace LibSerialPort
{
    [CCode (cname = "int", cprefix = "SP_", has_type_id = "false")]
    public enum Return
    {
        OK,
        ERR_ARG,
        ERR_FAIL,
        ERR_MEM,
        ERR_SUPP
    }
    
    [CCode (cname = "int", cprefix = "SP_BUF_", has_type_id = "false")]
    public enum Buffer
    {
        INPUT,
        OUTPUT,
        BOTH
    }
    
    [CCode (cname = "int", cprefix = "SP_PARITY_", has_type_id = "false")]
    public enum Parity
    {
        INVALID,
        NONE,
        ODD,
        EVEN,
        MARK,
        SPACE
    }
    
    [CCode (cname = "int", cprefix = "SP_RTS_", has_type_id = "false")]
    public enum Rts
    {
        INVALID,
        OFF,
        ON,
        FLOW_CONTROL
    }
    
    [CCode (cname = "int", cprefix = "SP_CTS_", has_type_id = "false")]
    public enum Cts
    {
        INVALID,
        IGNORE,
        FLOW_CONTROL
    }
    
    [CCode (cname = "int", cprefix = "SP_DTR_", has_type_id = "false")]
    public enum Dtr
    {
        INVALID,
        OFF,
        ON,
        FLOW_CONTROL
    }
    
    [CCode (cname = "int", cprefix = "SP_DSR_", has_type_id = "false")]
    public enum Dsr
    {
        INVALID,
        IGNORE,
        FLOW_CONTROL
    }
    
    [CCode (cname = "int", cprefix = "SP_XONXOFF_", has_type_id = "false")]
    public enum XonXoff
    {
        INVALID,
        DISABLED,
        IN,
        OUT,
        INOUT
    }
    
    [CCode (cname = "int", cprefix = "SP_FLOWCONTROL_", has_type_id = "false")]
    public enum FlowControl
    {
        NONE,
        XONXOFF,
        RTSCTS,
        DTRDSR
    }
    
    [CCode (cname = "int", cprefix = "SP_MODE_", has_type_id = "false")]
    public enum OpenMode
    {
        READ,
        WRITE,
        READ_WRITE
    }
    
    [CCode (cname = "int", cprefix = "SP_EVENT_", has_type_id = "false")]
    public enum EventMask
    {
        RX_READY,
        TX_READY,
        ERROR
    }
    
    [CCode (cname = "enum sp_signal", cprefix = "SP_SIG_", has_type_id = "false")]
    public enum Signal
    {
        CTS,
        DSR,
        DCD,
        RI
    }
    
    [CCode (cname = "enum sp_transport", cprefix = "SP_TRANSPORT_", has_type_id = "false")]
    public enum Transport
    {
        NATIVE,
        USB,
        BLUETOOTH
    }
    
    [CCode (cname = "struct sp_port_config", free_function = "sp_free_config", has_type_id = "false")]
    [Compact]
    public class Config
    {
        [CCode (cname = "sp_new_config", has_type_id = "false")]
        public static Return @new(out Config? config);
        [CCode (cname = "sp_get_config_baudrate", has_type_id = "false")]
        public Return get_baudrate(out int baudrate);
        [CCode (cname = "sp_set_config_baudrate", has_type_id = "false")]
        public Return set_baudrate(int baudrate);
        [CCode (cname = "sp_get_config_bits", has_type_id = "false")]
        public Return get_bits(out int bits);
        [CCode (cname = "sp_set_config_bits", has_type_id = "false")]
        public Return set_bits(int bits);
        [CCode (cname = "sp_get_config_stopbits", has_type_id = "false")]
        public Return get_stopbits(out int stopbits);
        [CCode (cname = "sp_set_config_stopbits", has_type_id = "false")]
        public Return set_stopbits(int stopbits);
        [CCode (cname = "sp_get_config_parity", has_type_id = "false")]
        public Return get_parity(out Parity parity);
        [CCode (cname = "sp_set_config_parity", has_type_id = "false")]
        public Return set_parity(Parity parity);
        [CCode (cname = "sp_get_config_rts", has_type_id = "false")]
        public Return get_rts(out Rts rts);
        [CCode (cname = "sp_set_config_rts", has_type_id = "false")]
        public Return set_rts(Rts rts);
        [CCode (cname = "sp_get_config_cts", has_type_id = "false")]
        public Return get_cts(out Cts cts);
        [CCode (cname = "sp_set_config_cts", has_type_id = "false")]
        public Return set_cts(Cts cts);
        [CCode (cname = "sp_get_config_dtr", has_type_id = "false")]
        public Return get_dtr(out Dtr dtr);
        [CCode (cname = "sp_set_config_dtr", has_type_id = "false")]
        public Return set_dtr(Dtr dtr);
        [CCode (cname = "sp_get_config_dsr", has_type_id = "false")]
        public Return get_dsr(out Dsr dsr);
        [CCode (cname = "sp_set_config_dsr", has_type_id = "false")]
        public Return set_dsr(Dsr xonxoff);
        [CCode (cname = "sp_get_config_xon_xoff", has_type_id = "false")]
        public Return get_xonxoff(out XonXoff xonxoff);
        [CCode (cname = "sp_set_config_xon_xoff", has_type_id = "false")]
        public Return set_xonxoff(XonXoff xonxoff);
        [CCode (cname = "sp_set_config_flowcontrol", has_type_id = "false")]
        public Return set_flowcontrol(FlowControl flowcontrol);
    }
    
    [CCode (cname = "struct sp_event_set", free_function = "sp_free_event_set", has_type_id = "false")]
    [Compact]
    public class EventSet
    {
        [CCode (cname = "sp_new_event_set", has_type_id = "false")]
        public static Return @new(out EventSet? event_set);
        [CCode (cname = "sp_add_port_events", has_type_id = "false")]
        public Return add_port(Port port, EventMask mask);
        [CCode (cname = "sp_wait", has_type_id = "false")]
        public Return wait(uint timeout = 0);
    }
    
    [CCode (cname = "struct sp_port", free_function = "sp_free_port", has_type_id = "false")]
    [Compact]
    public class Port
    {
        [CCode (cname = "sp_get_port_by_name", has_type_id = "false")]
        public static Return new_by_name(string name, out Port? port);
        [CCode (cname = "sp_list_ports", has_type_id = "false")]
        public static int _enum ([CCode (array_length = false)] out Port[] a);
        public static Port[]? @enum () 
        {
            Port[] temp;
            
            var res = _enum (out temp);
            
            if(null != temp)
            {
            	int i = 0;
            	
		        while(temp[i] != null)
		        {
		        	i++;
		        }
		        
		        temp.length = i;
		        
		        return (owned) temp;
            }
            
            return null;
        }
        [CCode (cname = "sp_open", has_type_id = "false")]
        public Return open(OpenMode mode);
        [CCode (cname = "sp_close", has_type_id = "false")]
        public Return close();
        [CCode (cname = "sp_get_port_name", has_type_id = "false")]
        public unowned string name();
        [CCode (cname = "sp_get_port_description", has_type_id = "false")]
        public unowned string get_description();
        [CCode (cname = "sp_get_port_transport", has_type_id = "false")]
        public Transport get_transport();
        [CCode (cname = "sp_get_port_usb_bus_address", has_type_id = "false")]
        public Return get_usb_bus_address(out int usb_bus, out int usb_address);
        [CCode (cname = "sp_get_port_usb_vid_pid", has_type_id = "false")]
        public Return get_usb_vid_pid(out int usb_vid, out int usb_pid);
        [CCode (cname = "sp_get_port_usb_manufacturer", has_type_id = "false")]
        public unowned string get_usb_manufacturer();
        [CCode (cname = "sp_get_port_usb_product", has_type_id = "false")]
        public unowned string get_usb_product();
        [CCode (cname = "sp_get_port_usb_serial", has_type_id = "false")]
        public unowned string get_usb_serial();
        [CCode (cname = "sp_get_port_bluetooth_address", has_type_id = "false")]
        public unowned string get_bluetooth_address();
        [CCode (cname = "sp_get_port_handle", has_type_id = "false")]
        public Return get_fd(out int fd);
        [CCode (cname = "sp_get_config", has_type_id = "false")]
        public Return get_config(Config config);
        [CCode (cname = "sp_set_config", has_type_id = "false")]
        public Return set_config(Config config);
        [CCode (cname = "sp_set_baudrate", has_type_id = "false")]
        public Return set_baudrate(int baudrate);
        [CCode (cname = "sp_set_bits", has_type_id = "false")]
        public Return set_bits(int bits);
        [CCode (cname = "sp_set_parity", has_type_id = "false")]
        public Return set_parity(Parity parity);
        [CCode (cname = "sp_set_stopbits", has_type_id = "false")]
        public Return set_stopbits(int stopbits);
        [CCode (cname = "sp_set_rts", has_type_id = "false")]
        public Return set_rts(Rts rts);
        [CCode (cname = "sp_set_cts", has_type_id = "false")]
        public Return set_cts(Cts cts);
        [CCode (cname = "sp_set_dtr", has_type_id = "false")]
        public Return set_dtr(Dtr dtr);
        [CCode (cname = "sp_set_dsr", has_type_id = "false")]
        public Return set_dsr(Dsr dsr);
        [CCode (cname = "sp_set_xon_xoff", has_type_id = "false")]
        public Return set_xon_xoff(XonXoff xon_xoff);
        [CCode (cname = "sp_set_flowcontrol", has_type_id = "false")]
        public Return set_flowcontrol(FlowControl flowControl);
        [CCode (cname = "sp_blocking_read", has_type_id = "false")]
        public Return blocking_read(uint8[] buffer, uint timeout);
        [CCode (cname = "sp_nonblocking_read", has_type_id = "false")]
        public Return nonblocking_read(uint8[] buffer);
        [CCode (cname = "sp_blocking_write", has_type_id = "false")]
        public Return blocking_write(uint8[] buffer, uint timeout);
        [CCode (cname = "sp_nonblocking_write", has_type_id = "false")]
        public Return nonblocking_write(uint8[] buffer);
        [CCode (cname = "sp_input_waiting", has_type_id = "false")]
        public Return input_waiting();
        [CCode (cname = "sp_output_waiting", has_type_id = "false")]
        public Return output_waiting();
        [CCode (cname = "sp_get_signals", has_type_id = "false")]
        public Return get_signal(out Signal signals);
        [CCode (cname = "sp_flush", has_type_id = "false")]
        public Return flush(Buffer buffer);
        [CCode (cname = "sp_drain", has_type_id = "false")]
        public Return drain();
        [CCode (cname = "sp_start_break", has_type_id = "false")]
        public Return start_break();
        [CCode (cname = "sp_end_break", has_type_id = "false")]
        public Return end_break();
    }
}
