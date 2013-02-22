/* tcc Vala Bindings
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

[CCode (lower_case_cprefix = "tcc_", cheader_filename = "libtcc.h")]
namespace TCC {

	public enum OutputType {
		MEMORY,
		EXE,
		DLL,
		OBJ,
		PREPROCESS
	}
	
	[CCode (instance_pos=0.9)]
	public delegate void ErrorFunction (string msg);

	[Compact]
	[CCode (cprefix="tcc_",free_function="tcc_delete")]
	public class State {
		[CCode (cname = "tcc_new")]
		public State ();
		
		public void enable_debug ();
		public void set_error_func([CCode (delegate_target_pos=0.9)] ErrorFunction error_func);
		
		/* preprocessor */
		public int add_include_path (string pathname);
		public int add_sysinclude_path (string pathname);
		public void define_symbol (string sym, string val);
		public void undefine_symbol (string sym);
		
		/* compiler */
		public int add_file (string filename);
		public int compile_string (string buf);
		
		/* linking */
		public int set_output_type (OutputType type);
		
		public int add_library_path (string pathname);
		public int add_library (string libraryname);
		public int add_symbol (string name, void* val);
		public int output_file (string filename);
		public int run ([CCode (array_length_pos="-1")] string[]? argv);
		public int relocate (void* ptr);
		public void* get_symbol (string name);
		public void set_lib_path (string path);
	}

}
