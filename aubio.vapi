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
 
[CCode (lower_case_cprefix = "aubio_", cheader_filename = "aubio/aubio.h")]
namespace Aubio {
  [CCode (cname = "smpl_t")]
  [FloatingType (rank = 2)]
  public struct Sample : float {}
  [CCode (cname = "lsmp_t")]
  [FloatingType (rank = 2)]
  public struct LongSample : double {}
  [CCode (cname = "uint_t")]
  public struct Uint : uint {}
  [CCode (cname = "sint_t")]
  public struct Int : int {}
   
  /* Buffer type used to store real data. */
  [Compact]
  [CCode (cname = "fvec_t", free_function = "del_fvec")]
  public class Fvector { 
    [CCode (cname = "new_fvec")]
    public Fvector(Uint length, Uint channels);
    public Uint channels;
    [CCode (array_length_cname = "length")] 
    public Sample[][] data; /* length * channels */
  }
   
  [Compact]
  [CCode (cname = "aubio_pitchdetection_t", cprefix = "aubio_pitchdetection_", free_function = "del_aubio_pitchdetection")]
  public class Pitch {
    [CCode (cname = "new_aubio_pitchdetection")]
    public Pitch(Uint bufsize, Uint hopsize, Uint channels, Uint samplerate, Type type, Mode mode);
    [CCode (cname = "aubio_pitchdetection")]
    public Sample @do(Fvector ibuf);
    [CCode (cname = "aubio_pitchdetection_type")]
    [Flags]
    public enum Type {
      [CCode (cname = "aubio_pitch_yin")] YIN,
      [CCode (cname = "aubio_pitch_mcomb")] MULTI_COMB,   
      [CCode (cname = "aubio_pitch_schmitt")] SCHMITT, 
      [CCode (cname = "aubio_pitch_fcomb")] FAST_COMB,
      [CCode (cname = "aubio_pitch_yinfft")] YIN_FFT  
    } 
    [CCode (cname = "aubio_pitchdetection_mode")]
    [Flags]
    public enum Mode {
      [CCode (cname = "aubio_pitchm_freq")] FREQUENCY,
      [CCode (cname = "aubio_pitchm_midi")] MIDI,   
      [CCode (cname = "pitchm_cent")] CENT, 
      [CCode (cname = "aubio_pitchm_bin")] BIN,
    }
  } 
}
