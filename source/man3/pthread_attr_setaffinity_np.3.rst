.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

pthread_attr_setaffinity_np(3) — Linux manual page
==================================================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `RETURN VALUE <#RETURN_VALUE>`__  |                                   |
| \| `ERRORS <#ERRORS>`__ \|        |                                   |
| `VERSIONS <#VERSIONS>`__ \|       |                                   |
| `ATTRIBUTES <#ATTRIBUTES>`__ \|   |                                   |
| `                                 |                                   |
| CONFORMING TO <#CONFORMING_TO>`__ |                                   |
| \| `NOTES <#NOTES>`__ \|          |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   PTHREAD_ATTR_SETAFFINITY_NP(3)Programmer'sPManual_ATTR_SETAFFINITY_NP(3)

NAME
-------------------------------------------------

::

          pthread_attr_setaffinity_np, pthread_attr_getaffinity_np -
          set/get CPU affinity attribute in thread attributes object


---------------------------------------------------------

::

          #define _GNU_SOURCE             /* See feature_test_macros(7) */
          #include <pthread.h>

          int pthread_attr_setaffinity_np(pthread_attr_t *attr,
                             size_t cpusetsize, const cpu_set_t *cpuset);
          int pthread_attr_getaffinity_np(const pthread_attr_t *attr,
                             size_t cpusetsize, cpu_set_t *cpuset);

          Compile and link with -pthread.


---------------------------------------------------------------

::

          The pthread_attr_setaffinity_np() function sets the CPU affinity
          mask attribute of the thread attributes object referred to by
          attr to the value specified in cpuset.  This attribute determines
          the CPU affinity mask of a thread created using the thread
          attributes object attr.

          The pthread_attr_getaffinity_np() function returns the CPU
          affinity mask attribute of the thread attributes object referred
          to by attr in the buffer pointed to by cpuset.

          The argument cpusetsize is the length (in bytes) of the buffer
          pointed to by cpuset.  Typically, this argument would be
          specified as sizeof(cpu_set_t).

          For more details on CPU affinity masks, see sched_setaffinity(2).
          For a description of a set of macros that can be used to
          manipulate and inspect CPU sets, see CPU_SET(3).


-----------------------------------------------------------------

::

          On success, these functions return 0; on error, they return a
          nonzero error number.


-----------------------------------------------------

::

          EINVAL (pthread_attr_setaffinity_np()) cpuset specified a CPU
                 that was outside the set supported by the kernel.  (The
                 kernel configuration option CONFIG_NR_CPUS defines the
                 range of the set supported by the kernel data type used to
                 represent CPU sets.)

          EINVAL (pthread_attr_getaffinity_np()) A CPU in the affinity mask
                 of the thread attributes object referred to by attr lies
                 outside the range specified by cpusetsize (i.e.,
                 cpuset/cpusetsize is too small).

          ENOMEM (pthread_attr_setaffinity_np()) Could not allocate memory.


---------------------------------------------------------

::

          These functions are provided by glibc since version 2.3.4.


-------------------------------------------------------------

::

          For an explanation of the terms used in this section, see
          attributes(7).

          ┌──────────────────────────────────────┬───────────────┬─────────┐
          │Interface                             │ Attribute     │ Value   │
          ├──────────────────────────────────────┼───────────────┼─────────┤
          │pthread_attr_setaffinity_np(),        │ Thread safety │ MT-Safe │
          │pthread_attr_getaffinity_np()         │               │         │
          └──────────────────────────────────────┴───────────────┴─────────┘


-------------------------------------------------------------------

::

          These functions are nonstandard GNU extensions; hence the suffix
          "_np" (nonportable) in the names.


---------------------------------------------------

::

          In glibc 2.3.3 only, versions of these functions were provided
          that did not have a cpusetsize argument.  Instead the CPU set
          size given to the underlying system calls was always
          sizeof(cpu_set_t).


---------------------------------------------------------

::

          sched_setaffinity(2), pthread_attr_init(3),
          pthread_setaffinity_np(3), cpuset(7), pthreads(7)

COLOPHON
---------------------------------------------------------

::

          This page is part of release 5.13 of the Linux man-pages project.
          A description of the project, information about reporting bugs,
          and the latest version of this page, can be found at
          https://www.kernel.org/doc/man-pages/.

   Linux                          2021-03-22 PTHREAD_ATTR_SETAFFINITY_NP(3)

--------------

Pages that refer to this page: `CPU_SET(3) <../man3/CPU_SET.3.html>`__, 
`pthread_attr_init(3) <../man3/pthread_attr_init.3.html>`__, 
`pthread_attr_setscope(3) <../man3/pthread_attr_setscope.3.html>`__, 
`pthread_getattr_default_np(3) <../man3/pthread_getattr_default_np.3.html>`__, 
`pthread_getattr_np(3) <../man3/pthread_getattr_np.3.html>`__, 
`pthread_setaffinity_np(3) <../man3/pthread_setaffinity_np.3.html>`__

--------------

`Copyright and license for this manual
page <../man3/pthread_attr_setaffinity_np.3.license.html>`__

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
