.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

numfmt(1) — Linux manual page
=============================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `EXAMPLES <#EXAMPLES>`__ \|       |                                   |
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

   NUMFMT(1)                     User Commands                    NUMFMT(1)

NAME
-------------------------------------------------

::

          numfmt - Convert numbers from/to human-readable strings


---------------------------------------------------------

::

          numfmt [OPTION]... [NUMBER]...


---------------------------------------------------------------

::

          Reformat NUMBER(s), or the numbers from standard input if none
          are specified.

          Mandatory arguments to long options are mandatory for short
          options too.

          --debug
                 print warnings about invalid input

          -d, --delimiter=X
                 use X instead of whitespace for field delimiter

          --field=FIELDS
                 replace the numbers in these input fields (default=1) see
                 FIELDS below

          --format=FORMAT
                 use printf style floating-point FORMAT; see FORMAT below
                 for details

          --from=UNIT
                 auto-scale input numbers to UNITs; default is 'none'; see
                 UNIT below

          --from-unit=N
                 specify the input unit size (instead of the default 1)

          --grouping
                 use locale-defined grouping of digits, e.g. 1,000,000
                 (which means it has no effect in the C/POSIX locale)

          --header[=N]
                 print (without converting) the first N header lines; N
                 defaults to 1 if not specified

          --invalid=MODE
                 failure mode for invalid numbers: MODE can be: abort
                 (default), fail, warn, ignore

          --padding=N
                 pad the output to N characters; positive N will
                 right-align; negative N will left-align; padding is
                 ignored if the output is wider than N; the default is to
                 automatically pad if a whitespace is found

          --round=METHOD
                 use METHOD for rounding when scaling; METHOD can be: up,
                 down, from-zero (default), towards-zero, nearest

          --suffix=SUFFIX
                 add SUFFIX to output numbers, and accept optional SUFFIX
                 in input numbers

          --to=UNIT
                 auto-scale output numbers to UNITs; see UNIT below

          --to-unit=N
                 the output unit size (instead of the default 1)

          -z, --zero-terminated
                 line delimiter is NUL, not newline

          --help display this help and exit

          --version
                 output version information and exit

      UNIT options:
          none   no auto-scaling is done; suffixes will trigger an error

          auto   accept optional single/two letter suffix:

                 1K = 1000, 1Ki = 1024, 1M = 1000000, 1Mi = 1048576,

          si     accept optional single letter suffix:

                 1K = 1000, 1M = 1000000, ...

          iec    accept optional single letter suffix:

                 1K = 1024, 1M = 1048576, ...

          iec-i  accept optional two-letter suffix:

                 1Ki = 1024, 1Mi = 1048576, ...

      FIELDS supports cut(1) style field ranges:
          N      N'th field, counted from 1

          N-     from N'th field, to end of line

          N-M    from N'th to M'th field (inclusive)

          -M     from first to M'th field (inclusive)

          -      all fields

          Multiple fields/ranges can be separated with commas

          FORMAT must be suitable for printing one floating-point argument
          '%f'.  Optional quote (%'f) will enable --grouping (if supported
          by current locale).  Optional width value (%10f) will pad output.
          Optional zero (%010f) width will zero pad the number. Optional
          negative values (%-10f) will left align.  Optional precision
          (%.1f) will override the input determined precision.

          Exit status is 0 if all input numbers were successfully
          converted.  By default, numfmt will stop at the first conversion
          error with exit status 2.  With --invalid='fail' a warning is
          printed for each conversion error and the exit status is 2.  With
          --invalid='warn' each conversion error is diagnosed, but the exit
          status is 0.  With --invalid='ignore' conversion errors are not
          diagnosed and the exit status is 0.


---------------------------------------------------------

::

                 $ numfmt --to=si 1000

                 -> "1.0K"

                 $ numfmt --to=iec 2048

                 -> "2.0K"

                 $ numfmt --to=iec-i 4096

                 -> "4.0Ki"

                 $ echo 1K | numfmt --from=si

                 -> "1000"

                 $ echo 1K | numfmt --from=iec

                 -> "1024"

                 $ df -B1 | numfmt --header --field 2-4 --to=si
                 $ ls -l  | numfmt --header --field 5 --to=iec
                 $ ls -lh | numfmt --header --field 5 --from=iec
                 --padding=10
                 $ ls -lh | numfmt --header --field 5 --from=iec --format
                 %10f


-----------------------------------------------------

::

          Written by Assaf Gordon.


---------------------------------------------------------------------

::

          GNU coreutils online help:
          <https://www.gnu.org/software/coreutils/>
          Report any translation bugs to
          <https://translationproject.org/team/>


-----------------------------------------------------------

::

          Copyright © 2020 Free Software Foundation, Inc.  License GPLv3+:
          GNU GPL version 3 or later <https://gnu.org/licenses/gpl.html>.
          This is free software: you are free to change and redistribute
          it.  There is NO WARRANTY, to the extent permitted by law.


---------------------------------------------------------

::

          Full documentation
          <https://www.gnu.org/software/coreutils/numfmt>
          or available locally via: info '(coreutils) numfmt invocation'

COLOPHON
---------------------------------------------------------

::

          This page is part of the coreutils (basic file, shell and text
          manipulation utilities) project.  Information about the project
          can be found at ⟨http://www.gnu.org/software/coreutils/⟩.  If you
          have a bug report for this manual page, see
          ⟨http://www.gnu.org/software/coreutils/⟩.  This page was obtained
          from the tarball coreutils-8.32.tar.xz fetched from
          ⟨http://ftp.gnu.org/gnu/coreutils/⟩ on 2021-08-27.  If you
          discover any rendering problems in this HTML version of the page,
          or you believe there is a better or more up-to-date source for
          the page, or you have corrections or improvements to the
          information in this COLOPHON (which is not part of the original
          manual page), send a mail to man-pages@man7.org

   GNU coreutils 8.32             March 2020                      NUMFMT(1)

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
