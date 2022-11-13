.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

partprobe(8) — Linux manual page
================================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `OPTIONS <#OPTIONS>`__ \|         |                                   |
| `RE                               |                                   |
| PORTING BUGS <#REPORTING_BUGS>`__ |                                   |
| \| `SEE ALSO <#SEE_ALSO>`__ \|    |                                   |
| `AUTHOR <#AUTHOR>`__ \|           |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   PARTPROBE(8)                GNU Parted Manual               PARTPROBE(8)

NAME
-------------------------------------------------

::

          partprobe - inform the OS of partition table changes


---------------------------------------------------------

::

          partprobe [-d] [-s] [devices...]


---------------------------------------------------------------

::

          This manual page documents briefly the partprobe command.

          partprobe is a program that informs the operating system kernel
          of partition table changes.


-------------------------------------------------------

::

          This program uses short UNIX style options.

          -d, --dry-run
                 Don't update the kernel.

          -s, --summary
                 Show a summary of devices and their partitions.

          -h, --help
                 Show summary of options.

          -v, --version
                 Show version of program.


---------------------------------------------------------------------

::

          Report bugs to <bug-parted@gnu.org>


---------------------------------------------------------

::

          parted(8).


-----------------------------------------------------

::

          This manual page was written by Timshel Knoll
          <timshel@debian.org>, for the Debian GNU/Linux system (but may be
          used by others).

COLOPHON
---------------------------------------------------------

::

          This page is part of the GNU parted (partition table
          manipulation) project.  Information about the project can be
          found at ⟨http://www.gnu.org/software/parted/⟩.  If you have a
          bug report for this manual page, send it to bug-parted@gnu.org.
          This page was obtained from the project's upstream Git repository
          ⟨git://git.savannah.gnu.org/parted.git⟩ on 2021-08-27.  (At that
          time, the date of the most recent commit that was found in the
          repository was 2021-08-25.)  If you discover any rendering
          problems in this HTML version of the page, or you believe there
          is a better or more up-to-date source for the page, or you have
          corrections or improvements to the information in this COLOPHON
          (which is not part of the original manual page), send a mail to
          man-pages@man7.org

   parted                       March 18, 2002                 PARTPROBE(8)

--------------

Pages that refer to this page: `addpart(8) <../man8/addpart.8.html>`__, 
`cfdisk(8) <../man8/cfdisk.8.html>`__, 
`delpart(8) <../man8/delpart.8.html>`__, 
`partx(8) <../man8/partx.8.html>`__, 
`resizepart(8) <../man8/resizepart.8.html>`__, 
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
