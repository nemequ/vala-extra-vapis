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

[CCode (cprefix = "Pa", lower_case_cprefix = "", cheader_filename = "portaudio.h")]
namespace PortAudio {

  
  public struct Error : int {}
  public struct DeviceIndex : int {}
  public struct HostApiIndex : int {}
  public struct Time : double {}
  public struct SampleFormat : ulong {}
  
  
  [CCode (cname = "paNoDevice")]
  public const int NO_DEVICE;
  [CCode (cname = "paUseHostApiSpecificDeviceSpecification")]
  public const int USE_HOST_API_SPECIFIC_DEVICE_SPECIFICATION;
  [CCode (cname = "paFloat32 ")] 
  public const SampleFormat FLOAT_32;
  [CCode (cname = "paInt32")] 
  public const SampleFormat INT_32;
  [CCode (cname = "paInt24")] 
  public const SampleFormat INT_24;
  [CCode (cname = "paInt16")] 
  public const SampleFormat INT_16;
  [CCode (cname = "paInt8")] 
  public const SampleFormat INT_8;
  [CCode (cname = "paUInt8")] 
  public const SampleFormat UINT_8;
  [CCode (cname = "paCustomFormat")] 
  public const SampleFormat CUSTOM_FORMAT;
  [CCode (cname = "paNonInterleaved")] 
  public const SampleFormat NON_INTERLEAVED;


  [CCode (cname = "paFormatIsSupported")]
  public const int FORMAT_IS_SUPPORTED;
  [CCode (cname = "paFramesPerBufferUnspecified")]
  public const int FRAMES_PER_BUFFER_UNSCPECIFIED;
  


  public enum ErrorCode {
    [CCode (cname = "paNoError")] NO_ERROR,
    [CCode (cname = "paNotInitialized")] NOT_INITIALIZED,
    [CCode (cname = "paUnanticipatedHostError")] UNANTICIPATED_HOST_ERROR,
    [CCode (cname = "paInvalidChannelCount")] INVALID_CHANNEL_COUNT,
    [CCode (cname = "paInvalidSampleRate")] INVALID_SAMPLE_RATE,
    [CCode (cname = "paInvalidDevice")] INVALID_DEVICE,
    [CCode (cname = "paInvalidFlag")] INVALID_FLAG,
    [CCode (cname = "paSampleFormatNotSupported")] SAMPLE_FORMAT_NOT_SUPPORTED,
    [CCode (cname = "paBadIODeviceCombination")] BAD_IO_DEVICE_COMBINATION,
    [CCode (cname = "paInsufficientMemory")] INSUFFICIENT_MEMORY,
    [CCode (cname = "paBufferTooBig")] BUFFER_TOO_BIG,
    [CCode (cname = "paBufferTooSmall")] BUFFER_TO_SMALL,
    [CCode (cname = "paNullCallback")] NULL_CALBACK,
    [CCode (cname = "paBadStreamPtr")] BAD_STREAM_PTR,
    [CCode (cname = "paTimedOut")] TIMED_OUT,
    [CCode (cname = "paInternalError")] INTERNAL_ERROR,
    [CCode (cname = "paDeviceUnavailable")] DEVICE_UNAVAILABLE,
    [CCode (cname = "paIncompatibleHostApiSpecificStreamInfo")] INCOMPATIBLE_HOST_API_SPECIFIC_STREAM_INFO,
    [CCode (cname = "paStreamIsStopped")] STREAM_IS_STOPPED,
    [CCode (cname = "paStreamIsNotStopped")] STREAM_IS_NOT_STOPPED,
    [CCode (cname = "paInputOverflowed")] INPUT_OVERFLOWED,
    [CCode (cname = "paOutputUnderflowed")] OUTPUT_UNDERFLOWED,
    [CCode (cname = "paHostApiNotFound")] HOST_API_NOT_FOUND,
    [CCode (cname = "paInvalidHostApi")] INVALID_HOST_API,
    [CCode (cname = "paCanNotReadFromACallbackStream")] CAN_NOT_READ_FROM_A_CALLBACK_STREAM,
    [CCode (cname = "paCanNotWriteToACallbackStream")] CAN_NOT_WRITE_TO_A_CALLBACK_STREAM,
    [CCode (cname = "paCanNotReadFromAnOutputOnlyStream")] CAN_NOT_READ,
    [CCode (cname = "paCanNotWriteToAnInputOnlyStream")] CAN_NOT_WRITE_TO_AN_INPUT_ONLY_STREAM,
    [CCode (cname = "paIncompatibleStreamHostApi")] INCOMPATIBLE_STREAM_HOST_API,
    [CCode (cname = "paBadBufferPtr")] BAD_BUFFER_PTR
  }
  
  public enum HostApiTypeId {
    [CCode (cname = "paInDevelopment")] IN_DEVELOPMENT,
    [CCode (cname = "paDirectSound")] DEIRECT_SOUND,
    [CCode (cname = "paMME")] MME,
    [CCode (cname = "paMME")] ASIO,
    [CCode (cname = "paSoundManager")] SOUND_MANAGER,
    [CCode (cname = "paCoreAudio")] CORE_AUDIO,
    [CCode (cname = "paOSS")] OSS,
    [CCode (cname = "paALSA")] ALSA,
    [CCode (cname = "paAL")] AL,
    [CCode (cname = "paBeOS")] BEOS,
    [CCode (cname = "paWDMKS")] WDMKS,
    [CCode (cname = "paJACK")] JACK,
    [CCode (cname = "paWASAPI")] WASAPI,
    [CCode (cname = "paAudioScienceHPI")] AUDIO_SCIENCE_HPI
  }

  
 
  [Compact]
  public class HostApiInfo {
  
    [CCode (cname = "Pa_GetHostApiInfo")]
    public HostApiInfo(HostApiIndex host_api); 
  
    [CCode (cname = "structVersion")]
    public int version;
    public HostApiTypeId type;
    public string name;
    [CCode (cname = "deviceCount")]
    public int device_count;
    [CCode (cname = "defaultInputDevice")]
    public DeviceIndex default_input_device;
    [CCode (cname = "defaultOutputDevice")]
    public DeviceIndex default_output_device;
  }
  
  [Compact]
  public class HostErrorInfo {
    public HostApiTypeId host_api_type;
    public long error_code;
    public string error_text;
    
    [CCode (cname = "Pa_GetLastHostErrorInfo")]
    public static HostErrorInfo get_last();
  }
  
  [Compact]
  public class DeviceInfo {
  
    [CCode (cname = "Pa_GetDeviceInfo")]
    public DeviceInfo(DeviceIndex device);
  
    [CCode (cname = "structVersion")]
    public int version;  
    public string name;
    public HostApiIndex host_api; 
    
    [CCode (cname = "maxInputChannels")]
    public int max_input_channels;
    [CCode (cname = "maxOutputChannels")]
    public int max_output_channels;
    
    [CCode (cname = "defaultLowInputLatency")]
    public Time default_low_input_latency;
    [CCode (cname = "defaultLowOutputLatency")]
    public Time default_low_output_latency;
    [CCode (cname = "defaultHighInputLatency")]
    public Time default_high_intput_latency;
    [CCode (cname = "defaultHighOutputLatency")]
    public Time default_high_output_latency;
    
    [CCode (cname = "defaultSampleRate")]
    public double default_sample_rate;
  }

  [Compact]
  [CCode (free_function = "Pa_CloseStream")]
  public class Stream {
  
    [Compact]
    public class Parameters {
      public DeviceIndex device;
      [CCode (cname = "channelCount")]
      public int channel_count;
      [CCode (cname = "sampleFormat")]
      public SampleFormat sample_format;
      [CCode (cname = "suggestedLatency")]
      public Time suggested_latency; 
      [CCode (cname = "hostApiSpecificStreamInfo")]
      public void* host_api_specific_stream_info;
    }
    
    [Compact]
    public class CallbackTimeInfo {
      [CCode (cname = "inputBufferAdcTime")]
      public Time input_buffer_adc_time;
      [CCode (cname = "currentTime")]
      public Time current_time;
      [CCode (cname = "outputBufferDacTime")]
      public Time output_buffer_dac_time;
    }  
    
    public enum CallbackResult {
      [CCode (cname = "paContinue")] CONTINUE,
      [CCode (cname = "paComplete")] COMPLETE,
      [CCode (cname = "paAbort")] ABORT,
    }

    [Compact]
    public class Info {
      [CCode (cname = "structVersion")]
      int version;
      [CCode (cname = "inputLatency")]
      Time input_latency;
      [CCode (cname = "outputLatency")]
      Time output_latency;
      [CCode (cname = "sampleRate")]
      double sample_rate;  
    }

    public struct Flags : ulong {}
    [CCode (cname = "paNoFlag")]
    public const Flags NO_FLAG;
    [CCode (cname = "paClipOff")]
    public const Flags CLIP_OFF;
    [CCode (cname = "paDitherOff")]
    public const Flags DITHER_OFF;
    [CCode (cname = "paNeverDropInput")]
    public const Flags NEVER_DROP_INPUT;
    [CCode (cname = "paPrimeOutputBuffersUsingStreamCallback")]
    public const Flags PRIME_OUTPUT_BUFFER_USING_STREAM_CALLBACK; 
    [CCode (cname = "paPlatformSpecificFlags")]
    public const Flags PLATFORM_SPECIFIC_FLAGS; 

    public struct CallbackFlags : ulong {}
    [CCode (cname = "paInputUnderflow")]
    public const CallbackFlags INPUT_UNDERFLOW; 
    [CCode (cname = "paInputOverflow")]
    public const CallbackFlags INPUT_OVERFLOW; 
    [CCode (cname = "paOutputUnderflow")]
    public const CallbackFlags OUTPUT_UNDERFLOW; 
    [CCode (cname = "paOutputOverflow")]
    public const CallbackFlags OUTPUT_OVERFLOW; 
    [CCode (cname = "paPrimingOutput")]
    public const CallbackFlags PRIMING_OUTPUT; 
     
    [CCode (cname = "PaStreamFinishedCallback")]
    public delegate void FinishedCallback();

    [CCode (cname = "Pa_SetStreamFinishedCallback")]
    public Error set_finished_callback(FinishedCallback finished_callback); 
    [CCode (cname = "Pa_StartStream")]
    public Error start();
    [CCode (cname = "Pa_StopStream")]
    public Error stop();
    [CCode (cname = "Pa_AbortStream")]
    public Error abort();
    [CCode (cname = "Pa_IsStreamStopped")]
    public Error is_stream_stopped();
    [CCode (cname = "Pa_IsStreamActive")]
    public Error is_stream_active();
    [CCode (cname = "Pa_GetStreamInfo")]
    public Info get_stream_info();
    [CCode (cname = "Pa_GetStreamTime")]
    public Time get_time();
    [CCode (cname = "Pa_GetStreamCpuLoad")]
    public double get_cpu_load();
    [CCode (cname = "Pa_ReadStream")]
    public Error read(void* buffer, ulong frames);
    [CCode (cname = "Pa_WriteStream")]
    public Error write(void *buffer, ulong frames);
    [CCode (cname = "Pa_GetStreamReadAvailable")]
    public long get_read_available();
    [CCode (cname = "Pa_GetStreamWriteAvailable")]
    public long get_write_available();
    
    [CCode (cname = "PaStreamCallback")]
    public delegate int Callback(void* input, void* output,
                                 ulong frame_count,
                                 CallbackTimeInfo time_info,
                                 CallbackFlags status_flags);

    [CCode (cname = "Pa_OpenStream")]
    public static Error open(out Stream stream,
                              Stream.Parameters input_parameters,
                              Stream.Parameters output_parameters,
                              double sample_rate,
                              ulong frames_per_buffer,
                              Flags stream_flags,
                              Callback stream_callback);

    [CCode (cname = "Pa_OpenDefaultStream")]
    public static Error open_default(out Stream stream,
                                      int num_input_channels,
                                      int num_output_channels,
                                      SampleFormat sample_format,
                                      double sample_rate,
                                      ulong frames_per_buffer,
                                      Callback stream_callback);
  }





  [CCode (cname = "Pa_GetVersion")]
  public int get_version();
  [CCode (cname = "Pa_GetVersionText")]
  public string get_version_text();
  

  [CCode (cname = "Pa_GetErrorText")]
  public string get_error_text(Error errorCode);
  [CCode (cname = "Pa_Initialize")]
  public Error initialize();
  [CCode (cname = "Pa_Terminate")]
  public Error terminate();


  
  [CCode (cname = "Pa_GetHostApiCount")]
  public HostApiIndex get_host_api_count();
  [CCode (cname = "Pa_GetDefaultHostApi")]
  public HostApiIndex get_default_host_api();



  [CCode (cname = "Pa_HostApiTypeIdToHostApiIndex")]
  public HostApiIndex host_api_type_id_to_host_api(HostApiTypeId type);
  [CCode (cname = "Pa_HostApiDeviceIndexToDeviceIndex")]
  public DeviceIndex host_api_device_index_to_device_index(HostApiIndex host_api, 
                                                           int host_api_device_index);
      
  [CCode (cname = "Pa_GetDeviceCount")]
  public DeviceIndex get_device_count();
  [CCode (cname = "Pa_GetDefaultInputDevice")]
  public DeviceIndex get_default_input_device();
  [CCode (cname = "Pa_GetDefaultOutputDevice")]
  public DeviceIndex get_default_output_device();



  [CCode (cname = "Pa_IsFormatSupported")]
  public Error is_format_supported(Stream.Parameters input_parameters,
                                   Stream.Parameters output_parameters,
                                   double sample_rate);
  
  [CCode (cname = "Pa_GetSampleSize")]
  public Error get_sample_size(SampleFormat format);
  [CCode (cname = "Pa_Sleep")]
  public void sleep(long msec);

}
