.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

realpath(3) — Linux manual page
===============================

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

   REALPATH(3)             Linux Programmer's Manual            REALPATH(3)

NAME
-------------------------------------------------

::

          realpath - return the canonicalized absolute pathname


---------------------------------------------------------

::

          #include <limits.h>
          #include <stdlib.h>

          char *realpath(const char *restrict path,
                         char *restrict resolved_path);

      Feature Test Macro Requirements for glibc (see
      feature_test_macros(7)):

          realpath():
              _XOPEN_SOURCE >= 500
                  || /* Glibc since 2.19: */ _DEFAULT_SOURCE
                  || /* Glibc <= 2.19: */ _BSD_SOURCE


---------------------------------------------------------------

::

          realpath() expands all symbolic links and resolves references to
          /./, /../ and extra '/' characters in the null-terminated string
          named by path to produce a canonicalized absolute pathname.  The
          resulting pathname is stored as a null-terminated string, up to a
          maximum of PATH_MAX bytes, in the buffer pointed to by
          resolved_path.  The resulting path will have no symbolic link,
          /./ or /../ components.

          If resolved_path is specified as NULL, then realpath() uses
          malloc(3) to allocate a buffer of up to PATH_MAX bytes to hold
          the resolved pathname, and returns a pointer to this buffer.  The
          caller should deallocate this buffer using free(3).


-----------------------------------------------------------------

::

          If there is no error, realpath() returns a pointer to the
          resolved_path.

          Otherwise, it returns NULL, the contents of the array
          resolved_path are undefined, and errno is set to indicate the
          error.


-----------------------------------------------------

::

          EACCES Read or search permission was denied for a component of
                 the path prefix.

          EINVAL path is NULL.  (In glibc versions before 2.3, this error
                 is also returned if resolved_path is NULL.)

          EIO    An I/O error occurred while reading from the filesystem.

          ELOOP  Too many symbolic links were encountered in translating
                 the pathname.

          ENAMETOOLONG
                 A component of a pathname exceeded NAME_MAX characters, or
                 an entire pathname exceeded PATH_MAX characters.

          ENOENT The named file does not exist.

          ENOMEM Out of memory.

          ENOTDIR
                 A component of the path prefix is not a directory.


-------------------------------------------------------------

::

          For an explanation of the terms used in this section, see
          attributes(7).

          ┌──────────────────────────────────────┬───────────────┬─────────┐
          │Interface                             │ Attribute     │ Value   │
          ├──────────────────────────────────────┼───────────────┼─────────┤
          │realpath()                            │ Thread safety │ MT-Safe │
          └──────────────────────────────────────┴───────────────┴─────────┘


-------------------------------------------------------------------

::

          4.4BSD, POSIX.1-2001.

          POSIX.1-2001 says that the behavior if resolved_path is NULL is
          implementation-defined.  POSIX.1-2008 specifies the behavior
          described in this page.


---------------------------------------------------

::

          In 4.4BSD and Solaris, the limit on the pathname length is
          MAXPATHLEN (found in <sys/param.h>).  SUSv2 prescribes PATH_MAX
          and NAME_MAX, as found in <limits.h> or provided by the
          pathconf(3) function.  A typical source fragment would be

              #ifdef PATH_MAX
                path_max = PATH_MAX;
              #else
                path_max = pathconf(path, _PC_PATH_MAX);
                if (path_max <= 0)
                  path_max = 4096;
              #endif

          (But see the BUGS section.)

      GNU extensions
          If the call fails with either EACCES or ENOENT and resolved_path
          is not NULL, then the prefix of path that is not readable or does
          not exist is returned in resolved_path.


-------------------------------------------------

::

          The POSIX.1-2001 standard version of this function is broken by
          design, since it is impossible to determine a suitable size for
          the output buffer, resolved_path.  According to POSIX.1-2001 a
          buffer of size PATH_MAX suffices, but PATH_MAX need not be a
          defined constant, and may have to be obtained using pathconf(3).
          And asking pathconf(3) does not really help, since, on the one
          hand POSIX warns that the result of pathconf(3) may be huge and
          unsuitable for mallocing memory, and on the other hand
          pathconf(3) may return -1 to signify that PATH_MAX is not
          bounded.  The resolved_path == NULL feature, not standardized in
          POSIX.1-2001, but standardized in POSIX.1-2008, allows this
          design problem to be avoided.


---------------------------------------------------------

::

          realpath(1), readlink(2), canonicalize_file_name(3), getcwd(3),
          pathconf(3), sysconf(3)

COLOPHON
---------------------------------------------------------

::

          This page is part of release 5.13 of the Linux man-pages project.
          A description of the project, information about reporting bugs,
          and the latest version of this page, can be found at
          https://www.kernel.org/doc/man-pages/.

                                  2021-03-22                    REALPATH(3)

--------------

Pages that refer to this page:
`dpkg-shlibdeps(1) <../man1/dpkg-shlibdeps.1.html>`__, 
`readlink(1) <../man1/readlink.1.html>`__, 
`realpath(1) <../man1/realpath.1.html>`__, 
`mount(2) <../man2/mount.2.html>`__, 
`readlink(2) <../man2/readlink.2.html>`__, 
`bindtextdomain(3) <../man3/bindtextdomain.3.html>`__, 
`canonicalize_file_name(3) <../man3/canonicalize_file_name.3.html>`__, 
`matchpathcon(3) <../man3/matchpathcon.3.html>`__, 
`selinux_restorecon(3) <../man3/selinux_restorecon.3.html>`__, 
`mount(8) <../man8/mount.8.html>`__, 
`restorecon(8) <../man8/restorecon.8.html>`__

--------------

`Copyright and license for this manual
page <../man3/realpath.3.license.html>`__

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
