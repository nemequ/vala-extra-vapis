/* CUPS Vala Bindings
 * Copyright 2009-2010 Evan Nemerson <evan@coeus-group.com>
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

/* Status:
 *   cups.h, array.h, and ppd.h are mostly done. Nothing else is, but
 *   patches are welcome. I'm not sure if I'll ever get around to
 *   finishing them unless there is a demand (what I need is done), so
 *   if you're actually using these let me know.
 */

[CCode (cheader_filename = "cups/cups.h")]
namespace CUPS {
	public const double VERSION;
	public const int VERSION_MAJOR;
	public const int VERSION_MINOR;
	public const int VERSION_PATCH;
	public const int DATE_ANY;

	[CCode (canme = "cups_ptype_t")]
	public enum PriterType {
		LOCAL,
		CLASS,
		REMOTE,
		BW,	
		COLOR,
		DUPLEX,
		STAPLE,
		COPIES,
		COLLATE,
		PUNCH,
		COVER,
		BIND,
		SORT,
		SMALL,
		MEDIUM,
		LARGE,
		VARIABLE,
		IMPLICIT,
		DEFAULT,
		FAX,
		REJECTING,
		DELETE,
		NOT_SHARED,
		AUTHENTICATED,
		COMMANDS,
		DISCOVERED,
		OPTIONS
	}

	[CCode (cname = "cups_option_t", destroy_function = "")]
	public struct Option {
		public string name;
		public string value;
	}

	[CCode (cname = "cups_dest_t")]
	public struct Destination {
		public string name;
		public string instance;
		public int is_default;
		[CCode (array_length_cname = "num_options")]
		public Option[] options;
		[CCode (cname = "cupsFreeDests")]
		public static void free (int num_dests, Destination * dests);
		[CCode (cname = "cupsGetDest")]
		public static unowned Destination? get_dest (string name, string? instance, [CCode (array_length_pos = 0.9)] Destination[] dests);
		[CCode (cname = "cupsGetDests")]
		public static int get_dests ([CCode (array_length = false)] out unowned Destination[] dests);

		public PPD.File get_ppd () {
			return new PPD.File (CUPS.get_ppd (this.name));
		}

		public int print_file (string filename, string title, Option[]? options) {
			return CUPS.print_file (this.name, filename, title, options);
		}
	}

	[CCode (cname = "cups_job_t")]
	public struct Job {
		public int id;
		public string dest;
		public string title;
		public string user;
		public string format;
		// public IPP.JobState state;
		public int size;
		public int priority;
		public time_t completed_time;
		public time_t creation_time;
		public time_t processing_time;
	}

	[CCode (cname = "cupsPrintFile")]
	public int print_file (string printer, string filename, string title, [CCode (array_length_pos = 3.9)] Option[]? options);
	[CCode (cname = "cupsGetDests")]
	public int get_dests ([CCode (array_length = false)] out unowned Destination[] dests);
	[CCode (cname = "cupsGetPPD")]
	public unowned string get_ppd (string printer);
	[CCode (cname = "cupsUser")]
	public unowned string user ();
	[CCode (cname = "cupsServer")]
	public unowned string server ();

	/* Better alternatives exist in both GLib and Gee. */
	[Compact, CCode (cname = "cups_array_t", copy_function = "cupsArrayDup", free_function = "cupsArrayDelete", cheader_filename = "cups/array.h")]
	public class Array <T> {
		public int add (T e);
		public void clear ();
		public int count ();
		public unowned T current ();
		public unowned T find (T e);
		public unowned T first ();
		public int get_index ();
		public int get_insert ();
		public unowned T index (int n);
		public int insert (T e);
		public unowned T last ();
		public Array (ArrayFunc f, T d);
		public Array.with_hash (ArrayFunc f, T d, ArrayHashFunc h, int hsize);
		public unowned T next ();
		public unowned T prev ();
		public int remove (T e);
		public unowned T restore ();
		public int save ();
	}

	[CCode (cname = "cups_array_func_t", cheader_filename = "cups/array.h")]
	public delegate int ArrayFunc (void * first, void * second);
	[CCode (cname = "cups_ahash_func_t", cheader_filename = "cups/array.h")]
	public delegate int ArrayHashFunc (void * element);

	// cups_file_t will not be bound unless someone comes up with a
	// compelling reason, or wants to do it themselves.

	[CCode (cheader_filename = "cups/ppd.h", lower_case_cprefix = "ppd_")]
	namespace PPD {
		[CCode (cname = "PPD_VERSION")]
		public const double VERSION;
		[CCode (cname = "PPD_MAX_NAME")]
		public const int MAX_NAME;
		[CCode (cname = "PPD_MAX_TEXT")]
		public const int MAX_TEXT;
		[CCode (cname = "PPD_MAX_LINE")]
		public const int MAX_LINE;

		[CCode (cname = "ppd_ui_t")]
		public enum UI {
			BOOLEAN,
			PICKONE,
			PICKMANY
		}

		[CCode (cname = "ppd_section_t", cprefix = "PPD_ORDER_")]
		public enum Section {
			ANY,
			DOCUMENT,
			EXIT,
			JCL,
			PAGE,
			PROLOG
		}

		[CCode (cname = "ppd_cs_t", cprefix = "PPD_CS_")]
		public enum Colorspace {
			CMYK,
			CMY,
			GRAY,
			RGB,
			RGBK,
			N
		}

		[CCode (cname = "ppd_status_t", cprefix = "PPD_")]
		public enum Status {
			OK,
			FILE_OPEN_ERROR,
			NULL_FILE,
			ALLOC_ERROR,
			MISSING_PPDADOBE4,
			MISSING_VALUE,
			INTERNAL_ERROR,
			BAD_OPEN_GROUP,
			NESTED_OPEN_GROUP,
			BAD_OPEN_UI,
			NESTED_OPEN_UI,
			BAD_ORDER_DEPENDENCY,
			BAD_UI_CONSTRAINTS,
			MISSING_ASTERISK,
			LINE_TOO_LONG,
			ILLEGAL_CHARACTER,
			ILLEGAL_MAIN_KEYWORD,
			ILLEGAL_OPTION_KEYWORD,
			ILLEGAL_TRANSLATION,
			ILLEGAL_WHITESPACE,
			BAD_CUSTOM_PARAM;

			[CCode (cname = "ppdErrorString")]
			public unowned string to_string ();
		}

		[CCode (cname = "ppd_conform_t")]
		public enum Conform {
			RELAXED,
			STRICT
		}

		[CCode (cname = "ppd_attr_s")]
		public struct Attribute {
			public string name;
			public string spec;
			public string text;
			public string value;
		}

		[CCode (cname = "ppd_choice_t")]
		public struct Choice {
			public char marked;
			public string choice;
			public string text;
			public string code;
			public Option * option;
		}

		[CCode (cname = "ppd_option_t")]
		public struct Option {
			public char conflicted;
			public string keyword;
			public string defchoice;
			public string text;
			public UI ui;
			public Section section;
			public float order;
			[CCode (array_length_cname = "num_choices")]
			public Choice[] choices;

			[CCode (cname = "ppdFindChoice")]
			public unowned Choice? find_choice (string option);
		}

		[CCode (cname = "ppd_group_t")]
		public struct Group {
			public string text;
			public string name;
			[CCode (array_length_cname = "num_options")]
			public Option[] options;
			[CCode (array_length_cname = "num_subgroups")]
			public Group[] subgroups;
		}

		[CCode (cname = "ppd_const_t")]
		public struct Constraint {
			public string option1;
			public string choice1;
			public string option2;
			public string choice2;
		}

		[CCode (cname = "ppd_size_t")]
		public struct Size {
			public int marked;
			public string name;
			public float width;
			public float length;
			public float left;
			public float bottom;
			public float right;
			public float top;
		}

		[CCode (cname = "ppd_emul_t")]
		public struct Emulation {
			public string name;
			public string start;
			public string stop;
		}

		[CCode (cname = "ppd_profile_t")]
		public struct Profile {
			public string resolution;
			public string media_type;
			public float density;
			public float gamma;
			[CCode (array_length = false)]
			public float[][] matrix;
		}

		[CCode (cname = "ppd_cptype_t", cprefix = "PPD_CUSTOM_")]
		public enum CPType {
			CURVE,
			INT,
			INTCURVE,
			PASSCODE,
			PASSWORD,
			POINTS,
			REAL,
			STRING
		}

		[CCode (cname = "ppd_cplimit_t")]
		public struct CPLimit {
			public float custom_curve;
			public int custom_int;
			public float custom_invcurve;
			public int custom_passcode;
			public int custom_password;
			public float custom_points;
			public float custom_real;
			public int custom_string;
		}

		[CCode (cname = "ppd_cpvalue_t")]
		public struct CPValue {
			public float custom_curve;
			public int custom_int;
			public float custom_invcurve;
			public string custom_passcode;
			public string custom_password;
			public float custom_points;
			public float custom_real;
			public string custom_string;
		}

		[CCode (cname = "ppd_cparam_t")]
		public struct CParam {
			public string name;
			public string text;
			public int order;
			public CPType type;
			public CPLimit minimum;
			public CPLimit maximum;
			public CPValue current;
		}

		[CCode (cname = "ppd_coption_t")]
		public struct COption {
			public string keyword;
			public Option * option;
			public int marked;
			public Array @params;

			public unowned CParam? find_custom_param (string name);
			public unowned CParam? first_custom_param (COption opt);
			public unowned CParam? next_custom_param ();
		}

		[Compact, CCode (cname = "ppd_file_t", free_function = "ppdClose")]
		public class File {
			public int language_level;
			public int color_devices;
			public int variable_sizes;
			public int accurate_screens;
			public int contone_only;
			public int landscape;
			public int model_number;
			public int manual_copies;
			public int throughput;
			public Colorspace colorspace;
			public string patches;
			[CCode (array_length_cname = "num_emulations")]
			public Emulation[] emulations;
			public string jcl_begin;
			public string jcl_ps;
			public string jcl_end;
			public string lang_encoding;
			public string lang_version;
			public string modelname;
			public string ttrasterizer;
			public string manufacturer;
			public string product;
			public string nickname;
			public string shortnickname;
			[CCode (array_length_cname = "num_groups")]
			public Group[] groups;
			[CCode (array_length_cname = "num_sizes")]
			public Size[] sizes;
			public float custom_min[2];
			public float custom_max[2];
			public float margins[4];
			[CCode (array_length_cname = "num_consts")]
			public Constraint[] consts;
			[CCode (array_length_cname = "num_fonts")]
			public string[] fonts;
			[CCode (array_length_cname = "num_profiles")]
			public Profile[] profiles;
			[CCode (array_length_cname = "num_filters")]
			public string[] filters;
			public string protocols;
			public string pcfilename;

			[CCode (cname = "ppdOpen")]
			public File.open (GLib.FileStream fp);
			[CCode (cname = "ppdOpenFd")]
			public File.open_fd (int fd);
			[CCode (cname = "ppdOpenFile")]
			public File (string filename);

			[CCode (cname = "ppdCollect")]
			public int collect (Section section, Choice *** choices);
			[CCode (cname = "ppdConflicts")]
			public int conflicts ();
			[CCode (cname = "ppdEmit")]
			public int emit (GLib.FileStream fp, Section section);
			[CCode (cname = "ppdEmitFd")]
			public int emit_fd (int fd, Section section);
			[CCode (cname = "ppdEmitJCL")]
			public int emit_jcl (GLib.FileStream fp, int job_id, string user, string title);
			[CCode (cname = "ppdFindMarkedChoice")]
			public unowned Choice? find_marked_choice (string keyword);
			[CCode (cname = "ppdFindOption")]
			public unowned Choice? find_option (string keyword);
			[CCode (cname = "ppdIsMarked")]
			public int is_marked (string keyword, string option);
			[CCode (cname = "ppdMarkDefaults")]
			public void mark_defaults ();
			[CCode (cname = "ppdMarkOption")]
			public int mark_option (string keyword, string option);
			[CCode (cname = "ppdPageLength")]
			public float page_length (string name);
			[CCode (cname = "ppdPageSize")]
			public Size page_size (string name);
			[CCode (cname = "ppdPageWidth")]
			public float page_width (string name);
			[CCode (cname = "ppdFindAttr")]
			public unowned Attribute? find_attribute (string name, string spec);
			[CCode (cname = "ppdFindAttrNext")]
			public unowned Attribute? find_attribute_next (string name, string spec);
			[CCode (cname = "ppdCollect2")]
			public int collect2 (Section section, float min_order, Choice *** choices);
			[CCode (cname = "ppdEmitAfterOrder")]
			public int emit_after_order (GLib.FileStream fp, Section section, int limit, float min_order);
			[CCode (cname = "ppdEmitJCLEnd")]
			public int emit_jcl_end (GLib.FileStream fp);
			[CCode (cname = "ppdEmitString")]
			public string emit_string (Section section, float min_order);
			[CCode (cname = "ppdFindCustomOption")]
			public unowned COption? find_custom_option (string keyword);
			[CCode (cname = "ppdFirstCustomOption")]
			public unowned COption? first_custom_option (string name);
			[CCode (cname = "ppdNextOption")]
			public unowned COption? next_option ();
			[CCode (cname = "ppdLocalize")]
			public int localize ();
			[CCode (cname = "ppdLocalizeIPPReason")]
			public unowned string localize_ipp_reason (string reason, string scheme, char[] buffer);
		}

		[CCode (cname = "ppdLastError")]
		public static Status last_error (out int line);
		[CCode (cname = "ppdSetConformance")]
		public static void set_conformance (Conform c);
	}

	[CCode (cheader_filename = "cups/ipp.h", lower_case_cprefix = "ppd_")]
	namespace IPP {
		[CCode (cname = "IPP_PORT")]
		public const int PORT;
		[CCode (cname = "IPP_MAX_LENGTH")]
		public const int MAX_LENGTH;
		[CCode (cname = "IPP_MAX_NAME")]
		public const int MAX_NAME;
		[CCode (cname = "IPP_MAX_VALUES")]
		public const int MAX_VALUES;

		[CCode (cname = "ipp_tag_t", cprefix = "IPP_TAG_")]
		public enum Tag {
			ZERO,
			OPERATION,
			JOB,
			END,
			PRINTER,
			UNSUPPORTED_GROUP,
			SUBSCRIPTION,
			EVENT_NOTIFICATION,
			UNSUPPORTED_VALUE,
			DEFAULT,
			UNKNOWN,
			NOVALUE,
			NOTSETTABLE,
			DELETEATTR,
			ADMINDEFINE,
			INTEGER,
			BOOLEAN,
			ENUM,
			STRING,
			DATE,
			RESOLUTION,
			RANGE,
			BEGIN_COLLECTION,
			TEXTLANG,
			NAMELANG,
			END_COLLECTION,
			TEXT,
			NAME,
			KEYWORD,
			URI,
			URISCHEME,
			CHARSET,
			LANGUAGE,
			MIMETYPE,
			MEMBERNAME,
			MASK,
			COPY
		}

		[CCode (cname = "ipp_res_t", cprefix = "IPP_RES_")]
		public enum Resolution {
			PER_INCH,
			PER_CM
		}

		[CCode (cname = "ipp_finish_t", cprefix = "IPP_FINISHINGS_")]
		public enum Finishing {
			NONE,
			STAPLE,
			PUNCH,
			COVER,
			BIND,
			SADDLE_STITCH,
			EDGE_STITCH,
			FOLD,
			TRIM,
			BALE,
			BOOKLET_MAKER,
			JOB_OFFSET,
			STAPLE_TOP_LEFT,
			STAPLE_BOTTOM_LEFT,
			STAPLE_TOP_RIGHT,
			STAPLE_BOTTOM_RIGHT,
			EDGE_STITCH_LEFT,
			EDGE_STITCH_TOP,
			EDGE_STITCH_RIGHT,
			EDGE_STITCH_BOTTOM,
			STAPLE_DUAL_LEFT,
			STAPLE_DUAL_TOP,
			STAPLE_DUAL_RIGHT,
			STAPLE_DUAL_BOTTOM,
			BIND_LEFT,
			BIND_TOP,
			BIND_RIGHT,
			BIND_BOTTOM
		}

		[CCode (cname = "ipp_orient_t", cprefix = "IPP_")]
		public enum Orientation {
			PORTRAIT,
			LANDSCAPE,
			REVERSE_LANDSCAPE,
			REVERSE_PORTRAIT
		}

		[CCode (cname = "ipp_quality_t", cprefix = "IPP_QUALITY_")]
		public enum Quality {
			DRAFT,
			NORMAL,
			HIGH
		}

		[CCode (cname = "ipp_jstate_t", cprefix = "IPP_JOB_")]
		public enum JobState {
			PENDING,
			HELD,
			PROCESSING,
			STOPPED,
			CANCELED,
			ABORTED,
			COMPLETED
		}

		[CCode (cname = "ipp_pstate_t", cprefix = "IPP_PRINTER_")]
		public enum PrinterState {
			IDLE,
			PROCESSING,
			STOPPED
		}

		[CCode (cname = "ipp_state_t", cprefix = "IPP_")]
		public enum State {
			ERROR,
			IDLE,
			HEADER,
			ATTRIBUTE,
			DATA
		}

		[CCode (cname = "ipp_op_t", cprefix = "IPP_")]
		public enum Operation {
			PRINT_JOB,
			PRINT_URI,
			VALIDATE_JOB,
			CREATE_JOB,
			SEND_DOCUMENT,
			SEND_URI,
			CANCEL_JOB,
			GET_JOB_ATTRIBUTES,
			GET_JOBS,
			GET_PRINTER_ATTRIBUTES,
			HOLD_JOB,
			RELEASE_JOB,
			RESTART_JOB,
			PAUSE_PRINTER,
			RESUME_PRINTER,
			PURGE_JOBS,
			SET_PRINTER_ATTRIBUTES,
			SET_JOB_ATTRIBUTES,
			GET_PRINTER_SUPPORTED_VALUES,
			CREATE_PRINTER_SUBSCRIPTION,
			CREATE_JOB_SUBSCRIPTION,
			GET_SUBSCRIPTION_ATTRIBUTES,
			GET_SUBSCRIPTIONS,
			RENEW_SUBSCRIPTION,
			CANCEL_SUBSCRIPTION,
			GET_NOTIFICATIONS,
			SEND_NOTIFICATIONS,
			GET_PRINT_SUPPORT_FILES,
			ENABLE_PRINTER,
			DISABLE_PRINTER,
			PAUSE_PRINTER_AFTER_CURRENT_JOB,
			HOLD_NEW_JOBS,
			RELEASE_HELD_NEW_JOBS,
			DEACTIVATE_PRINTER,
			ACTIVATE_PRINTER,
			RESTART_PRINTER,
			SHUTDOWN_PRINTER,
			STARTUP_PRINTER,
			REPROCESS_JOB,
			CANCEL_CURRENT_JOB,
			SUSPEND_CURRENT_JOB,
			RESUME_JOB,
			PROMOTE_JOB,
			SCHEDULE_JOB_AFTER,
			PRIVATE,
			CUPS_GET_DEFAULT,
			CUPS_GET_PRINTERS,
			CUPS_ADD_MODIFY_PRINTER,
			CUPS_DELETE_PRINTER,
			CUPS_GET_CLASSES,
			CUPS_ADD_MODIFY_CLASS,
			CUPS_DELETE_CLASS,
			CUPS_ACCEPT_JOBS,
			CUPS_REJECT_JOBS,
			CUPS_SET_DEFAULT,
			CUPS_GET_DEVICES,
			CUPS_GET_PPDS,
			CUPS_MOVE_JOB,
			CUPS_AUTHENTICATE_JOB,
			CUPS_GET_PPD
		}

		[CCode (cname = "ipp_status_t", cprefix = "IPP_")]
		public enum Status {
			OK,
			OK_SUBST,
			OK_CONFLICT,
			OK_IGNORED_SUBSCRIPTIONS,
			OK_IGNORED_NOTIFICATIONS,
			OK_TOO_MANY_EVENTS,
			OK_BUT_CANCEL_SUBSCRIPTION,
			OK_EVENTS_COMPLETE,
			REDIRECTION_OTHER_SITE,
			CUPS_SEE_OTHER,
			BAD_REQUEST,
			FORBIDDEN,
			NOT_AUTHENTICATED,
			NOT_AUTHORIZED,
			NOT_POSSIBLE,
			TIMEOUT,
			NOT_FOUND,
			GONE,
			REQUEST_ENTITY,
			REQUEST_VALUE,
			DOCUMENT_FORMAT,
			ATTRIBUTES,
			URI_SCHEME,
			CHARSET,
			CONFLICT,
			COMPRESSION_NOT_SUPPORTED,
			COMPRESSION_ERROR,
			DOCUMENT_FORMAT_ERROR,
			DOCUMENT_ACCESS_ERROR,
			ATTRIBUTES_NOT_SETTABLE,
			IGNORED_ALL_SUBSCRIPTIONS,
			TOO_MANY_SUBSCRIPTIONS,
			IGNORED_ALL_NOTIFICATIONS,
			PRINT_SUPPORT_FILE_NOT_FOUND,
			INTERNAL_ERROR,
			OPERATION_NOT_SUPPORTED,
			SERVICE_UNAVAILABLE,
			VERSION_NOT_SUPPORTED,
			DEVICE_ERROR,
			TEMPORARY_ERROR,
			NOT_ACCEPTING,
			PRINTER_BUSY,
			ERROR_JOB_CANCELED,
			MULTIPLE_JOBS_NOT_SUPPORTED,
			PRINTER_IS_DEACTIVATED
		}

		[CCode (cname = "struct { ipp_uchar_t version[2]; int op_status; int request_id; }")]
		public struct RequestAny {
			[CCode (array_length = false)]
			public uchar[] version;
			public int op_status;
			public int request_id;
		}

		[CCode (cname = "struct { ipp_uchar_t version[2]; ipp_op_t operation_id; int request_id; }")]
		public struct RequestOperation {
			[CCode (array_length = false)]
			public uchar[] version;
			public Operation operation_id;
			public int request_id;
		}

		[CCode (cname = "struct { ipp_uchar_t version[2]; ipp_status_t status_code; int request_id; }")]
		public struct RequestStatus {
			[CCode (array_length = false)]
			public uchar[] version;
			public Status status_code;
			public int request_id;
		}

		[CCode (cname = "struct { ipp_uchar_t version[2]; ipp_status_t status_code; int request_id; }")]
		public struct RequestEvent {
			[CCode (array_length = false)]
			public uchar[] version;
			public Status status_code;
			public int request_id;
		}

		[CCode (cname = "ipp_request_t")]
		public class Request {
			public RequestAny any;
			public RequestOperation op;
			public RequestStatus status;
			public RequestEvent @event;
		}

		[CCode (cname = "ipp_attribute_t")]
		public struct Attribute {
			//public Attribute? next;
			public Tag group_tag;
			public Tag value_tag;
			public string name;
			//[CCode (array_length_cname = "num_values")]
			//public Value[] values;
		}

		[CCode (cname = "ippPort")]
		public static int port ();

		[Compact, CCode (cname = "ipp_t", free_function = "ippDelete")]
		public class IPP {
			public State state;

			// Doesn't actually return a modified pointer, but rather a
			// whole new object, and frees the old one. Still, this is the
			// only way I can think of to make this work in vala, since
			// there is no ippCopy()
			[ReturnsModifiedPointer, CCode (cname = "cupsDoRequest", instance_pos = 1.1)]
			public void do_request (HTTP.HTTP http, string resource = "/");

			[CCode (cname = "ippNew")]
			public IPP ();
			[CCode (cname = "ippNewRequest")]
			public IPP.request (Operation op);
			[CCode (cname = "ippAddBoolean")]
			public unowned Attribute add_boolean (Tag group, string name, char value);
			[CCode (cname = "ippAddBooleans")]
			public unowned Attribute add_booleanns (Tag group, string name, [CCode (array_length_pos = 0.9)] char[] values);
			[CCode (cname = "ippAddString")]
			public unowned Attribute add_string (Tag group, Tag type, string name, string? charset, string value);
		}
	}

	namespace HTTP {
		[CCode (cname = "http_uri_status_t", cprefix = "HTTP_URI_")]
		public enum URIStatus {
			BAD_ARGUMENTS,
			BAD_HOSTNAME,
			BAD_PORT,
			BAD_RESOURCE,
			BAD_SCHEME,
			BAD_URI,
			BAD_USERNAME,
			MISSING_RESOURCE,
			MISSING_SCHEME,
			OK,
			OVERFLOW,
			UNKNOWN_SCHEME,
		}

		[CCode (cname = "http_uri_coding_t", cprefix = "HTTP_URI_CODING_")]
		public enum URICoding {
			ALL,
			HOSTNAME,
			MOST,
			NONE,
			QUERY,
			RESOURCE,
			USERNAME
		}

		[CCode (cname = "httpAssembleURIf", sentinel = ""), PrintfFormat]
		public static URIStatus assemble_uri_f (URICoding encoding, char[] uri, string scheme, string? username, string host, int port, ...);

		[CCode (cname = "CUPS_HTTP_DEFAULT")]
		public static HTTP DEFAULT;

		[Compact, CCode (cname = "http_t", free_function = "httpClose")]
		public class HTTP {
			[CCode (cname = "httpConnect")]
			public HTTP (string host, int port);

			public IPP.IPP do_request (owned IPP.IPP request, string resource);
			public IPP.IPP do_file_request (owned IPP.IPP request, string resource, string filename);
		}
	}
}
