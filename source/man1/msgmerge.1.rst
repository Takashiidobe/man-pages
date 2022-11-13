.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

msgmerge(1) — Linux manual page
===============================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `AUTHOR <#AUTHOR>`__ \|           |                                   |
| `RE                               |                                   |
| PORTING BUGS <#REPORTING_BUGS>`__ |                                   |
| \| `COPYRIGHT <#COPYRIGHT>`__ \|  |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   MSGMERGE(1)                   User Commands                  MSGMERGE(1)

NAME
-------------------------------------------------

::

          msgmerge - merge message catalog and template


---------------------------------------------------------

::

          msgmerge [OPTION] def.po ref.pot


---------------------------------------------------------------

::

          Merges two Uniforum style .po files together.  The def.po file is
          an existing PO file with translations which will be taken over to
          the newly created file as long as they still match; comments will
          be preserved, but extracted comments and file positions will be
          discarded.  The ref.pot file is the last created PO file with
          up-to-date source references but old translations, or a PO
          Template file (generally created by xgettext); any translations
          or comments in the file will be discarded, however dot comments
          and file positions will be preserved.  Where an exact match
          cannot be found, fuzzy matching is used to produce better
          results.

          Mandatory arguments to long options are mandatory for short
          options too.

      Input file location:
          def.po translations referring to old sources

          ref.pot
                 references to new sources

          -D, --directory=DIRECTORY
                 add DIRECTORY to list for input files search

          -C, --compendium=FILE
                 additional library of message translations, may be
                 specified more than once

      Operation mode:
          -U, --update
                 update def.po, do nothing if def.po already up to date

      Output file location:
          -o, --output-file=FILE
                 write output to specified file

          The results are written to standard output if no output file is
          specified or if it is -.

          Output file location in update mode: The result is written back
          to def.po.

          --backup=CONTROL
                 make a backup of def.po

          --suffix=SUFFIX
                 override the usual backup suffix

          The version control method may be selected via the --backup
          option or through the VERSION_CONTROL environment variable.  Here
          are the values:

          none, off
                 never make backups (even if --backup is given)

          numbered, t
                 make numbered backups

          existing, nil
                 numbered if numbered backups exist, simple otherwise

          simple, never
                 always make simple backups

          The backup suffix is '~', unless set with --suffix or the
          SIMPLE_BACKUP_SUFFIX environment variable.

      Operation modifiers:
          -m, --multi-domain
                 apply ref.pot to each of the domains in def.po

          --for-msgfmt
                 produce output for 'msgfmt', not for a translator

          -N, --no-fuzzy-matching
                 do not use fuzzy matching

          --previous
                 keep previous msgids of translated messages

      Input file syntax:
          -P, --properties-input
                 input files are in Java .properties syntax

          --stringtable-input
                 input files are in NeXTstep/GNUstep .strings syntax

      Output details:
          --lang=CATALOGNAME
                 set 'Language' field in the header entry

          --color
                 use colors and other text attributes always

          --color=WHEN
                 use colors and other text attributes if WHEN.  WHEN may be
                 'always', 'never', 'auto', or 'html'.

          --style=STYLEFILE
                 specify CSS style rule file for --color

          -e, --no-escape
                 do not use C escapes in output (default)

          -E, --escape
                 use C escapes in output, no extended chars

          --force-po
                 write PO file even if empty

          -i, --indent
                 indented output style

          --no-location
                 suppress '#: filename:line' lines

          -n, --add-location
                 preserve '#: filename:line' lines (default)

          --strict
                 strict Uniforum output style

          -p, --properties-output
                 write out a Java .properties file

          --stringtable-output
                 write out a NeXTstep/GNUstep .strings file

          -w, --width=NUMBER
                 set output page width

          --no-wrap
                 do not break long message lines, longer than the output
                 page width, into several lines

          -s, --sort-output
                 generate sorted output

          -F, --sort-by-file
                 sort output by file location

      Informative output:
          -h, --help
                 display this help and exit

          -V, --version
                 output version information and exit

          -v, --verbose
                 increase verbosity level

          -q, --quiet, --silent
                 suppress progress indicators


-----------------------------------------------------

::

          Written by Peter Miller.


---------------------------------------------------------------------

::

          Report bugs in the bug tracker at
          <https://savannah.gnu.org/projects/gettext> or by email to
          <bug-gettext@gnu.org>.


-----------------------------------------------------------

::

          Copyright © 1995-2020 Free Software Foundation, Inc.  License
          GPLv3+: GNU GPL version 3 or later
          <https://gnu.org/licenses/gpl.html>
          This is free software: you are free to change and redistribute
          it.  There is NO WARRANTY, to the extent permitted by law.


---------------------------------------------------------

::

          The full documentation for msgmerge is maintained as a Texinfo
          manual.  If the info and msgmerge programs are properly installed
          at your site, the command

                 info msgmerge

          should give you access to the complete manual.

COLOPHON
---------------------------------------------------------

::

          This page is part of the gettext (message translation) project.
          Information about the project can be found at 
          ⟨http://www.gnu.org/software/gettext/⟩.  If you have a bug report
          for this manual page, see
          ⟨http://savannah.gnu.org/projects/gettext/⟩.  This page was
          obtained from the tarball gettext-0.21.tar.gz fetched from
          ⟨https://ftp.gnu.org/gnu/gettext/⟩ on 2021-08-27.  If you
          discover any rendering problems in this HTML version of the page,
          or you believe there is a better or more up-to-date source for
          the page, or you have corrections or improvements to the
          information in this COLOPHON (which is not part of the original
          manual page), send a mail to man-pages@man7.org

   GNU gettext-tools 20200704      July 2020                    MSGMERGE(1)

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
