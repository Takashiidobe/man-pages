.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

sd_journal_open(3) — Linux manual page
======================================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `RETURN VALUE <#RETURN_VALUE>`__  |                                   |
| \| `NOTES <#NOTES>`__ \|          |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   SD_JOURNAL_OPEN(3)           sd_journal_open          SD_JOURNAL_OPEN(3)

NAME
-------------------------------------------------

::

          sd_journal_open, sd_journal_open_directory,
          sd_journal_open_directory_fd, sd_journal_open_files,
          sd_journal_open_files_fd, sd_journal_open_namespace,
          sd_journal_close, sd_journal, SD_JOURNAL_LOCAL_ONLY,
          SD_JOURNAL_RUNTIME_ONLY, SD_JOURNAL_SYSTEM,
          SD_JOURNAL_CURRENT_USER, SD_JOURNAL_OS_ROOT,
          SD_JOURNAL_ALL_NAMESPACES, SD_JOURNAL_INCLUDE_DEFAULT_NAMESPACE -
          Open the system journal for reading


---------------------------------------------------------

::

          #include <systemd/sd-journal.h>

          int sd_journal_open(sd_journal **ret, int flags);

          int sd_journal_open_namespace(sd_journal **ret,
                                        const char *namespace, int flags);

          int sd_journal_open_directory(sd_journal **ret, const char *path,
                                        int flags);

          int sd_journal_open_directory_fd(sd_journal **ret, int fd,
                                           int flags);

          int sd_journal_open_files(sd_journal **ret, const char **paths,
                                    int flags);

          int sd_journal_open_files_fd(sd_journal **ret, int fds[],
                                       unsigned n_fds, int flags);

          void sd_journal_close(sd_journal *j);


---------------------------------------------------------------

::

          sd_journal_open() opens the log journal for reading. It will find
          all journal files automatically and interleave them automatically
          when reading. As first argument it takes a pointer to a
          sd_journal pointer, which, on success, will contain a journal
          context object. The second argument is a flags field, which may
          consist of the following flags ORed together:
          SD_JOURNAL_LOCAL_ONLY makes sure only journal files generated on
          the local machine will be opened.  SD_JOURNAL_RUNTIME_ONLY makes
          sure only volatile journal files will be opened, excluding those
          which are stored on persistent storage.  SD_JOURNAL_SYSTEM will
          cause journal files of system services and the kernel (in
          opposition to user session processes) to be opened.
          SD_JOURNAL_CURRENT_USER will cause journal files of the current
          user to be opened. If neither SD_JOURNAL_SYSTEM nor
          SD_JOURNAL_CURRENT_USER are specified, all journal file types
          will be opened.

          sd_journal_open_namespace() is similar to sd_journal_open() but
          takes an additional namespace parameter that specifies which
          journal namespace to operate on. If specified as NULL the call is
          identical to sd_journal_open(). If non-NULL only data from the
          namespace identified by the specified parameter is accessed. This
          call understands two additional flags: if
          SD_JOURNAL_ALL_NAMESPACES is specified the namespace parameter is
          ignored and all defined namespaces are accessed simultaneously;
          if SD_JOURNAL_INCLUDE_DEFAULT_NAMESPACE the specified namespace
          and the default namespace are accessed but no others (this flag
          has no effect when namespace is passed as NULL). For details
          about journal namespaces see systemd-journald.service(8).

          sd_journal_open_directory() is similar to sd_journal_open() but
          takes an absolute directory path as argument. All journal files
          in this directory will be opened and interleaved automatically.
          This call also takes a flags argument. The flags parameters
          accepted by this call are SD_JOURNAL_OS_ROOT, SD_JOURNAL_SYSTEM,
          and SD_JOURNAL_CURRENT_USER. If SD_JOURNAL_OS_ROOT is specified,
          journal files are searched for below the usual /var/log/journal
          and /run/log/journal relative to the specified path, instead of
          directly beneath it. The other two flags limit which files are
          opened, the same as for sd_journal_open().

          sd_journal_open_directory_fd() is similar to
          sd_journal_open_directory(), but takes a file descriptor
          referencing a directory in the file system instead of an absolute
          file system path.

          sd_journal_open_files() is similar to sd_journal_open() but takes
          a NULL-terminated list of file paths to open. All files will be
          opened and interleaved automatically. This call also takes a
          flags argument, but it must be passed as 0 as no flags are
          currently understood for this call. Please note that in the case
          of a live journal, this function is only useful for debugging,
          because individual journal files can be rotated at any moment,
          and the opening of specific files is inherently racy.

          sd_journal_open_files_fd() is similar to sd_journal_open_files()
          but takes an array of open file descriptors that must reference
          journal files, instead of an array of file system paths. Pass the
          array of file descriptors as second argument, and the number of
          array entries in the third. The flags parameter must be passed as
          0.

          sd_journal objects cannot be used in the child after a fork.
          Functions which take a journal object as an argument
          (sd_journal_next() and others) will return -ECHILD after a fork.

          sd_journal_close() will close the journal context allocated with
          sd_journal_open() or sd_journal_open_directory() and free its
          resources.

          When opening the journal only journal files accessible to the
          calling user will be opened. If journal files are not accessible
          to the caller, this will be silently ignored.

          See sd_journal_next(3) for an example of how to iterate through
          the journal after opening it with sd_journal_open().

          A journal context object returned by sd_journal_open() references
          a specific journal entry as current entry, similar to a file seek
          index in a classic file system file, but without absolute
          positions. It may be altered with sd_journal_next(3) and
          sd_journal_seek_head(3) and related calls. The current entry
          position may be exported in cursor strings, as accessible via
          sd_journal_get_cursor(3). Cursor strings may be used to globally
          identify a specific journal entry in a stable way and then later
          to seek to it (or if the specific entry is not available locally,
          to its closest entry in time) sd_journal_seek_cursor(3).

          Notification of journal changes is available via
          sd_journal_get_fd() and related calls.


-----------------------------------------------------------------

::

          The sd_journal_open(), sd_journal_open_directory(), and
          sd_journal_open_files() calls return 0 on success or a negative
          errno-style error code.  sd_journal_close() returns nothing.


---------------------------------------------------

::

          All functions listed here are thread-agnostic and only a single
          specific thread may operate on a given object during its entire
          lifetime. It's safe to allocate multiple independent objects and
          use each from a specific thread in parallel. However, it's not
          safe to allocate such an object in one thread, and operate or
          free it from any other, even if locking is used to ensure these
          threads don't operate on it at the very same time.

          These APIs are implemented as a shared library, which can be
          compiled and linked to with the libsystemd pkg-config(1) file.


---------------------------------------------------------

::

          systemd(1), sd-journal(3), systemd-journald.service(8),
          sd_journal_next(3), sd_journal_get_data(3)

COLOPHON
---------------------------------------------------------

::

          This page is part of the systemd (systemd system and service
          manager) project.  Information about the project can be found at
          ⟨http://www.freedesktop.org/wiki/Software/systemd⟩.  If you have
          a bug report for this manual page, see
          ⟨http://www.freedesktop.org/wiki/Software/systemd/#bugreports⟩.
          This page was obtained from the project's upstream Git repository
          ⟨https://github.com/systemd/systemd.git⟩ on 2021-08-27.  (At that
          time, the date of the most recent commit that was found in the
          repository was 2021-08-27.)  If you discover any rendering
          problems in this HTML version of the page, or you believe there
          is a better or more up-to-date source for the page, or you have
          corrections or improvements to the information in this COLOPHON
          (which is not part of the original manual page), send a mail to
          man-pages@man7.org

   systemd 249                                           SD_JOURNAL_OPEN(3)

--------------

Pages that refer to this page:
`sd-journal(3) <../man3/sd-journal.3.html>`__, 
`sd_journal_add_match(3) <../man3/sd_journal_add_match.3.html>`__, 
`sd_journal_enumerate_fields(3) <../man3/sd_journal_enumerate_fields.3.html>`__, 
`sd_journal_get_catalog(3) <../man3/sd_journal_get_catalog.3.html>`__, 
`sd_journal_get_cursor(3) <../man3/sd_journal_get_cursor.3.html>`__, 
`sd_journal_get_cutoff_realtime_usec(3) <../man3/sd_journal_get_cutoff_realtime_usec.3.html>`__, 
`sd_journal_get_data(3) <../man3/sd_journal_get_data.3.html>`__, 
`sd_journal_get_fd(3) <../man3/sd_journal_get_fd.3.html>`__, 
`sd_journal_get_realtime_usec(3) <../man3/sd_journal_get_realtime_usec.3.html>`__, 
`sd_journal_get_usage(3) <../man3/sd_journal_get_usage.3.html>`__, 
`sd_journal_next(3) <../man3/sd_journal_next.3.html>`__, 
`sd_journal_query_unique(3) <../man3/sd_journal_query_unique.3.html>`__, 
`sd_journal_seek_head(3) <../man3/sd_journal_seek_head.3.html>`__

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
