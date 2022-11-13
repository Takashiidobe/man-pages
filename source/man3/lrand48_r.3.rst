.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

drand48_r(3) — Linux manual page
================================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `RETURN VALUE <#RETURN_VALUE>`__  |                                   |
| \| `ATTRIBUTES <#ATTRIBUTES>`__   |                                   |
| \|                                |                                   |
| `                                 |                                   |
| CONFORMING TO <#CONFORMING_TO>`__ |                                   |
| \| `SEE ALSO <#SEE_ALSO>`__ \|    |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   DRAND48_R(3)            Linux Programmer's Manual           DRAND48_R(3)

NAME
-------------------------------------------------

::

          drand48_r, erand48_r, lrand48_r, nrand48_r, mrand48_r, jrand48_r,
          srand48_r, seed48_r, lcong48_r - generate uniformly distributed
          pseudo-random numbers reentrantly


---------------------------------------------------------

::

          #include <stdlib.h>

          int drand48_r(struct drand48_data *restrict buffer,
                        double *restrict result);
          int erand48_r(unsigned short xsubi[3],
                        struct drand48_data *restrict buffer,
                        double *restrict result);

          int lrand48_r(struct drand48_data *restrict buffer,
                        long *restrict result);
          int nrand48_r(unsigned short xsubi[3],
                        struct drand48_data *restrict buffer,
                        long *restrict result);

          int mrand48_r(struct drand48_data *restrict buffer,
                        long *restrict result);
          int jrand48_r(unsigned short xsubi[3],
                        struct drand48_data *restrict buffer,
                        long *restrict result);

          int srand48_r(long int seedval, struct drand48_data *buffer);
          int seed48_r(unsigned short seed16v[3], struct drand48_data *buffer);
          int lcong48_r(unsigned short param[7], struct drand48_data *buffer);

      Feature Test Macro Requirements for glibc (see
      feature_test_macros(7)):

          All functions shown above:
              /* Glibc since 2.19: */ _DEFAULT_SOURCE
                  || /* Glibc <= 2.19: */ _SVID_SOURCE || _BSD_SOURCE


---------------------------------------------------------------

::

          These functions are the reentrant analogs of the functions
          described in drand48(3).  Instead of modifying the global random
          generator state, they use the supplied data buffer.

          Before the first use, this struct must be initialized, for
          example, by filling it with zeros, or by calling one of the
          functions srand48_r(), seed48_r(), or lcong48_r().


-----------------------------------------------------------------

::

          The return value is 0.


-------------------------------------------------------------

::

          For an explanation of the terms used in this section, see
          attributes(7).

          ┌──────────────────────────┬───────────────┬─────────────────────┐
          │Interface                 │ Attribute     │ Value               │
          ├──────────────────────────┼───────────────┼─────────────────────┤
          │drand48_r(), erand48_r(), │ Thread safety │ MT-Safe race:buffer │
          │lrand48_r(), nrand48_r(), │               │                     │
          │mrand48_r(), jrand48_r(), │               │                     │
          │srand48_r(), seed48_r(),  │               │                     │
          │lcong48_r()               │               │                     │
          └──────────────────────────┴───────────────┴─────────────────────┘


-------------------------------------------------------------------

::

          These functions are GNU extensions and are not portable.


---------------------------------------------------------

::

          drand48(3), rand(3), random(3)

COLOPHON
---------------------------------------------------------

::

          This page is part of release 5.13 of the Linux man-pages project.
          A description of the project, information about reporting bugs,
          and the latest version of this page, can be found at
          https://www.kernel.org/doc/man-pages/.

   GNU                            2021-03-22                   DRAND48_R(3)

--------------

Pages that refer to this page: `rand(3) <../man3/rand.3.html>`__

--------------

`Copyright and license for this manual
page <../man3/drand48_r.3.license.html>`__

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
