.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

loadkeys(1) — Linux manual page
===============================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `RESET                            |                                   |
| TO DEFAULT <#RESET_TO_DEFAULT>`__ |                                   |
| \|                                |                                   |
| `LOAD KERNE                       |                                   |
| L KEYMAP <#LOAD_KERNEL_KEYMAP>`__ |                                   |
| \|                                |                                   |
| `LOAD KERNEL ACCENT TAB           |                                   |
| LE <#LOAD_KERNEL_ACCENT_TABLE>`__ |                                   |
| \|                                |                                   |
| `LOAD KERNEL STRING TAB           |                                   |
| LE <#LOAD_KERNEL_STRING_TABLE>`__ |                                   |
| \|                                |                                   |
| `CREATE KERNEL SOURCE TABLE       |                                   |
|  <#CREATE_KERNEL_SOURCE_TABLE>`__ |                                   |
| \|                                |                                   |
| `CREATE BINARY                    |                                   |
| KEYMAP <#CREATE_BINARY_KEYMAP>`__ |                                   |
| \|                                |                                   |
| `UNICODE MODE <#UNICODE_MODE>`__  |                                   |
| \|                                |                                   |
| `                                 |                                   |
| OTHER OPTIONS <#OTHER_OPTIONS>`__ |                                   |
| \| `WARNING <#WARNING>`__ \|      |                                   |
| `FILES <#FILES>`__ \|             |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   LOADKEYS(1)              General Commands Manual             LOADKEYS(1)

NAME
-------------------------------------------------

::

          loadkeys - load keyboard translation tables


---------------------------------------------------------

::

          loadkeys [ -a --ascii ] [ -b --bkeymap ] [ -c --clearcompose ] [
          -C '<FILE>' | --console=<FILE> ] [ -d --default ] [ -h --help ] [
          -m --mktable ] [ -p --parse ] [ -q --quiet ] [ -s --clearstrings
          ] [ -u --unicode ] [ -v --verbose ] [ -V --version ] [
          filename...  ]


---------------------------------------------------------------

::

          The program loadkeys reads the file or files specified by
          filename....  Its main purpose is to load the kernel keymap for
          the console.  You can specify console device by the -C (or
          --console ) option.


-------------------------------------------------------------------------

::

          If the -d (or --default ) option is given, loadkeys loads a
          default keymap, probably the file defkeymap.map either in
          @DATADIR@/keymaps or in /usr/src/linux/drivers/char.  (Probably
          the former was user-defined, while the latter is a qwerty
          keyboard map for PCs - maybe not what was desired.)  Sometimes,
          with a strange keymap loaded (with the minus on some obscure
          unknown modifier combination) it is easier to type `loadkeys
          defkeymap'.


-----------------------------------------------------------------------------

::

          The main function of loadkeys is to load or modify the keyboard
          driver's translation tables.  When specifying the file names,
          standard input can be denoted by dash (-). If no file is
          specified, the data is read from the standard input.

          For many countries and keyboard types appropriate keymaps are
          available already, and a command like `loadkeys uk' might do what
          you want. On the other hand, it is easy to construct one's own
          keymap. The user has to tell what symbols belong to each key. She
          can find the keycode for a key by use of showkey(1), while the
          keymap format is given in keymaps(5) and can also be seen from
          the output of dumpkeys(1).


-----------------------------------------------------------------------------------------

::

          If the input file does not contain any compose key definitions,
          the kernel accent table is left unchanged, unless the -c (or
          --clearcompose ) option is given, in which case the kernel accent
          table is emptied.  If the input file does contain compose key
          definitions, then all old definitions are removed, and replaced
          by the specified new entries.  The kernel accent table is a
          sequence of (by default 68) entries describing how dead
          diacritical signs and compose keys behave.  For example, a line

                 compose ',' 'c' to ccedilla

          means that <ComposeKey><,><c> must be combined to <ccedilla>.
          The current content of this table can be see using `dumpkeys
          --compose-only'.


-----------------------------------------------------------------------------------------

::

          The option -s (or --clearstrings ) clears the kernel string
          table. If this option is not given, loadkeys will only add or
          replace strings, not remove them.  (Thus, the option -s is
          required to reach a well-defined state.)  The kernel string table
          is a sequence of strings with names like F31. One can make
          function key F5 (on an ordinary PC keyboard) produce the text
          `Hello!', and Shift+F5 `Goodbye!' using lines

                 keycode 63 = F70 F71
                 string F70 = "Hello!"
                 string F71 = "Goodbye!"

          in the keymap.  The default bindings for the function keys are
          certain escape sequences mostly inspired by the VT100 terminal.


---------------------------------------------------------------------------------------------

::

          If the -m (or --mktable ) option is given loadkeys prints to the
          standard output a file that may be used as /usr/src/linux‐
          /drivers/char/defkeymap.c, specifying the default key bindings
          for a kernel (and does not modify the current keymap).


---------------------------------------------------------------------------------

::

          If the -b (or --bkeymap ) option is given loadkeys prints to the
          standard output a file that may be used as a binary keymap as
          expected by Busybox loadkmap command (and does not modify the
          current keymap).


-----------------------------------------------------------------

::

          loadkeys automatically detects whether the console is in Unicode
          or ASCII (XLATE) mode.  When a keymap is loaded, literal keysyms
          (such as section) are resolved accordingly; numerical keysyms are
          converted to fit the current console mode, regardless of the way
          they are specified (decimal, octal, hexadecimal or Unicode).

          The -u (or --unicode) switch forces loadkeys to convert all
          keymaps to Unicode.  If the keyboard is in a non-Unicode mode,
          such as XLATE, loadkeys will change it to Unicode for the time of
          its execution.  A warning message will be printed in this case.

          It is recommended to run kbd_mode(1) before loadkeys instead of
          using the -u option.


-------------------------------------------------------------------

::

          -a --ascii
                 Force conversion to ASCII.

          -h --help
                 loadkeys prints its version number and a short usage
                 message to the programs standard error output and exits.

          -p --parse
                 loadkeys searches and parses keymap without action.

          -q --quiet
                 loadkeys suppresses all normal output.

          -V --version
                 loadkeys prints version number and exits.


-------------------------------------------------------

::

          Note that anyone having read access to /dev/console can run
          loadkeys and thus change the keyboard layout, possibly making it
          unusable. Note that the keyboard translation table is common for
          all the virtual consoles, so any changes to the keyboard bindings
          affect all the virtual consoles simultaneously.

          Note that because the changes affect all the virtual consoles,
          they also outlive your session. This means that even at the login
          prompt the key bindings may not be what the user expects.


---------------------------------------------------

::

          @DATADIR@/keymaps
                 default directory for keymaps.

          /usr/src/linux/drivers/char/defkeymap.map
                 default kernel keymap.


---------------------------------------------------------

::

          dumpkeys(1), keymaps(5)

COLOPHON
---------------------------------------------------------

::

          This page is part of the kbd (Linux keyboard tools) project.
          Information about the project can be found at 
          ⟨http://www.kbd-project.org/⟩.  If you have a bug report for this
          manual page, send it to kbd@lists.altlinux.org.  This page was
          obtained from the project's upstream Git repository
          ⟨https://github.com/legionus/kbd.git⟩ on 2021-08-27.  (At that
          time, the date of the most recent commit that was found in the
          repository was 2021-07-04.)  If you discover any rendering
          problems in this HTML version of the page, or you believe there
          is a better or more up-to-date source for the page, or you have
          corrections or improvements to the information in this COLOPHON
          (which is not part of the original manual page), send a mail to
          man-pages@man7.org

   kbd                            6 Feb 1994                    LOADKEYS(1)

--------------

Pages that refer to this page:
`dumpkeys(1) <../man1/dumpkeys.1.html>`__, 
`kbd_mode(1) <../man1/kbd_mode.1.html>`__, 
`localectl(1) <../man1/localectl.1.html>`__, 
`setleds(1) <../man1/setleds.1.html>`__, 
`setmetamode(1) <../man1/setmetamode.1.html>`__, 
`showkey(1) <../man1/showkey.1.html>`__, 
`unicode_start(1) <../man1/unicode_start.1.html>`__, 
`ioctl_console(2) <../man2/ioctl_console.2.html>`__, 
`reboot(2) <../man2/reboot.2.html>`__, 
`keymaps(5) <../man5/keymaps.5.html>`__, 
`vconsole.conf(5) <../man5/vconsole.conf.5.html>`__, 
`setkeycodes(8) <../man8/setkeycodes.8.html>`__, 
`systemd-localed.service(8) <../man8/systemd-localed.service.8.html>`__, 
`systemd-vconsole-setup.service(8) <../man8/systemd-vconsole-setup.service.8.html>`__

--------------

--------------

.. container:: footer

   +-----------------------+-----------------------+-----------------------+
   | HTML rendering        |                       | |Cover of TLPI|       |
   | created 2021-08-27 by |                       |                       |
   | `Michael              |                       |                       |
   | Ker                   |                       |                       |
   | risk <https://man7.or |                       |                       |
   | g/mtk/index.html>`__, |                       |                       |
   | author of `The Linux  |                       |                       |
   | Programming           |                       |                       |
   | Interface <https:     |                       |                       |
   | //man7.org/tlpi/>`__, |                       |                       |
   | maintainer of the     |                       |                       |
   | `Linux man-pages      |                       |                       |
   | project <             |                       |                       |
   | https://www.kernel.or |                       |                       |
   | g/doc/man-pages/>`__. |                       |                       |
   |                       |                       |                       |
   | For details of        |                       |                       |
   | in-depth **Linux/UNIX |                       |                       |
   | system programming    |                       |                       |
   | training courses**    |                       |                       |
   | that I teach, look    |                       |                       |
   | `here <https://ma     |                       |                       |
   | n7.org/training/>`__. |                       |                       |
   |                       |                       |                       |
   | Hosting by `jambit    |                       |                       |
   | GmbH                  |                       |                       |
   | <https://www.jambit.c |                       |                       |
   | om/index_en.html>`__. |                       |                       |
   +-----------------------+-----------------------+-----------------------+

--------------

.. container:: statcounter

   |Web Analytics Made Easy - StatCounter|

.. |Cover of TLPI| image:: https://man7.org/tlpi/cover/TLPI-front-cover-vsmall.png
   :target: https://man7.org/tlpi/
.. |Web Analytics Made Easy - StatCounter| image:: https://c.statcounter.com/7422636/0/9b6714ff/1/
   :class: statcounter
   :target: https://statcounter.com/
