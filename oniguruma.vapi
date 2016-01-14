/*-
 * Copyright (c) 2008-2009 Daniel Lucraft <dan@fluentradical.com>
 * All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted provided that the following conditions
 * are met:
 * 1. Redistributions of source code must retain the above copyright
 *    notice, this list of conditions and the following disclaimer.
 * 2. Redistributions in binary form must reproduce the above copyright
 *    notice, this list of conditions and the following disclaimer in the
 *    documentation and/or other materials provided with the distribution.
 *
 * THIS SOFTWARE IS PROVIDED BY THE AUTHOR AND CONTRIBUTORS ``AS IS'' AND
 * ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
 * IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
 * ARE DISCLAIMED.  IN NO EVENT SHALL THE AUTHOR OR CONTRIBUTORS BE LIABLE
 * FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL
 * DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS
 * OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION)
 * HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT
 * LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY
 * OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF
 * SUCH DAMAGE.
 */

namespace Oniguruma {
	[CCode (cname = "onig_new", cheader_filename = "oniguruma.h")]
	public static int onig_new(out RegexT regex, char* pattern, char* pattern_end,
							   OnigOptionType* option, OnigEncoding* enc, OnigSyntaxType syntax,
							   ref OnigErrorInfo err_info);

	[CCode (cname = "onig_error_code_to_str", cheader_filename = "oniguruma.h")]
	public static int error_code_to_string(char* err_buf, int err_code);

	[CCode (cname = "regex_t", cheader_filename = "oniguruma.h", free_function = "onig_free", ref_function="", unref_function="")]
	public class RegexT {
		[CCode (cname = "onig_search", cheader_filename = "oniguruma.h")]
		public int search(char* str, char* end, char* start,
						  char* range, Region region, OnigOptionType* option);
		[CCode (cname = "onig_number_of_captures", cheader_filename = "oniguruma.h")]
		public int number_of_captures();
		[CCode (cname = "onig_number_of_names", cheader_filename = "oniguruma.h")]
		public int number_of_names();
		// [CCode (cname = "onig_number_of_capture_histories", cheader_filename = "oniguruma.h")]
		// public int number_of_capture_histories();
	}
	
	[CCode (cname = "OnigRegion", cheader_filename = "oniguruma.h", free_function = "onig_region_free", ref_function="", unref_function="")]
	public class Region {
		public int num_regs;
		public int[] beg;
		public int[] end;
		[CCode (cname = "onig_region_new", cheader_filename = "oniguruma.h")]
		public Region();
		[CCode (cname = "onig_get_capture_tree", cheader_filename = "oniguruma.h")]
		public CaptureTreeNode get_capture_tree();	
		[CCode (cname = "onig_number_of_capture_histories", cheader_filename = "oniguruma.h")]
		public int number_of_capture_histories();
}

	[CCode (cname = "OnigCaptureTreeNode", cheader_filename = "oniguruma.h", free_function = "", ref_function = "", unref_function = "")]
	public class CaptureTreeNode {
		public int group;
		public int beg;
		public int end;
		public int allocated;
		public int num_childs;
		public CaptureTreeNode[] childs;
	}

	[CCode (cname="OnigOptionType")]
	public struct OnigOptionType { }

	[CCode (cname="OnigEncoding*")]
	public struct OnigEncoding : int { 
		[CCode (cname = "onigenc_strlen", cheader_filename = "oniguruma.h")]
		public int strlen(char* str, char* end);
		[CCode (cname = "onigenc_strlen_null", cheader_filename = "oniguruma.h")]
		public int strlen_null(char* str);
	}

	[CCode (cname="OnigSyntaxType")]
	public struct OnigSyntaxType {
		[CCode (cname = "onig_set_syntax_op2", cheader_filename = "oniguruma.h")]
		public void set_op2(uint op2);
		[CCode (cname = "onig_get_syntax_op2", cheader_filename = "oniguruma.h")]
		public uint get_op2();
	}

	[CCode (cname="UChar")]
	public struct UChar : char { }

	namespace Option {
		[CCode (cname = "ONIG_OPTION_NONE", cheader_filename = "oniguruma.h")]
		public const OnigOptionType NONE;
		[CCode (cname = "ONIG_OPTION_IGNORECASE", cheader_filename = "oniguruma.h")]
    public const OnigOptionType IGNORECASE;
		[CCode (cname = "ONIG_OPTION_EXTEND", cheader_filename = "oniguruma.h")]
		public const OnigOptionType EXTEND;
		[CCode (cname = "ONIG_OPTION_MULTILINE", cheader_filename = "oniguruma.h")]
		public const OnigOptionType MULTILINE;
		[CCode (cname = "ONIG_OPTION_SINGLELINE", cheader_filename = "oniguruma.h")]
		public const OnigOptionType SINGLELINE;
		[CCode (cname = "ONIG_OPTION_FIND_LONGEST", cheader_filename = "oniguruma.h")]
		public const OnigOptionType FIND_LONGEST;
		[CCode (cname = "ONIG_OPTION_FIND_NOT_EMPTY", cheader_filename = "oniguruma.h")]
		public const OnigOptionType FIND_NOT_EMPTY;
		[CCode (cname = "ONIG_OPTION_NEGATE_SINGLELINE", cheader_filename = "oniguruma.h")]
		public const OnigOptionType NEGATE_SINGLELINE;
		[CCode (cname = "ONIG_OPTION_DONT_CAPTURE_GROUP", cheader_filename = "oniguruma.h")]
		public const OnigOptionType DONT_CAPTURE_GROUP;
		[CCode (cname = "ONIG_OPTION_CAPTURE_GROUP", cheader_filename = "oniguruma.h")]
		public const OnigOptionType CAPTURE_GROUP;
		[CCode (cname = "ONIG_OPTION_NOTBOL", cheader_filename = "oniguruma.h")]
		public const OnigOptionType NOTBOL;
		[CCode (cname = "ONIG_OPTION_NOTEOL", cheader_filename = "oniguruma.h")]
		public const OnigOptionType NOTEOL;
		[CCode (cname = "ONIG_OPTION_POSIX_REGION", cheader_filename = "oniguruma.h")]
		public const OnigOptionType POSIX_REGION;
		[CCode (cname = "ONIG_OPTION_MAXBIT", cheader_filename = "oniguruma.h")]
		public const OnigOptionType MAXBIT;
		[CCode (cname = "ONIG_OPTION_DEFAULT", cheader_filename = "oniguruma.h")]
		public const OnigOptionType DEFAULT;
	}

	namespace Encoding {
		[CCode (cname = "ONIG_ENCODING_ASCII", cheader_filename = "oniguruma.h")]
		public const OnigEncoding ASCII;
		// public const OnigEncoding ONIG_ENCODING_ISO_8859_1;
		// public const OnigEncoding ONIG_ENCODING_ISO_8859_2;
		// public const OnigEncoding ONIG_ENCODING_ISO_8859_3;
		// public const OnigEncoding ONIG_ENCODING_ISO_8859_4;
		// public const OnigEncoding ONIG_ENCODING_ISO_8859_5;
		// public const OnigEncoding ONIG_ENCODING_ISO_8859_6;
		// public const OnigEncoding ONIG_ENCODING_ISO_8859_7;
		// public const OnigEncoding ONIG_ENCODING_ISO_8859_8;
		// public const OnigEncoding ONIG_ENCODING_ISO_8859_9;
		// public const OnigEncoding ONIG_ENCODING_ISO_8859_10;
		// public const OnigEncoding ONIG_ENCODING_ISO_8859_11;
		// public const OnigEncoding ONIG_ENCODING_ISO_8859_13;
		// public const OnigEncoding ONIG_ENCODING_ISO_8859_14;
		// public const OnigEncoding ONIG_ENCODING_ISO_8859_15;
		// public const OnigEncoding ONIG_ENCODING_ISO_8859_16;
		[CCode (cname = "ONIG_ENCODING_UTF8", cheader_filename = "oniguruma.h")]
		public const OnigEncoding UTF8;
		// public const OnigEncoding ONIG_ENCODING_UTF16_BE;
		// public const OnigEncoding ONIG_ENCODING_UTF16_LE;
		// public const OnigEncoding ONIG_ENCODING_UTF32_BE;
		// public const OnigEncoding ONIG_ENCODING_UTF32_LE;
		// public const OnigEncoding ONIG_ENCODING_EUC_JP;
		// public const OnigEncoding ONIG_ENCODING_EUC_TW;
		// public const OnigEncoding ONIG_ENCODING_EUC_KR;
		// public const OnigEncoding ONIG_ENCODING_EUC_CN;
		// public const OnigEncoding ONIG_ENCODING_SJIS;
		// public const OnigEncoding ONIG_ENCODING_KOI8_R;
		// public const OnigEncoding ONIG_ENCODING_CP1251;
		// public const OnigEncoding ONIG_ENCODING_BIG5;
		// public const OnigEncoding ONIG_ENCODING_GB18030;
	}

	namespace Syntax {
		// public const OnigSyntaxType ONIG_SYNTAX_ASIS;
		// public const OnigSyntaxType ONIG_SYNTAX_POSIX_BASIC;
		// public const OnigSyntaxType ONIG_SYNTAX_POSIX_EXTENDED;
		// public const OnigSyntaxType ONIG_SYNTAX_EMACS;
		// public const OnigSyntaxType ONIG_SYNTAX_GREP;
		// public const OnigSyntaxType ONIG_SYNTAX_GNU_REGEX;
		// public const OnigSyntaxType ONIG_SYNTAX_JAVA;
		// public const OnigSyntaxType ONIG_SYNTAX_PERL;
		// public const OnigSyntaxType ONIG_SYNTAX_PERL_NG;
		// public const OnigSyntaxType ONIG_SYNTAX_RUBY;
		//[CCode (cname = "ONIG_SYNTAX_DEFAULT", cheader_filename = "oniguruma.h")]
		//public const OnigSyntaxType* DEFAULT;
		
		[CCode (cname = "onig_copy_syntax", cheader_filename = "oniguruma.h")]
		public static void copy(OnigSyntaxType* to, OnigSyntaxType* from);

		namespace Op2 {
			// public const int ONIG_SYN_OP2_ESC_CAPITAL_Q_QUOTE;
			// public const int ONIG_SYN_OP2_QMARK_GROUP_EFFECT;
			// public const int ONIG_SYN_OP2_OPTION_PERL;       
			// public const int ONIG_SYN_OP2_OPTION_RUBY;       
			// public const int ONIG_SYN_OP2_PLUS_POSSESSIVE_REPEAT;
			// public const int ONIG_SYN_OP2_PLUS_POSSESSIVE_INTERVAL;
			// public const int ONIG_SYN_OP2_CCLASS_SET_OP;           
			// public const int ONIG_SYN_OP2_QMARK_LT_NAMED_GROUP;    
			// public const int ONIG_SYN_OP2_ESC_K_NAMED_BACKREF;     
			// public const int ONIG_SYN_OP2_ESC_G_SUBEXP_CALL;   
			[CCode (cname = "ONIG_SYN_OP2_ATMARK_CAPTURE_HISTORY", cheader_filename = "oniguruma.h")]    
			public const uint ATMARK_CAPTURE_HISTORY;  
			// public const int ONIG_SYN_OP2_ESC_CAPITAL_C_BAR_CONTROL;
			// public const int ONIG_SYN_OP2_ESC_CAPITAL_M_BAR_META;   
			// public const int ONIG_SYN_OP2_ESC_V_VTAB;               
			// public const int ONIG_SYN_OP2_ESC_U_HEX4;               
			// public const int ONIG_SYN_OP2_ESC_GNU_BUF_ANCHOR;       
			// public const int ONIG_SYN_OP2_ESC_P_BRACE_CHAR_PROPERTY;
			// public const int ONIG_SYN_OP2_ESC_P_BRACE_CIRCUMFLEX_NOT;
			// public const int ONIG_SYN_OP2_CHAR_PROPERTY_PREFIX_IS;   
			// public const int ONIG_SYN_OP2_ESC_H_XDIGIT;              
			// public const int ONIG_SYN_OP2_INEFFECTIVE_ESCAPE;        

		}
	}

	[CCode (cname = "OnigErrorInfo", cheader_filename = "oniguruma.h")]
	public struct OnigErrorInfo {
		public OnigEncoding enc;
		public UChar* par;
		public UChar* par_end;
	}


}
