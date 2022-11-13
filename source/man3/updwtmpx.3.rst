.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

updwtmp(3) — Linux manual page
==============================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `FILES <#FILES>`__ \|             |                                   |
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

   UPDWTMP(3)              Linux Programmer's Manual             UPDWTMP(3)

NAME
-------------------------------------------------

::

          updwtmp, logwtmp - append an entry to the wtmp file


---------------------------------------------------------

::

          #include <utmp.h>

          void updwtmp(const char *wtmp_file, const struct utmp *ut);
          void logwtmp(const char *line, const char *name, const char *host);

          For logwtmp(), link with -lutil.


---------------------------------------------------------------

::

          updwtmp() appends the utmp structure ut to the wtmp file.

          logwtmp() constructs a utmp structure using line, name, host,
          current time, and current process ID.  Then it calls updwtmp() to
          append the structure to the wtmp file.


---------------------------------------------------

::

          /var/log/wtmp
                 database of past user logins


-------------------------------------------------------------

::

          For an explanation of the terms used in this section, see
          attributes(7).

          ┌─────────────────────┬───────────────┬──────────────────────────┐
          │Interface            │ Attribute     │ Value                    │
          ├─────────────────────┼───────────────┼──────────────────────────┤
          │updwtmp(), logwtmp() │ Thread safety │ MT-Unsafe sig:ALRM timer │
          └─────────────────────┴───────────────┴──────────────────────────┘


-------------------------------------------------------------------

::

          Not in POSIX.1.  Present on Solaris, NetBSD, and perhaps other
          systems.


---------------------------------------------------

::

          For consistency with the other "utmpx" functions (see
          getutxent(3)), glibc provides (since version 2.1):

              #include <utmpx.h>
              void updwtmpx (const char *wtmpx_file, const struct utmpx *utx);

          This function performs the same task as updwtmp(), but differs in
          that it takes a utmpx structure as its last argument.


---------------------------------------------------------

::

          getutxent(3), wtmp(5)

COLOPHON
---------------------------------------------------------

::

          This page is part of release 5.13 of the Linux man-pages project.
          A description of the project, information about reporting bugs,
          and the latest version of this page, can be found at
          https://www.kernel.org/doc/man-pages/.

   GNU                            2021-03-22                     UPDWTMP(3)

--------------

Pages that refer to this page: `utmp(5) <../man5/utmp.5.html>`__

--------------

`Copyright and license for this manual
page <../man3/updwtmp.3.license.html>`__

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
