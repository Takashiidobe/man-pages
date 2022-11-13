.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

touch(1) — Linux manual page
============================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `DATE STRING <#DATE_STRING>`__ \| |                                   |
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

   TOUCH(1)                      User Commands                     TOUCH(1)

NAME
-------------------------------------------------

::

          touch - change file timestamps


---------------------------------------------------------

::

          touch [OPTION]... FILE...


---------------------------------------------------------------

::

          Update the access and modification times of each FILE to the
          current time.

          A FILE argument that does not exist is created empty, unless -c
          or -h is supplied.

          A FILE argument string of - is handled specially and causes touch
          to change the times of the file associated with standard output.

          Mandatory arguments to long options are mandatory for short
          options too.

          -a     change only the access time

          -c, --no-create
                 do not create any files

          -d, --date=STRING
                 parse STRING and use it instead of current time

          -f     (ignored)

          -h, --no-dereference
                 affect each symbolic link instead of any referenced file
                 (useful only on systems that can change the timestamps of
                 a symlink)

          -m     change only the modification time

          -r, --reference=FILE
                 use this file's times instead of current time

          -t STAMP
                 use [[CC]YY]MMDDhhmm[.ss] instead of current time

          --time=WORD
                 change the specified time: WORD is access, atime, or use:
                 equivalent to -a WORD is modify or mtime: equivalent to -m

          --help display this help and exit

          --version
                 output version information and exit

          Note that the -d and -t options accept different time-date
          formats.


---------------------------------------------------------------

::

          The --date=STRING is a mostly free format human readable date
          string such as "Sun, 29 Feb 2004 16:21:42 -0800" or "2004-02-29
          16:21:42" or even "next Thursday".  A date string may contain
          items indicating calendar date, time of day, time zone, day of
          week, relative time, relative date, and numbers.  An empty string
          indicates the beginning of the day.  The date string format is
          more complex than is easily documented here but is fully
          described in the info documentation.


-----------------------------------------------------

::

          Written by Paul Rubin, Arnold Robbins, Jim Kingdon, David
          MacKenzie, and Randy Smith.


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

          Full documentation <https://www.gnu.org/software/coreutils/touch>
          or available locally via: info '(coreutils) touch invocation'

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

   GNU coreutils 8.32             March 2020                       TOUCH(1)

--------------

Pages that refer to this page:
`last(1@@util-linux) <../man1/last.1@@util-linux.html>`__, 
`utime(2) <../man2/utime.2.html>`__, 
`utimensat(2) <../man2/utimensat.2.html>`__, 
`systemd-update-done.service(8) <../man8/systemd-update-done.service.8.html>`__

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
