.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

getsid(2) — Linux manual page
=============================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `RETURN VALUE <#RETURN_VALUE>`__  |                                   |
| \| `ERRORS <#ERRORS>`__ \|        |                                   |
| `VERSIONS <#VERSIONS>`__ \|       |                                   |
| `                                 |                                   |
| CONFORMING TO <#CONFORMING_TO>`__ |                                   |
| \| `NOTES <#NOTES>`__ \|          |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   GETSID(2)               Linux Programmer's Manual              GETSID(2)

NAME
-------------------------------------------------

::

          getsid - get session ID


---------------------------------------------------------

::

          #include <unistd.h>

          pid_t getsid(pid_t pid);

      Feature Test Macro Requirements for glibc (see
      feature_test_macros(7)):

          getsid():
              _XOPEN_SOURCE >= 500
                  || /* Since glibc 2.12: */ _POSIX_C_SOURCE >= 200809L


---------------------------------------------------------------

::

          getsid(0) returns the session ID of the calling process.
          getsid() returns the session ID of the process with process ID
          pid.  If pid is 0, getsid() returns the session ID of the calling
          process.


-----------------------------------------------------------------

::

          On success, a session ID is returned.  On error, (pid_t) -1 is
          returned, and errno is set to indicate the error.


-----------------------------------------------------

::

          EPERM  A process with process ID pid exists, but it is not in the
                 same session as the calling process, and the
                 implementation considers this an error.

          ESRCH  No process with process ID pid was found.


---------------------------------------------------------

::

          This system call is available on Linux since version 2.0.


-------------------------------------------------------------------

::

          POSIX.1-2001, POSIX.1-2008, SVr4.


---------------------------------------------------

::

          Linux does not return EPERM.

          See credentials(7) for a description of sessions and session IDs.


---------------------------------------------------------

::

          getpgid(2), setsid(2), credentials(7)

COLOPHON
---------------------------------------------------------

::

          This page is part of release 5.13 of the Linux man-pages project.
          A description of the project, information about reporting bugs,
          and the latest version of this page, can be found at
          https://www.kernel.org/doc/man-pages/.

   Linux                          2021-03-22                      GETSID(2)

--------------

Pages that refer to this page: `procps(1) <../man1/procps.1.html>`__, 
`ps(1) <../man1/ps.1.html>`__,  `setsid(2) <../man2/setsid.2.html>`__, 
`syscalls(2) <../man2/syscalls.2.html>`__, 
`sd_pid_get_owner_uid(3) <../man3/sd_pid_get_owner_uid.3.html>`__, 
`tcgetsid(3) <../man3/tcgetsid.3.html>`__, 
`utmp(5) <../man5/utmp.5.html>`__, 
`credentials(7) <../man7/credentials.7.html>`__, 
`system_data_types(7) <../man7/system_data_types.7.html>`__

--------------

`Copyright and license for this manual
page <../man2/getsid.2.license.html>`__

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
