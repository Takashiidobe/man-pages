.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

sd_session_is_active(3) — Linux manual page
===========================================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `RETURN VALUE <#RETURN_VALUE>`__  |                                   |
| \| `NOTES <#NOTES>`__ \|          |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `NOTES <#NOTES>`__ \|             |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   SD_SESSION_IS_ACTIVE(3)   sd_session_is_active   SD_SESSION_IS_ACTIVE(3)

NAME
-------------------------------------------------

::

          sd_session_is_active, sd_session_is_remote, sd_session_get_state,
          sd_session_get_uid, sd_session_get_seat, sd_session_get_service,
          sd_session_get_type, sd_session_get_class,
          sd_session_get_desktop, sd_session_get_display,
          sd_session_get_tty, sd_session_get_vt,
          sd_session_get_remote_host, sd_session_get_remote_user -
          Determine state of a specific session


---------------------------------------------------------

::

          #include <systemd/sd-login.h>

          int sd_session_is_active(const char *session);

          int sd_session_is_remote(const char *session);

          int sd_session_get_state(const char *session, char **state);

          int sd_session_get_uid(const char *session, uid_t *uid);

          int sd_session_get_seat(const char *session, char **seat);

          int sd_session_get_service(const char *session, char **service);

          int sd_session_get_type(const char *session, char **type);

          int sd_session_get_class(const char *session, char **class);

          int sd_session_get_desktop(const char *session, char **desktop);

          int sd_session_get_display(const char *session, char **display);

          int sd_session_get_remote_host(const char *session,
                                         char **remote_host);

          int sd_session_get_remote_user(const char *session,
                                         char **remote_user);

          int sd_session_get_tty(const char *session, char **tty);

          int sd_session_get_vt(const char *session, unsigned int *vt);


---------------------------------------------------------------

::

          sd_session_is_active() may be used to determine whether the
          session identified by the specified session identifier is
          currently active (i.e. currently in the foreground and available
          for user input) or not.

          sd_session_is_remote() may be used to determine whether the
          session identified by the specified session identifier is a
          remote session (i.e. its remote host is known) or not.

          sd_session_get_state() may be used to determine the state of the
          session identified by the specified session identifier. The
          following states are currently known: "online" (session logged
          in, but session not active, i.e. not in the foreground), "active"
          (session logged in and active, i.e. in the foreground), "closing"
          (session nominally logged out, but some processes belonging to it
          are still around). In the future additional states might be
          defined, client code should be written to be robust in regards to
          additional state strings being returned. This function is a more
          generic version of sd_session_is_active(). The returned string
          needs to be freed with the libc free(3) call after use.

          sd_session_get_uid() may be used to determine the user identifier
          of the Unix user the session identified by the specified session
          identifier belongs to.

          sd_session_get_seat() may be used to determine the seat
          identifier of the seat the session identified by the specified
          session identifier belongs to. Note that not all sessions are
          attached to a seat, this call will fail (returning -ENODATA) for
          them. The returned string needs to be freed with the libc free(3)
          call after use.

          sd_session_get_service() may be used to determine the name of the
          service (as passed during PAM session setup) that registered the
          session identified by the specified session identifier. The
          returned string needs to be freed with the libc free(3) call
          after use.

          sd_session_get_type() may be used to determine the type of the
          session identified by the specified session identifier. The
          returned string is one of "x11", "wayland", "tty", "mir" or
          "unspecified" and needs to be freed with the libc free(3) call
          after use.

          sd_session_get_class() may be used to determine the class of the
          session identified by the specified session identifier. The
          returned string is one of "user", "greeter", "lock-screen", or
          "background" and needs to be freed with the libc free(3) call
          after use.

          sd_session_get_desktop() may be used to determine the brand of
          the desktop running on the session identified by the specified
          session identifier. This field can be set freely by desktop
          environments and does not follow any special formatting. However,
          desktops are strongly recommended to use the same identifiers and
          capitalization as for $XDG_CURRENT_DESKTOP, as defined by the
          Desktop Entry Specification[1]. The returned string needs to be
          freed with the libc free(3) call after use.

          sd_session_get_display() may be used to determine the X11 display
          of the session identified by the specified session identifier.
          The returned string needs to be freed with the libc free(3) call
          after use.

          sd_session_get_remote_host() may be used to determine the remote
          hostname of the session identified by the specified session
          identifier. The returned string needs to be freed with the libc
          free(3) call after use.

          sd_session_get_remote_user() may be used to determine the remote
          username of the session identified by the specified session
          identifier. The returned string needs to be freed with the libc
          free(3) call after use. Note that this value is rarely known to
          the system, and even then should not be relied on.

          sd_session_get_tty() may be used to determine the TTY device of
          the session identified by the specified session identifier. The
          returned string needs to be freed with the libc free(3) call
          after use.

          sd_session_get_vt() may be used to determine the VT number of the
          session identified by the specified session identifier. This
          function will return an error if the seat does not support VTs.

          If the session parameter of any of these functions is passed as
          NULL, the operation is executed for the session the calling
          process is a member of, if there is any.


-----------------------------------------------------------------

::

          If the test succeeds, sd_session_is_active() and
          sd_session_is_remote() return a positive integer; if it fails, 0.
          On success, sd_session_get_state(), sd_session_get_uid(),
          sd_session_get_seat(), sd_session_get_service(),
          sd_session_get_type(), sd_session_get_class(),
          sd_session_get_display(), sd_session_get_remote_user(),
          sd_session_get_remote_host() and sd_session_get_tty() return 0 or
          a positive integer. On failure, these calls return a negative
          errno-style error code.

      Errors
          Returned errors may indicate the following problems:

          -ENXIO
              The specified session does not exist.

          -ENODATA
              The given field is not specified for the described session.

          -EINVAL
              An input parameter was invalid (out of range, or NULL, where
              that is not accepted).

          -ENOMEM
              Memory allocation failed.


---------------------------------------------------

::

          These APIs are implemented as a shared library, which can be
          compiled and linked to with the libsystemd pkg-config(1) file.


---------------------------------------------------------

::

          systemd(1), sd-login(3), sd_pid_get_session(3)

.. _notes-top-1:


---------------------------------------------------

::

           1. Desktop Entry Specification
              http://standards.freedesktop.org/desktop-entry-spec/latest/

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

   systemd 249                                      SD_SESSION_IS_ACTIVE(3)

--------------

Pages that refer to this page:
`sd_get_seats(3) <../man3/sd_get_seats.3.html>`__, 
`sd-login(3) <../man3/sd-login.3.html>`__, 
`sd_pid_get_owner_uid(3) <../man3/sd_pid_get_owner_uid.3.html>`__, 
`sd_seat_get_active(3) <../man3/sd_seat_get_active.3.html>`__, 
`org.freedesktop.login1(5) <../man5/org.freedesktop.login1.5.html>`__, 
`pam_systemd(8) <../man8/pam_systemd.8.html>`__

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
