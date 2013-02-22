/* magic.vapi
 *
 * Copyright (C) 2012 Nikolay Orlyuk
 *
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
 *
 * Author:
 * 	Nikolay Orlyuk <virkony@gmail.com>
 */

namespace Magic {
    [SimpleType]
    [CCode (cname = "magic_t", destroy_function = "magic_close", lower_case_cprefix = "magic_", cheader_filename = "magic.h")]
    public struct Magic {
        [CCode (cname = "magic_open")]
        public Magic(Flags flags = Flags.NONE);
        public string? error {
            [CCode (cname = "magic_error")]
            get;
        }
        public int errno {
            [CCode (cname = "magic_errno")]
            get;
        }

        public unowned string? descriptor(int fd);
        public unowned string? file(string filename);
        public unowned string? buffer(uint8[]? buffer);
        public int flags {
            [CCode (cname = "magic_setflags")]
            set;
        }

        public int check(string filename);
        public int compile(string filename);
        public int list(string filename);
        public int load(string? filename = null);
    }

    [Flags]
    [CCode (cprefix = "MAGIC_", cname = "int")]
    public enum Flags {
        NONE, /* No flags */
        DEBUG, /* Turn on debugging */
        SYMLINK, /* Follow symlinks */
        COMPRESS, /* Check inside compressed files */
        DEVICES, /* Look at the contents of devices */
        MIME_TYPE, /* Return the MIME type */
        CONTINUE, /* Return all matches */
        CHECK, /* Print warnings to stderr */
        PRESERVE_ATIME, /* Restore access time on exit */
        RAW, /* Don't translate unprintable chars */
        ERROR, /* Handle ENOENT etc as real errors */
        MIME_ENCODING, /* Return the MIME encoding */
        MIME,
        APPLE, /* Return the Apple creator and type */

        NO_CHECK_COMPRESS, /* Don't check for compressed files */
        NO_CHECK_TAR, /* Don't check for tar files */
        NO_CHECK_SOFT, /* Don't check magic entries */
        NO_CHECK_APPTYPE, /* Don't check application type */
        NO_CHECK_ELF, /* Don't check for elf details */
        NO_CHECK_TEXT, /* Don't check for text files */
        NO_CHECK_CDF, /* Don't check for cdf files */
        NO_CHECK_TOKENS, /* Don't check tokens */
        NO_CHECK_ENCODING, /* Don't check text encodings */

        NO_CHECK_BUILTIN
    }
}
