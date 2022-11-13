.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

trace-cmd-mem(1) — Linux manual page
====================================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `OPTIONS <#OPTIONS>`__ \|         |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `AUTHOR <#AUTHOR>`__ \|           |                                   |
| `RESOURCES <#RESOURCES>`__ \|     |                                   |
| `COPYING <#COPYING>`__ \|         |                                   |
| `NOTES <#NOTES>`__ \|             |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   TRACE-CMD-MEM(1)                                        TRACE-CMD-MEM(1)

NAME
-------------------------------------------------

::

          trace-cmd-mem - show memory usage of certain kmem events


---------------------------------------------------------

::

          trace-cmd mem [OPTIONS][input-file]


---------------------------------------------------------------

::

          The trace-cmd(1) mem requires a trace-cmd record that enabled the
          following events:

              kmalloc
              kmalloc_node
              kfree
              kmem_cache_alloc
              kmem_cache_alloc_node
              kmem_cache_alloc_free

          It then reads the amount requested and the ammount freed as well
          as the functions that called the allocation. It then reports the
          final amount of bytes requested and allocated, along with the
          total amount allocated and requested, as well as the max
          allocation and requested during the run. It reports the amount of
          wasted bytes (allocated - requested) that was not freed, as well
          as the max wasted amount during the run. The list is sorted by
          descending order of wasted bytes after the run.

                      Function                Waste   Alloc   req             TotAlloc     TotReq             MaxAlloc     MaxReq     MaxWaste
                      --------                -----   -----   ---             --------     ------             --------     ------     --------
                rb_allocate_cpu_buffer        768     2304    1536                2304       1536                 2304       1536     768
                       alloc_pipe_info        400     1152    752                 1152        752                 1152        752     400
                        instance_mkdir        252     544     292                  544        292                  544        292     252
                             __d_alloc        215     1086560 1086345          1087208    1086993              1086560    1086345     215
                        get_empty_filp        72      2304    2232                4864       4712                 4864       4712     152
                              mm_alloc        40      960     920                  960        920                  960        920     40
                         prepare_creds        32      192     160                 1728       1440                 1728       1440     288
                  tracing_buffers_open        8       32      24                    32         24                   32         24     8
                                do_brk        0       0       0                    368        368                  368        368     0
              journal_add_journal_head        0       6048    6048                6048       6048                 6048       6048     0
                         journal_start        0       0       0                   1224       1224                   48         48     0
                   __rb_allocate_pages        0       3289856 3289856          3289856    3289856              3289856    3289856     0
                        anon_vma_alloc        0       0       0                    936        936                  864        864     0
                                                                      [...]


-------------------------------------------------------

::

          -i input-file
              By default, trace-cmd hist will read the file trace.dat. But
              the -i option open up the given input-file instead. Note, the
              input file may also be specified as the last item on the
              command line.


---------------------------------------------------------

::

          trace-cmd(1), trace-cmd-record(1), trace-cmd-report(1),
          trace-cmd-start(1), trace-cmd-stop(1), trace-cmd-extract(1),
          trace-cmd-reset(1), trace-cmd-hist(1), trace-cmd-split(1),
          trace-cmd-listen(1)


-----------------------------------------------------

::

          Written by Steven Rostedt, <rostedt@goodmis.org[1]>


-----------------------------------------------------------

::

          git://git.kernel.org/pub/scm/linux/kernel/git/rostedt/trace-cmd.git


-------------------------------------------------------

::

          Copyright (C) 2013 Red Hat, Inc. Free use of this software is
          granted under the terms of the GNU Public License (GPL).


---------------------------------------------------

::

           1. rostedt@goodmis.org
              mailto:rostedt@goodmis.org

COLOPHON
---------------------------------------------------------

::

          This page is part of the trace-cmd (a front-end for Ftrace)
          project.  Information about the project can be found at [unknown
          -- if you know, please contact man-pages@man7.org] If you have a
          bug report for this manual page, send it to Steven Rostedt
          <rostedt@goodmis.org>.  This page was obtained from the project's
          upstream Git repository
          ⟨git://git.kernel.org/pub/scm/linux/kernel/git/rostedt/trace-cmd.git⟩
          on 2021-08-27.  (At that time, the date of the most recent commit
          that was found in the repository was 2021-08-20.)  If you
          discover any rendering problems in this HTML version of the page,
          or you believe there is a better or more up-to-date source for
          the page, or you have corrections or improvements to the
          information in this COLOPHON (which is not part of the original
          manual page), send a mail to man-pages@man7.org

                                  05/27/2020               TRACE-CMD-MEM(1)

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
