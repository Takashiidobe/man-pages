.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

bno_plot(1) — Linux manual page
===============================

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

   BNO_PLOT(1)                                                  BNO_PLOT(1)

NAME
-------------------------------------------------

::

          bno_plot - generate interactive 3D plot of IO blocks and sizes


---------------------------------------------------------

::

          bno_plot [ -h | --help ]
                   [ -v | --verbose ]
                   [ -K | --keys-below ]
                   [ <file...> ]


---------------------------------------------------------------

::

          bno_plot is a visualization tool for the block layer IO tracing
          tool called blktrace(8).  As noted in its documentation, blktrace
          is a block layer IO tracing mechanism which provides detailed
          information about request queue operations up to user space.

          bno_plot utilizes gnuplot to generate a 3D plot of the block
          number output from btt.  If no <files> are specified, it will
          utilize all files generated after btt was run with -B blknos
          (meaning: all files of the form blknos*[rw].dat).

          The -K option forces bno_plot to put the keys below the graph.
          If it is not specified, all keys for input files are put in the
          upper right corner of the graph. If the number of devices exceed
          10, then bno_plot will automatically push the keys under the
          graph.

          To use this utility, the gnuplot package needs to be installed.

          To exit the plotter, enter 'quit' or ^D at the 'gnuplot> '
          prompt.


-------------------------------------------------------

::

          bno_plot was written by Alan D. Brunelle.  This man page was
          created from the blktrace documentation by Bas Zoetekouw.


---------------------------------------------------------------------

::

          Report bugs to <linux-btrace@vger.kernel.org>


-----------------------------------------------------------

::

          Copyright © 2008 Hewlett-Packard Development Company, L.P.
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

          btt(1), gnuplot(1), blktrace(8), blkparse(1), verify_blkparse(1),
          blkrawverify(1)

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

   blktrace git-20080213182518 February 22, 2007                BNO_PLOT(1)

--------------

Pages that refer to this page: `btt(1) <../man1/btt.1.html>`__

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
