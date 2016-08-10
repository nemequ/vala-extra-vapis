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
  /**
   * Flags to influence the behaviour of Augeas
   */
  [Flags]
  [CCode (cprefix = "AUG_")]
  public enum InitFlags {
    NONE,
    /**
    * Preserve originals of modified files with extension '.augsave'
    */
    SAVE_BACKUP,
    /**
    * Save changes into a new file with extension '.augnew'
    *
    * Does not overwrite the original file
    * and takes precedence over SAVE_BACKUP
    */
    SAVE_NEWFILE,
    /**
    * Type check lenses
    *
    * Since it can be an expensive operation this is not done by default
    */
    TYPE_CHECK,
    /**
    * Do not search the built in default directories for lenses
    */
    NO_STDINC,
    /**
    * Make save a no-op process, just show what would have changed
    */
    SAVE_NOOP,
    /**
    * Do not automatically load files associated with lenses on start up
    */
    NO_LOAD,
    /**
    * Do not automatically load all lenses found in the search paths on start up
    */
    NO_MODL_AUTOLOAD,
    /**
    * Load span positions for nodes related to a file
    */
    ENABLE_SPAN,
    /**
    * Do not automatically close when encountering an error during start up
    */
    NO_ERR_CLOSE,
    /**
    * Output a message when a lens is loaded, used by 'augparse --trace'
    */
    TRACE_MODULE_LOADING
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
