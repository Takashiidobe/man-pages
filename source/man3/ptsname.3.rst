.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

ptsname(3) — Linux manual page
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
| \| `SEE ALSO <#SEE_ALSO>`__ \|    |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   PTSNAME(3)              Linux Programmer's Manual             PTSNAME(3)

NAME
-------------------------------------------------

::

          ptsname, ptsname_r - get the name of the slave pseudoterminal


---------------------------------------------------------

::

          #include <stdlib.h>

          char *ptsname(int fd);
          int ptsname_r(int fd, char *buf, size_t buflen);

      Feature Test Macro Requirements for glibc (see
      feature_test_macros(7)):

          ptsname():
              Since glibc 2.24:
                  _XOPEN_SOURCE >= 500
              Glibc 2.23 and earlier:
                  _XOPEN_SOURCE

          ptsname_r():
              _GNU_SOURCE


---------------------------------------------------------------

::

          The ptsname() function returns the name of the slave
          pseudoterminal device corresponding to the master referred to by
          the file descriptor fd.

          The ptsname_r() function is the reentrant equivalent of
          ptsname().  It returns the name of the slave pseudoterminal
          device as a null-terminated string in the buffer pointed to by
          buf.  The buflen argument specifies the number of bytes available
          in buf.


-----------------------------------------------------------------

::

          On success, ptsname() returns a pointer to a string in static
          storage which will be overwritten by subsequent calls.  This
          pointer must not be freed.  On failure, NULL is returned.

          On success, ptsname_r() returns 0.  On failure, an error number
          is returned to indicate the error.


-----------------------------------------------------

::

          EINVAL (ptsname_r() only) buf is NULL.  (This error is returned
                 only for glibc 2.25 and earlier.)

          ENOTTY fd does not refer to a pseudoterminal master device.

          ERANGE (ptsname_r() only) buf is too small.


---------------------------------------------------------

::

          ptsname() is provided in glibc since version 2.1.


-------------------------------------------------------------

::

          For an explanation of the terms used in this section, see
          attributes(7).

          ┌───────────────────────┬───────────────┬────────────────────────┐
          │Interface              │ Attribute     │ Value                  │
          ├───────────────────────┼───────────────┼────────────────────────┤
          │ptsname()              │ Thread safety │ MT-Unsafe race:ptsname │
          ├───────────────────────┼───────────────┼────────────────────────┤
          │ptsname_r()            │ Thread safety │ MT-Safe                │
          └───────────────────────┴───────────────┴────────────────────────┘


-------------------------------------------------------------------

::

          ptsname():
           POSIX.1-2001, POSIX.1-2008.

          ptsname() is part of the UNIX 98 pseudoterminal support (see
          pts(4)).

          ptsname_r() is a Linux extension, that is proposed for inclusion
          in the next major revision of POSIX.1 (Issue 8).  A version of
          this function is documented on Tru64 and HP-UX, but on those
          implementations, -1 is returned on error, with errno set to
          indicate the error.  Avoid using this function in portable
          programs.


---------------------------------------------------------

::

          grantpt(3), posix_openpt(3), ttyname(3), unlockpt(3), pts(4),
          pty(7)

COLOPHON
---------------------------------------------------------

::

          This page is part of release 5.13 of the Linux man-pages project.
          A description of the project, information about reporting bugs,
          and the latest version of this page, can be found at
          https://www.kernel.org/doc/man-pages/.

                                  2021-03-22                     PTSNAME(3)

--------------

Pages that refer to this page:
`ioctl_tty(2) <../man2/ioctl_tty.2.html>`__, 
`getpt(3) <../man3/getpt.3.html>`__, 
`grantpt(3) <../man3/grantpt.3.html>`__, 
`posix_openpt(3) <../man3/posix_openpt.3.html>`__, 
`unlockpt(3) <../man3/unlockpt.3.html>`__, 
`pts(4) <../man4/pts.4.html>`__,  `pty(7) <../man7/pty.7.html>`__

--------------

`Copyright and license for this manual
page <../man3/ptsname.3.license.html>`__

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
