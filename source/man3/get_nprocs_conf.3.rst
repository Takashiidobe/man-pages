.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

get_nprocs_conf(3) — Linux manual page
======================================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `RETURN VALUE <#RETURN_VALUE>`__  |                                   |
| \| `ATTRIBUTES <#ATTRIBUTES>`__   |                                   |
| \|                                |                                   |
| `                                 |                                   |
| CONFORMING TO <#CONFORMING_TO>`__ |                                   |
| \| `NOTES <#NOTES>`__ \|          |                                   |
| `EXAMPLES <#EXAMPLES>`__ \|       |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   GET_NPROCS(3)           Linux Programmer's Manual          GET_NPROCS(3)

NAME
-------------------------------------------------

::

          get_nprocs, get_nprocs_conf - get number of processors


---------------------------------------------------------

::

          #include <sys/sysinfo.h>

          int get_nprocs(void);
          int get_nprocs_conf(void);


---------------------------------------------------------------

::

          The function get_nprocs_conf() returns the number of processors
          configured by the operating system.

          The function get_nprocs() returns the number of processors
          currently available in the system.  This may be less than the
          number returned by get_nprocs_conf() because processors may be
          offline (e.g., on hotpluggable systems).


-----------------------------------------------------------------

::

          As given in DESCRIPTION.


-------------------------------------------------------------

::

          For an explanation of the terms used in this section, see
          attributes(7).

          ┌──────────────────────────────────────┬───────────────┬─────────┐
          │Interface                             │ Attribute     │ Value   │
          ├──────────────────────────────────────┼───────────────┼─────────┤
          │get_nprocs(), get_nprocs_conf()       │ Thread safety │ MT-Safe │
          └──────────────────────────────────────┴───────────────┴─────────┘


-------------------------------------------------------------------

::

          These functions are GNU extensions.


---------------------------------------------------

::

          The current implementation of these functions is rather
          expensive, since they open and parse files in the /sys filesystem
          each time they are called.

          The following sysconf(3) calls make use of the functions
          documented on this page to return the same information.

              np = sysconf(_SC_NPROCESSORS_CONF);     /* processors configured */
              np = sysconf(_SC_NPROCESSORS_ONLN);     /* processors available */


---------------------------------------------------------

::

          The following example shows how get_nprocs() and
          get_nprocs_conf() can be used.

          #include <stdlib.h>
          #include <stdio.h>
          #include <sys/sysinfo.h>

          int
          main(int argc, char *argv[])
          {
              printf("This system has %d processors configured and "
                      "%d processors available.\n",
                      get_nprocs_conf(), get_nprocs());
              exit(EXIT_SUCCESS);
          }


---------------------------------------------------------

::

          nproc(1)

COLOPHON
---------------------------------------------------------

::

          This page is part of release 5.13 of the Linux man-pages project.
          A description of the project, information about reporting bugs,
          and the latest version of this page, can be found at
          https://www.kernel.org/doc/man-pages/.

   GNU                            2021-03-22                  GET_NPROCS(3)

--------------

Pages that refer to this page:
`sched_setaffinity(2) <../man2/sched_setaffinity.2.html>`__, 
`sysconf(3) <../man3/sysconf.3.html>`__

--------------

`Copyright and license for this manual
page <../man3/get_nprocs_conf.3.license.html>`__

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
