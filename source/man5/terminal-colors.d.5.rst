.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

terminal-colors.d(5) — Linux manual page
========================================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `DEFAULT SCHEME FILES FORMAT      |                                   |
| <#DEFAULT_SCHEME_FILES_FORMAT>`__ |                                   |
| \| `ENVIRONMENT <#ENVIRONMENT>`__ |                                   |
| \| `FILES <#FILES>`__ \|          |                                   |
| `EXAMPLE <#EXAMPLE>`__ \|         |                                   |
| `                                 |                                   |
| COMPATIBILITY <#COMPATIBILITY>`__ |                                   |
| \|                                |                                   |
| `RE                               |                                   |
| PORTING BUGS <#REPORTING_BUGS>`__ |                                   |
| \|                                |                                   |
| `AVAILABILITY <#AVAILABILITY>`__  |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   TERMINAL-COLORS.D(5)          File formats          TERMINAL-COLORS.D(5)

NAME
-------------------------------------------------

::

          terminal-colors.d - configure output colorization for various
          utilities


---------------------------------------------------------

::

          /etc/terminal-colors.d/[[name][@term].][type]


---------------------------------------------------------------

::

          Files in this directory determine the default behavior for
          utilities when coloring output.

          The name is a utility name. The name is optional and when none is
          specified then the file is used for all unspecified utilities.

          The term is a terminal identifier (the TERM environment
          variable). The terminal identifier is optional and when none is
          specified then the file is used for all unspecified terminals.

          The type is a file type. Supported file types are:

          disable
              Turns off output colorization for all compatible utilities.

          enable
              Turns on output colorization; any matching disable files are
              ignored.

          scheme
              Specifies colors used for output. The file format may be
              specific to the utility, the default format is described
              below.

          If there are more files that match for a utility, then the file
          with the more specific filename wins. For example, the filename
          "@xterm.scheme" has less priority than "dmesg@xterm.scheme". The
          lowest priority are those files without a utility name and
          terminal identifier (e.g., "disable").

          The user-specific $XDG_CONFIG_HOME/terminal-colors.d or
          $HOME/.config/terminal-colors.d overrides the global setting.


-----------------------------------------------------------------------------------------------

::

          The following statement is recognized:

             name color-sequence

          The name is a logical name of color sequence (for example
          "error"). The names are specific to the utilities. For more
          details always see the COLORS section in the man page for the
          utility.

          The color-sequence is a color name, ASCII color sequences or
          escape sequences.

      Color names
          black, blink, blue, bold, brown, cyan, darkgray, gray, green,
          halfbright, lightblue, lightcyan, lightgray, lightgreen,
          lightmagenta, lightred, magenta, red, reset, reverse, and yellow.

      ANSI color sequences
          The color sequences are composed of sequences of numbers
          separated by semicolons. The most common codes are:

             ┌───┬───────────────────────┐
             │   │                       │
             │0  │ to restore default    │
             │   │ color                 │
             ├───┼───────────────────────┤
             │   │                       │
             │1  │ for brighter colors   │
             ├───┼───────────────────────┤
             │   │                       │
             │4  │ for underlined text   │
             ├───┼───────────────────────┤
             │   │                       │
             │5  │ for flashing text     │
             ├───┼───────────────────────┤
             │   │                       │
             │30 │ for black foreground  │
             ├───┼───────────────────────┤
             │   │                       │
             │31 │ for red foreground    │
             ├───┼───────────────────────┤
             │   │                       │
             │32 │ for green foreground  │
             ├───┼───────────────────────┤
             │   │                       │
             │33 │ for yellow (or brown) │
             │   │ foreground            │
             ├───┼───────────────────────┤
             │   │                       │
             │34 │ for blue foreground   │
             ├───┼───────────────────────┤
             │   │                       │
             │35 │ for purple foreground │
             ├───┼───────────────────────┤
             │   │                       │
             │36 │ for cyan foreground   │
             ├───┼───────────────────────┤
             │   │                       │
             │37 │ for white (or gray)   │
             │   │ foreground            │
             ├───┼───────────────────────┤
             │   │                       │
             │40 │ for black background  │
             ├───┼───────────────────────┤
             │   │                       │
             │41 │ for red background    │
             ├───┼───────────────────────┤
             │   │                       │
             │42 │ for green background  │
             ├───┼───────────────────────┤
             │   │                       │
             │43 │ for yellow (or brown) │
             │   │ background            │
             ├───┼───────────────────────┤
             │   │                       │
             │44 │ for blue background   │
             ├───┼───────────────────────┤
             │   │                       │
             │45 │ for purple background │
             ├───┼───────────────────────┤
             │   │                       │
             │46 │ for cyan background   │
             ├───┼───────────────────────┤
             │   │                       │
             │47 │ for white (or gray)   │
             │   │ background            │
             └───┴───────────────────────┘

      Escape sequences
          To specify control or blank characters in the color
          sequences, C-style \-escaped notation can be used:

             ┌─────┬──────────────────────┐
             │     │                      │
             │\a   │ Bell (ASCII 7)       │
             ├─────┼──────────────────────┤
             │     │                      │
             │\b   │ Backspace (ASCII 8)  │
             ├─────┼──────────────────────┤
             │     │                      │
             │\e   │ Escape (ASCII 27)    │
             ├─────┼──────────────────────┤
             │     │                      │
             │\f   │ Form feed (ASCII 12) │
             ├─────┼──────────────────────┤
             │     │                      │
             │\n   │ Newline (ASCII 10)   │
             ├─────┼──────────────────────┤
             │     │                      │
             │\r   │ Carriage Return      │
             │     │ (ASCII 13)           │
             ├─────┼──────────────────────┤
             │     │                      │
             │\t   │ Tab (ASCII 9)        │
             ├─────┼──────────────────────┤
             │     │                      │
             │\v   │ Vertical Tab (ASCII  │
             │     │ 11)                  │
             ├─────┼──────────────────────┤
             │     │                      │
             │\?   │ Delete (ASCII 127)   │
             ├─────┼──────────────────────┤
             │     │                      │
             │\_   │ Space                │
             ├─────┼──────────────────────┤
             │     │                      │
             │\\fP │ Backslash (\)        │
             ├─────┼──────────────────────┤
             │     │                      │
             │\^   │ Caret (^)            │
             ├─────┼──────────────────────┤
             │     │                      │
             │\#   │ Hash mark (#)        │
             └─────┴──────────────────────┘

          Please note that escapes are necessary to enter a
          space, backslash, caret, or any control character
          anywhere in the string, as well as a hash mark as the
          first character.

          For example, to use a red background for alert
          messages in the output of dmesg(1), use:

             echo 'alert 37;41' >>
             /etc/terminal-colors.d/dmesg.scheme

      Comments
          Lines where the first non-blank character is a #
          (hash) are ignored. Any other use of the hash
          character is not interpreted as introducing a
          comment.


---------------------------------------------------------------

::

          TERMINAL_COLORS_DEBUG=all
              enables debug output.


---------------------------------------------------

::

          $XDG_CONFIG_HOME/terminal-colors.d

          $HOME/.config/terminal-colors.d

          /etc/terminal-colors.d


-------------------------------------------------------

::

          Disable colors for all compatible utilities:

             touch /etc/terminal-colors.d/disable

          Disable colors for all compatible utils on a vt100
          terminal:

             touch /etc/terminal-colors.d/@vt100.disable

          Disable colors for all compatible utils except
          dmesg(1):

             touch /etc/terminal-colors.d/disable

             touch /etc/terminal-colors.d/dmesg.enable


-------------------------------------------------------------------

::

          The terminal-colors.d functionality is currently
          supported by all util-linux utilities which provides
          colorized output. For more details always see the
          COLORS section in the man page for the utility.


---------------------------------------------------------------------

::

          For bug reports, use the issue tracker at
          https://github.com/karelzak/util-linux/issues.


-----------------------------------------------------------------

::

          terminal-colors.d is part of the util-linux package
          which can be downloaded from Linux Kernel Archive
          <https://www.kernel.org/pub/linux/utils/util-linux/>.
          This page is part of the util-linux (a random
          collection of Linux utilities) project. Information
          about the project can be found at 
          ⟨https://www.kernel.org/pub/linux/utils/util-linux/⟩.
          If you have a bug report for this manual page, send
          it to util-linux@vger.kernel.org. This page was
          obtained from the project's upstream Git repository
          ⟨git://git.kernel.org/pub/scm/utils/util-linux/util-linux.git⟩
          on 2021-08-27. (At that time, the date of the most
          recent commit that was found in the repository was
          2021-08-24.) If you discover any rendering problems
          in this HTML version of the page, or you believe
          there is a better or more up-to-date source for the
          page, or you have corrections or improvements to the
          information in this COLOPHON (which is not part of
          the original manual page), send a mail to
          man-pages@man7.org

   util-linux 2.37.85-637cc       2021-04-02           TERMINAL-COLORS.D(5)

--------------

Pages that refer to this page: `cal(1) <../man1/cal.1.html>`__, 
`dmesg(1) <../man1/dmesg.1.html>`__, 
`hexdump(1) <../man1/hexdump.1.html>`__, 
`cfdisk(8) <../man8/cfdisk.8.html>`__, 
`fdisk(8) <../man8/fdisk.8.html>`__, 
`sfdisk(8) <../man8/sfdisk.8.html>`__

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
