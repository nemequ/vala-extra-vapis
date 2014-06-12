/*
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
 */

using Xcb;

namespace Xcb {

	[CCode (cprefix = "xcb_randr_", cheader_filename = "xcb/randr.h")]
	namespace RandR {
		public static Connection get_connection (Xcb.Connection c) {
			return (Connection) c;
		}

		[Compact]
		[CCode (cname = "xcb_connection_t", cprefix = "xcb_randr_", unref_function = "")]
		public class Connection : Xcb.Connection {
			public QueryVersionCookie query_version (uint32 major_version, uint32 minor_version);
			public QueryVersionCookie query_version_unchecked (uint32 major_version, uint32 minor_version);
			public QueryVersionReply query_version_reply (QueryVersionCookie cookie, out GenericError? e = null);

			public SetScreenConfigCookie set_screen_config (Window window, Timestamp timestamp, Timestamp config_timestamp, uint16 sizeID, Rotation rotation, uint16 rate);
			public SetScreenConfigCookie set_screen_config_unchecked (Window window, Timestamp timestamp, Timestamp config_timestamp, uint16 sizeID, Rotation rotation, uint16 rate);
			public SetScreenConfigReply set_screen_config_reply (SetScreenConfigCookie cookie, out GenericError? e = null);

			public VoidCookie select_input_checked (Window window, NotifyMask enable);
			public VoidCookie select_input (Window window, NotifyMask enable);

			public GetScreenInfoCookie get_screen_info (Window window);
			public GetScreenInfoCookie get_screen_info_unchecked (Window window);
			public GetScreenInfoReply get_screen_info_reply (GetScreenInfoCookie cookie, out GenericError? e = null);

			public GetScreenSizeRangeCookie get_screen_size_range (Window window);
			public GetScreenSizeRangeCookie get_screen_size_range_unchecked (Window window);
			public GetScreenSizeRangeReply get_screen_size_range_reply (GetScreenSizeRangeCookie cookie, out GenericError? e = null);

			public VoidCookie set_screen_size_checked (Window window, uint16 width, uint16 height, uint16 mm_width, uint16 mm_height);
			public VoidCookie set_screen_size (Window window, uint16 width, uint16 height, uint16 mm_width, uint16 mm_height);

			public GetScreenResourcesCookie get_screen_resources (Window window);
			public GetScreenResourcesCookie get_screen_resources_unchecked (Window window);
			public GetScreenResourcesReply get_screen_resources_reply (GetScreenResourcesCookie cookie, out GenericError? e = null);

			public GetOutputInfoCookie get_output_info (Output output, Timestamp config_timestamp);
			public GetOutputInfoCookie get_output_info_unchecked (Output output, Timestamp config_timestamp);
			public GetOutputInfoReply get_output_info_reply (GetOutputInfoCookie cookie, out GenericError? e = null);

			public ListOutputPropertiesCookie list_output_properties (Output output);
			public ListOutputPropertiesCookie list_output_properties_unchecked (Output output);
			public ListOutputPropertiesReply list_output_properties_reply (ListOutputPropertiesCookie cookie, out GenericError? e = null);

			public QueryOutputPropertyCookie query_output_property (Output output, Atom property);
			public QueryOutputPropertyCookie query_output_property_unchecked (Output output, Atom property);
			public QueryOutputPropertyReply query_output_property_reply (QueryOutputPropertyCookie cookie, out GenericError? e = null);

			public VoidCookie configure_output_property_checked (Output output, Atom property, bool pending, bool range, [CCode (array_length_pos = 4.9, array_length_type = "uint16_t")] int32[] values);
			public VoidCookie configure_output_property (Output output, Atom property, bool pending, bool range, [CCode (array_length_pos = 4.9, array_length_type = "uint16_t")] int32[] values);

			private VoidCookie change_output_property_checked (Output output, Atom property, Atom type, uint8 format, PropMode mode, uint32 num_units, void* data);
			private VoidCookie change_output_property (Output output, Atom property, Atom type, uint8 format, PropMode mode, uint32 num_units, void* data);
			public VoidCookie change_output_property_string_checked (Output output, Atom property, Atom type, PropMode mode, string value) {
				this.change_output_property_checked (output, property, type, 8, mode, value.length, value);
			}
			public VoidCookie change_output_property_string (Output output, Atom property, Atom type, PropMode mode, string value) {
				this.change_output_property_checked (output, property, type, 8, mode, value.length, value);
			}
			public VoidCookie change_output_property_int8_checked (Output output, Atom property, Atom type, PropMode mode, int8[] value) {
				this.change_output_property_checked (output, property, type, 8, mode, value.length, value);
			}
			public VoidCookie change_output_property_int8 (Output output, Atom property, Atom type, PropMode mode, int8[] value) {
				this.change_output_property_checked (output, property, type, 8, mode, value.length, value);
			}
			public VoidCookie change_output_property_int16_checked (Output output, Atom property, Atom type, PropMode mode, int16[] value) {
				this.change_output_property_checked (output, property, type, 16, mode, value.length, value);
			}
			public VoidCookie change_output_property_int16 (Output output, Atom property, Atom type, PropMode mode, int16[] value) {
				this.change_output_property_checked (output, property, type, 16, mode, value.length, value);
			}
			public VoidCookie change_output_property_int32_checked (Output output, Atom property, Atom type, PropMode mode, int32[] value) {
				this.change_output_property_checked (output, property, type, 32, mode, value.length, value);
			}
			public VoidCookie change_output_property_int32 (Output output, Atom property, Atom type, PropMode mode, int32[] value) {
				this.change_output_property_checked (output, property, type, 32, mode, value.length, value);
			}

			public VoidCookie delete_output_property_checked (Output output, Atom property);
			public VoidCookie delete_output_property (Output output, Atom property);

			public GetOutputPropertyCookie get_output_property (Output output, Atom property, Atom type, uint32 long_offset, uint32 long_length, bool _delete, bool pending);
			public GetOutputPropertyCookie get_output_property_unchecked (Output output, Atom property, Atom type, uint32 long_offset, uint32 long_length, bool _delete, bool pending);
			public GetOutputPropertyReply get_output_property_reply (GetOutputPropertyCookie cookie, out GenericError? e = null);

			[CCode (cname = "xcb_randr_create_mode")]
			private CreateModeCookie vala_create_mode (Window window, ModeInfo mode_info, uint32 name_len, string name);
			[CCode (cname = "vala_xcb_randr_create_mode")]
			public CreateModeCookie create_mode (Window window, ModeInfo mode_info, string name) {
				this.vala_create_mode (window, mode_info, (uint32) name.length, name);
			}
			[CCode (cname = "xcb_randr_create_mode_unchecked")]
			private CreateModeCookie vala_create_mode_unchecked (Window window, ModeInfo mode_info, uint32 name_len, string name);
			[CCode (cname = "vala_xcb_randr_create_mode_unchecked")]
			public CreateModeCookie create_mode_unchecked (Window window, ModeInfo mode_info, string name) {
				this.vala_create_mode_unchecked (window, mode_info, (uint32) name.length, name);
			}
 			public CreateModeReply create_mode_reply (CreateModeCookie cookie, out GenericError? e = null);

			public VoidCookie destroy_mode_checked (Mode mode);
			public VoidCookie destroy_mode (Mode mode);

			public VoidCookie add_output_mode_checked (Output output, Mode mode);
			public VoidCookie add_output_mode (Output output, Mode mode);

			public VoidCookie delete_output_mode_checked (Output output, Mode mode);
			public VoidCookie delete_output_mode (Output output, Mode mode);

			public GetCrtcInfoCookie get_crtc_info (Crtc crtc, Timestamp config_timestamp);
			public GetCrtcInfoCookie get_crtc_info_unchecked (Crtc crtc, Timestamp config_timestamp);
			public GetCrtcInfoReply get_crtc_info_reply (GetCrtcInfoCookie cookie, out GenericError? e = null);

			public SetCrtcConfigCookie set_crtc_config (Crtc crtc, Timestamp timestamp, Timestamp config_timestamp, int16 x, int16 y, Mode mode, Rotation rotation, [CCode (array_length_pos = 7.9, array_length_type = "uint32_t")] Output[] outputs);
			public SetCrtcConfigCookie set_crtc_config_unchecked (Crtc crtc, Timestamp timestamp, Timestamp config_timestamp, int16 x, int16 y, Mode mode, Rotation rotation, [CCode (array_length_pos = 7.9, array_length_type = "uint32_t")] Output[] outputs);
			public SetCrtcConfigReply set_crtc_config_reply (SetCrtcConfigCookie cookie, out GenericError? e = null);

			public GetCrtcGammaSizeCookie get_crtc_gamma_size (Crtc crtc);
			public GetCrtcGammaSizeCookie get_crtc_gamma_size_unchecked (Crtc crtc);
			public GetCrtcGammaSizeReply get_crtc_gamma_size_reply (GetCrtcGammaSizeCookie cookie, out GenericError? e = null);

			public GetCrtcGammaCookie get_crtc_gamma (Crtc crtc);
			public GetCrtcGammaCookie get_crtc_gamma_unchecked (Crtc crtc);
			public GetCrtcGammaReply get_crtc_gamma_reply (GetCrtcGammaCookie cookie, out GenericError? e = null);

			public VoidCookie set_crtc_gamma_checked (Crtc crtc, [CCode (array_length_pos = 1.9, array_length_type = "uint16_t")] uint16[] red, [CCode (array_length = false)] uint16[] green, [CCode (array_length = false)] uint16[] blue);
			public VoidCookie set_crtc_gamma (Crtc crtc, [CCode (array_length_pos = 1.9, array_length_type = "uint16_t")] uint16[] red, [CCode (array_length = false)] uint16[] green, [CCode (array_length = false)] uint16[] blue);

			public GetScreenResourcesCurrentCookie get_screen_resources_current (Window window);
			public GetScreenResourcesCurrentCookie get_screen_resources_current_unchecked (Window window);
			public GetScreenResourcesCurrentReply get_screen_resources_current_reply (GetScreenResourcesCurrentCookie cookie, out GenericError? e = null);

			[CCode (cname = "xcb_randr_set_crtc_transform_checked")]
			private VoidCookie vala_set_crtc_transform_checked (Crtc crtc, Xcb.Render.Transform transform, uint16 filter_len, string filter_name,  [CCode (array_length_pos = 4.9, array_length_type = "uint32_t")] Xcb.Render.Fixed[] filter_params);
			[CCode (cname = "vala_xcb_randr_set_crtc_transform_checked")]
			public VoidCookie set_crtc_transform_checked (Crtc crtc, Xcb.Render.Transform transform, string filter_name, Xcb.Render.Fixed[] filter_params) {
				return this.vala_set_crtc_transform_checked (crtc, transform, (uint16) filter_name.length, filter_name, filter_params);
			}
			[CCode (cname = "xcb_randr_set_crtc_transform")]
			private VoidCookie vala_set_crtc_transform (Crtc crtc, Xcb.Render.Transform transform, uint16 filter_len, string filter_name,  [CCode (array_length_pos = 4.9, array_length_type = "uint32_t")] Xcb.Render.Fixed[] filter_params);
			[CCode (cname = "vala_xcb_randr_set_crtc_transform")]
			public VoidCookie set_crtc_transform (Crtc crtc, Xcb.Render.Transform transform, string filter_name, Xcb.Render.Fixed[] filter_params) {
				return this.vala_set_crtc_transform (crtc, transform, (uint16) filter_name.length, filter_name, filter_params);
			}

			public GetCrtcTransformCookie get_crtc_transform (Crtc crtc);
			public GetCrtcTransformCookie get_crtc_transform_unchecked (Crtc crtc);
			public GetCrtcTransformReply get_crtc_transform_reply (GetCrtcTransformCookie cookie, out GenericError? e = null);

			public GetPanningCookie get_panning (Crtc crtc);
			public GetPanningCookie get_panning_unchecked (Crtc crtc);
			public GetPanningReply get_panning_reply (GetPanningCookie cookie, out GenericError? e = null);

			public SetPanningCookie set_panning (Crtc crtc, Timestamp timestamp, uint16 left, uint16 top, uint16 width, uint16 height, uint16 track_left, uint16 track_top, uint16 track_width, uint16 track_height, int16 border_left, int16 border_top, int16 border_right, int16 border_bottom);
			public SetPanningCookie set_panning_unchecked (Crtc crtc, Timestamp timestamp, uint16 left, uint16 top, uint16 width, uint16 height, uint16 track_left, uint16 track_top, uint16 track_width, uint16 track_height, int16 border_left, int16 border_top, int16 border_right, int16 border_bottom);
			public SetPanningReply set_panning_reply (SetPanningCookie cookie, out GenericError? e = null);

			public VoidCookie set_output_primary_checked (Window window, Output output);
			public VoidCookie set_output_primary (Window window, Output output);

			public GetOutputPrimaryCookie get_output_primary (Window window);
			public GetOutputPrimaryCookie get_output_primary_unchecked (Window window);
			public GetOutputPrimaryReply get_output_primary_reply (GetOutputPrimaryCookie cookie, out GenericError? e = null);

			public GetProvidersCookie get_providers (Window window);
			public GetProvidersCookie get_providers_unchecked (Window window);
			public GetProvidersReply get_providers_reply (GetProvidersCookie cookie, out GenericError? e = null);

			public GetProviderInfoCookie get_provider_info (Provider provider, Timestamp config_timestamp);
			public GetProviderInfoCookie get_provider_info_unchecked (Provider provider, Timestamp config_timestamp);
			public GetProviderInfoReply get_provider_info_reply (GetProviderInfoCookie cookie, out GenericError? e = null);

			public VoidCookie set_provider_offload_sink_checked (Provider provider, Provider sink_provider, Timestamp config_timestamp);
			public VoidCookie set_provider_offload_sink (Provider provider, Provider sink_provider, Timestamp config_timestamp);

			public VoidCookie set_provider_output_source_checked (Provider provider, Provider source_provider, Timestamp config_timestamp);
			public VoidCookie set_provider_output_source (Provider provider, Provider source_provider, Timestamp config_timestamp);

			public ListProviderPropertiesCookie list_provider_properties (Provider provider);
			public ListProviderPropertiesCookie list_provider_properties_unchecked (Provider provider);
			public ListProviderPropertiesReply list_provider_properties_reply (ListProviderPropertiesCookie cookie, out GenericError? e = null);

			public QueryProviderPropertyCookie query_provider_property (Provider provider, Atom property);
			public QueryProviderPropertyCookie query_provider_property_unchecked (Provider provider, Atom property);
			public QueryProviderPropertyReply query_provider_property_reply (QueryProviderPropertyCookie cookie, out GenericError? e = null);

			public VoidCookie configure_provider_property_checked (Provider provider, Atom property, bool pending, bool range, [CCode (array_length_pos = 4.9, array_length_type = "uint32_t")] int32[] values);
			public VoidCookie configure_provider_property (Provider provider, Atom property, bool pending, bool range, [CCode (array_length_pos = 4.9, array_length_type = "uint32_t")] int32[] values);

			private VoidCookie change_provider_property_checked (Provider provider, Atom property, Atom type, uint8 format, PropMode mode, uint32 num_units, void* data);
			private VoidCookie change_provider_property (Provider provider, Atom property, Atom type, uint8 format, PropMode mode, uint32 num_units, void* data);
			public VoidCookie change_provider_property_string_checked (Provider provider, Atom property, Atom type, PropMode mode, string value) {
				this.change_provider_property_checked (provider, property, type, 8, mode, value.length, value);
			}
			public VoidCookie change_provider_property_string (Provider provider, Atom property, Atom type, PropMode mode, string value) {
				this.change_provider_property_checked (provider, property, type, 8, mode, value.length, value);
			}
			public VoidCookie change_provider_property_int8_checked (Provider provider, Atom property, Atom type, PropMode mode, int8[] value) {
				this.change_provider_property_checked (provider, property, type, 8, mode, value.length, value);
			}
			public VoidCookie change_provider_property_int8 (Provider provider, Atom property, Atom type, PropMode mode, int8[] value) {
				this.change_provider_property_checked (provider, property, type, 8, mode, value.length, value);
			}
			public VoidCookie change_provider_property_int16_checked (Provider provider, Atom property, Atom type, PropMode mode, int16[] value) {
				this.change_provider_property_checked (provider, property, type, 16, mode, value.length, value);
			}
			public VoidCookie change_provider_property_int16 (Provider provider, Atom property, Atom type, PropMode mode, int16[] value) {
				this.change_provider_property_checked (provider, property, type, 16, mode, value.length, value);
			}
			public VoidCookie change_provider_property_int32_checked (Provider provider, Atom property, Atom type, PropMode mode, int32[] value) {
				this.change_provider_property_checked (provider, property, type, 32, mode, value.length, value);
			}
			public VoidCookie change_provider_property_int32 (Provider provider, Atom property, Atom type, PropMode mode, int32[] value) {
				this.change_provider_property_checked (provider, property, type, 32, mode, value.length, value);
			}

			public VoidCookie delete_provider_property_checked (Provider provider, Atom property);
			public VoidCookie delete_provider_property (Provider provider, Atom property);

			public GetProviderPropertyCookie get_provider_property (Provider provider, Atom property, Atom type, uint32 long_offset, uint32 long_length, bool _delete, bool pending);
			public GetProviderPropertyCookie get_provider_property_unchecked (Provider provider, Atom property, Atom type, uint32 long_offset, uint32 long_length, bool _delete, bool pending);
			public GetProviderPropertyReply get_provider_property_reply (GetProviderPropertyCookie cookie, out GenericError? e = null);
		}

		[SimpleType]
		[IntegerType (rank = 9)]
		[CCode (cname = "xcb_randr_mode_t", has_type_id = false)]
		public struct Mode {
		}

		[SimpleType]
		[IntegerType (rank = 9)]
		[CCode (cname = "xcb_randr_crtc_t", has_type_id = false)]
		public struct Crtc {
		}

		[SimpleType]
		[IntegerType (rank = 9)]
		[CCode (cname = "xcb_randr_output_t", has_type_id = false)]
		public struct Output {
		}

		[SimpleType]
		[IntegerType (rank = 9)]
		[CCode (cname = "xcb_randr_provider_t", has_type_id = false)]
		public struct Provider {
		}

		[SimpleType]
		[CCode (cname = "xcb_randr_screen_size_t", has_type_id = false)]
		public struct ScreenSize {
			public uint16 width;
			public uint16 height;
			public uint16 mwidth;
			public uint16 mheight;
		}

		[Compact]
		[CCode (cname = "xcb_randr_refresh_rates_t", ref_function = "", unref_function = "")]
		public class RefreshRates {
			private uint16 nRates;
			[CCode (cname = "xcb_randr_refresh_rates_rates")]
			private uint16* vala_rates ();
			public unowned uint16[] rates
			{
				get {
					unowned uint16[] res = (uint16[]) vala_rates ();
					res.length = nRates;
					return res;
				}
			}
		}

		[SimpleType]
		[CCode (cname = "xcb_randr_refresh_rates_iterator_t", has_type_id = false)]
		private struct RefreshRatesIterator {
			public unowned RefreshRates data;
			[CCode (cname = "xcb_randr_refresh_rates_next")]
			public static void next (ref RefreshRatesIterator iter);
		}

		[SimpleType]
		[IntegerType (rank = 9)]
		[CCode (cname = "xcb_randr_query_version_cookie_t", has_type_id = false)]
		public struct QueryVersionCookie {
		}

		[Compact]
		[CCode (cname = "xcb_randr_query_version_reply_t", ref_function = "", unref_function = "free")]
		public class QueryVersionReply : Xcb.GenericReply {
			public uint32 major_version;
			public uint32 minor_version;
		}

		[CCode (cname = "xcb_randr_rotation_t", cprefix = "XCB_RANDR_ROTATION_", has_type_id = false)]
		public enum Rotation {
			ROTATE_0,
			ROTATE_90,
			ROTATE_180,
			ROTATE_270,
			REFLECT_X,
			REFLECT_Y
		}

		[CCode (cname = "xcb_randr_set_config_t", cprefix = "XCB_RANDR_SET_CONFIG_", has_type_id = false)]
		public enum SetConfig {
			SUCCESS,
			INVALID_CONFIG_TIME,
			INVALID_TIME,
			FAILED
		}

		[SimpleType]
		[IntegerType (rank = 9)]
		[CCode (cname = "xcb_randr_set_screen_config_cookie_t", has_type_id = false)]
		public struct SetScreenConfigCookie {
		}

		[Compact]
		[CCode (cname = "xcb_randr_set_screen_config_reply_t", ref_function = "", unref_function = "free")]
		public class SetScreenConfigReply : Xcb.GenericReply {
			public SetConfig status;
			public Timestamp new_timestamp;
			public Timestamp config_timestamp;
			public Window root;
			public Xcb.Render.SubPixel subpixel_order;
		}

		[CCode (cname = "xcb_randr_notify_mask_t", cprefix = "XCB_RANDR_NOTIFY_MASK_", has_type_id = false)]
		public enum NotifyMask {
			SCREEN_CHANGE,
			CRTC_CHANGE,
			OUTPUT_CHANGE,
			OUTPUT_PROPERTY,
			PROVIDER_CHANGE,
			PROVIDER_PROPERTY,
			RESOURCE_CHANGE
		}

		[SimpleType]
		[IntegerType (rank = 9)]
		[CCode (cname = "xcb_randr_get_screen_info_cookie_t", has_type_id = false)]
		public struct GetScreenInfoCookie {
		}

		[Compact]
		[CCode (cname = "xcb_randr_get_screen_info_reply_t", ref_function = "", unref_function = "free")]
		public class GetScreenInfoReply : Xcb.GenericReply {
			public Rotation rotations;
			public Window root;
			public Timestamp timestamp;
			public Timestamp config_timestamp;
			public uint16 sizeID;
			public Rotation rotation;
			public uint16 rate;
			private uint16 nSizes;
			[CCode (cname = "xcb_randr_get_screen_info_sizes")]
			private ScreenSize* vala_sizes ();
			public ScreenSize[] sizes
			{
				get {
					unowned ScreenSize[] res = (ScreenSize[]) vala_sizes ();
					res.length = nSizes;
					return res;
				}
			}
			private uint16 nInfo;
			[CCode (cname = "xcb_randr_get_screen_info_rates_length")]
			private int rates_length ();
			[CCode (cname = "xcb_randr_get_screen_info_rates_iterator")]
			private RefreshRatesIterator rates_iterator ();
			public RefreshRates[] rates
			{
				owned get {
					var value = new RefreshRates[rates_length ()];
					var iter = rates_iterator ();
					for (var i = 0; i < value.length; i++)
					{
						value[i] = iter.data;
						RefreshRatesIterator.next (ref iter);
					}
					return value;
				}
			}
		}

		[SimpleType]
		[IntegerType (rank = 9)]
		[CCode (cname = "xcb_randr_get_screen_size_range_cookie_t", has_type_id = false)]
		public struct GetScreenSizeRangeCookie {
		}

		[Compact]
		[CCode (cname = "xcb_randr_get_screen_size_range_reply_t", ref_function = "", unref_function = "free")]
		public class GetScreenSizeRangeReply : Xcb.GenericReply {
			public uint16 min_width;
			public uint16 min_height;
			public uint16 max_width;
			public uint16 max_height;
		}

		[CCode (cname = "xcb_randr_mode_flag_t", cprefix = "XCB_RANDR_MODE_FLAG_", has_type_id = false)]
		public enum ModeFlag {
			HSYNC_POSITIVE,
			HSYNC_NEGATIVE,
			VSYNC_POSITIVE,
			VSYNC_NEGATIVE,
			INTERLACE,
			DOUBLE_SCAN,
			CSYNC,
			CSYNC_POSITIVE,
			CSYNC_NEGATIVE,
			HSKEW_PRESENT,
			BCAST,
			PIXEL_MULTIPLEX,
			DOUBLE_CLOCK,
			HALVE_CLOCK
		}

		[SimpleType]
		[CCode (cname = "xcb_randr_mode_info_t", has_type_id = false)]
		public struct ModeInfo {
			public uint32 id;
			public uint16 width;
			public uint16 height;
			public uint32 dot_clock;
			public uint16 hsync_start;
			public uint16 hsync_end;
			public uint16 htotal;
			public uint16 hskew;
			public uint16 vsync_start;
			public uint16 vsync_end;
			public uint16 vtotal;
			public uint32 mode_flags;
			public uint16 name_len;
		}

		[SimpleType]
		[IntegerType (rank = 9)]
		[CCode (cname = "xcb_randr_get_screen_resources_cookie_t", has_type_id = false)]
		public struct GetScreenResourcesCookie {
		}

		[Compact]
		[CCode (cname = "xcb_randr_get_screen_resources_reply_t", ref_function = "", unref_function = "free")]
		public class GetScreenResourcesReply : Xcb.GenericReply {
			public Timestamp timestamp;
			public Timestamp config_timestamp;
			private uint16 num_crtcs;
			[CCode (cname = "xcb_randr_get_screen_resources_crtcs")]
			private Crtc* vala_crtcs ();
			public Crtc[] crtcs
			{
				get {
					unowned Crtc[] res = (Crtc[]) vala_crtcs ();
					res.length = num_crtcs;
					return res;
				}
			}
			private uint16 num_outputs;
			[CCode (cname = "xcb_randr_get_screen_resources_outputs")]
			private Output* vala_outputs ();
			public Output[] outputs
			{
				get {
					unowned Output[] res = (Output[]) vala_outputs ();
					res.length = num_outputs;
					return res;
				}
			}
			private uint16 num_modes;
			[CCode (cname = "xcb_randr_get_screen_resources_modes")]
			private ModeInfo* vala_modes ();
			public ModeInfo[] modes
			{
				get {
					unowned ModeInfo[] res = (ModeInfo[]) vala_modes ();
					res.length = num_modes;
					return res;
				}
			}
			private uint16 names_len;
			[CCode (cname = "xcb_randr_get_screen_resources_names")]
			private uint8* vala_names ();
			public string[] mode_names
			{
				owned get {
					var m = modes;
					var d = vala_names ();
					var value = new string[m.length];
					var offset = 0;
					for (var i = 0; i < m.length; i++)
					{
						var len = m[i].name_len;
						value[i] = offset + len <= names_len ? "%.*s".printf (len, d + offset) : "";
						offset += len;
					}
					return value;
				}
			}
		}

		[CCode (cname = "xcb_randr_connection_t", cprefix = "XCB_RANDR_CONNECTION_", has_type_id = false)]
		public enum ConnectionState {
			CONNECTED,
			DISCONNECTED,
			UNKNOWN
		}

		[SimpleType]
		[IntegerType (rank = 9)]
		[CCode (cname = "xcb_randr_get_output_info_cookie_t", has_type_id = false)]
		public struct GetOutputInfoCookie {
		}

		[Compact]
		[CCode (cname = "xcb_randr_get_output_info_reply_t", ref_function = "", unref_function = "free")]
		public class GetOutputInfoReply : Xcb.GenericReply {
			public SetConfig status;
			public Timestamp timestamp;
			public Crtc crtc;
			public uint32 mm_width;
			public uint32 mm_height;
			public ConnectionState connection;
			public Xcb.Render.SubPixel subpixel_order;
			private uint16 num_crtcs;
			[CCode (cname = "xcb_randr_get_output_info_crtcs")]
			private Crtc* vala_crtcs ();
			public Crtc[] crtcs
			{
				get {
					unowned Crtc[] res = (Crtc[]) vala_crtcs ();
					res.length = num_crtcs;
					return res;
				}
			}
			private uint16 num_modes;
			[CCode (cname = "xcb_randr_get_output_info_modes")]
			private Mode* vala_modes ();
			public Mode[] modes
			{
				get {
					unowned Mode[] res = (Mode[]) vala_modes ();
					res.length = num_modes;
					return res;
				}
			}
			public uint16 num_preferred;
			private uint16 num_clones;
			[CCode (cname = "xcb_randr_get_output_info_clones")]
			private Output* vala_clones ();
			public Output[] clones
			{
				get {
					unowned Output[] res = (Output[]) vala_clones ();
					res.length = num_clones;
					return res;
				}
			}
			private uint16 name_len;
			[CCode (cname = "xcb_randr_get_output_info_name")]
			private unowned string vala_name ();
			public string name { owned get { return "%.*s".printf (name_len, vala_name ()); } }
		}

		[SimpleType]
		[IntegerType (rank = 9)]
		[CCode (cname = "xcb_randr_list_output_properties_cookie_t", has_type_id = false)]
		public struct ListOutputPropertiesCookie {
		}

		[Compact]
		[CCode (cname = "xcb_randr_list_output_properties_reply_t", ref_function = "", unref_function = "free")]
		public class ListOutputPropertiesReply : Xcb.GenericReply {
			private uint16 num_atoms;
			[CCode (cname = "xcb_randr_list_output_properties_atoms")]
			private Atom* vala_atoms();
			public Atom[] atoms
			{
				get
				{
					unowned Atom[] res = (Atom[]) vala_atoms ();
					res.length = num_atoms;
					return res;
				}
			}
		}

		[SimpleType]
		[IntegerType (rank = 9)]
		[CCode (cname = "xcb_randr_query_output_property_cookie_t", has_type_id = false)]
		public struct QueryOutputPropertyCookie {
		}

		[Compact]
		[CCode (cname = "xcb_randr_query_output_property_reply_t", ref_function = "", unref_function = "free")]
		public class QueryOutputPropertyReply : Xcb.GenericReply {
			public bool pending;
			public bool range;
			public bool immutable;
			[CCode (cname = "xcb_randr_query_output_property_valid_values_length")]
			private int valid_values_length ();
			[CCode (cname = "xcb_randr_query_output_property_valid_values")]
			private int32* vala_valid_values ();
			public int32[] valid_values
			{
				get {
					unowned int32[] res = (int32[]) vala_valid_values ();
					res.length = valid_values_length ();
					return res;
				}
			}
		}

		[SimpleType]
		[IntegerType (rank = 9)]
		[CCode (cname = "xcb_randr_get_output_property_cookie_t", has_type_id = false)]
		public struct GetOutputPropertyCookie {
		}

		[Compact]
		[CCode (cname = "xcb_randr_get_output_property_reply_t", ref_function = "", unref_function = "free")]
		public class GetOutputPropertyReply : Xcb.GenericReply {
			public uint8 format;
			public Atom type;
			public uint32 bytes_after;
			private uint32 num_items;
			[CCode (cname = "xcb_randr_get_output_property_data")]
			private uint8* data ();
			public string value_as_string () {
				GLib.assert (format == 8);
				return "%.*s".printf (num_items, data ());
			}
			public unowned uint8[] value_as_uint8_array () {
				GLib.assert (format == 8);
				unowned uint8[] res = (uint8[]) data ();
				res.length = (int) num_items;
				return res;
			}
			public unowned uint16[] value_as_uint16_array () {
				GLib.assert (format == 16);
				unowned uint16[] res = (uint16[]) data ();
				res.length = (int) num_items;
				return res;
			}
			public unowned uint32[] value_as_uint32_array () {
				GLib.assert (format == 32);
				unowned uint32[] res = (uint32[]) data ();
				res.length = (int) num_items;
				return res;
			}
		}

		[SimpleType]
		[IntegerType (rank = 9)]
		[CCode (cname = "xcb_randr_create_mode_cookie_t", has_type_id = false)]
		public struct CreateModeCookie {
		}

		[Compact]
		[CCode (cname = "xcb_randr_create_mode_reply_t", ref_function = "", unref_function = "free")]
		public class CreateModeReply : Xcb.GenericReply {
			public Mode mode;
		}

		[SimpleType]
		[IntegerType (rank = 9)]
		[CCode (cname = "xcb_randr_get_crtc_info_cookie_t", has_type_id = false)]
		public struct GetCrtcInfoCookie {
		}

		[Compact]
		[CCode (cname = "xcb_randr_get_crtc_info_reply_t", ref_function = "", unref_function = "free")]
		public class GetCrtcInfoReply : Xcb.GenericReply {
			public SetConfig status;
			public Timestamp timestamp;
			public int16 x;
			public int16 y;
			public uint16 width;
			public uint16 height;
			public Mode mode;
			public Rotation rotation;
			public Rotation rotations;
			private uint16 num_outputs;
			[CCode (cname = "xcb_randr_get_crtc_info_outputs")]
			private Output* vala_outputs ();
			public Output[] outputs
			{
				get {
					unowned Output[] res = (Output[]) vala_outputs ();
					res.length = num_outputs;
					return res;
				}
			}
			private uint16 num_possible_outputs;
			[CCode (cname = "xcb_randr_get_crtc_info_possible")]
			private Output* vala_possible ();
			public Output[] possible_outputs
			{
				get {
					unowned Output[] res = (Output[]) vala_possible ();
					res.length = num_possible_outputs;
					return res;
				}
			}
		}

		[SimpleType]
		[IntegerType (rank = 9)]
		[CCode (cname = "xcb_randr_set_crtc_config_cookie_t", has_type_id = false)]
		public struct SetCrtcConfigCookie {
		}

		[Compact]
		[CCode (cname = "xcb_randr_set_crtc_config_reply_t", ref_function = "", unref_function = "free")]
		public class SetCrtcConfigReply : Xcb.GenericReply {
			public SetConfig status;
			public Timestamp timestamp;
		}

		[SimpleType]
		[IntegerType (rank = 9)]
		[CCode (cname = "xcb_randr_get_crtc_gamma_size_cookie_t", has_type_id = false)]
		public struct GetCrtcGammaSizeCookie {
		}

		[Compact]
		[CCode (cname = "xcb_randr_get_crtc_gamma_size_reply_t", ref_function = "", unref_function = "free")]
		public class GetCrtcGammaSizeReply : Xcb.GenericReply {
			public uint16 size;
		}

		[SimpleType]
		[IntegerType (rank = 9)]
		[CCode (cname = "xcb_randr_get_crtc_gamma_cookie_t", has_type_id = false)]
		public struct GetCrtcGammaCookie {
		}

		[Compact]
		[CCode (cname = "xcb_randr_get_crtc_gamma_reply_t", ref_function = "", unref_function = "free")]
		public class GetCrtcGammaReply : Xcb.GenericReply {
			private uint16 size;
			[CCode (cname = "xcb_randr_get_crtc_gamma_red")]
			private uint16* vala_red ();
			public uint16[] red
			{
				get {
					unowned uint16[] res = (uint16[]) vala_red ();
					res.length = size;
					return res;
				}
			}
			[CCode (cname = "xcb_randr_get_crtc_gamma_green")]
			private uint16* vala_green ();
			public uint16[] green
			{
				get {
					unowned uint16[] res = (uint16[]) vala_green ();
					res.length = size;
					return res;
				}
			}
			[CCode (cname = "xcb_randr_get_crtc_gamma_blue")]
			private uint16* vala_blue ();
			public uint16[] blue
			{
				get {
					unowned uint16[] res = (uint16[]) vala_blue ();
					res.length = size;
					return res;
				}
			}
		}

		[SimpleType]
		[IntegerType (rank = 9)]
		[CCode (cname = "xcb_randr_get_screen_resources_current_cookie_t", has_type_id = false)]
		public struct GetScreenResourcesCurrentCookie {
		}

		[Compact]
		[CCode (cname = "xcb_randr_get_screen_resources_current_reply_t", ref_function = "", unref_function = "free")]
		public class GetScreenResourcesCurrentReply : Xcb.GenericReply {
			public Timestamp timestamp;
			public Timestamp config_timestamp;
			private uint16 num_crtcs;
			[CCode (cname = "xcb_randr_get_screen_resources_current_crtcs")]
			private Crtc* vala_crtcs ();
			public Crtc[] crtcs
			{
				get {
					unowned Crtc[] res = (Crtc[]) vala_crtcs ();
					res.length = num_crtcs;
					return res;
				}
			}
			private uint16 num_outputs;
			[CCode (cname = "xcb_randr_get_screen_resources_current_outputs")]
			private Output* vala_outputs ();
			public Output[] outputs
			{
				get {
					unowned Output[] res = (Output[]) vala_outputs ();
					res.length = num_outputs;
					return res;
				}
			}
			private uint16 num_modes;
			[CCode (cname = "xcb_randr_get_screen_resources_current_modes")]
			private ModeInfo* vala_modes ();
			public ModeInfo[] modes
			{
				get {
					unowned ModeInfo[] res = (ModeInfo[]) vala_modes ();
					res.length = num_modes;
					return res;
				}
			}
			private uint16 names_len;
			[CCode (cname = "xcb_randr_get_screen_resources_current_names")]
			private uint8* vala_names ();
			public string[] mode_names
			{
				owned get {
					var m = modes;
					var d = vala_names ();
					var value = new string[m.length];
					var offset = 0;
					for (var i = 0; i < m.length; i++)
					{
						var len = m[i].name_len;
						value[i] = offset + len <= names_len ? "%.*s".printf (len, d + offset) : "";
						offset += len;
					}
					return value;
				}
			}
		}

		[CCode (cname = "xcb_randr_transform_t", cprefix = "XCB_RANDR_TRANSFORM_", has_type_id = false)]
		public enum Transform {
			UNIT,
			SCALE_UP,
			SCALE_DOWN,
			PROJECTIVE
		}

		[SimpleType]
		[IntegerType (rank = 9)]
		[CCode (cname = "xcb_randr_get_crtc_transform_cookie_t", has_type_id = false)]
		public struct GetCrtcTransformCookie {
		}

		[Compact]
		[CCode (cname = "xcb_randr_get_crtc_transform_reply_t", ref_function = "", unref_function = "free")]
		public class GetCrtcTransformReply : Xcb.GenericReply {
			public Xcb.Render.Transform pending_transform;
			public uint8 has_transforms;
			public Xcb.Render.Transform current_transform;
			private uint16 pending_len;
			[CCode (cname = "xcb_randr_get_crtc_transform_pending_filter_name")]
			private unowned string vala_pending_filter_name ();
			public string pending_filter_name { owned get { return "%.*s".printf (pending_len, vala_pending_filter_name ()); } }
			private uint16 pending_nparams;
			[CCode (cname = "xcb_randr_get_crtc_transform_pending_params")]
			private Xcb.Render.Fixed* vala_pending_params ();
			public Xcb.Render.Fixed[] pending_params
			{
				get {
					unowned Xcb.Render.Fixed[] res = (Xcb.Render.Fixed[]) vala_pending_params ();
					res.length = pending_nparams;
					return res;
				}
			}
			private uint16 current_len;
			[CCode (cname = "xcb_randr_get_crtc_transform_current_filter_name")]
			private unowned string vala_current_filter_name ();
			public string current_filter_name { owned get { return "%.*s".printf (current_len, vala_current_filter_name ()); } }
			private uint16 current_nparams;
			[CCode (cname = "xcb_randr_get_crtc_transform_current_params")]
			private Xcb.Render.Fixed* vala_current_params ();
			public Xcb.Render.Fixed[] current_params
			{
				get {
					unowned Xcb.Render.Fixed[] res = (Xcb.Render.Fixed[]) vala_current_params ();
					res.length = current_nparams;
					return res;
				}
			}
		}

		[SimpleType]
		[IntegerType (rank = 9)]
		[CCode (cname = "xcb_randr_get_panning_cookie_t", has_type_id = false)]
		public struct GetPanningCookie {
		}

		[Compact]
		[CCode (cname = "xcb_randr_get_panning_reply_t", ref_function = "", unref_function = "free")]
		public class GetPanningReply : Xcb.GenericReply {
			public SetConfig status;
			public Timestamp timestamp;
			public uint16 left;
			public uint16 top;
			public uint16 width;
			public uint16 height;
			public uint16 track_left;
			public uint16 track_top;
			public uint16 track_width;
			public uint16 track_height;
			public int16 border_left;
			public int16 border_top;
			public int16 border_right;
			public int16 border_bottom;
		}

		[SimpleType]
		[IntegerType (rank = 9)]
		[CCode (cname = "xcb_randr_set_panning_cookie_t", has_type_id = false)]
		public struct SetPanningCookie {
		}

		[Compact]
		[CCode (cname = "xcb_randr_set_panning_reply_t", ref_function = "", unref_function = "free")]
		public class SetPanningReply : Xcb.GenericReply {
			public SetConfig status;
			public Timestamp timestamp;
		}

		[SimpleType]
		[IntegerType (rank = 9)]
		[CCode (cname = "xcb_randr_get_output_primary_cookie_t", has_type_id = false)]
		public struct GetOutputPrimaryCookie {
		}

		[Compact]
		[CCode (cname = "xcb_randr_get_output_primary_reply_t", ref_function = "", unref_function = "free")]
		public class GetOutputPrimaryReply : Xcb.GenericReply {
			public Output output;
		}

		[SimpleType]
		[IntegerType (rank = 9)]
		[CCode (cname = "xcb_randr_get_providers_cookie_t", has_type_id = false)]
		public struct GetProvidersCookie {
		}

		[Compact]
		[CCode (cname = "xcb_randr_get_providers_reply_t", ref_function = "", unref_function = "free")]
		public class GetProvidersReply : Xcb.GenericReply {
			public Timestamp timestamp;
			private uint16 num_providers;
			[CCode (cname = "xcb_randr_get_providers_providers")]
			private Provider* vala_providers ();
			public Provider[] providers
			{
				get {
					unowned Provider[] res = (Provider[]) vala_providers ();
					res.length = num_providers;
					return res;
				}
			}
		}

		[CCode (cname = "xcb_randr_provider_capability_t", cprefix = "XCB_RANDR_PROVIDER_CAPABILITY_", has_type_id = false)]
		public enum ProviderCapability {
			SOURCE_OUTPUT,
			SINK_OUTPUT,
			SOURCE_OFFLOAD,
			SINK_OFFLOAD
		}

		[SimpleType]
		[IntegerType (rank = 9)]
		[CCode (cname = "xcb_randr_get_provider_info_cookie_t", has_type_id = false)]
		public struct GetProviderInfoCookie {
		}

		[Compact]
		[CCode (cname = "xcb_randr_get_provider_info_reply_t", ref_function = "", unref_function = "free")]
		public class GetProviderInfoReply : Xcb.GenericReply {
			public SetConfig status;
			public Timestamp timestamp;
			public ProviderCapability capabilities;
			private uint16 num_crtcs;
			[CCode (cname = "xcb_randr_get_provider_info_crtcs")]
			private Crtc* vala_crtcs ();
			public Crtc[] crtcs
			{
				get {
					unowned Crtc[] res = (Crtc[]) vala_crtcs ();
					res.length = num_crtcs;
					return res;
				}
			}
			private uint16 num_outputs;
			[CCode (cname = "xcb_randr_get_provider_info_outputs")]
			private Output* vala_outputs ();
			public Output[] outputs
			{
				get {
					unowned Output[] res = (Output[]) vala_outputs ();
					res.length = num_outputs;
					return res;
				}
			}
			private uint16 num_associated_providers;
			[CCode (cname = "xcb_randr_get_provider_info_associated_providers")]
			private Provider* vala_associated_providers ();
			public Provider[] associated_providers
			{
				get {
					unowned Provider[] res = (Provider[]) vala_associated_providers ();
					res.length = num_associated_providers;
					return res;
				}
			}
			[CCode (cname = "xcb_randr_get_provider_info_associated_capability")]
			private ProviderCapability* vala_associated_capability ();
			public ProviderCapability[] associated_provider_capability
			{
				get {
					unowned ProviderCapability[] res = (ProviderCapability[]) vala_associated_capability ();
					res.length = num_associated_providers;
					return res;
				}
			}
			private uint16 name_len;
			[CCode (cname = "xcb_randr_get_provider_info_name")]
			private unowned string vala_name ();
			public string name { owned get { return "%.*s".printf (name_len, vala_name ()); } }
		}

		[SimpleType]
		[IntegerType (rank = 9)]
		[CCode (cname = "xcb_randr_list_provider_properties_cookie_t", has_type_id = false)]
		public struct ListProviderPropertiesCookie {
		}

		[Compact]
		[CCode (cname = "xcb_randr_list_provider_properties_reply_t", ref_function = "", unref_function = "free")]
		public class ListProviderPropertiesReply : Xcb.GenericReply {
			private uint16 num_atoms;
			[CCode (cname = "xcb_randr_list_provider_properties_atoms")]
			private Atom* vala_atoms();
			public Atom[] atoms
			{
				get
				{
					unowned Atom[] res = (Atom[]) vala_atoms ();
					res.length = num_atoms;
					return res;
				}
			}
		}

		[SimpleType]
		[IntegerType (rank = 9)]
		[CCode (cname = "xcb_randr_query_provider_property_cookie_t", has_type_id = false)]
		public struct QueryProviderPropertyCookie {
		}

		[Compact]
		[CCode (cname = "xcb_randr_query_provider_property_reply_t", ref_function = "", unref_function = "free")]
		public class QueryProviderPropertyReply : Xcb.GenericReply {
			public bool pending;
			public bool range;
			public bool immutable;
			[CCode (cname = "xcb_randr_query_output_property_valid_values_length")]
			private int valid_values_length ();
			[CCode (cname = "xcb_randr_query_output_property_valid_values")]
			private int32* vala_valid_values ();
			public int32[] valid_values
			{
				get {
					unowned int32[] res = (int32[]) vala_valid_values ();
					res.length = valid_values_length ();
					return res;
				}
			}
		}

		[SimpleType]
		[IntegerType (rank = 9)]
		[CCode (cname = "xcb_randr_get_provider_property_cookie_t", has_type_id = false)]
		public struct GetProviderPropertyCookie {
		}

		[Compact]
		[CCode (cname = "xcb_randr_get_provider_property_reply_t", ref_function = "", unref_function = "free")]
		public class GetProviderPropertyReply : Xcb.GenericReply {
			public uint8 format;
			public Atom type;
			public uint32 bytes_after;
			private uint32 num_items;
			[CCode (cname = "xcb_randr_get_provider_property_data")]
			private uint8* data ();
			public string value_as_string ()
			{
				GLib.assert (format == 8);
				return "%.*s".printf (num_items, data ());
			}
			public unowned uint8[] value_as_uint8_array () {
				GLib.assert (format == 8);
				unowned uint8[] res = (uint8[]) data ();
				res.length = (int) num_items;
				return res;
			}
			public unowned uint16[] value_as_uint16_array () {
				GLib.assert (format == 16);
				unowned uint16[] res = (uint16[]) data ();
				res.length = (int) num_items;
				return res;
			}
			public unowned uint32[] value_as_uint32_array () {
				GLib.assert (format == 32);
				unowned uint32[] res = (uint32[]) data ();
				res.length = (int) num_items;
				return res;
			}
		}
	}
}
