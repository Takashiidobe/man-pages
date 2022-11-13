.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

sd_listen_fds(3) — Linux manual page
====================================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `RETURN VALUE <#RETURN_VALUE>`__  |                                   |
| \| `NOTES <#NOTES>`__ \|          |                                   |
| `ENVIRONMENT <#ENVIRONMENT>`__ \| |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   SD_LISTEN_FDS(3)              sd_listen_fds             SD_LISTEN_FDS(3)

NAME
-------------------------------------------------

::

          sd_listen_fds, sd_listen_fds_with_names, SD_LISTEN_FDS_START -
          Check for file descriptors passed by the system manager


---------------------------------------------------------

::

          #include <systemd/sd-daemon.h>

          #define SD_LISTEN_FDS_START 3

          int sd_listen_fds(int unset_environment);

          int sd_listen_fds_with_names(int unset_environment,
                                       char*** names);


---------------------------------------------------------------

::

          sd_listen_fds() may be invoked by a daemon to check for file
          descriptors passed by the service manager as part of the
          socket-based activation logic. It returns the number of received
          file descriptors. If no file descriptors have been received, zero
          is returned. The first file descriptor may be found at file
          descriptor number 3 (i.e.  SD_LISTEN_FDS_START), the remaining
          descriptors follow at 4, 5, 6, ..., if any.

          If a daemon receives more than one file descriptor, they will be
          passed in the same order as configured in the systemd socket unit
          file (see systemd.socket(5) for details) — if there's only one
          such file (see below). Nonetheless, it is recommended to verify
          the correct socket types before using them. To simplify this
          checking, the functions sd_is_fifo(3), sd_is_socket(3),
          sd_is_socket_inet(3), sd_is_socket_unix(3) are provided. In order
          to maximize flexibility, it is recommended to make these checks
          as loose as possible without allowing incorrect setups. i.e.
          often, the actual port number a socket is bound to matters little
          for the service to work, hence it should not be verified. On the
          other hand, whether a socket is a datagram or stream socket
          matters a lot for the most common program logics and should be
          checked.

          This function call will set the FD_CLOEXEC flag for all passed
          file descriptors to avoid further inheritance to children of the
          calling process.

          If multiple socket units activate the same service, the order of
          the file descriptors passed to its main process is undefined. If
          additional file descriptors have been passed to the service
          manager using sd_pid_notify_with_fds(3)'s "FDSTORE=1" messages,
          these file descriptors are passed last, in arbitrary order, and
          with duplicates removed.

          If the unset_environment parameter is non-zero, sd_listen_fds()
          will unset the $LISTEN_FDS, $LISTEN_PID and $LISTEN_FDNAMES
          environment variables before returning (regardless of whether the
          function call itself succeeded or not). Further calls to
          sd_listen_fds() will then return zero, but the variables are no
          longer inherited by child processes.

          sd_listen_fds_with_names() is like sd_listen_fds(), but
          optionally also returns an array of strings with identification
          names for the passed file descriptors, if that is available and
          the names parameter is non-NULL. This information is read from
          the $LISTEN_FDNAMES variable, which may contain a colon-separated
          list of names. For socket-activated services, these names may be
          configured with the FileDescriptorName= setting in socket unit
          files, see systemd.socket(5) for details. For file descriptors
          pushed into the file descriptor store (see above), the name is
          set via the FDNAME= field transmitted via
          sd_pid_notify_with_fds(). The primary usecase for these names are
          services which accept a variety of file descriptors which are not
          recognizable with functions like sd_is_socket() alone, and thus
          require identification via a name. It is recommended to rely on
          named file descriptors only if identification via sd_is_socket()
          and related calls is not sufficient. Note that the names used are
          not unique in any way. The returned array of strings has as many
          entries as file descriptors have been received, plus a final NULL
          pointer terminating the array. The caller needs to free the array
          itself and each of its elements with libc's free() call after
          use. If the names parameter is NULL, the call is entirely
          equivalent to sd_listen_fds().

          Under specific conditions, the following automatic file
          descriptor names are returned:

          Table 1.  Special names
          ┌─────────────┬──────────────────────────┐
          │Name         │ Description              │
          ├─────────────┼──────────────────────────┤
          │"unknown"    │ The process received no  │
          │             │ name for the specific    │
          │             │ file descriptor from the │
          │             │ service manager.         │
          ├─────────────┼──────────────────────────┤
          │"stored"     │ The file descriptor      │
          │             │ originates in the        │
          │             │ service manager's        │
          │             │ per-service file         │
          │             │ descriptor store, and    │
          │             │ the FDNAME= field was    │
          │             │ absent when the file     │
          │             │ descriptor was submitted │
          │             │ to the service manager.  │
          ├─────────────┼──────────────────────────┤
          │"connection" │ The service was          │
          │             │ activated in             │
          │             │ per-connection style     │
          │             │ using Accept=yes in the  │
          │             │ socket unit file, and    │
          │             │ the file descriptor is   │
          │             │ the connection socket.   │
          └─────────────┴──────────────────────────┘


-----------------------------------------------------------------

::

          On failure, these calls returns a negative errno-style error
          code. If $LISTEN_FDS/$LISTEN_PID was not set or was not correctly
          set for this daemon and hence no file descriptors were received,
          0 is returned. Otherwise, the number of file descriptors passed
          is returned. The application may find them starting with file
          descriptor SD_LISTEN_FDS_START, i.e. file descriptor 3.


---------------------------------------------------

::

          These APIs are implemented as a shared library, which can be
          compiled and linked to with the libsystemd pkg-config(1) file.

          Internally, sd_listen_fds() checks whether the $LISTEN_PID
          environment variable equals the daemon PID. If not, it returns
          immediately. Otherwise, it parses the number passed in the
          $LISTEN_FDS environment variable, then sets the FD_CLOEXEC flag
          for the parsed number of file descriptors starting from
          SD_LISTEN_FDS_START. Finally, it returns the parsed number.
          sd_listen_fds_with_names() does the same but also parses
          $LISTEN_FDNAMES if set.


---------------------------------------------------------------

::

          $LISTEN_PID, $LISTEN_FDS, $LISTEN_FDNAMES
              Set by the service manager for supervised processes that use
              socket-based activation. This environment variable specifies
              the data sd_listen_fds() and sd_listen_fds_with_names()
              parses. See above for details.


---------------------------------------------------------

::

          systemd(1), sd-daemon(3), sd_is_fifo(3), sd_is_socket(3),
          sd_is_socket_inet(3), sd_is_socket_unix(3),
          sd_pid_notify_with_fds(3), daemon(7), systemd.service(5),
          systemd.socket(5)

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

   systemd 249                                             SD_LISTEN_FDS(3)

--------------

Pages that refer to this page: `systemd(1) <../man1/systemd.1.html>`__, 
`systemd-socket-activate(1) <../man1/systemd-socket-activate.1.html>`__, 
`sd-daemon(3) <../man3/sd-daemon.3.html>`__, 
`sd_is_fifo(3) <../man3/sd_is_fifo.3.html>`__, 
`sd_notify(3) <../man3/sd_notify.3.html>`__, 
`systemd.exec(5) <../man5/systemd.exec.5.html>`__, 
`systemd.service(5) <../man5/systemd.service.5.html>`__, 
`systemd.socket(5) <../man5/systemd.socket.5.html>`__, 
`daemon(7) <../man7/daemon.7.html>`__

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
