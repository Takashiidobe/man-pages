.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

posix_openpt(3) — Linux manual page
===================================

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

   POSIX_OPENPT(3)         Linux Programmer's Manual        POSIX_OPENPT(3)

NAME
-------------------------------------------------

::

          posix_openpt - open a pseudoterminal device


---------------------------------------------------------

::

          #include <stdlib.h>
          #include <fcntl.h>

          int posix_openpt(int flags);

      Feature Test Macro Requirements for glibc (see
      feature_test_macros(7)):

          posix_openpt():
              _XOPEN_SOURCE >= 600


---------------------------------------------------------------

::

          The posix_openpt() function opens an unused pseudoterminal master
          device, returning a file descriptor that can be used to refer to
          that device.

          The flags argument is a bit mask that ORs together zero or more
          of the following flags:

          O_RDWR Open the device for both reading and writing.  It is usual
                 to specify this flag.

          O_NOCTTY
                 Do not make this device the controlling terminal for the
                 process.


-----------------------------------------------------------------

::

          On success, posix_openpt() returns a file descriptor (a
          nonnegative integer) which is the lowest numbered unused file
          descriptor.  On failure, -1 is returned, and errno is set to
          indicate the error.


-----------------------------------------------------

::

          See open(2).


---------------------------------------------------------

::

          Glibc support for posix_openpt() has been provided since version
          2.2.1.


-------------------------------------------------------------

::

          For an explanation of the terms used in this section, see
          attributes(7).

          ┌──────────────────────────────────────┬───────────────┬─────────┐
          │Interface                             │ Attribute     │ Value   │
          ├──────────────────────────────────────┼───────────────┼─────────┤
          │posix_openpt()                        │ Thread safety │ MT-Safe │
          └──────────────────────────────────────┴───────────────┴─────────┘


-------------------------------------------------------------------

::

          POSIX.1-2001, POSIX.1-2008.

          posix_openpt() is part of the UNIX 98 pseudoterminal support (see
          pts(4)).


---------------------------------------------------

::

          Some older UNIX implementations that support System V (aka UNIX
          98) pseudoterminals don't have this function, but it can be
          easily implemented by opening the pseudoterminal multiplexor
          device:

              int
              posix_openpt(int flags)
              {
                  return open("/dev/ptmx", flags);
              }

          Calling posix_openpt() creates a pathname for the corresponding
          pseudoterminal slave device.  The pathname of the slave device
          can be obtained using ptsname(3).  The slave device pathname
          exists only as long as the master device is open.


---------------------------------------------------------

::

          open(2), getpt(3), grantpt(3), ptsname(3), unlockpt(3), pts(4),
          pty(7)

COLOPHON
---------------------------------------------------------

::

          This page is part of release 5.13 of the Linux man-pages project.
          A description of the project, information about reporting bugs,
          and the latest version of this page, can be found at
          https://www.kernel.org/doc/man-pages/.

                                  2021-03-22                POSIX_OPENPT(3)

--------------

Pages that refer to this page: `getpt(3) <../man3/getpt.3.html>`__, 
`grantpt(3) <../man3/grantpt.3.html>`__, 
`ptsname(3) <../man3/ptsname.3.html>`__, 
`unlockpt(3) <../man3/unlockpt.3.html>`__, 
`org.freedesktop.machine1(5) <../man5/org.freedesktop.machine1.5.html>`__, 
`pty(7) <../man7/pty.7.html>`__

--------------

`Copyright and license for this manual
page <../man3/posix_openpt.3.license.html>`__

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
