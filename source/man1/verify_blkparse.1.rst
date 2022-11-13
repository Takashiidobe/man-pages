.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

verify_blkparse(1) — Linux manual page
======================================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `AUTHORS <#AUTHORS>`__ \|         |                                   |
| `RE                               |                                   |
| PORTING BUGS <#REPORTING_BUGS>`__ |                                   |
| \| `COPYRIGHT <#COPYRIGHT>`__ \|  |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   VERIFY_BLKPARSE(1)                                    VERIFY_BLKPARSE(1)

NAME
-------------------------------------------------

::

          verify_blkparse - verifies an output file produced by blkparse


---------------------------------------------------------

::

          verify_blkparse <filename>


---------------------------------------------------------------

::

          Verifies an output file from blkparse. All it does is check if
          the events in the file are correctly time ordered. If an entry is
          found that isn't ordered, it's dumped to stdout.


-------------------------------------------------------

::

          blkparse was written by Jens Axboe, Alan D. Brunelle and Nathan
          Scott.  This man page was created from the blktrace documentation
          by Bas Zoetekouw.


---------------------------------------------------------------------

::

          Report bugs to <linux-btrace@vger.kernel.org>


-----------------------------------------------------------

::

          Copyright © 2006 Jens Axboe, Alan D. Brunelle and Nathan Scott.
          This is free software.  You may redistribute copies of it under
          the terms of the GNU General Public License
          <http://www.gnu.org/licenses/gpl.html>.  There is NO WARRANTY, to
          the extent permitted by law.
          This manual page was created for Debian by Bas Zoetekouw.  It was
          derived from the documentation provided by the authors and it may
          be used, distributed and modified under the terms of the GNU
          General Public License, version 2.
          On Debian systems, the text of the GNU General Public License can
          be found in /usr/share/common-licenses/GPL-2.


---------------------------------------------------------

::

          btrace(8), blktrace(8), blkparse(1), blkrawverify(1), btt(1)

COLOPHON
---------------------------------------------------------

::

          This page is part of the blktrace (Linux block layer I/O tracer)
          project.  Information about the project can be found at [unknown
          -- if you know, please contact man-pages@man7.org] It is not
          known how to report bugs for this man page; if you know, please
          send a mail to man-pages@man7.org.  This page was obtained from
          the project's upstream Git repository
          ⟨http://git.kernel.org/cgit/linux/kernel/git/axboe/blktrace.git/⟩
          on 2021-08-27.  (At that time, the date of the most recent commit
          that was found in the repository was 2021-06-28.)  If you
          discover any rendering problems in this HTML version of the page,
          or you believe there is a better or more up-to-date source for
          the page, or you have corrections or improvements to the
          information in this COLOPHON (which is not part of the original
          manual page), send a mail to man-pages@man7.org

   blktrace git-20070306202522  March  6, 2007           VERIFY_BLKPARSE(1)

--------------

Pages that refer to this page:
`blkparse(1) <../man1/blkparse.1.html>`__, 
`blkrawverify(1) <../man1/blkrawverify.1.html>`__, 
`bno_plot(1) <../man1/bno_plot.1.html>`__, 
`btt(1) <../man1/btt.1.html>`__, 
`blkiomon(8) <../man8/blkiomon.8.html>`__, 
`blktrace(8) <../man8/blktrace.8.html>`__, 
`btrace(8) <../man8/btrace.8.html>`__

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
