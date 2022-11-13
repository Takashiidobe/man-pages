.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

migratepages(8) — Linux manual page
===================================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `NOTES <#NOTES>`__ \|             |                                   |
| `FILES <#FILES>`__ \|             |                                   |
| `COPYRIGHT <#COPYRIGHT>`__ \|     |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   MIGRATEPAGES(8)       Linux Administrator's Manual       MIGRATEPAGES(8)

NAME
-------------------------------------------------

::

          migratepages - Migrate the physical location a processes pages


---------------------------------------------------------

::

          migratepages pid from-nodes to-nodes


---------------------------------------------------------------

::

          migratepages moves the physical location of a processes pages
          without any changes of the virtual address space of the process.
          Moving the pages allows one to change the distances of a process
          to its memory. Performance may be optimized by moving a processes
          pages to the node where it is executing.

          If multiple nodes are specified for from-nodes or to-nodes then
          an attempt is made to preserve the relative location of each page
          in each nodeset.

          For example if we move from nodes 2-5 to 7,9,12-13 then the
          preferred mode of operation is to move pages from 2->7, 3->9,
          4->12 and 5->13. However, this is only posssible if enough memory
          is available.

          Valid node specifiers

                 all                 All nodes
                 number              Node number
                 number1{,number2}   Node number1 and Node number2
                 number1-number2     Nodes from number1 to number2
                 ! nodes             Invert selection of the following specification.


---------------------------------------------------

::

          Requires a NUMA policy aware kernel with support for page
          migration (linux 2.6.16 and later).

          migratepages will only move pages that are not shared with other
          processes if called by a user without administrative priviledges
          (but with the right to modify the process).

          migratepages will move all pages if invoked from root (or a user
          with administrative priviledges).


---------------------------------------------------

::

          /proc/<pid>/numa_maps for information about the NUMA memory use
          of a process.


-----------------------------------------------------------

::

          Copyright 2005-2006 Christoph Lameter, Silicon Graphics, Inc.
          migratepages is under the GNU General Public License, v.2


---------------------------------------------------------

::

          numactl(8) , set_mempolicy(2) , get_mempolicy(2) , mbind(2) ,
          sched_setaffinity(2) , sched_getaffinity(2) , proc(5) , ftok(3) ,
          shmat(2) , taskset(1)

COLOPHON
---------------------------------------------------------

::

          This page is part of the numactl (NUMA commands) project.
          Information about the project can be found at 
          ⟨http://oss.sgi.com/projects/libnuma/⟩.  If you have a bug report
          for this manual page, send it to linux-numa@vger.kernel.org.
          This page was obtained from the project's upstream Git repository
          ⟨https://github.com/numactl/numactl.git⟩ on 2021-08-27.  (At that
          time, the date of the most recent commit that was found in the
          repository was 2021-08-25.)  If you discover any rendering
          problems in this HTML version of the page, or you believe there
          is a better or more up-to-date source for the page, or you have
          corrections or improvements to the information in this COLOPHON
          (which is not part of the original manual page), send a mail to
          man-pages@man7.org

   SGI                             Jan 2005                 MIGRATEPAGES(8)

--------------

Pages that refer to this page:
`migrate_pages(2) <../man2/migrate_pages.2.html>`__, 
`move_pages(2) <../man2/move_pages.2.html>`__, 
`cpuset(7) <../man7/cpuset.7.html>`__, 
`numactl(8) <../man8/numactl.8.html>`__

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
