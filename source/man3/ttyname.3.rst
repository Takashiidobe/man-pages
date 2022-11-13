.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

ttyname(3) — Linux manual page
==============================

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

   TTYNAME(3)              Linux Programmer's Manual             TTYNAME(3)

NAME
-------------------------------------------------

::

          ttyname, ttyname_r - return name of a terminal


---------------------------------------------------------

::

          #include <unistd.h>

          char *ttyname(int fd);
          int ttyname_r(int fd, char *buf, size_t buflen);


---------------------------------------------------------------

::

          The function ttyname() returns a pointer to the null-terminated
          pathname of the terminal device that is open on the file
          descriptor fd, or NULL on error (for example, if fd is not
          connected to a terminal).  The return value may point to static
          data, possibly overwritten by the next call.  The function
          ttyname_r() stores this pathname in the buffer buf of length
          buflen.


-----------------------------------------------------------------

::

          The function ttyname() returns a pointer to a pathname on
          success.  On error, NULL is returned, and errno is set to
          indicate the error.  The function ttyname_r() returns 0 on
          success, and an error number upon error.


-----------------------------------------------------

::

          EBADF  Bad file descriptor.

          ENODEV fd refers to a slave pseudoterminal device but the
                 corresponding pathname could not be found (see NOTES).

          ENOTTY fd does not refer to a terminal device.

          ERANGE (ttyname_r()) buflen was too small to allow storing the
                 pathname.


-------------------------------------------------------------

::

          For an explanation of the terms used in this section, see
          attributes(7).

          ┌───────────────────────┬───────────────┬────────────────────────┐
          │Interface              │ Attribute     │ Value                  │
          ├───────────────────────┼───────────────┼────────────────────────┤
          │ttyname()              │ Thread safety │ MT-Unsafe race:ttyname │
          ├───────────────────────┼───────────────┼────────────────────────┤
          │ttyname_r()            │ Thread safety │ MT-Safe                │
          └───────────────────────┴───────────────┴────────────────────────┘


-------------------------------------------------------------------

::

          POSIX.1-2001, POSIX.1-2008, 4.2BSD.


---------------------------------------------------

::

          A process that keeps a file descriptor that refers to a pts(4)
          device open when switching to another mount namespace that uses a
          different /dev/ptmx instance may still accidentally find that a
          device path of the same name for that file descriptor exists.
          However, this device path refers to a different device and thus
          can't be used to access the device that the file descriptor
          refers to.  Calling ttyname() or ttyname_r() on the file
          descriptor in the new mount namespace will cause these functions
          to return NULL and set errno to ENODEV.


---------------------------------------------------------

::

          tty(1), fstat(2), ctermid(3), isatty(3), pts(4)

COLOPHON
---------------------------------------------------------

::

          This page is part of release 5.13 of the Linux man-pages project.
          A description of the project, information about reporting bugs,
          and the latest version of this page, can be found at
          https://www.kernel.org/doc/man-pages/.

   Linux                          2021-03-22                     TTYNAME(3)

--------------

Pages that refer to this page: `ctermid(3) <../man3/ctermid.3.html>`__, 
`getttyent(3) <../man3/getttyent.3.html>`__, 
`getutent(3) <../man3/getutent.3.html>`__, 
`isatty(3) <../man3/isatty.3.html>`__, 
`openpty(3) <../man3/openpty.3.html>`__, 
`ptsname(3) <../man3/ptsname.3.html>`__, 
`ttyslot(3) <../man3/ttyslot.3.html>`__

--------------

`Copyright and license for this manual
page <../man3/ttyname.3.license.html>`__

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
