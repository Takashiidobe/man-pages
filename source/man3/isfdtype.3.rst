.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

isfdtype(3) — Linux manual page
===============================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `RETURN VALUE <#RETURN_VALUE>`__  |                                   |
| \| `ERRORS <#ERRORS>`__ \|        |                                   |
| `                                 |                                   |
| CONFORMING TO <#CONFORMING_TO>`__ |                                   |
| \| `NOTES <#NOTES>`__ \|          |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   ISFDTYPE(3)             Linux Programmer's Manual            ISFDTYPE(3)

NAME
-------------------------------------------------

::

          isfdtype - test file type of a file descriptor


---------------------------------------------------------

::

          #include <sys/stat.h>
          #include <sys/socket.h>

          int isfdtype(int fd, int fdtype);

      Feature Test Macro Requirements for glibc (see
      feature_test_macros(7)):

          isfdtype():
              Since glibc 2.20:
                  _DEFAULT_SOURCE
              Before glibc 2.20:
                  _BSD_SOURCE || _SVID_SOURCE


---------------------------------------------------------------

::

          The isfdtype() function tests whether the file descriptor fd
          refers to a file of type fdtype.  The fdtype argument specifies
          one of the S_IF* constants defined in <sys/stat.h> and documented
          in stat(2) (e.g., S_IFREG).


-----------------------------------------------------------------

::

          The isfdtype() function returns 1 if the file descriptor fd is of
          type fdtype and 0 if it is not.  On failure, -1 is returned and
          errno is set to indicate the error.


-----------------------------------------------------

::

          The isfdtype() function can fail with any of the same errors as
          fstat(2).


-------------------------------------------------------------------

::

          The isfdtype() function is not specified in any standard, but did
          appear in the draft POSIX.1g standard.  It is present on OpenBSD
          and Tru64 UNIX (where the required header file in both cases is
          just <sys/stat.h>, as shown in the POSIX.1g draft), and possibly
          other systems.


---------------------------------------------------

::

          Portable applications should use fstat(2) instead.


---------------------------------------------------------

::

          fstat(2)

COLOPHON
---------------------------------------------------------

::

          This page is part of release 5.13 of the Linux man-pages project.
          A description of the project, information about reporting bugs,
          and the latest version of this page, can be found at
          https://www.kernel.org/doc/man-pages/.

   Linux                          2021-03-22                    ISFDTYPE(3)

--------------

`Copyright and license for this manual
page <../man3/isfdtype.3.license.html>`__

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
