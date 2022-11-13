.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

slabtop(1) — Linux manual page
==============================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `OPTIONS <#OPTIONS>`__ \|         |                                   |
| `                                 |                                   |
| SORT CRITERIA <#SORT_CRITERIA>`__ |                                   |
| \| `COMMANDS <#COMMANDS>`__ \|    |                                   |
| `FILES <#FILES>`__ \|             |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `NOTES <#NOTES>`__ \|             |                                   |
| `AUTHORS <#AUTHORS>`__ \|         |                                   |
| `RE                               |                                   |
| PORTING BUGS <#REPORTING_BUGS>`__ |                                   |
| \| `COLOPHON <#COLOPHON>`__       |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   SLABTOP(1)                    User Commands                   SLABTOP(1)

NAME
-------------------------------------------------

::

          slabtop - display kernel slab cache information in real time


---------------------------------------------------------

::

          slabtop [options]


---------------------------------------------------------------

::

          slabtop displays detailed kernel slab cache information in real
          time.  It displays a listing of the top caches sorted by one of
          the listed sort criteria.  It also displays a statistics header
          filled with slab layer information.


-------------------------------------------------------

::

          Normal invocation of slabtop does not require any options.  The
          behavior, however, can be fine-tuned by specifying one or more of
          the following flags:

          -d, --delay=N
                 Refresh the display every n in seconds.  By default,
                 slabtop refreshes the display every three seconds.  To
                 exit the program, hit q.

          -s, --sort=S
                 Sort by S, where S is one of the sort criteria.

          -o, --once
                 Display the output once and then exit.

          -V, --version
                 Display version information and exit.

          -h, --help
                 Display usage information and exit.


-------------------------------------------------------------------

::

          The following are valid sort criteria used to sort the individual
          slab caches and thereby determine what are the "top" slab caches
          to display.  The default sort criteria is to sort by the number
          of objects ("o").

          The sort criteria can also be changed while slabtop is running by
          pressing the associated character.

          character   description                header
          a           number of active objects   ACTIVE
          b           objects per slab           OBJ/SLAB
          c           cache size                 CACHE SIZE
          l           number of slabs            SLABS
          v           number of active slabs     N/A
          n           name                       NAME
          o           number of objects          OBJS
          p           pages per slab             N/A
          s           object size                OBJ SIZE
          u           cache utilization          USE


---------------------------------------------------------

::

          slabtop accepts keyboard commands from the user during use.  The
          following are supported.  In the case of letters, both cases are
          accepted.

          Each of the valid sort characters are also accepted, to change
          the sort routine. See the section SORT CRITERIA.

          <SPACEBAR>
                 Refresh the screen.

          Q      Quit the program.


---------------------------------------------------

::

          /proc/slabinfo
                 slab information


---------------------------------------------------------

::

          free(1), ps(1), top(1), vmstat(8)


---------------------------------------------------

::

          Currently, slabtop requires a 2.4 or later kernel (specifically,
          a version 1.1 or later /proc/slabinfo).  Kernel 2.2 should be
          supported in the future.

          The slabtop statistic header is tracking how many bytes of slabs
          are being used and is not a measure of physical memory.  The
          'Slab' field in the /proc/meminfo file is tracking information
          about used slab physical memory.


-------------------------------------------------------

::

          Written by Chris Rivera and Robert Love.

          slabtop was inspired by Martin Bligh's perl script, vmtop.


---------------------------------------------------------------------

::

          Please send bug reports to ⟨procps@freelists.org⟩

COLOPHON
---------------------------------------------------------

::

          This page is part of the procps-ng (/proc filesystem utilities)
          project.  Information about the project can be found at 
          ⟨https://gitlab.com/procps-ng/procps⟩.  If you have a bug report
          for this manual page, see
          ⟨https://gitlab.com/procps-ng/procps/blob/master/Documentation/bugs.md⟩.
          This page was obtained from the project's upstream Git repository
          ⟨https://gitlab.com/procps-ng/procps.git⟩ on 2021-08-27.  (At
          that time, the date of the most recent commit that was found in
          the repository was 2021-08-24.)  If you discover any rendering
          problems in this HTML version of the page, or you believe there
          is a better or more up-to-date source for the page, or you have
          corrections or improvements to the information in this COLOPHON
          (which is not part of the original manual page), send a mail to
          man-pages@man7.org

   procps-ng                       June 2011                     SLABTOP(1)

--------------

Pages that refer to this page: `free(1) <../man1/free.1.html>`__, 
`top(1) <../man1/top.1.html>`__, 
`slabinfo(5) <../man5/slabinfo.5.html>`__

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
