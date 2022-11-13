.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

sd_pid_get_owner_uid(3) — Linux manual page
===========================================

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

   SD_PID_GET_OWNER_UID(3)   sd_pid_get_owner_uid   SD_PID_GET_OWNER_UID(3)

NAME
-------------------------------------------------

::

          sd_pid_get_owner_uid, sd_pid_get_session, sd_pid_get_user_unit,
          sd_pid_get_unit, sd_pid_get_machine_name, sd_pid_get_slice,
          sd_pid_get_user_slice, sd_pid_get_cgroup, sd_peer_get_owner_uid,
          sd_peer_get_session, sd_peer_get_user_unit, sd_peer_get_unit,
          sd_peer_get_machine_name, sd_peer_get_slice,
          sd_peer_get_user_slice, sd_peer_get_cgroup - Determine the owner
          uid of the user unit or session, or the session, user unit,
          system unit, container/VM or slice that a specific PID or socket
          peer belongs to


---------------------------------------------------------

::

          #include <systemd/sd-login.h>

          int sd_pid_get_owner_uid(pid_t pid, uid_t *uid);

          int sd_pid_get_session(pid_t pid, char **session);

          int sd_pid_get_user_unit(pid_t pid, char **unit);

          int sd_pid_get_unit(pid_t pid, char **unit);

          int sd_pid_get_machine_name(pid_t pid, char **name);

          int sd_pid_get_slice(pid_t pid, char **slice);

          int sd_pid_get_user_slice(pid_t pid, char **slice);

          int sd_pid_get_cgroup(pid_t pid, char **cgroup);

          int sd_peer_get_owner_uid(int fd, uid_t *uid);

          int sd_peer_get_session(int fd, char **session);

          int sd_peer_get_user_unit(int fd, char **unit);

          int sd_peer_get_unit(int fd, char **unit);

          int sd_peer_get_machine_name(int fd, char **name);

          int sd_peer_get_slice(int fd, char **slice);

          int sd_peer_get_user_slice(int fd, char **slice);

          int sd_peer_get_cgroup(int fd, char **cgroup);


---------------------------------------------------------------

::

          sd_pid_get_owner_uid() may be used to determine the Unix UID
          (user identifier) which owns the login session or systemd user
          unit of a process identified by the specified PID. For processes
          which are not part of a login session and not managed by a user
          manager, this function will fail with -ENODATA.

          sd_pid_get_session() may be used to determine the login session
          identifier of a process identified by the specified process
          identifier. The session identifier is a short string, suitable
          for usage in file system paths. Please note the login session may
          be limited to a stub process or two. User processes may instead
          be started from their systemd user manager, e.g. GUI applications
          started using DBus activation, as well as service processes which
          are shared between multiple logins of the same user. For
          processes which are not part of a login session, this function
          will fail with -ENODATA. The returned string needs to be freed
          with the libc free(3) call after use.

          sd_pid_get_user_unit() may be used to determine the systemd user
          unit (i.e. user service or scope unit) identifier of a process
          identified by the specified PID. The unit name is a short string,
          suitable for usage in file system paths. For processes which are
          not managed by a user manager, this function will fail with
          -ENODATA. The returned string needs to be freed with the libc
          free(3) call after use.

          sd_pid_get_unit() may be used to determine the systemd system
          unit (i.e. system service or scope unit) identifier of a process
          identified by the specified PID. The unit name is a short string,
          suitable for usage in file system paths. Note that not all
          processes are part of a system unit/service. For processes not
          being part of a systemd system unit, this function will fail with
          -ENODATA. (More specifically, this call will not work for kernel
          threads.) The returned string needs to be freed with the libc
          free(3) call after use.

          sd_pid_get_machine_name() may be used to determine the name of
          the VM or container is a member of. The machine name is a short
          string, suitable for usage in file system paths. The returned
          string needs to be freed with the libc free(3) call after use.
          For processes not part of a VM or container, this function fails
          with -ENODATA.

          sd_pid_get_slice() may be used to determine the slice unit the
          process is a member of. See systemd.slice(5) for details about
          slices. The returned string needs to be freed with the libc
          free(3) call after use.

          Similarly, sd_pid_get_user_slice() returns the user slice (as
          managed by the user's systemd instance) of a process.

          sd_pid_get_cgroup() returns the control group path of the
          specified process, relative to the root of the hierarchy. Returns
          the path without trailing slash, except for processes located in
          the root control group, where "/" is returned. To find the actual
          control group path in the file system, the returned path needs to
          be prefixed with /sys/fs/cgroup/ (if the unified control group
          setup is used), or /sys/fs/cgroup/HIERARCHY/ (if the legacy
          multi-hierarchy control group setup is used).

          If the pid parameter of any of these functions is passed as 0,
          the operation is executed for the calling process.

          The sd_peer_get_owner_uid(), sd_peer_get_session(),
          sd_peer_get_user_unit(), sd_peer_get_unit(),
          sd_peer_get_machine_name(), sd_peer_get_slice(),
          sd_peer_get_user_slice() and sd_peer_get_cgroup() calls operate
          similar to their PID counterparts, but operate on a connected
          AF_UNIX socket and retrieve information about the connected peer
          process. Note that these fields are retrieved via /proc/, and
          hence are not suitable for authorization purposes, as they are
          subject to races.


-----------------------------------------------------------------

::

          On success, these calls return 0 or a positive integer. On
          failure, these calls return a negative errno-style error code.

      Errors
          Returned errors may indicate the following problems:

          -ESRCH
              The specified PID does not refer to a running process.

          -EBADF
              The specified socket file descriptor was invalid.

          -ENODATA
              The given field is not specified for the described process or
              peer.

          -EINVAL
              An input parameter was invalid (out of range, or NULL, where
              that is not accepted).

          -ENOMEM
              Memory allocation failed.


---------------------------------------------------

::

          These APIs are implemented as a shared library, which can be
          compiled and linked to with the libsystemd pkg-config(1) file.

          Note that the login session identifier as returned by
          sd_pid_get_session() is completely unrelated to the process
          session identifier as returned by getsid(2).


---------------------------------------------------------

::

          systemd(1), sd-login(3), sd_session_is_active(3), getsid(2),
          systemd.slice(5), systemd-machined.service(8)

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

   systemd 249                                      SD_PID_GET_OWNER_UID(3)

--------------

Pages that refer to this page: `homectl(1) <../man1/homectl.1.html>`__, 
`journalctl(1) <../man1/journalctl.1.html>`__, 
`localectl(1) <../man1/localectl.1.html>`__, 
`loginctl(1) <../man1/loginctl.1.html>`__, 
`machinectl(1) <../man1/machinectl.1.html>`__, 
`portablectl(1) <../man1/portablectl.1.html>`__, 
`systemctl(1) <../man1/systemctl.1.html>`__, 
`systemd(1) <../man1/systemd.1.html>`__, 
`systemd-analyze(1) <../man1/systemd-analyze.1.html>`__, 
`systemd-inhibit(1) <../man1/systemd-inhibit.1.html>`__, 
`systemd-nspawn(1) <../man1/systemd-nspawn.1.html>`__, 
`timedatectl(1) <../man1/timedatectl.1.html>`__, 
`userdbctl(1) <../man1/userdbctl.1.html>`__, 
`sd-login(3) <../man3/sd-login.3.html>`__, 
`sd_machine_get_class(3) <../man3/sd_machine_get_class.3.html>`__, 
`sd_session_is_active(3) <../man3/sd_session_is_active.3.html>`__, 
`sd_uid_get_state(3) <../man3/sd_uid_get_state.3.html>`__, 
`systemd-tmpfiles(8) <../man8/systemd-tmpfiles.8.html>`__

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
