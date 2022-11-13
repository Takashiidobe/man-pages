.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

utmpdump(1) — Linux manual page
===============================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `OPTIONS <#OPTIONS>`__ \|         |                                   |
| `NOTES <#NOTES>`__ \|             |                                   |
| `BUGS <#BUGS>`__ \|               |                                   |
| `AUTHORS <#AUTHORS>`__ \|         |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `RE                               |                                   |
| PORTING BUGS <#REPORTING_BUGS>`__ |                                   |
| \|                                |                                   |
| `AVAILABILITY <#AVAILABILITY>`__  |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   UTMPDUMP(1)                   User Commands                  UTMPDUMP(1)

NAME
-------------------------------------------------

::

          utmpdump - dump UTMP and WTMP files in raw format


---------------------------------------------------------

::

          utmpdump [options] filename


---------------------------------------------------------------

::

          utmpdump is a simple program to dump UTMP and WTMP files in raw
          format, so they can be examined. utmpdump reads from stdin unless
          a filename is passed.


-------------------------------------------------------

::

          -f, --follow
              Output appended data as the file grows.

          -o, --output file
              Write command output to file instead of standard output.

          -r, --reverse
              Undump, write back edited login information into the utmp or
              wtmp files.

          -V, --version
              Display version information and exit.

          -h, --help
              Display help text and exit.


---------------------------------------------------

::

          utmpdump can be useful in cases of corrupted utmp or wtmp
          entries. It can dump out utmp/wtmp to an ASCII file, which can
          then be edited to remove bogus entries, and reintegrated using:

             utmpdump -r < ascii_file > wtmp

          But be warned, utmpdump was written for debugging purposes only.

      File formats
          Only the binary version of the utmp(5) is standardised. Textual
          dumps may become incompatible in future.

          The version 2.28 was the last one that printed text output using
          ctime(3) timestamp format. Newer dumps use millisecond precision
          ISO-8601 timestamp format in UTC-0 timezone. Conversion from
          former timestamp format can be made to binary, although attempt
          to do so can lead the timestamps to drift amount of timezone
          offset.


-------------------------------------------------

::

          You may not use the -r option, as the format for the utmp/wtmp
          files strongly depends on the input format. This tool was not
          written for normal use, but for debugging only.


-------------------------------------------------------

::

          Michael Krapp


---------------------------------------------------------

::

          last(1), w(1), who(1), utmp(5)


---------------------------------------------------------------------

::

          For bug reports, use the issue tracker at
          https://github.com/karelzak/util-linux/issues.


-----------------------------------------------------------------

::

          The utmpdump command is part of the util-linux package which can
          be downloaded from Linux Kernel Archive
          <https://www.kernel.org/pub/linux/utils/util-linux/>. This page
          is part of the util-linux (a random collection of Linux
          utilities) project. Information about the project can be found at
          ⟨https://www.kernel.org/pub/linux/utils/util-linux/⟩. If you have
          a bug report for this manual page, send it to
          util-linux@vger.kernel.org. This page was obtained from the
          project's upstream Git repository
          ⟨git://git.kernel.org/pub/scm/utils/util-linux/util-linux.git⟩ on
          2021-08-27. (At that time, the date of the most recent commit
          that was found in the repository was 2021-08-24.) If you discover
          any rendering problems in this HTML version of the page, or you
          believe there is a better or more up-to-date source for the page,
          or you have corrections or improvements to the information in
          this COLOPHON (which is not part of the original manual page),
          send a mail to man-pages@man7.org

   util-linux 2.37.85-637cc       2021-04-02                    UTMPDUMP(1)

--------------

Pages that refer to this page: `getutmp(3) <../man3/getutmp.3.html>`__, 
`utmp(5) <../man5/utmp.5.html>`__

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
