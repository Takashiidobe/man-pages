.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

sd_seat_get_active(3) — Linux manual page
=========================================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `RETURN VALUE <#RETURN_VALUE>`__  |                                   |
| \| `NOTES <#NOTES>`__ \|          |                                   |
| `HISTORY <#HISTORY>`__ \|         |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   SD_SEAT_GET_ACTIVE(3)      sd_seat_get_active      SD_SEAT_GET_ACTIVE(3)

NAME
-------------------------------------------------

::

          sd_seat_get_active, sd_seat_get_sessions, sd_seat_can_tty,
          sd_seat_can_graphical - Determine state of a specific seat


---------------------------------------------------------

::

          #include <systemd/sd-login.h>

          int sd_seat_get_active(const char *seat, char **session,
                                 uid_t *uid);

          int sd_seat_get_sessions(const char *seat, char ***ret_sessions,
                                   uid_t **ret_uids,
                                   unsigned int *ret_n_uids);

          int sd_seat_can_tty(const char *seat);

          int sd_seat_can_graphical(const char *seat);


---------------------------------------------------------------

::

          sd_seat_get_active() may be used to determine which session is
          currently active on a seat, if there is any. Returns the session
          identifier and the user identifier of the Unix user the session
          is belonging to. Either the session or the user identifier
          parameter can be passed NULL, in case only one of the parameters
          shall be queried. The returned string needs to be freed with the
          libc free(3) call after use.

          sd_seat_get_sessions() may be used to determine all sessions on
          the specified seat. Returns two arrays, one (NULL terminated)
          with the session identifiers of the sessions and one with the
          user identifiers of the Unix users the sessions belong to. An
          additional parameter may be used to return the number of entries
          in the latter array. This value is the same as the return value
          if the return value is nonnegative. The output parameters may be
          passed as NULL in case these output values are not needed. The
          arrays and the strings referenced by them need to be freed with
          the libc free(3) call after use. Note that instead of an empty
          array NULL may be returned and should be considered equivalent to
          an empty array.

          sd_seat_can_tty() may be used to determine whether a specific
          seat provides TTY functionality, i.e. is useful as a text
          console.

          sd_seat_can_graphical() may be used to determine whether a
          specific seat provides graphics functionality, i.e. is useful as
          a graphics display.

          If the seat parameter of any of these functions is passed as
          NULL, the operation is executed for the seat of the session of
          the calling process, if there is any.


-----------------------------------------------------------------

::

          On success, sd_seat_get_active() returns 0 or a positive integer.
          On success, sd_seat_get_sessions() returns the number of entries
          in the session identifier array. If the test succeeds,
          sd_seat_can_tty() and sd_seat_can_graphical() return a positive
          integer, if it fails 0. On failure, these calls return a negative
          errno-style error code.

      Errors
          Returned errors may indicate the following problems:

          -ENODATA
              The given field is not specified for the described seat.

          -ENXIO
              The specified seat is unknown.

          -EINVAL
              An input parameter was invalid (out of range, or NULL, where
              that is not accepted).

          -ENOMEM
              Memory allocation failed.


---------------------------------------------------

::

          These APIs are implemented as a shared library, which can be
          compiled and linked to with the libsystemd pkg-config(1) file.


-------------------------------------------------------

::

          In the past, sd_seat_can_multi_session() was used to check
          whether the seat supports multiple sessions. All seats support
          that now, so that function has been deprecated and always returns
          true.


---------------------------------------------------------

::

          systemd(1), sd-login(3), sd_session_get_seat(3)

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

   systemd 249                                        SD_SEAT_GET_ACTIVE(3)

--------------

Pages that refer to this page: `sd-login(3) <../man3/sd-login.3.html>`__

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
