/*-
 * Copyright (c) 2010-2013 Giulio Paci <giuliopaci@gmail.com>
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

[CCode (cprefix = "uchardet_", lower_case_cprefix = "uchardet_")]
namespace UcharDet {
	[Compact]
	[CCode (cname="uchardet_t",cheader_filename = "uchardet/uchardet.h", free_function="uchardet_delete")]
	public class Classifier {
		[CCode (cname = "uchardet_new", cheader_filename = "uchardet/uchardet.h")]
		public Classifier ();
		[CCode (cname = "uchardet_handle_data", cheader_filename = "uchardet/uchardet.h")]
		public int handle_data ([CCode (array_length_type = "size_t")] uint8[] buffer);
		[CCode (cname = "uchardet_data_end", cheader_filename = "uchardet/uchardet.h")]
		public void data_end ();
		[CCode (cname = "uchardet_reset", cheader_filename = "uchardet/uchardet.h")]
		public void reset ();
		[CCode (cname = "uchardet_get_charset", cheader_filename = "uchardet/uchardet.h")]
		public unowned string get_charset();
	}
}
