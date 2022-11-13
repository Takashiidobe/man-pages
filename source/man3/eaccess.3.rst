.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

euidaccess(3) — Linux manual page
=================================

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

   EUIDACCESS(3)           Linux Programmer's Manual          EUIDACCESS(3)

NAME
-------------------------------------------------

::

          euidaccess, eaccess - check effective user's permissions for a
          file


---------------------------------------------------------

::

          #define _GNU_SOURCE             /* See feature_test_macros(7) */
          #include <unistd.h>

          int euidaccess(const char *pathname, int mode);
          int eaccess(const char *pathname, int mode);


---------------------------------------------------------------

::

          Like access(2), euidaccess() checks permissions and existence of
          the file identified by its argument pathname.  However, whereas
          access(2) performs checks using the real user and group
          identifiers of the process, euidaccess() uses the effective
          identifiers.

          mode is a mask consisting of one or more of R_OK, W_OK, X_OK, and
          F_OK, with the same meanings as for access(2).

          eaccess() is a synonym for euidaccess(), provided for
          compatibility with some other systems.


-----------------------------------------------------------------

::

          On success (all requested permissions granted), zero is returned.
          On error (at least one bit in mode asked for a permission that is
          denied, or some other error occurred), -1 is returned, and errno
          is set to indicate the error.


-----------------------------------------------------

::

          As for access(2).


---------------------------------------------------------

::

          The eaccess() function was added to glibc in version 2.4.


-------------------------------------------------------------

::

          For an explanation of the terms used in this section, see
          attributes(7).

          ┌──────────────────────────────────────┬───────────────┬─────────┐
          │Interface                             │ Attribute     │ Value   │
          ├──────────────────────────────────────┼───────────────┼─────────┤
          │euidaccess(), eaccess()               │ Thread safety │ MT-Safe │
          └──────────────────────────────────────┴───────────────┴─────────┘


-------------------------------------------------------------------

::

          These functions are nonstandard.  Some other systems have an
          eaccess() function.


---------------------------------------------------

::

          Warning: Using this function to check a process's permissions on
          a file before performing some operation based on that information
          leads to race conditions: the file permissions may change between
          the two steps.  Generally, it is safer just to attempt the
          desired operation and handle any permission error that occurs.

          This function always dereferences symbolic links.  If you need to
          check the permissions on a symbolic link, use faccessat(2) with
          the flags AT_EACCESS and AT_SYMLINK_NOFOLLOW.


---------------------------------------------------------

::

          access(2), chmod(2), chown(2), faccessat(2), open(2), setgid(2),
          setuid(2), stat(2), credentials(7), path_resolution(7)

COLOPHON
---------------------------------------------------------

::

          This page is part of release 5.13 of the Linux man-pages project.
          A description of the project, information about reporting bugs,
          and the latest version of this page, can be found at
          https://www.kernel.org/doc/man-pages/.

                                  2021-03-22                  EUIDACCESS(3)

--------------

Pages that refer to this page: `access(2) <../man2/access.2.html>`__, 
`credentials(7) <../man7/credentials.7.html>`__

--------------

`Copyright and license for this manual
page <../man3/euidaccess.3.license.html>`__

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
