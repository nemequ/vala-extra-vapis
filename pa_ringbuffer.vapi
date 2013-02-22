/* 
  Copyright (C) 2012 Davorin Šego

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

[CCode (cprefix = "Pa", lower_case_cprefix = "", cheader_filename = "pa_ringbuffer.h")]
namespace PortAudio.Util {

  [CCode (cname = "ring_buffer_size_t")]
  public struct size_t : long {}
  
  [Compact]
  [CCode (cname = "PaUtilRingBuffer", destroy_function = "")]
  public struct RingBuffer {
    
    [CCode (cname = "bufferSize")]
    public size_t buffer_size;
    [CCode (cname = "readIndex")]
    public size_t read_index;
    [CCode (cname = "bigMask")]
    public size_t big_mask;   
    [CCode (cname = "smallMask")]
    public size_t small_mask;  
    [CCode (cname = "elementSizeBytes")]
    public size_t element_size_bytes;  
    public uint8[] buffer;
    
    [CCode (cname = "PaUtil_InitializeRingBuffer")]
    public size_t initialize(size_t element_size_bytes, 
                             size_t element_count, 
                             void* data_ptr);
                                        
    [CCode (cname = "PaUtil_FlushRingBuffer")]                                
    public void flush();
    
    [CCode (cname = "PaUtil_GetRingBufferWriteAvailable")]                                
    public size_t get_write_available();
    [CCode (cname = "PaUtil_GetRingBufferReadAvailable")]                                
    public size_t get_read_available();  
    
    [CCode (cname = "PaUtil_WriteRingBuffer")]                                
    public size_t write(void* data, size_t element_count);   
    [CCode (cname = "PaUtil_ReadRingBuffer")]                                
    public size_t read(void* data, size_t element_count);  
    
    [CCode (cname = "PaUtil_GetRingBufferWriteRegions")]                                
    public size_t get_write_regions(size_t element_count,
                                    void* data_ptr1, size_t *size_ptr1,
                                    void* data_ptr2, size_t *size_ptr2); 
    [CCode (cname = "PaUtil_GetRingBufferReadRegions")]         
    public size_t get_read_regions(size_t element_count,
                                   void* data_ptr1, size_t *size_ptr1,
                                   void* data_ptr2, size_t *size_ptr2);   
                                   
    [CCode (cname = "PaUtil_AdvanceRingBufferWriteIndex")]         
    public size_t advance_write_index(size_t element_count);   
    [CCode (cname = "PaUtil_AdvanceRingBufferReadIndex")]         
    public size_t advance_read_index(size_t element_count);    
           
  }

}
