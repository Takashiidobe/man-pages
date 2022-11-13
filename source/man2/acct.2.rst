.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

acct(2) — Linux manual page
===========================

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

   ACCT(2)                 Linux Programmer's Manual                ACCT(2)

NAME
-------------------------------------------------

::

          acct - switch process accounting on or off


---------------------------------------------------------

::

          #include <unistd.h>

          int acct(const char *filename);

      Feature Test Macro Requirements for glibc (see
      feature_test_macros(7)):

          acct():
              Since glibc 2.21:
                  _DEFAULT_SOURCE
              In glibc 2.19 and 2.20:
                  _DEFAULT_SOURCE || (_XOPEN_SOURCE && _XOPEN_SOURCE < 500)
              Up to and including glibc 2.19:
                  _BSD_SOURCE || (_XOPEN_SOURCE && _XOPEN_SOURCE < 500)


---------------------------------------------------------------

::

          The acct() system call enables or disables process accounting.
          If called with the name of an existing file as its argument,
          accounting is turned on, and records for each terminating process
          are appended to filename as it terminates.  An argument of NULL
          causes accounting to be turned off.


-----------------------------------------------------------------

::

          On success, zero is returned.  On error, -1 is returned, and
          errno is set to indicate the error.


-----------------------------------------------------

::

          EACCES Write permission is denied for the specified file, or
                 search permission is denied for one of the directories in
                 the path prefix of filename (see also path_resolution(7)),
                 or filename is not a regular file.

          EFAULT filename points outside your accessible address space.

          EIO    Error writing to the file filename.

          EISDIR filename is a directory.

          ELOOP  Too many symbolic links were encountered in resolving
                 filename.

          ENAMETOOLONG
                 filename was too long.

          ENFILE The system-wide limit on the total number of open files
                 has been reached.

          ENOENT The specified file does not exist.

          ENOMEM Out of memory.

          ENOSYS BSD process accounting has not been enabled when the
                 operating system kernel was compiled.  The kernel
                 configuration parameter controlling this feature is
                 CONFIG_BSD_PROCESS_ACCT.

          ENOTDIR
                 A component used as a directory in filename is not in fact
                 a directory.

          EPERM  The calling process has insufficient privilege to enable
                 process accounting.  On Linux, the CAP_SYS_PACCT
                 capability is required.

          EROFS  filename refers to a file on a read-only filesystem.

          EUSERS There are no more free file structures or we ran out of
                 memory.


-------------------------------------------------------------------

::

          SVr4, 4.3BSD (but not POSIX).


---------------------------------------------------

::

          No accounting is produced for programs running when a system
          crash occurs.  In particular, nonterminating processes are never
          accounted for.

          The structure of the records written to the accounting file is
          described in acct(5).


---------------------------------------------------------

::

          acct(5)

COLOPHON
---------------------------------------------------------

::

          This page is part of release 5.13 of the Linux man-pages project.
          A description of the project, information about reporting bugs,
          and the latest version of this page, can be found at
          https://www.kernel.org/doc/man-pages/.

   Linux                          2021-03-22                        ACCT(2)

--------------

Pages that refer to this page:
`syscalls(2) <../man2/syscalls.2.html>`__, 
`acct(5) <../man5/acct.5.html>`__, 
`capabilities(7) <../man7/capabilities.7.html>`__, 
`feature_test_macros(7) <../man7/feature_test_macros.7.html>`__

--------------

`Copyright and license for this manual
page <../man2/acct.2.license.html>`__

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
