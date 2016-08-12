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

/**
 * A configuration file editing tool
 *
 * Augeas parses a configuration file in its native format using a "lens" and
 * transforms it into a tree. Configuration changes are made by manipulating
 * this tree and saving it back into the native configuration file.
 *
 *  * ''Home'': [[http://augeas.net/]]
 *  * ''C-Documentation'': [[http://augeas.net/docs/references/c_api/files/augeas-h.html]]
 *
 * == Loading a Configuration File into the Tree ==
 *
 * The following example uses a //hosts// file. A hosts file maps network host
 * names to Internet Protocol (IP) addresses. For Unix systems this is usually
 * located at /etc/hosts
 * {{{
 * void main () {
 *    var tree = new Augeas.Tree ();
 *    tree.transform ("hosts", "/etc/hosts");
 *    tree.load ();
 *    tree.print ();
 * }
 * }}}
 * The example creates an instance of Augeas.Tree and then adds a transform to
 * the tree using the "hosts" lens for the file "/etc/hosts". A tree can
 * have many transforms. There are also many lenses available for parsing
 * different types of configuration files. The Augeas website has a list of
 * [[http://augeas.net/stock_lenses.html|stock lenses]].
 *
 * The configuration file is then loaded in to the tree using the specified
 * lens. The print () call shows how the tree is structured with the
 * transformed configuration file.
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

/**
 * Initialize the library.
 *
 * The Vala binding uses InitFlags.NO_MOD_AUTOLOAD as the default flag to make
 * a quick initialization of the library. Otherwise the library can take several
 * seconds to initialize because it will load all lenses and any corresponding
 * files marked for auto-loading. With InitFlags.NO_MOD_AUTOLOAD
 * //transform ()// and //load ()// need to be used to identify the lens and
 * configuration file to load.
 *
 * @param root the filesystem root. If ROOT is NULL, use the value
 * of the environment variable AUGEAS_ROOT.  If that doesn’t exist, use "/".
 * @param loadpath a colon-separated list of directories that modules should
 * be searched in.  This is in addition to the standard load path and the
 * directories in AUGEAS_LENS_LIB
 * @param flags a bitmask made up of values from InitFlags. The flag
 * InitFlags.NO_ERR_CLOSE can be used to get more information on why
 * initialization failed. If it is set in flags, the caller must check that
 * //error ()// returns ErrorCode.NOERROR before using the returned augeas
 * handle for any other operation. If the handle reports any error, the caller
 * should only call the //error// functions and //close ()// on this handle.
 * @return a handle to the Augeas tree upon success.  If initialization fails,
 * returns NULL if InitFlags.NO_ERR_CLOSE is not set in //flags//.  If
 * InitFlags.NO_ERR_CLOSE is set, might return an Augeas handle even on
 * failure. In that case, caller must check for errors using //error ()//, and,
 * if an error is reported, only use the handle with the //error// functions
 * and //close ()//.
 */
    [CCode (cname = "aug_init")]
    public Tree (string? root = null, string? loadpath = null, InitFlags flags = InitFlags.NO_MODL_AUTOLOAD);

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

/**
 * Load files into the tree.
 *
 * Which files to load and which lenses to use on them is specified under
 * /augeas/load in the tree. Each entry /augeas/load/NAME specifies a
 * "transform", having exactly one child "lens" and any number of children
 * labelled //incl// and //excl//. The value of NAME has no meaning.
 *
 * The //lens// grandchild of /augeas/load specifies which lens to use, and can
 * either be the fully qualified name of a lens 'module.lns' or 'module'.
 * The latter form means that the lens from the transform marked for
 * autoloading in MODULE should be used.
 *
 * The //incl// and //excl// grandchildren of /augeas/load indicate which files
 * to transform. Their value are used as glob patterns. Any file that matches
 * at least one 'incl' pattern and no 'excl' pattern is transformed. The order
 * of //incl// and //excl// entries is irrelevant.
 *
 * Before loading any files, //load ()// will remove everything underneath
 * /augeas/files and /files, regardless of whether any entries have been
 * modified or not.
 *
 * @return 0 on success, -1 on error.  Note that success includes the case
 * where some files could not be loaded. Details of such files can be found
 * under /augeas/ /error
 */
    public int load ();
#if POSIX
    public int print (string path = "/*", [CCode (pos = 0.5)] Posix.FILE output = Posix.stdout);
    public int srun (string command = "help", [CCode (pos = 0.5)] Posix.FILE output = Posix.stdout);
#else

/**
 * Print each node matching //path// and its descendants to //output//.
 *
 * @param path path expression, default is all nodes "/*"
 * @param output file to send output to, default is STDOUT
 * @return 0 on success, or a negative value on failure
 */
    public int print (string path = "/*", [CCode (pos = 0.5)] GLib.FileStream output = GLib.stdout);

/**
 * Run one or more newline separated commands.
 *
 * The output of the commands will be printed to //output//.  Running just 'help'
 * will print the available commands.  Commands accepted by this are identical
 * to those augtool accepts.
 * @param command one or more newline separated commands, default is 'help'
 * @param output file to send output to, default is STDOUT
 * @return the number of executed commands on success, -1 on failure, and -2
 * if a 'quit' command was encountered
 */
    public int srun (string command = "help", [CCode (pos = 0.5)] GLib.FileStream output = GLib.stdout);

#endif
    public void close ();

    public int to_xml (string path, out Xml.Node doc, uint flags = 0);

/**
 * Add a transform using //lens// for //file//.
 *
 * //excl// specifies if the file is to be included (0) or excluded (1) from
 * the lens.  The lens may be a module name or a full lens name.  If a module
 * name is given, then lns will be the lens assumed.
 * @param lens lens name
 * @param file file to transform
 * @param excl include file if 0, exclude file if 1
 * @return 1 on success, -1 on failure
 */
    public int transform (string lens, string file, int excl = 0);
    public ErrorCode error ();
    public string error_message ();
    public string error_minor_message ();
    public string error_details ();
  }
}
