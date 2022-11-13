.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

cap_get_file(3) — Linux manual page
===================================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `RETURN VALUE <#RETURN_VALUE>`__  |                                   |
| \|                                |                                   |
| `                                 |                                   |
| CONFORMING TO <#CONFORMING_TO>`__ |                                   |
| \| `NOTES <#NOTES>`__ \|          |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   CAP_GET_FILE(3)         Linux Programmer's Manual        CAP_GET_FILE(3)

NAME
-------------------------------------------------

::

          cap_get_file, cap_set_file, cap_get_fd, cap_set_fd - capability
          manipulation on files


---------------------------------------------------------

::

          #include <sys/capability.h>

          cap_t cap_get_file(const char *path_p);
          int cap_set_file(const char *path_p, cap_t cap_p);
          cap_t cap_get_fd(int fd);
          int cap_set_fd(int fd, cap_t caps);
          uid_t cap_get_nsowner(cap_t caps);
          int cap_set_nsowner(cap_t caps, uid_t rootuid);

          Link with -lcap.


---------------------------------------------------------------

::

          cap_get_file() and cap_get_fd() allocate a capability state in
          working storage and set it to represent the capability state of
          the pathname pointed to by path_p or the file open on descriptor
          fd.  These functions return a pointer to the newly created
          capability state.  The effects of reading the capability state
          from any file other than a regular file is undefined.  The caller
          should free any releasable memory, when the capability state in
          working storage is no longer required, by calling cap_free() with
          the used cap_t as an argument.

          cap_set_file() and cap_set_fd() set the values for all capability
          flags for all capabilities for the pathname pointed to by path_p
          or the file open on descriptor fd, with the capability state
          identified by cap_p.  The new capability state of the file is
          completely determined by the contents of cap_p.  A NULL value for
          cap_p is used to indicate that capabilities for the file should
          be deleted.  For these functions to succeed, the calling process
          must have the CAP_SETFCAP capability in its effective set and
          either the effective user ID of the process must match the file
          owner or the calling process must have the CAP_FOWNER capability
          in its effective capability set.  The effects of writing the
          capability state to any file type other than a regular file are
          undefined.

          A capability set held in memory can be associated with the root
          user ID in use in a specific user namespace. It is possible to
          get and set this value (in the memory copy) with
          cap_get_nsowner() and cap_set_nsowner() respectively. The root
          user ID is ignored by the libcap library in all cases other than
          when the capability is written to a file. Only if the value is
          non-zero will the library attempt to include it in the written
          file capability set.


-----------------------------------------------------------------

::

          cap_get_file() and cap_get_fd() return a non-NULL value on
          success, and NULL on failure.

          cap_set_file() and cap_set_fd() return zero on success, and -1 on
          failure.

          On failure, errno is set to EACCES, EBADFD, ENAMETOOLONG, ENOENT,
          ENOMEM, ENOTDIR, EPERM, or EROFS.


-------------------------------------------------------------------

::

          These functions are specified by withdrawn POSIX.1e draft
          specification.


---------------------------------------------------

::

          Support for file capabilities is provided on Linux since version
          2.6.24.

          On Linux, the file Effective set is a single bit.  If it is
          enabled, then all Permitted capabilities are enabled in the
          Effective set of the calling process when the file is executed;
          otherwise, no capabilities are enabled in the process's Effective
          set following an execve(2).  Because the file Effective set is a
          single bit, if any capability is enabled in the Effective set of
          the cap_t given to cap_set_file() or cap_set_fd(), then all
          capabilities whose Permitted or Inheritable flag is enabled must
          also have the Effective flag enabled.  Conversely, if the
          Effective bit is enabled on a file, then the cap_t returned by
          cap_get_file() and cap_get_fd() will have the Effective flag
          enabled for each capability that has the Permitted or Inheritable
          flag enabled.


---------------------------------------------------------

::

          libcap(3), cap_clear(3), cap_copy_ext(3), cap_from_text(3),
          cap_get_proc(3), cap_init(3), capabilities(7), user_namespaces(7)

COLOPHON
---------------------------------------------------------

::

          This page is part of the libcap (capabilities commands and
          library) project.  Information about the project can be found at
          ⟨https://git.kernel.org/pub/scm/libs/libcap/libcap.git/⟩.  If you
          have a bug report for this manual page, send it to
          morgan@kernel.org (please put "libcap" in the Subject line).
          This page was obtained from the project's upstream Git repository
          ⟨https://git.kernel.org/pub/scm/libs/libcap/libcap.git/⟩ on
          2021-08-27.  (At that time, the date of the most recent commit
          that was found in the repository was 2021-08-25.)  If you
          discover any rendering problems in this HTML version of the page,
          or you believe there is a better or more up-to-date source for
          the page, or you have corrections or improvements to the
          information in this COLOPHON (which is not part of the original
          manual page), send a mail to man-pages@man7.org

                                  2021-03-06                CAP_GET_FILE(3)

--------------

Pages that refer to this page:
`cap_clear(3) <../man3/cap_clear.3.html>`__, 
`cap_copy_ext(3) <../man3/cap_copy_ext.3.html>`__, 
`cap_from_text(3) <../man3/cap_from_text.3.html>`__, 
`cap_get_proc(3) <../man3/cap_get_proc.3.html>`__, 
`cap_init(3) <../man3/cap_init.3.html>`__, 
`libcap(3) <../man3/libcap.3.html>`__, 
`capabilities(7) <../man7/capabilities.7.html>`__, 
`getcap(8) <../man8/getcap.8.html>`__, 
`setcap(8) <../man8/setcap.8.html>`__

--------------

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
