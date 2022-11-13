.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

sd_uid_get_state(3) — Linux manual page
=======================================

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

   SD_UID_GET_STATE(3)         sd_uid_get_state         SD_UID_GET_STATE(3)

NAME
-------------------------------------------------

::

          sd_uid_get_state, sd_uid_is_on_seat, sd_uid_get_sessions,
          sd_uid_get_seats, sd_uid_get_display - Determine login state of a
          specific Unix user ID


---------------------------------------------------------

::

          #include <systemd/sd-login.h>

          int sd_uid_get_state(uid_t uid, char **state);

          int sd_uid_is_on_seat(uid_t uid, int require_active,
                                const char *seat);

          int sd_uid_get_sessions(uid_t uid, int require_active,
                                  char ***sessions);

          int sd_uid_get_seats(uid_t uid, int require_active,
                               char ***seats);

          int sd_uid_get_display(uid_t uid, char **session);


---------------------------------------------------------------

::

          sd_uid_get_state() may be used to determine the login state of a
          specific Unix user identifier. The following states are currently
          known: "offline" (user not logged in at all), "lingering" (user
          not logged in, but some user services running), "online" (user
          logged in, but not active, i.e. has no session in the
          foreground), "active" (user logged in, and has at least one
          active session, i.e. one session in the foreground), "closing"
          (user not logged in, and not lingering, but some processes are
          still around). In the future additional states might be defined,
          client code should be written to be robust in regards to
          additional state strings being returned. The returned string
          needs to be freed with the libc free(3) call after use.

          sd_uid_is_on_seat() may be used to determine whether a specific
          user is logged in or active on a specific seat. Accepts a Unix
          user identifier and a seat identifier string as parameters. The
          require_active parameter is a boolean value. If non-zero (true),
          this function will test if the user is active (i.e. has a session
          that is in the foreground and accepting user input) on the
          specified seat, otherwise (false) only if the user is logged in
          (and possibly inactive) on the specified seat.

          sd_uid_get_sessions() may be used to determine the current
          sessions of the specified user. Accepts a Unix user identifier as
          parameter. The require_active parameter controls whether the
          returned list shall consist of only those sessions where the user
          is currently active (> 0), where the user is currently online but
          possibly inactive (= 0), or logged in at all but possibly closing
          the session (< 0). The call returns a NULL terminated string
          array of session identifiers in sessions which needs to be freed
          by the caller with the libc free(3) call after use, including all
          the strings referenced. If the string array parameter is passed
          as NULL, the array will not be filled in, but the return code
          still indicates the number of current sessions. Note that instead
          of an empty array NULL may be returned and should be considered
          equivalent to an empty array.

          Similarly, sd_uid_get_seats() may be used to determine the list
          of seats on which the user currently has sessions. Similar
          semantics apply, however note that the user may have multiple
          sessions on the same seat as well as sessions with no attached
          seat and hence the number of entries in the returned array may
          differ from the one returned by sd_uid_get_sessions().

          sd_uid_get_display() returns the name of the "primary" session of
          a user. If the user has graphical sessions, it will be the oldest
          graphical session. Otherwise, it will be the oldest open session.


-----------------------------------------------------------------

::

          On success, sd_uid_get_state() returns 0 or a positive integer.
          If the test succeeds, sd_uid_is_on_seat() returns a positive
          integer; if it fails, 0.  sd_uid_get_sessions() and
          sd_uid_get_seats() return the number of entries in the returned
          arrays.  sd_uid_get_display() returns a non-negative code on
          success. On failure, these calls return a negative errno-style
          error code.

      Errors
          Returned errors may indicate the following problems:

          -ENODATA
              The given field is not specified for the described user.

          -ENXIO
              The specified seat is unknown.

          -EINVAL
              An input parameter was invalid (out of range, or NULL, where
              that is not accepted). This is also returned if the passed
              user ID is 0xFFFF or 0xFFFFFFFF, which are undefined on
              Linux.

          -ENOMEM
              Memory allocation failed.


---------------------------------------------------

::

          These APIs are implemented as a shared library, which can be
          compiled and linked to with the libsystemd pkg-config(1) file.


---------------------------------------------------------

::

          systemd(1), sd-login(3), sd_pid_get_owner_uid(3)

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

   systemd 249                                          SD_UID_GET_STATE(3)

--------------

Pages that refer to this page:
`sd-login(3) <../man3/sd-login.3.html>`__, 
`org.freedesktop.login1(5) <../man5/org.freedesktop.login1.5.html>`__

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
