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

[CCode (cheader_filename = "sndfile.h", cprefix="")]
namespace Sndfile {
  
  [CCode (cprefix = "SF_FORMAT_")]
  public enum Format {
    WAV,
    AIFF,
    AU,
    RAW,
    PAF,
    SVX,
    NIST,
    VOC,
    IRCAM,
    W64,
    MAT4,
    MAT5,
    PVF,
    XI,
    HTK,
    SDS,
    AVR,
    WAVEX,
    SD2,
    FLAC,
    CAF,
    WVE,
    OGG,
    MPC2K,
    RF64,
    PCM_S8,
    PCM_16,
    PCM_24,
    PCM_32,
    PCM_U8,
    FLOAT,
    DOUBLE,
    ULAW,
    ALAW,
    IMA_ADPCM,
    MS_ADPCM,
    GSM610,   
    VOX_ADPCM, 
    G721_32,  
    G723_24,  
    G723_40,  
    DWVW_12,  
    DWVW_16,  
    DWVW_24,  
    DWVW_N,  
    DPCM_8,   
    DPCM_16,  
    VORBIS,
    [CCode (cname = "SF_ENDIAN_FILE")]
    ENDIAN_FILE,
    [CCode (cname = "SF_ENDIAN_LITTLE")]
    ENDIAN_LITTLE,
    [CCode (cname = "SF_ENDIAN_BIG")]
    ENDIAN_BIG,
    [CCode (cname = "SF_ENDIAN_CPU")]
    ENDIAN_CPU,
    SUBMASK,
    TYPEMASK,
    ENDMASK
  }

  [CCode (cprefix = "SFC_")]
  public enum Command { 
    GET_LIB_VERSION,
    GET_LOG_INFO,
    GET_CURRENT_SF_INFO,
    GET_NORM_DOUBLE,
    GET_NORM_FLOAT,
    SET_NORM_DOUBLE,
    SET_NORM_FLOAT,
    SET_SCALE_FLOAT_INT_READ ,
    SET_SCALE_INT_FLOAT_WRITE,
    GET_SIMPLE_FORMAT_COUNT,
    GET_SIMPLE_FORMAT,
    GET_FORMAT_INFO ,
    GET_FORMAT_MAJOR_COUNT,
    GET_FORMAT_MAJOR,
    GET_FORMAT_SUBTYPE_COUNT,
    GET_FORMAT_SUBTYPE,
    CALC_SIGNAL_MAX,
    CALC_NORM_SIGNAL_MAX,
    CALC_MAX_ALL_CHANNELS,
    CALC_NORM_MAX_ALL_CHANNELS,
    GET_SIGNAL_MAX,
    GET_MAX_ALL_CHANNELS,
    SET_ADD_PEAK_CHUNK,
    SET_ADD_HEADER_PAD_CHUNK,
    UPDATE_HEADER_NOW,
    SET_UPDATE_HEADER_AUTO,
    FILE_TRUNCATE,
    SET_RAW_START_OFFSET,
    SET_DITHER_ON_WRITE ,
    SET_DITHER_ON_READ,
    GET_DITHER_INFO_COUNT,
    GET_DITHER_INFO,
    GET_EMBED_FILE_INFO,
    SET_CLIPPING,
    GET_CLIPPING,
    GET_INSTRUMENT,
    SET_INSTRUMENT,
    GET_LOOP_INFO ,
    GET_BROADCAST_INFO,
    SET_BROADCAST_INFO,
    GET_CHANNEL_MAP_INFO,
    SET_CHANNEL_MAP_INFO,
    RAW_DATA_NEEDS_ENDSWAP,
    WAVEX_SET_AMBISONIC,
    WAVEX_GET_AMBISONIC,
    SET_VBR_ENCODING_QUALITY,
    TEST_IEEE_FLOAT_REPLACE,
    SET_ADD_DITHER_ON_WRITE,
    SET_ADD_DITHER_ON_READ
  }

  [CCode (cprefix = "SF_STR_")] 
  public enum String { 
    TITLE,
    COPYRIGHT,
    SOFTWARE,
    ARTIST,
    COMMENT,
    DATE,
    ALBUM,
    LICENSE,
    TRACKNUMBER,
    GENRE
  }

  public const int SF_STR_FIRST;
  public const int SF_STR_LAST;

  [CCode (cprefix = "SFM_")] 
  public enum Mode {
    READ,
    WRITE,
    RDWR,
  }

  public const int SF_FALSE;
  public const int SF_TRUE;
  public const int SF_AMBISONIC_NONE;
  public const int SF_AMBISONIC_B_FORMAT;


  [CCode (cprefix = "SF_ERR_")] 
  public enum Error { 
    NO_ERROR,
    UNRECOGNISED_FORMAT,
    SYSTEM,
    MALFORMED_FILE,
    UNSUPPORTED_ENCODING,
  }

  [CCode (cprefix = "SF_CHANNEL_MAP_")] 
  public enum ChannelMap {
    INVALID,
    MONO ,
    LEFT,  
    RIGHT,   
    CENTER,  
    FRONT_LEFT,
    FRONT_RIGHT,
    FRONT_CENTER,
    REAR_CENTER,  
    REAR_LEFT,    
    REAR_RIGHT,  
    LFE,         
    FRONT_LEFT_OF_CENTER,  
    FRONT_RIGHT_OF_CENTER,
    SIDE_LEFT, 
    SIDE_RIGHT, 
    TOP_CENTER,    
    TOP_FRONT_LEFT,      
    TOP_FRONT_RIGHT,    
    TOP_FRONT_CENTER,   
    TOP_REAR_LEFT,     
    TOP_REAR_RIGHT,    
    TOP_REAR_CENTER,    
    AMBISONIC_B_W,
    AMBISONIC_B_X,
    AMBISONIC_B_Y,
    AMBISONIC_B_Z,
    MAX
  } 

  [CCode (cname = "sf_count_t")]
  public struct count_t : int {}
  
  [Compact]
  [CCode (cname = "SF_INFO", cprefix = "", destroy_function = "", has_copy_function=false)]
  public struct Info { 
    count_t  frames ;
    int     samplerate;
    int     channels;
    int     format;
    int     sections;
    int     seekable;
  }
  
  [CCode (cname = "SEEK_SET")]
  public const int SEEK_SET;

  [CCode (cname = "SEEK_CUR")]
  public const int SEEK_CUR;

  [CCode (cname = "SEEK_END")]
  public const int SEEK_END;

  [Compact]
  [CCode (cname = "SNDFILE", cprefix="sf_", free_function = "sf_close")]
  public class File {

    public static string error_number(int errnum);
    public static int format_check(Info info);

    public static int error(File? file);
    public static string strerror(File? file);

    [CCode (cname = "sf_open")]
    public File(string path, Mode mode, ref Info info);

    [CCode (cname = "sf_open_fd")]
    public File.fd(int fd, Mode mode, ref Info info, int close_desc);

    [CCode (cname = "sf_open_virtual")]
    public File.virtual(VirtualIO virtual, Mode mode, ref Info info);

    //public const LPCWSTR;
    //[CCode (cname = "sf_wchar_open")]
    //public File.wchar(LPCWSTR wpath, Mode mode, ref Info info) ;

    public int command(int command, void *data, int datasize);
    public count_t  seek(count_t frames, int whence) ;

    public int set_string(int str_type, string str) ;
    public string get_string(int str_type) ;
    public string version_string() ;

    [CCode (array_length = false)]
    public count_t  read_raw(void[] ptr, count_t bytes) ;
    [CCode (array_length = false)]
    public count_t  write_raw(void[] ptr, count_t bytes) ;


    public count_t  readf_short([CCode (array_length = false)]short[] ptr, count_t frames) ;
    public count_t  writef_short([CCode (array_length = false)]short[] ptr, count_t frames) ;

    public count_t  readf_int([CCode (array_length = false)]int[] ptr, count_t frames) ;
    public count_t  writef_int([CCode (array_length = false)]int[] ptr, count_t frames) ;

    public count_t  readf_float([CCode (array_length = false)]float[] ptr, count_t frames) ;
    public count_t  writef_float([CCode (array_length = false)]float[] ptr, count_t frames) ;

    public count_t  readf_double ([CCode (array_length = false)]double[] ptr, count_t frames) ;
    public count_t  writef_double([CCode (array_length = false)]double[] ptr, count_t frames) ;

    public count_t  read_short ([CCode (array_length = false)]short[] ptr, count_t items) ;
    public count_t  write_short([CCode (array_length = false)]short[] ptr, count_t items) ;

    public count_t  read_int ([CCode (array_length = false)]int[] ptr, count_t items) ;
    public count_t  write_int([CCode (array_length = false)]int[] ptr, count_t items) ;

    public count_t  read_float ([CCode (array_length = false)]float[] ptr, count_t items) ;
    public count_t  write_float([CCode (array_length = false)]float[] ptr, count_t items) ;
    
    public count_t  read_double([CCode (array_length = false)]double[] ptr, count_t items) ;
    public count_t  write_double ([CCode (array_length = false)]double[] ptr, count_t items) ;


    public int   close() ;
    public void  write_sync() ;

  }

  public const int SF_COUNT_MAX;

  [Compact]
  [CCode (cname = "SF_FORMAT_INFO", cprefix = "", destroy_function = "", has_copy_function=false)]
  public struct FormatInfo { 
    int    format ;
    string name ;
    string extension ;
  } 

  [CCode (cprefix = "SFD_")]
  public enum Dither {
    DEFAULT_LEVEL,
    CUSTOM_LEVEL,
    NO_DITHER,
    WHITE,
    TRIANGULAR_PDF
  } 


  [Compact]
  [CCode (cname = "SF_DITHER_INFO", cprefix = "", destroy_function = "", has_copy_function=false)]
  public struct DitherInfo {
    int     type ;
    double  level ;
    string  name ;
  }

  [Compact]
  [CCode (cname = "SF_EMBED_FILE_INFO", cprefix = "", destroy_function = "", has_copy_function=false)]
  public struct EmbedFileInfo {
    count_t  offset ;
    count_t  length ;
  }

  [CCode (cprefix = "SF_LOOP_")]
  public enum Loop {
    NONE,
    FORWARD,
    BACKWARD,
    ALTERNATING
  }

  public struct Loops { 
    int mode ;
    uint start ;
    uint end ;
    uint count ;
  } 

  [Compact]
  [CCode (cname = "SF_INSTRUMENT", cprefix = "", destroy_function = "", has_copy_function=false)]
  public struct Instrument {
    int gain ;
    char basenote;
    char detune ;
    char velocity_lo;
    char velocity_hi ;
    char key_lo ;
    char key_hi ;
    int loop_count ;

    Loops loops[16];

  }


  [Compact]
  [CCode (cname = "SF_LOOP_INFO", cprefix = "", destroy_function = "", has_copy_function=false)]
  public struct LoopInfo {
    short time_sig_num ; 
    short time_sig_den ; 
    int   loop_mode ;  
    int   num_beats ; 
    float bpm ;  
    int root_key ;  
    int future [6] ;
  }



  [Compact]
  [CCode (cname = "SF_VIRTUAL_IO", cprefix = "", free_function = "")]
  public class VirtualIO {

    [CCode (cname = "sf_vio_get_filelen")]
    public delegate count_t GetFilelen() ;
    [CCode (cname = "sf_vio_seek")]
    public delegate count_t Seek(count_t offset, int whence) ;
    [CCode (cname = "sf_vio_read")]
    public delegate count_t  Read(void *ptr, count_t count) ;
    [CCode (cname = "sf_vio_write")]
    public delegate count_t Write (void *ptr, count_t count) ;
    [CCode (cname = "sf_vio_tell")]
    public delegate count_t Tell () ;

    GetFilelen   get_filelen ;
    Seek         seek ;
    Read         read ;
    Write        write ;
    Tell         tell ;

  } 

  [CCode (cname = "SF_BROADCAST_INFO_VAR", cprefix = "", destroy_function = "", has_copy_function=false)]
  public struct BroadcatInfoVar { }

}