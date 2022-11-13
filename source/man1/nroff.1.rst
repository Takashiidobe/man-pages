.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

nroff(1) — Linux manual page
============================

+-----------------------------------+-----------------------------------+
| `Name <#Name>`__ \|               |                                   |
| `Synopsis <#Synopsis>`__ \|       |                                   |
| `Description <#Description>`__ \| |                                   |
| `Exit status <#Exit_status>`__ \| |                                   |
| `Environment <#Environment>`__ \| |                                   |
| `Files <#Files>`__ \|             |                                   |
| `Notes <#Notes>`__ \|             |                                   |
| `See also <#See_also>`__ \|       |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   nroff(1)                 General Commands Manual                nroff(1)


-------------------------------------------------

::

          nroff - format documents with groff for TTY (terminal) devices


---------------------------------------------------------

::

          nroff [-bcCEhikpStUVz] [-d cs] [-d name=string] [-K enc]
                [-m name] [-M dir] [-n num] [-o list] [-P arg] [-r cn]
                [-r reg=expr] [-T dev] [-w name] [-W name] [file ...]

          nroff --help

          nroff -v
          nroff --version


---------------------------------------------------------------

::

          nroff formats documents written in the roff(7) language for
          typewriter-like devices such as terminal emulators.  GNU nroff
          emulates the AT&T nroff command using groff(1).  nroff generates
          output via grotty(1), groff's terminal output driver, which needs
          to know the character encoding scheme used by the device.
          Consequently, acceptable arguments to the -T option are ascii,
          latin1, utf8, and cp1047; any others are ignored.  If neither the
          GROFF_TYPESETTER environment variable nor the -T command-line
          option (which overrides the environment variable) specifies a
          (valid) device, nroff consults the locale to select an
          appropriate output device.  It first tries the locale(1) program,
          then checks several locale-related environment variables; see
          section “Environment”, below.  If all of the foregoing fail,
          -Tascii is implied.

          The -b, -c, -C, -d, -E, -i, -m, -M, -n, -o, -r, -U, -w, -W, and
          -z options have the effects described in troff(1).  -c and -h
          imply “-P-c” and “-P-h”, respectively; -c is also interpreted
          directly by troff.  In addition, this implementation ignores the
          AT&T nroff options -e, -q, and -s (which are not implemented in
          groff).  The options -k, -K, -p, -P, -t, and -S are documented in
          groff(1).  -V causes nroff to display the constructed groff
          command on the standard output stream, but does not execute it.
          -v and --version show version information about nroff and the
          programs it runs, while --help displays a usage message; all exit
          afterward.


---------------------------------------------------------------

::

          nroff exits with error status 2 if there was a problem parsing
          its arguments, with status 0 if any of the options -V, -v,
          --version, or --help were specified, and with the status of groff
          otherwise.


---------------------------------------------------------------

::

          GROFF_BIN_PATH
                 is a colon-separated list of directories in which to
                 search for the groff executable before searching in PATH.
                 If unset, /usr/local/bin is used.

          GROFF_TYPESETTER
                 specifies the default output device for groff.

          LC_ALL
          LC_CTYPE
          LANG
          LESSCHARSET
                 are pattern-matched in this order for contents matching
                 standard character encodings supported by groff in the
                 event no -T option is given and GROFF_TYPESETTER is unset.


---------------------------------------------------

::

          /usr/local/share/groff/1.23.0/tmac/tty-char.tmac
                 Character definitions from this file are loaded to replace
                 unrepresentable glyphs.


---------------------------------------------------

::

          Pager programs like more(1) and less(1) may require command-line
          options to correctly handle some output sequences; see grotty(1).


---------------------------------------------------------

::

          groff(1), troff(1), grotty(1), locale(1), roff(7)

COLOPHON
---------------------------------------------------------

::

          This page is part of the groff (GNU troff) project.  Information
          about the project can be found at 
          ⟨http://www.gnu.org/software/groff/⟩.  If you have a bug report
          for this manual page, see ⟨http://www.gnu.org/software/groff/⟩.
          This page was obtained from the project's upstream Git repository
          ⟨https://git.savannah.gnu.org/git/groff.git⟩ on 2021-08-27.  (At
          that time, the date of the most recent commit that was found in
          the repository was 2021-08-23.)  If you discover any rendering
          problems in this HTML version of the page, or you believe there
          is a better or more up-to-date source for the page, or you have
          corrections or improvements to the information in this COLOPHON
          (which is not part of the original manual page), send a mail to
          man-pages@man7.org

   groff 1.23.0.rc1.654-4e1db-dir1t9yAugust 2021                     nroff(1)

--------------

Pages that refer to this page: `col(1) <../man1/col.1.html>`__, 
`colcrt(1) <../man1/colcrt.1.html>`__, 
`gdiffmk(1) <../man1/gdiffmk.1.html>`__, 
`man(1) <../man1/man.1.html>`__,  `ul(1) <../man1/ul.1.html>`__, 
`zsoelim(1) <../man1/zsoelim.1.html>`__, 
`roff(7) <../man7/roff.7.html>`__

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
