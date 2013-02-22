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
 

[CCode (cheader_filename = "samplerate.h")]
namespace Samplerate {
  [CCode (cprefix = "")]
  public enum ConverterType {    
    SRC_SINC_BEST_QUALITY,
    SRC_SINC_MEDIUM_QUALITY,
    SRC_SINC_FASTEST,
    SRC_ZERO_ORDER_HOLD,
    SRC_LINEAR
  }  
  [Compact]
  [CCode (cname = "SRC_DATA", cprefix = "", destroy_function = "")]
  public struct Data {
    [CCode (array_length = false)]
    public float[] data_in;
    [CCode (array_length = false)]
    public float[] data_out ;
    public long    input_frames;
    public long    output_frames;
    public long    input_frames_used;
    public long    output_frames_gen;
    public int     end_of_input;
    public double  src_ratio;
  }
  [Compact]
  [CCode (cname = "SRC_STATE", free_function = "src_delete", cprefix = "src_")]
  public class SRC {
    public static string strerror(int error);
    [CCode (cname = "src_new")]
    public SRC(ConverterType type, int channels, int *error);
    public int process(Data *data);
    public int reset();
    public int set_ratio(double new_ratio);
    public static int is_valid_ratio(double ratio);
  }
}
