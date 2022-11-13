.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

grantpt(3) — Linux manual page
==============================

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

   GRANTPT(3)              Linux Programmer's Manual             GRANTPT(3)

NAME
-------------------------------------------------

::

          grantpt - grant access to the slave pseudoterminal


---------------------------------------------------------

::

          #include <stdlib.h>

          int grantpt(int fd);

      Feature Test Macro Requirements for glibc (see
      feature_test_macros(7)):

          grantpt():
              Since glibc 2.24:
                  _XOPEN_SOURCE >= 500
              Glibc 2.23 and earlier:
                  _XOPEN_SOURCE


---------------------------------------------------------------

::

          The grantpt() function changes the mode and owner of the slave
          pseudoterminal device corresponding to the master pseudoterminal
          referred to by the file descriptor fd.  The user ID of the slave
          is set to the real UID of the calling process.  The group ID is
          set to an unspecified value (e.g., tty).  The mode of the slave
          is set to 0620 (crw--w----).

          The behavior of grantpt() is unspecified if a signal handler is
          installed to catch SIGCHLD signals.


-----------------------------------------------------------------

::

          When successful, grantpt() returns 0.  Otherwise, it returns -1
          and sets errno to indicate the error.


-----------------------------------------------------

::

          EACCES The corresponding slave pseudoterminal could not be
                 accessed.

          EBADF  The fd argument is not a valid open file descriptor.

          EINVAL The fd argument is valid but not associated with a master
                 pseudoterminal.


---------------------------------------------------------

::

          grantpt() is provided in glibc since version 2.1.


-------------------------------------------------------------

::

          For an explanation of the terms used in this section, see
          attributes(7).

          ┌───────────────────────────────┬───────────────┬────────────────┐
          │Interface                      │ Attribute     │ Value          │
          ├───────────────────────────────┼───────────────┼────────────────┤
          │grantpt()                      │ Thread safety │ MT-Safe locale │
          └───────────────────────────────┴───────────────┴────────────────┘


-------------------------------------------------------------------

::

          POSIX.1-2001, POSIX.1-2008.


---------------------------------------------------

::

          This is part of the UNIX 98 pseudoterminal support, see pts(4).

          Many systems implement this function via a set-user-ID helper
          binary called "pt_chown".  On Linux systems with a devpts
          filesystem (present since Linux 2.2), the kernel normally sets
          the correct ownership and permissions for the pseudoterminal
          slave when the master is opened (posix_openpt(3)), so that
          nothing must be done by grantpt().  Thus, no such helper binary
          is required (and indeed it is configured to be absent during the
          glibc build that is typical on many systems).


---------------------------------------------------------

::

          open(2), posix_openpt(3), ptsname(3), unlockpt(3), pts(4), pty(7)

COLOPHON
---------------------------------------------------------

::

          This page is part of release 5.13 of the Linux man-pages project.
          A description of the project, information about reporting bugs,
          and the latest version of this page, can be found at
          https://www.kernel.org/doc/man-pages/.

   GNU                            2021-03-22                     GRANTPT(3)

--------------

Pages that refer to this page: `getpt(3) <../man3/getpt.3.html>`__, 
`posix_openpt(3) <../man3/posix_openpt.3.html>`__, 
`ptsname(3) <../man3/ptsname.3.html>`__, 
`unlockpt(3) <../man3/unlockpt.3.html>`__, 
`pts(4) <../man4/pts.4.html>`__,  `pty(7) <../man7/pty.7.html>`__

--------------

`Copyright and license for this manual
page <../man3/grantpt.3.license.html>`__

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
