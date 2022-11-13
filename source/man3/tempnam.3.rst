.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

tempnam(3) — Linux manual page
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
| `BUGS <#BUGS>`__ \|               |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   TEMPNAM(3)              Linux Programmer's Manual             TEMPNAM(3)

NAME
-------------------------------------------------

::

          tempnam - create a name for a temporary file


---------------------------------------------------------

::

          #include <stdio.h>

          char *tempnam(const char *dir, const char *pfx);

      Feature Test Macro Requirements for glibc (see
      feature_test_macros(7)):

          tempnam():
              Since glibc 2.19:
                  _DEFAULT_SOURCE
              Glibc 2.19 and earlier:
                  _BSD_SOURCE || _SVID_SOURCE


---------------------------------------------------------------

::

          Never use this function.  Use mkstemp(3) or tmpfile(3) instead.

          The tempnam() function returns a pointer to a string that is a
          valid filename, and such that a file with this name did not exist
          when tempnam() checked.  The filename suffix of the pathname
          generated will start with pfx in case pfx is a non-NULL string of
          at most five bytes.  The directory prefix part of the pathname
          generated is required to be "appropriate" (often that at least
          implies writable).

          Attempts to find an appropriate directory go through the
          following steps:

          a) In case the environment variable TMPDIR exists and contains
             the name of an appropriate directory, that is used.

          b) Otherwise, if the dir argument is non-NULL and appropriate, it
             is used.

          c) Otherwise, P_tmpdir (as defined in <stdio.h>) is used when
             appropriate.

          d) Finally an implementation-defined directory may be used.

          The string returned by tempnam() is allocated using malloc(3) and
          hence should be freed by free(3).


-----------------------------------------------------------------

::

          On success, the tempnam() function returns a pointer to a unique
          temporary filename.  It returns NULL if a unique name cannot be
          generated, with errno set to indicate the error.


-----------------------------------------------------

::

          ENOMEM Allocation of storage failed.


-------------------------------------------------------------

::

          For an explanation of the terms used in this section, see
          attributes(7).

          ┌──────────────────────────────────┬───────────────┬─────────────┐
          │Interface                         │ Attribute     │ Value       │
          ├──────────────────────────────────┼───────────────┼─────────────┤
          │tempnam()                         │ Thread safety │ MT-Safe env │
          └──────────────────────────────────┴───────────────┴─────────────┘


-------------------------------------------------------------------

::

          SVr4, 4.3BSD, POSIX.1-2001.  POSIX.1-2008 marks tempnam() as
          obsolete.


---------------------------------------------------

::

          Although tempnam() generates names that are difficult to guess,
          it is nevertheless possible that between the time that tempnam()
          returns a pathname, and the time that the program opens it,
          another program might create that pathname using open(2), or
          create it as a symbolic link.  This can lead to security holes.
          To avoid such possibilities, use the open(2) O_EXCL flag to open
          the pathname.  Or better yet, use mkstemp(3) or tmpfile(3).

          SUSv2 does not mention the use of TMPDIR; glibc will use it only
          when the program is not set-user-ID.  On SVr4, the directory used
          under d) is /tmp (and this is what glibc does).

          Because it dynamically allocates memory used to return the
          pathname, tempnam() is reentrant, and thus thread safe, unlike
          tmpnam(3).

          The tempnam() function generates a different string each time it
          is called, up to TMP_MAX (defined in <stdio.h>) times.  If it is
          called more than TMP_MAX times, the behavior is implementation
          defined.

          tempnam() uses at most the first five bytes from pfx.

          The glibc implementation of tempnam() fails with the error EEXIST
          upon failure to find a unique name.


-------------------------------------------------

::

          The precise meaning of "appropriate" is undefined; it is
          unspecified how accessibility of a directory is determined.


---------------------------------------------------------

::

          mkstemp(3), mktemp(3), tmpfile(3), tmpnam(3)

COLOPHON
---------------------------------------------------------

::

          This page is part of release 5.13 of the Linux man-pages project.
          A description of the project, information about reporting bugs,
          and the latest version of this page, can be found at
          https://www.kernel.org/doc/man-pages/.

                                  2021-03-22                     TEMPNAM(3)

--------------

Pages that refer to this page: `getpid(2) <../man2/getpid.2.html>`__, 
`mkdtemp(3) <../man3/mkdtemp.3.html>`__, 
`mkstemp(3) <../man3/mkstemp.3.html>`__, 
`mktemp(3) <../man3/mktemp.3.html>`__, 
`stdio(3) <../man3/stdio.3.html>`__, 
`tmpfile(3) <../man3/tmpfile.3.html>`__, 
`tmpnam(3) <../man3/tmpnam.3.html>`__, 
`environ(7) <../man7/environ.7.html>`__

--------------

`Copyright and license for this manual
page <../man3/tempnam.3.license.html>`__

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
