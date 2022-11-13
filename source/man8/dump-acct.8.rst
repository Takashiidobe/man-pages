.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

dump-acct(8) — Linux manual page
================================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `OPTIONS <#OPTIONS>`__ \|         |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   DUMP_ACCT(8)             System Manager's Manual            DUMP_ACCT(8)

NAME
-------------------------------------------------

::

          dump-acct - print an acct/pacct file in human-readable format


---------------------------------------------------------

::

          dump-acct [-r|--reverse] [-R|--raw] [-n|--num recs] [--byte-swap]
          [--format] [--ahz freq] [-h|--help] [files]


---------------------------------------------------------------

::

          The dump-acct command transforms the output file from the accton
          format to the human-readable format: one record per line.  Each
          record consists of severald fields which are separated by
          character "|" (the meaning of concreate field depends on the
          version of kernel package - with which the accton file was
          created).


-------------------------------------------------------

::

          The following options are supported:

          -r, --reverse
                 Print the output in reverse order.

          -R, --raw
                 The records will be printed without any parsing.

          -n, --num NUMRECS
                 Display only the first NUMRECS number of records.

          --byteswap
                 Swap the bytes (relative to your system's native byte
                 order) in --raw output.

          --format
                 Set output format with --raw option.

          --ahz FREQ
                 Set the AHZ (platform dependent frequency in Hertz) to
                 FREQ.

          -h, --help
                 Print a help message and the default location of the
                 process accounting file and exit.


---------------------------------------------------------

::

          accton(8), lastcomm(1)

COLOPHON
---------------------------------------------------------

::

          This page is part of the psacct (process accounting utilities)
          project.  Information about the project can be found at 
          ⟨http://www.gnu.org/software/acct/⟩.  If you have a bug report for
          this manual page, see ⟨http://www.gnu.org/software/acct/⟩.  This
          page was obtained from the tarball acct-6.6.4.tar.gz fetched from
          ⟨http://ftp.gnu.org/gnu/acct/⟩ on 2021-08-27.  If you discover
          any rendering problems in this HTML version of the page, or you
          believe there is a better or more up-to-date source for the page,
          or you have corrections or improvements to the information in
          this COLOPHON (which is not part of the original manual page),
          send a mail to man-pages@man7.org

   Linux accounting system      2009 December 2                DUMP_ACCT(8)

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
