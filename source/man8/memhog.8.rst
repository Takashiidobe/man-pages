.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

memhog(8) — Linux manual page
=============================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `EXAMPLES <#EXAMPLES>`__ \|       |                                   |
| `AUTHORS <#AUTHORS>`__ \|         |                                   |
| `LICENSE <#LICENSE>`__ \|         |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   MEMHOG(8)             Linux Administrator's Manual             MEMHOG(8)

NAME
-------------------------------------------------

::

          memhog - Allocates memory with policy for testing


---------------------------------------------------------

::

          memhog [ -r<NUM> ] [ size kmg ] [ policy nodeset ] [ -f<filename>
          ]


---------------------------------------------------------------

::

          memhog mmaps a memory region for a given size and sets the numa
          policy (if specified).  It then updates the memory region for the
          given number of iterations using memset.

          -r<num>    Repeat memset NUM times
          -f<file>   Open file for mmap backing
          -H         Disable transparent hugepages
          -size      Allocation size in bytes, may have case-insensitive order
                     suffix (G=gigabyte, M=megabyte, K=kilobyte)

          Supported numa-policies:

          interleave
                 Memory will be allocated using round robin on nodes. When
                 memory cannot be allocated on the current interleave,
                 target fall back to other nodes.  Multiple nodes may be
                 specified.

          membind
                 Only  allocate  memory  from  nodes. Allocation will fail
                 when there is not enough memory available on these nodes.
                 Multiple nodes  may be specified.

          preferred
                 Preferably allocate memory on node, but if memory cannot
                 be allocated  there  fall  back  to other nodes.  This
                 option takes only a single node number.

          default
                 Memory will be allocated on the local node (the node the
                 thread is running on)


---------------------------------------------------------

::

          # Allocate a 1G region, mmap backed by memhog.mmap file, membind
          to node 0, repeat test 6 times
                 memhog -r6 1G --membind 0 -fmemhog.mmap

          # Allocate a 1G region, iterleave across nodes 0,1,2,3, repeat
          test 4 times
                 memhog -r4 1G --interleave 0-3

          # Allocate a 1G region, (implicit) default policy, repeat test 8
          times
                 memhog -r8 1G


-------------------------------------------------------

::

          Andi Kleen (ak@suse.de)


-------------------------------------------------------

::

          GPL v2


---------------------------------------------------------

::

          mmap(2), memset(3), numactl(8), numastat(8)

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

   SuSE Labs                       2003,2004                      MEMHOG(8)

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
