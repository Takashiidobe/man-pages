.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

timegm(3) — Linux manual page
=============================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `RETURN VALUE <#RETURN_VALUE>`__  |                                   |
| \| `ERRORS <#ERRORS>`__ \|        |                                   |
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

   TIMEGM(3)               Linux Programmer's Manual              TIMEGM(3)

NAME
-------------------------------------------------

::

          timegm, timelocal - inverses of gmtime and localtime


---------------------------------------------------------

::

          #include <time.h>

          time_t timelocal(struct tm *tm);
          time_t timegm(struct tm *tm);

      Feature Test Macro Requirements for glibc (see
      feature_test_macros(7)):

          timelocal(), timegm():
              Since glibc 2.19:
                  _DEFAULT_SOURCE
              Glibc 2.19 and earlier:
                  _BSD_SOURCE || _SVID_SOURCE


---------------------------------------------------------------

::

          The functions timelocal() and timegm() are the inverses of
          localtime(3) and gmtime(3).  Both functions take a broken-down
          time and convert it to calendar time (seconds since the Epoch,
          1970-01-01 00:00:00 +0000, UTC).  The difference between the two
          functions is that timelocal() takes the local timezone into
          account when doing the conversion, while timegm() takes the input
          value to be Coordinated Universal Time (UTC).


-----------------------------------------------------------------

::

          On success, these functions return the calendar time (seconds
          since the Epoch), expressed as a value of type time_t.  On error,
          they return the value (time_t) -1 and set errno to indicate the
          error.


-----------------------------------------------------

::

          EOVERFLOW
                 The result cannot be represented.


-------------------------------------------------------------

::

          For an explanation of the terms used in this section, see
          attributes(7).

          ┌───────────────────────────┬───────────────┬────────────────────┐
          │Interface                  │ Attribute     │ Value              │
          ├───────────────────────────┼───────────────┼────────────────────┤
          │timelocal(), timegm()      │ Thread safety │ MT-Safe env locale │
          └───────────────────────────┴───────────────┴────────────────────┘


-------------------------------------------------------------------

::

          These functions are nonstandard GNU extensions that are also
          present on the BSDs.  Avoid their use.


---------------------------------------------------

::

          The timelocal() function is equivalent to the POSIX standard
          function mktime(3).  There is no reason to ever use it.


---------------------------------------------------------

::

          gmtime(3), localtime(3), mktime(3), tzset(3)

COLOPHON
---------------------------------------------------------

::

          This page is part of release 5.13 of the Linux man-pages project.
          A description of the project, information about reporting bugs,
          and the latest version of this page, can be found at
          https://www.kernel.org/doc/man-pages/.

   GNU                            2021-03-22                      TIMEGM(3)

--------------

Pages that refer to this page: `ctime(3) <../man3/ctime.3.html>`__

--------------

`Copyright and license for this manual
page <../man3/timegm.3.license.html>`__

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
