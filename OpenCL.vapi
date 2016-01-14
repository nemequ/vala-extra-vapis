/* OpenCL Vala Bindings
 * Copyright 2011 Fabian Deutsch <fabian.deutsch@gmx.de>
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

[CCode (cheader_filename = "CL/cl.h", lower_case_cprefix = "cl", cprefix = "CL_")]
namespace OpenCL
{
    [CCode (cname = "cl_platform_id", has_type_id = false)]
    [SimpleType]
    public struct PlatformId {
    }
    
    [CCode (cname = "cl_device_id", has_type_id = false)]
    [SimpleType]
    public struct DeviceId {
    }
    
    [SimpleType]
    [CCode (cname = "cl_context", has_type_id = false, ref_function = "clRetainContext", unref_function = "clReleaseContext")]
    public struct Context {
    }
    
    [SimpleType]
    [CCode (cname = "cl_command_queue", has_type_id = false, ref_function = "clRetainCommandQueue", unref_function = "clReleaseCommandQueue")]
    public struct CommandQueue {
    }
    
    [SimpleType]
    [CCode (cname = "cl_mem", has_type_id = false, ref_function = "clRetainMemObject", unref_function = "clReleaseMemObject")]
    public struct Mem {
    }
    
    [SimpleType]
    [CCode (cname = "cl_kernel", has_type_id = false, ref_function = "clRetainKernel", unref_function = "clReleaseKernel")]
    public struct Kernel {
    }
    

    [SimpleType]
    [CCode (cname = "cl_program", has_type_id = false, ref_function = "clRetainProgram", unref_function = "clReleaseProgram")]
    public struct Program {
    }
    
    [SimpleType]
    [CCode (cname = "cl_event", has_type_id = false, ref_function = "clRetainEvent", unref_function = "clReleaseEvent")]
    public struct Event {
    }
    
    [SimpleType]
    [CCode (cname = "cl_sampler", has_type_id = false, ref_function = "clRetainSampler", unref_function = "clReleaseSampler")]
    public struct Sampler {
    }
    
    
    public struct ImageFormat {
        ChannelOrder image_channel_order;
        ChannelType image_channel_data_type;
    }


    public struct BufferRegion {
        size_t origin;
        size_t size;
    }
    
    
    /* Error Codes */
    [CCode(cname = "int", cprefix = "CL_", has_type_id = false)]
    public enum ErrorCode {
        SUCCESS                                 = 0,
        DEVICE_NOT_FOUND                        = -1,
        DEVICE_NOT_AVAILABLE                    = -2,
        COMPILER_NOT_AVAILABLE                  = -3,
        MEM_OBJECT_ALLOCATION_FAILURE           = -4,
        OUT_OF_RESOURCES                        = -5,
        OUT_OF_HOST_MEMORY                      = -6,
        PROFILING_INFO_NOT_AVAILABLE            = -7,
        MEM_COPY_OVERLAP                        = -8,
        IMAGE_FORMAT_MISMATCH                   = -9,
        IMAGE_FORMAT_NOT_SUPPORTED              = -10,
        BUILD_PROGRAM_FAILURE                   = -11,
        MAP_FAILURE                             = -12,
        MISALIGNED_SUB_BUFFER_OFFSET            = -13,
        EXEC_STATUS_ERROR_FOR_EVENTS_IN_WAIT_LIST = -14,

        INVALID_VALUE                           = -30,
        INVALID_DEVICE_TYPE                     = -31,
        INVALID_PLATFORM                        = -32,
        INVALID_DEVICE                          = -33,
        INVALID_CONTEXT                         = -34,
        INVALID_QUEUE_PROPERTIES                = -35,
        INVALID_COMMAND_QUEUE                   = -36,
        INVALID_HOST_PTR                        = -37,
        INVALID_MEM_OBJECT                      = -38,
        INVALID_IMAGE_FORMAT_DESCRIPTOR         = -39,
        INVALID_IMAGE_SIZE                      = -40,
        INVALID_SAMPLER                         = -41,
        INVALID_BINARY                          = -42,
        INVALID_BUILD_OPTIONS                   = -43,
        INVALID_PROGRAM                         = -44,
        INVALID_PROGRAM_EXECUTABLE              = -45,
        INVALID_KERNEL_NAME                     = -46,
        INVALID_KERNEL_DEFINITION               = -47,
        INVALID_KERNEL                          = -48,
        INVALID_ARG_INDEX                       = -49,
        INVALID_ARG_VALUE                       = -50,
        INVALID_ARG_SIZE                        = -51,
        INVALID_KERNEL_ARGS                     = -52,
        INVALID_WORK_DIMENSION                  = -53,
        INVALID_WORK_GROUP_SIZE                 = -54,
        INVALID_WORK_ITEM_SIZE                  = -55,
        INVALID_GLOBAL_OFFSET                   = -56,
        INVALID_EVENT_WAIT_LIST                 = -57,
        INVALID_EVENT                           = -58,
        INVALID_OPERATION                       = -59,
        INVALID_GL_OBJECT                       = -60,
        INVALID_BUFFER_SIZE                     = -61,
        INVALID_MIP_LEVEL                       = -62,
        INVALID_GLOBAL_WORK_SIZE                = -63,
        INVALID_PROPERTY                        = -64
    }

    /* cl_platform_info */
    [CCode(cname = "cl_platform_info", cprefix = "CL_PLATFORM_", has_type_id = false)]
    public enum PlatformInfo
    {
        PROFILE                         = 0x0900,
        VERSION                         = 0x0901,
        NAME                            = 0x0902,
        VENDOR                          = 0x0903,
        EXTENSIONS                      = 0x0904
    }
    
    
    /* cl_device_type - bitfield */
    [CCode (cname = "cl_device_type", cprefix = "CL_DEVICE_TYPE_", has_type_id = false)]
    [Flags]
    public enum DeviceType
    {
        DEFAULT                      = (1 << 0),
        CPU                          = (1 << 1),
        GPU                          = (1 << 2),
        ACCELERATOR                  = (1 << 3),
        ALL                          = 0xFFFFFFFF
    }


    /* cl_device_info */
    [CCode (cname = "cl_device_info", cprefix = "CL_DEVICE_", has_type_id = false)]
    public enum DeviceInfo
    {
        TYPE                            = 0x1000,
        VENDOR_ID                       = 0x1001,
        MAX_COMPUTE_UNITS               = 0x1002,
        MAX_WORK_ITEM_DIMENSIONS        = 0x1003,
        MAX_WORK_GROUP_SIZE             = 0x1004,
        MAX_WORK_ITEM_SIZES             = 0x1005,
        PREFERRED_VECTOR_WIDTH_CHAR     = 0x1006,
        PREFERRED_VECTOR_WIDTH_SHORT    = 0x1007,
        PREFERRED_VECTOR_WIDTH_INT      = 0x1008,
        PREFERRED_VECTOR_WIDTH_LONG     = 0x1009,
        PREFERRED_VECTOR_WIDTH_FLOAT    = 0x100A,
        PREFERRED_VECTOR_WIDTH_DOUBLE   = 0x100B,
        MAX_CLOCK_FREQUENCY             = 0x100C,
        ADDRESS_BITS                    = 0x100D,
        MAX_READ_IMAGE_ARGS             = 0x100E,
        MAX_WRITE_IMAGE_ARGS            = 0x100F,
        MAX_MEM_ALLOC_SIZE              = 0x1010,
        IMAGE2D_MAX_WIDTH               = 0x1011,
        IMAGE2D_MAX_HEIGHT              = 0x1012,
        IMAGE3D_MAX_WIDTH               = 0x1013,
        IMAGE3D_MAX_HEIGHT              = 0x1014,
        IMAGE3D_MAX_DEPTH               = 0x1015,
        IMAGE_SUPPORT                   = 0x1016,
        MAX_PARAMETER_SIZE              = 0x1017,
        MAX_SAMPLERS                    = 0x1018,
        MEM_BASE_ADDR_ALIGN             = 0x1019,
        MIN_DATA_TYPE_ALIGN_SIZE        = 0x101A,
        SINGLE_FP_CONFIG                = 0x101B,
        GLOBAL_MEM_CACHE_TYPE           = 0x101C,
        GLOBAL_MEM_CACHELINE_SIZE       = 0x101D,
        GLOBAL_MEM_CACHE_SIZE           = 0x101E,
        GLOBAL_MEM_SIZE                 = 0x101F,
        MAX_CONSTANT_BUFFER_SIZE        = 0x1020,
        MAX_CONSTANT_ARGS               = 0x1021,
        LOCAL_MEM_TYPE                  = 0x1022,
        LOCAL_MEM_SIZE                  = 0x1023,
        ERROR_CORRECTION_SUPPORT        = 0x1024,
        PROFILING_TIMER_RESOLUTION      = 0x1025,
        ENDIAN_LITTLE                   = 0x1026,
        AVAILABLE                       = 0x1027,
        COMPILER_AVAILABLE              = 0x1028,
        EXECUTION_CAPABILITIES          = 0x1029,
        QUEUE_PROPERTIES                = 0x102A,
        NAME                            = 0x102B,
        VENDOR                          = 0x102C,
        [CCode (cname = "CL_DRIVER_VERSION")]
        DRIVER_VERSION                  = 0x102D,
        PROFILE                         = 0x102E,
        VERSION                         = 0x102F,
        EXTENSIONS                      = 0x1030,
        PLATFORM                        = 0x1031,
        /* 0x1032 reserved for CL_DEVICE_DOUBLE_FP_CONFIG */
        /* 0x1033 reserved for CL_DEVICE_HALF_FP_CONFIG */
        PREFERRED_VECTOR_WIDTH_HALF     = 0x1034,
        HOST_UNIFIED_MEMORY             = 0x1035,
        NATIVE_VECTOR_WIDTH_CHAR        = 0x1036,
        NATIVE_VECTOR_WIDTH_SHORT       = 0x1037,
        NATIVE_VECTOR_WIDTH_INT         = 0x1038,
        NATIVE_VECTOR_WIDTH_LONG        = 0x1039,
        NATIVE_VECTOR_WIDTH_FLOAT       = 0x103A,
        NATIVE_VECTOR_WIDTH_DOUBLE      = 0x103B,
        NATIVE_VECTOR_WIDTH_HALF        = 0x103C,
        OPENCL_C_VERSION                = 0x103D
    }
    
    /* cl_device_fp_config - bitfield */
    [CCode (cname = "cl_device_fp_config", cprefix = "CL_FP_", has_type_id = false)]
    [Flags]
    public enum FpConfig
    {
        DENORM                              = (1 << 0),
        INF_NAN                             = (1 << 1),
        ROUND_TO_NEAREST                    = (1 << 2),
        ROUND_TO_ZERO                       = (1 << 3),
        ROUND_TO_INF                        = (1 << 4),
        FMA                                 = (1 << 5),
        SOFT_FLOAT                          = (1 << 6)
    }
    
    
    /* cl_device_mem_cache_type */
    [CCode (cname = "cl_device_mem_cache_type", cprefix = "CL_", has_type_id = false)]
    public enum MemCacheType
    {
        NONE                                   = 0x0,
        READ_ONLY_CACHE                        = 0x1,
        READ_WRITE_CACHE                       = 0x2
    }
    
    
    /* cl_device_local_mem_type */
    [CCode (cname = "cl_device_local_mem_type", cprefix = "CL_", has_type_id = false)]
    public enum LocalMemType
    {
        LOCAL                                  = 0x1,
        GLOBAL                                 = 0x2
    }
    
    /* cl_device_exec_capabilities - bitfield */
    [CCode (cname = "cl_device_exec_capabilities", cprefix = "CL_EXEC_", has_type_id = false)]
    [Flags]
    public enum ExecCapabilities
    {
        KERNEL                            = (1 << 0),
        NATIVE_KERNEL                     = (1 << 1)
    }

    /* cl_command_queue_properties - bitfield */
    [CCode (cname = "cl_command_queue_properties", cprefix = "CL_QUEUE_", has_type_id = false)]
    [Flags]
    public enum CommandQueueProperties
    {
        OUT_OF_ORDER_EXEC_MODE_ENABLE    = (1 << 0),
        PROFILING_ENABLE                 = (1 << 1)
    }

    /* cl_context_info  */
    [CCode (cname = "cl_context_info", cprefix = "CL_CONTEXT_", has_type_id = false)]
    public enum ContextInfo
    {
        REFERENCE_COUNT                = 0x1080,
        DEVICES                        = 0x1081,
        PROPERTIES                     = 0x1082,
        NUM_DEVICES                    = 0x1083,
        
        PLATFORM                       = 0x1084
    }
    
    /* cl_context_info + cl_context_properties */
    [CCode (cname = "cl_context_properties", cprefix = "CL_CONTEXT_", has_type_id = false)]
    public enum ContextProperties
    {
        PLATFORM                       = 0x1084
    }

    /* cl_command_queue_info */
    [CCode (cname = "cl_command_queue_info", cprefix = "CL_QUEUE_", has_type_id = false)]
    public enum CommandQueueInfo
    {
        CONTEXT                          = 0x1090,
        DEVICE                           = 0x1091,
        REFERENCE_COUNT                  = 0x1092,
        PROPERTIES                       = 0x1093
    }
    
    
    /* cl_mem_flags - bitfield */
    [CCode (cname = "cl_mem_flags", cprefix = "CL_MEM_", has_type_id = false)]
    [Flags]
    public enum MemFlags
    {
        READ_WRITE                         = (1 << 0),
        WRITE_ONLY                         = (1 << 1),
        READ_ONLY                          = (1 << 2),
        USE_HOST_PTR                       = (1 << 3),
        ALLOC_HOST_PTR                     = (1 << 4),
        COPY_HOST_PTR                      = (1 << 5)
    }
    
    /* cl_channel_order */
    [CCode (cname = "cl_channel_order", cprefix = "CL_", has_type_id = false)]
    public enum ChannelOrder
    {
        R                                      = 0x10B0,
        A                                      = 0x10B1,
        RG                                     = 0x10B2,
        RA                                     = 0x10B3,
        RGB                                    = 0x10B4,
        RGBA                                   = 0x10B5,
        BGRA                                   = 0x10B6,
        ARGB                                   = 0x10B7,
        INTENSITY                              = 0x10B8,
        LUMINANCE                              = 0x10B9,
        Rx                                     = 0x10BA,
        RGx                                    = 0x10BB,
        RGBx                                   = 0x10BC
    }

    /* cl_channel_type */
    [CCode (cname = "cl_channel_type", cprefix = "CL_", has_type_id = false)]
    public enum ChannelType
    {
        SNORM_INT8                             = 0x10D0,
        SNORM_INT16                            = 0x10D1,
        UNORM_INT8                             = 0x10D2,
        UNORM_INT16                            = 0x10D3,
        UNORM_SHORT_565                        = 0x10D4,
        UNORM_SHORT_555                        = 0x10D5,
        UNORM_INT_101010                       = 0x10D6,
        SIGNED_INT8                            = 0x10D7,
        SIGNED_INT16                           = 0x10D8,
        SIGNED_INT32                           = 0x10D9,
        UNSIGNED_INT8                          = 0x10DA,
        UNSIGNED_INT16                         = 0x10DB,
        UNSIGNED_INT32                         = 0x10DC,
        HALF_FLOAT                             = 0x10DD,
        FLOAT                                  = 0x10DE
    }
    
    /* cl_mem_object_type */
    [CCode (cname = "cl_mem_object_type", cprefix = "CL_MEM_OBJECT_", has_type_id = false)]
    public enum MemObjectType
    {
        BUFFER                      = 0x10F0,
        IMAGE2D                     = 0x10F1,
        IMAGE3D                     = 0x10F2
    }
    
    
    /* cl_mem_info */
    [CCode (cname = "cl_mem_info", cprefix = "CL_MEM_", has_type_id = false)]
    public enum MemInfo
    {
        TYPE                               = 0x1100,
        FLAGS                              = 0x1101,
        SIZE                               = 0x1102,
        HOST_PTR                           = 0x1103,
        MAP_COUNT                          = 0x1104,
        REFERENCE_COUNT                    = 0x1105,
        CONTEXT                            = 0x1106,
        ASSOCIATED_MEMOBJECT               = 0x1107,
        OFFSET                             = 0x1108
    }
    
    
    /* cl_image_info */
    [CCode (cname = "cl_image_info", cprefix = "CL_IMAGE_", has_type_id = false)]
    public enum ImageInfo
    {
        FORMAT                           = 0x1110,
        ELEMENT_SIZE                     = 0x1111,
        ROW_PITCH                        = 0x1112,
        SLICE_PITCH                      = 0x1113,
        WIDTH                            = 0x1114,
        HEIGHT                           = 0x1115,
        DEPTH                            = 0x1116
    }
    
    /* cl_addressing_mode */
    [CCode (cname = "cl_addressing_mode", cprefix = "CL_ADDRESS_", has_type_id = false)]
    public enum AddressingMode
    {
        NONE                           = 0x1130,
        CLAMP_TO_EDGE                  = 0x1131,
        CLAMP                          = 0x1132,
        REPEAT                         = 0x1133,
        MIRRORED_REPEAT                = 0x1134
    }
    
    /* cl_filter_mode */
    [CCode (cname = "cl_filter_mode", cprefix = "CL_FILTER_", has_type_id = false)]
    public enum FilterMode
    {
        NEAREST                         = 0x1140,
        LINEAR                          = 0x1141
    }
    
    /* cl_sampler_info */
    [CCode (cname = "cl_sampler_info", cprefix = "CL_SAMPLER_", has_type_id = false)]
    public enum SamplerInfo
    {
        REFERENCE_COUNT                = 0x1150,
        CONTEXT                        = 0x1151,
        NORMALIZED_COORDS              = 0x1152,
        ADDRESSING_MODE                = 0x1153,
        FILTER_MODE                    = 0x1154
    }
    
    /* cl_map_flags - bitfield */
    [CCode (cname = "cl_map_flags", cprefix = "CL_MAP_", has_type_id = false)]
    [Flags]
    public enum MapFlags
    {
        READ                               = (1 << 0),
        WRITE                              = (1 << 1)
    }
    
    /* cl_program_info */
    [CCode (cname = "cl_program_info", cprefix = "CL_PROGRAM_", has_type_id = false)]
    public enum ProgramInfo
    {
        REFERENCE_COUNT                = 0x1160,
        CONTEXT                        = 0x1161,
        NUM_DEVICES                    = 0x1162,
        DEVICES                        = 0x1163,
        SOURCE                         = 0x1164,
        BINARY_SIZES                   = 0x1165,
        BINARIES                       = 0x1166
    }
    
    
    /* cl_program_build_info */
    [CCode (cname = "cl_program_build_info", cprefix = "CL_PROGRAM_BUILD_", has_type_id = false)]
    public enum ProgramBuildInfo
    {
        STATUS                   = 0x1181,
        OPTIONS                  = 0x1182,
        LOG                      = 0x1183
    }

    /* cl_build_status */
    [CCode (cname = "cl_build_status", cprefix = "CL_BUILD_", has_type_id = false)]
    public enum BuildStatus
    {
        SUCCESS                          = 0,
        NONE                             = -1,
        ERROR                            = -2,
        IN_PROGRESS                      = -3
    }
    
    /* cl_kernel_info */
    [CCode (cname = "cl_kernel_info", cprefix = "CL_KERNEL_", has_type_id = false)]
    public enum KernelInfo
    {
        FUNCTION_NAME                   = 0x1190,
        NUM_ARGS                        = 0x1191,
        REFERENCE_COUNT                 = 0x1192,
        CONTEXT                         = 0x1193,
        PROGRAM                         = 0x1194
    }
    
    /* cl_kernel_work_group_info */
    [CCode (cname = "cl_kernel_work_group_info", cprefix = "CL_KERNEL_", has_type_id = false)]
    public enum KernelWorkGroupInfo
    {
        WORK_GROUP_SIZE                 = 0x11B0,
        COMPILE_WORK_GROUP_SIZE         = 0x11B1,
        LOCAL_MEM_SIZE                  = 0x11B2,
        PREFERRED_WORK_GROUP_SIZE_MULTIPLE = 0x11B3,
        PRIVATE_MEM_SIZE                = 0x11B4
    }
    
    /* cl_event_info  */
    [CCode (cname = "cl_event_info", cprefix = "CL_EVENT_", has_type_id = false)]
    public enum EventInfo
    {
        COMMAND_QUEUE                    = 0x11D0,
        COMMAND_TYPE                     = 0x11D1,
        REFERENCE_COUNT                  = 0x11D2,
        COMMAND_EXECUTION_STATUS         = 0x11D3,
        CONTEXT                          = 0x11D4
    }
    
    /* cl_command_type */
    [CCode (cname = "cl_command_type", cprefix = "CL_COMMAND_", has_type_id = false)]
    public enum CommandType
    {
        NDRANGE_KERNEL                 = 0x11F0,
        TASK                           = 0x11F1,
        NATIVE_KERNEL                  = 0x11F2,
        READ_BUFFER                    = 0x11F3,
        WRITE_BUFFER                   = 0x11F4,
        COPY_BUFFER                    = 0x11F5,
        READ_IMAGE                     = 0x11F6,
        WRITE_IMAGE                    = 0x11F7,
        COPY_IMAGE                     = 0x11F8,
        COPY_IMAGE_TO_BUFFER           = 0x11F9,
        COPY_BUFFER_TO_IMAGE           = 0x11FA,
        MAP_BUFFER                     = 0x11FB,
        MAP_IMAGE                      = 0x11FC,
        UNMAP_MEM_OBJECT               = 0x11FD,
        MARKER                         = 0x11FE,
        ACQUIRE_GL_OBJECTS             = 0x11FF,
        RELEASE_GL_OBJECTS             = 0x1200,
        READ_BUFFER_RECT               = 0x1201,
        WRITE_BUFFER_RECT              = 0x1202,
        COPY_BUFFER_RECT               = 0x1203,
        USER                           = 0x1204
    }
    
    /* command execution status */
    [CCode (cname = "int", cprefix = "CL_", has_type_id = false)]
    public enum CommandExecutionStatus
    {
        COMPLETE                               = 0x0,
        RUNNING                                = 0x1,
        SUBMITTED                              = 0x2,
        QUEUED                                 = 0x3
    }
    
    /* cl_buffer_create_type  */
    [CCode (cname = "cl_buffer_create_type", cprefix = "CL_BUFFER_CREATE_TYPE_", has_type_id = false)]
    public enum BufferCreateType
    {
        REGION              = 0x1220
    }
    
    /* cl_profiling_info  */
    [CCode (cname = "cl_profiling_info", cprefix = "CL_PROFILING_COMMAND_", has_type_id = false)]
    public enum ProfilingInfo
    {
        QUEUED               = 0x1280,
        SUBMIT               = 0x1281,
        START                = 0x1282,
        END                  = 0x1283
    }
    
//--------------------------------------------------------------------------------------------------------

    /* Platform API */
    [CCode (cname = "clGetPlatformIDs")]
    public ErrorCode GetPlatformIDs(uint        num_entries,
                                   [CCode (array_length = false)]
                                   PlatformId*  platforms, 
                                   out uint     num_platforms);


    [CCode (cname = "clGetPlatformInfo")]
    public ErrorCode GetPlatformInfo(PlatformId    platform, 
                                     PlatformInfo  param_name,
                                     size_t        param_value_size, 
                                     void*         param_value,
                                     out size_t    param_value_size_ret);
                               
    /* Device APIs */
    [CCode (cname = "clGetDeviceIDs")]
    public ErrorCode GetDeviceIDs(PlatformId  platform,
                                  DeviceType  device_type, 
                                  int         num_entries, 
                                  [CCode (array_length = false, array_null_terminated = true)]
                                  DeviceId*   devices, 
                                  out uint    num_devices);

    [CCode (cname = "clGetDeviceInfo")]
    public ErrorCode GetDeviceInfo(DeviceId        device,
                                   DeviceInfo      param_name, 
                                   size_t          param_value_size, 
                                   void *          param_value,
                                   out size_t      param_value_size_ret);

    /* Context APIs  */
    [CCode (has_target = false, delegate_target = false)]
    public delegate void ErrorNotify(char* errinfo, void* private_info, size_t cb, void* user_data);
    
    [CCode (cname = "clCreateContext")]
    public Context CreateContext(ContextProperties* properties,
                                 uint               num_devices,
                                 DeviceId*          devices,
                                 ErrorNotify?         pfn_notify,
                                 void*              user_data,
                                 out ErrorCode      errcode_ret);

    [CCode (cname = "clCreateContextFromType")]
    public Context CreateContextFromType(ContextProperties*  properties,
                                         DeviceType          device_type,
                                         ErrorNotify?          pfn_notify,
                                         void*               user_data,
                                         out ErrorCode       errcode_ret);

    [CCode (cname = "clRetainContext")]
    public int RetainContext(Context context);

    [CCode (cname = "clReleaseContext")]
    public int ReleaseContext(Context context);

    [CCode (cname = "clGetContextInfo")]
    public ErrorCode GetContextInfo(Context      context, 
                                    ContextInfo  param_name, 
                                    size_t       param_value_size, 
                                    void*        param_value, 
                                    out size_t   param_value_size_ret);

    /* Command Queue APIs */
    public CommandQueue CreateCommandQueue(Context                 context, 
                                           DeviceId                device, 
                                           CommandQueueProperties  properties,
                                           out ErrorCode           errcode_ret);

    public ErrorCode RetainCommandQueue(CommandQueue  command_queue);

    public ErrorCode ReleaseCommandQueue(CommandQueue  command_queue);

    public ErrorCode GetCommandQueueInfo(CommandQueue      command_queue,
                                         CommandQueueInfo  param_name,
                                         size_t            param_value_size,
                                         void*             param_value,
                                         out size_t        param_value_size_ret);

    /* Memory Object APIs */
    public Mem CreateBuffer(Context   context,
                            MemFlags  flags,
                            size_t    size,
                            void*     host_ptr,
                            out ErrorCode  errcode_ret);

    public Mem CreateSubBuffer(Mem               buffer,
                               MemFlags          flags,
                               BufferCreateType  buffer_create_type,
                               void*             buffer_create_info,
                               out ErrorCode     errcode_ret);

    public Mem CreateImage2D(Context        context,
                             MemFlags       flags,
                             ImageFormat*   image_format,
                             size_t         image_width,
                             size_t         image_height,
                             size_t         image_row_pitch, 
                             void*          host_ptr,
                             out ErrorCode  errcode_ret);
                            
    public Mem CreateImage3D(Context        context,
                             MemFlags       flags,
                             ImageFormat*   image_format,
                             size_t         image_width, 
                             size_t         image_height,
                             size_t         image_depth, 
                             size_t         image_row_pitch, 
                             size_t         image_slice_pitch, 
                             void*          host_ptr,
                             out ErrorCode  errcode_ret);
                            
    public ErrorCode RetainMemObject(Mem memobj);

    public ErrorCode ReleaseMemObject(Mem memobj);

    public ErrorCode GetSupportedImageFormats(Context        context,
                                              MemFlags       flags,
                                              MemObjectType  image_type,
                                              uint           num_entries,
                                              ImageFormat*   image_formats,
                                              out uint       num_image_formats);
                                        
    public ErrorCode GetMemObjectInfo(Mem          memobj,
                                      MemInfo      param_name, 
                                      size_t       param_value_size,
                                      void*        param_value,
                                      out size_t   param_value_size_ret);

    public ErrorCode GetImageInfo(Mem         image,
                                  ImageInfo   param_name, 
                                  size_t      param_value_size,
                                  void*       param_value,
                                  out size_t  param_value_size_ret);

    [CCode (has_target = false, delegate_target = false)]
    public delegate void DestructorCallback(Mem    memobj, 
                                            void*  user_data);
        
    public ErrorCode SetMemObjectDestructorCallback(Mem                  memobj, 
                                                    DestructorCallback?  pfn_notify, 
                                                    void*                user_data);

/* Sampler APIs  */
public Sampler CreateSampler(Context           context,
                bool              normalized_coords, 
                AddressingMode   addressing_mode, 
                FilterMode       filter_mode,
                out ErrorCode             errcode_ret);

public int RetainSampler(Sampler  sampler);

public int ReleaseSampler(Sampler  sampler);

public int GetSamplerInfo(Sampler          sampler,
                 SamplerInfo     param_name,
                 size_t              param_value_size,
                 void*              param_value,
                 out size_t            param_value_size_ret);

/* Program Object APIs  */

public Program CreateProgramWithSource(Context        context,
                                               uint           count,
                                               [CCode (array_length = false)]
                                               char[][]       strings,
                                               [CCode (array_length = false)]
                                               size_t[]       lengths,
                                               out ErrorCode  errcode_ret);

public Program CreateProgramWithBinary(Context                      context,
                          uint                         num_devices,
                          DeviceId*            device_list,
                          size_t*                  lengths,
                          uchar**          binaries,
                          int *                        binary_status,
                          out ErrorCode                        errcode_ret);

public int RetainProgram(Program  program);

public int ReleaseProgram(Program  program);

[CCode (has_target = false, delegate_target = false)]
public delegate void ProgramBuiltCallback(Program  program, void*  user_data);

public ErrorCode BuildProgram(Program      program,
                              uint         num_devices,
                              [CCode (array_length = false)]
                              DeviceId[]?  device_list,
                              [CCode (array_length = false)]
                              char[]?      options = null, 
                              ProgramBuiltCallback?  pfn_notify = null,
                              void*        user_data = null);

public int UnloadCompiler();

public int GetProgramInfo(Program          program,
                 ProgramInfo     param_name,
                 size_t              param_value_size,
                 void*              param_value,
                 out size_t            param_value_size_ret);

public int GetProgramBuildInfo(Program             program,
                      DeviceId           device,
                      ProgramBuildInfo  param_name,
                      size_t                 param_value_size,
                      void*                 param_value,
                      out size_t               param_value_size_ret);

/* Kernel Object APIs */
public Kernel CreateKernel(Program  program,
                                   [CCode (array_length = false)]
                                   char[]   kernel_name,
                                   out ErrorCode  errcode_ret);

public ErrorCode CreateKernelsInProgram(Program     program,
                         uint        num_kernels,
                         Kernel*    kernels,
                         out uint      num_kernels_ret);

public ErrorCode RetainKernel(Kernel    kernel);

public ErrorCode ReleaseKernel(Kernel   kernel);

public ErrorCode SetKernelArg(Kernel    kernel,
               uint      arg_index,
               size_t       arg_size,
               void* arg_value);

public ErrorCode GetKernelInfo(Kernel       kernel,
                KernelInfo  param_name,
                size_t          param_value_size,
                void*          param_value,
                out size_t        param_value_size_ret);

public ErrorCode GetKernelWorkGroupInfo(Kernel                  kernel,
                         DeviceId               device,
                         KernelWorkGroupInfo  param_name,
                         size_t                     param_value_size,
                         void*                     param_value,
                         out size_t                   param_value_size_ret);

/* Event Object APIs  */
public ErrorCode WaitForEvents([CCode (array_length_pos = 0.9)] Event[] event_list);

public ErrorCode GetEventInfo(Event         event,
               EventInfo    param_name,
               size_t           param_value_size,
               void*           param_value,
               out size_t         param_value_size_ret);
                            
public Event CreateUserEvent(Context    context,
                  out ErrorCode      errcode_ret);               
                            
public ErrorCode RetainEvent(Event event);

public ErrorCode ReleaseEvent(Event event);

public ErrorCode SetUserEventStatus(Event   event,
                     out int     execution_status);

[CCode (has_target = false, delegate_target = false)]
public delegate void EventCallback(Event  event, CommandExecutionStatus event_command_exec_status, void*  user_data);

public ErrorCode SetEventCallback(Event    event,
                    int      command_exec_callback_type,
                    EventCallback pfn_notify,
                    void*      user_data);


/* Profiling APIs  */
public ErrorCode GetEventProfilingInfo(Event           event,
                        ProfilingInfo  param_name,
                        size_t             param_value_size,
                        void *             param_value,
                        out size_t           param_value_size_ret);
                                
/* Flush and Finish APIs */
public ErrorCode Flush(CommandQueue  command_queue);

public ErrorCode Finish(CommandQueue  command_queue);

/* Enqueued Commands APIs */
public ErrorCode EnqueueReadBuffer(CommandQueue    command_queue,
                    Mem             buffer,
                    bool            blocking_read,
                    size_t             offset,
                    size_t             cb, 
                    void *             ptr,
                    uint            num_events_in_wait_list,
                    Event *   event_wait_list,
                    out Event         event);
                            
public ErrorCode EnqueueReadBufferRect(CommandQueue    command_queue,
                        Mem             buffer,
                        bool            blocking_read,
                        size_t *     buffer_origin,
                        size_t *     host_origin, 
                        size_t *     region,
                        size_t             buffer_row_pitch,
                        size_t             buffer_slice_pitch,
                        size_t             host_row_pitch,
                        size_t             host_slice_pitch,                        
                        void *             ptr,
                        uint            num_events_in_wait_list,
                        Event *   event_wait_list,
                        out Event         event);
                            
public ErrorCode EnqueueWriteBuffer(CommandQueue   command_queue, 
                     Mem            buffer, 
                     bool           blocking_write, 
                     size_t            offset, 
                     size_t            cb, 
                     void *      ptr, 
                     uint           num_events_in_wait_list, 
                     Event *  event_wait_list, 
                     out Event        event);
                            
public ErrorCode EnqueueWriteBufferRect(CommandQueue    command_queue,
                         Mem             buffer,
                         bool            blocking_write,
                         size_t *     buffer_origin,
                         size_t *     host_origin, 
                         size_t *     region,
                         size_t             buffer_row_pitch,
                         size_t             buffer_slice_pitch,
                         size_t             host_row_pitch,
                         size_t             host_slice_pitch,                        
                         void *       ptr,
                         uint            num_events_in_wait_list,
                         Event *   event_wait_list,
                         out Event         event);
                            
public ErrorCode EnqueueCopyBuffer(CommandQueue    command_queue, 
                    Mem             src_buffer,
                    Mem             dst_buffer, 
                    size_t             src_offset,
                    size_t             dst_offset,
                    size_t             cb, 
                    uint            num_events_in_wait_list,
                    Event *   event_wait_list,
                    out Event         event);
                            
public ErrorCode EnqueueCopyBufferRect(CommandQueue    command_queue, 
                        Mem             src_buffer,
                        Mem             dst_buffer, 
                        size_t *     src_origin,
                        size_t *     dst_origin,
                        size_t *     region, 
                        size_t             src_row_pitch,
                        size_t             src_slice_pitch,
                        size_t             dst_row_pitch,
                        size_t             dst_slice_pitch,
                        uint            num_events_in_wait_list,
                        Event *   event_wait_list,
                        out Event         event);
                            
public ErrorCode EnqueueReadImage(CommandQueue     command_queue,
                   Mem              image,
                   bool             blocking_read, 
                   size_t *      origin[3],
                   size_t *      region[3],
                   size_t              row_pitch,
                   size_t              slice_pitch, 
                   void *              ptr,
                   uint             num_events_in_wait_list,
                   Event *    event_wait_list,
                   out Event          event);

public ErrorCode EnqueueWriteImage(CommandQueue    command_queue,
                    Mem             image,
                    bool            blocking_write, 
                    size_t *     origin[3],
                    size_t *     region[3],
                    size_t             input_row_pitch,
                    size_t             input_slice_pitch, 
                    void *       ptr,
                    uint            num_events_in_wait_list,
                    Event *   event_wait_list,
                    out Event         event);

public ErrorCode EnqueueCopyImage(CommandQueue     command_queue,
                   Mem              src_image,
                   Mem              dst_image, 
                   size_t *      src_origin[3],
                   size_t *      dst_origin[3],
                   size_t *      region[3], 
                   uint             num_events_in_wait_list,
                   Event *    event_wait_list,
                   out Event          event);

public ErrorCode EnqueueCopyImageToBuffer(CommandQueue command_queue,
                           Mem          src_image,
                           Mem          dst_buffer, 
                           size_t *  src_origin[3],
                           size_t *  region[3], 
                           size_t          dst_offset,
                           uint         num_events_in_wait_list,
                           Event *event_wait_list,
                           out Event      event);

public ErrorCode EnqueueCopyBufferToImage(CommandQueue command_queue,
                           Mem          src_buffer,
                           Mem          dst_image, 
                           size_t          src_offset,
                           size_t *  dst_origin[3],
                           size_t *  region[3], 
                           uint         num_events_in_wait_list,
                           Event* event_wait_list,
                           out Event      event);

public void* EnqueueMapBuffer(CommandQueue command_queue,
                   Mem          buffer,
                   bool         blocking_map, 
                   MapFlags    map_flags,
                   size_t          offset,
                   size_t          cb,
                   uint         num_events_in_wait_list,
                   Event *event_wait_list,
                   out Event      event,
                   out ErrorCode        errcode_ret);

public void* EnqueueMapImage(CommandQueue  command_queue,
                  Mem           image, 
                  bool          blocking_map, 
                  MapFlags     map_flags, 
                  size_t *   origin[3],
                  size_t *   region[3],
                  size_t *         image_row_pitch,
                  size_t *         image_slice_pitch,
                  uint          num_events_in_wait_list,
                  Event * event_wait_list,
                  out Event       event,
                  out ErrorCode         errcode_ret);

public ErrorCode EnqueueUnmapMemObject(CommandQueue command_queue,
                        Mem          memobj,
                        void *          mapped_ptr,
                        uint         num_events_in_wait_list,
                        Event * event_wait_list,
                        out Event       event);

public ErrorCode EnqueueNDRangeKernel(CommandQueue command_queue,
                       Kernel       kernel,
                       uint         work_dim,
                       size_t *  global_work_offset,
                       size_t *  global_work_size,
                       size_t *  local_work_size,
                       uint         num_events_in_wait_list,
                       Event *event_wait_list,
                       out Event      event);

public ErrorCode EnqueueTask(CommandQueue  command_queue,
              Kernel        kernel,
              uint          num_events_in_wait_list,
              Event* event_wait_list,
              out Event       event);

[CCode (has_target = false, delegate_target = false)]
public delegate void UserFunc (void* args);

public ErrorCode EnqueueNativeKernel(CommandQueue  command_queue,
                      void* user_func, 
                      void*           args,
                      size_t           cb_args, 
                      uint          num_mem_objects,
                      Mem *   mem_list,
                      void **    args_mem_loc,
                      uint          num_events_in_wait_list,
                      Event* event_wait_list,
                      out Event       event);

public ErrorCode EnqueueMarker(CommandQueue    command_queue,
                Event *         event);

public ErrorCode EnqueueWaitForEvents(CommandQueue command_queue,
                       uint         num_events,
                       Event event_list);

public ErrorCode EnqueueBarrier(CommandQueue command_queue);

/* Extension function access
 *
 * Returns the extension function address for the given function name,
 * or NULL if a valid function can not be found.  The client must
 * check to make sure the address is not NULL, before using or 
 * calling the returned function address.
 */
public void*  GetExtensionFunctionAddress(char *func_name);
}
