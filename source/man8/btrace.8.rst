.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

btrace(8) — Linux manual page
=============================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `OPTIONS <#OPTIONS>`__ \|         |                                   |
| `EXAMPLE <#EXAMPLE>`__ \|         |                                   |
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

   BTRACE(8)                                                      BTRACE(8)

NAME
-------------------------------------------------

::

          btrace - perform live tracing for block devices


---------------------------------------------------------

::

          btrace [-s] [-t] [-w N] [-n N] [-b N] [-r <dbg mnt>] [-a
          <trace>...] <dev>...


---------------------------------------------------------------

::

          The btrace script provides a quick and easy way to do live
          tracing of block devices.  It calls blktrace on the specified
          devices and pipes the output through blkparse for formatting.
          See blktrace (8) for more in-depth information about how blktrace
          works.


-------------------------------------------------------

::

          -s Displays data sorted by program (see blkparse (1)).

          -t Displays time deltas per IO (see blkparse (1)).

          -w N Sets run time to the number of seconds specified (see
              blktrace (8)).

          -n N Specifies the number of buffers to use (see blktrace (8)).

          -b N Specifies buffer size for event extraction (scaled by 1024)
              (see blktrace (8)).

          -r <dbg mnt> Specifies the debugfs mountpoint.

          -a <trace>...  Adds mask to current filter (see blktrace (8)).

          <dev> Specifies the device to trace.


-------------------------------------------------------

::

          Simply running

              % btrace /dev/sda

          will show a trace of the device /dev/sda.


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

          blktrace(8), blkparse(1), verify_blkparse(1), blkrawverify(1),
          btt(1)

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

   blktrace git-20070306202522  March  6, 2007                    BTRACE(8)

--------------

Pages that refer to this page:
`blkparse(1) <../man1/blkparse.1.html>`__, 
`blkrawverify(1) <../man1/blkrawverify.1.html>`__, 
`verify_blkparse(1) <../man1/verify_blkparse.1.html>`__, 
`blkiomon(8) <../man8/blkiomon.8.html>`__, 
`blktrace(8) <../man8/blktrace.8.html>`__

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
