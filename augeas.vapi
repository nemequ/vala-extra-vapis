/* augeas.vapi
 *
 * Copyright (C) 2010-2011  Fabian Deutsch
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
 *  Fabian Deutsch <fabian.deutsch@gmx.de>
 */

[CCode (cheader_filename = "augeas.h")]
namespace Augeas {
  [Flags]
  [CCode (cprefix = "AUG_")]
  public enum InitFlags {
    NONE,
    SAVE_BACKUP,
    SAVE_NEWFILE,
    TYPE_CHECK,
    NO_STDINC,
    SAVE_NOOP,
    NO_LOAD,
    NO_MODL_AUTOLOAD
  }

  [CCode (cprefix= "AUG_")]
  public enum ErrorCode
  {
    NOERROR,
    ENOMEM,
    EINTERNAL,
    EPATHX,
    ENOMATCH,
    EMMATCH,
    ESYNTAX,
    ENOLENS,
    EMXFM
  }

  [Compact]
  [CCode (cname = "augeas", cprefix = "aug_", free_function = "aug_close")]
  public class Tree {

    [CCode (cname = "aug_init")]
    public Tree (string? root = null, string? loadpath = null, InitFlags flags = InitFlags.NONE);

    public int defvar (string name, string? expr);
    public int defnode (string name, string expr, string val, out int created);

    public int get (string path, out unowned string? val);
    public int set (string path, string val);
    public int setm (string base, string sub, string val);
    public int insert (string path, string label, bool before);

    public int rm (string path);
    public int mv (string src, string dst);

    [CCode (cname = "aug_match")]
    int _match(string p, [CCode (array_length = false)] out string[]? matches);

    [CCode (cname = "vala_aug_match")]
    public string[]? match (string path)
    {
      string[] matches;
      int len = _match (path, out matches);
      if( matches != null ) matches.length = len;
      return matches;
    }

    public int save ();
    public int load ();
#if POSIX
    public int print (Posix.FILE fout, string path);
    public int srun (Posix.FILE fout, string path);
#else
    public int print (GLib.FileStream fout, string path);
    public int srun (GLib.FileStream fout, string path);
#endif
    public void close ();

    public int to_xml (string path, out Xml.Node doc, uint flags = 0);

    public ErrorCode error ();
    public string error_message ();
    public string error_minor_message ();
    public string error_details ();
  }
}
