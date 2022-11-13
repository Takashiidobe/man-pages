.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

sd_login_monitor_new(3) — Linux manual page
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

   SD_LOGIN_MONITOR_NEW(3)   sd_login_monitor_new   SD_LOGIN_MONITOR_NEW(3)

NAME
-------------------------------------------------

::

          sd_login_monitor_new, sd_login_monitor_unref,
          sd_login_monitor_unrefp, sd_login_monitor_flush,
          sd_login_monitor_get_fd, sd_login_monitor_get_events,
          sd_login_monitor_get_timeout, sd_login_monitor - Monitor login
          sessions, seats, users and virtual machines/containers


---------------------------------------------------------

::

          #include <systemd/sd-login.h>

          int sd_login_monitor_new(const char *category,
                                   sd_login_monitor **ret);

          sd_login_monitor *sd_login_monitor_unref(sd_login_monitor *m);

          void sd_login_monitor_unrefp(sd_login_monitor **m);

          int sd_login_monitor_flush(sd_login_monitor *m);

          int sd_login_monitor_get_fd(sd_login_monitor *m);

          int sd_login_monitor_get_events(sd_login_monitor *m);

          int sd_login_monitor_get_timeout(sd_login_monitor *m,
                                           uint64_t *timeout_usec);


---------------------------------------------------------------

::

          sd_login_monitor_new() may be used to monitor login sessions,
          users, seats, and virtual machines/containers. Via a monitor
          object a file descriptor can be integrated into an application
          defined event loop which is woken up each time a user logs in,
          logs out or a seat is added or removed, or a session, user, seat
          or virtual machine/container changes state otherwise. The first
          parameter takes a string which can be "seat" (to get only
          notifications about seats being added, removed or changed),
          "session" (to get only notifications about sessions being created
          or removed or changed), "uid" (to get only notifications when a
          user changes state in respect to logins) or "machine" (to get
          only notifications when a virtual machine or container is started
          or stopped). If notifications shall be generated in all these
          conditions, NULL may be passed. Note that in the future
          additional categories may be defined. The second parameter
          returns a monitor object and needs to be freed with the
          sd_login_monitor_unref() call after use.

          sd_login_monitor_unref() may be used to destroy a monitor object.
          Note that this will invalidate any file descriptor returned by
          sd_login_monitor_get_fd().

          sd_login_monitor_unrefp() is similar to sd_login_monitor_unref()
          but takes a pointer to a pointer to an sd_login_monitor object.
          This call is useful in conjunction with GCC's and LLVM's Clean-up
          Variable Attribute[1]. Note that this function is defined as
          inline function. Use a declaration like the following, in order
          to allocate a login monitor object that is freed automatically as
          the code block is left:

              {
                __attribute__((cleanup(sd_login_monitor_unrefp))) sd_login_monitor *m = NULL;
                int r;
                ...
                r = sd_login_monitor_new(NULL, &m);
                if (r < 0)
                  fprintf(stderr, "Failed to allocate login monitor object: %s\n", strerror(-r));
                ...
              }

          sd_login_monitor_flush() may be used to reset the wakeup state of
          the monitor object. Whenever an event causes the monitor to wake
          up the event loop via the file descriptor this function needs to
          be called to reset the wake-up state. If this call is not
          invoked, the file descriptor will immediately wake up the event
          loop again.

          sd_login_monitor_unref() and sd_login_monitor_unrefp() execute no
          operation if the passed in monitor object is NULL.

          sd_login_monitor_get_fd() may be used to retrieve the file
          descriptor of the monitor object that may be integrated in an
          application defined event loop, based around poll(2) or a similar
          interface. The application should include the returned file
          descriptor as wake-up source for the events mask returned by
          sd_login_monitor_get_events(). It should pass a timeout value as
          returned by sd_login_monitor_get_timeout(). Whenever a wake-up is
          triggered the file descriptor needs to be reset via
          sd_login_monitor_flush(). An application needs to reread the
          login state with a function like sd_get_seats(3) or similar to
          determine what changed.

          sd_login_monitor_get_events() will return the poll() mask to wait
          for. This function will return a combination of POLLIN, POLLOUT
          and similar to fill into the ".events" field of struct pollfd.

          sd_login_monitor_get_timeout() will return a timeout value for
          usage in poll(). This returns a value in microseconds since the
          epoch of CLOCK_MONOTONIC for timing out poll() in timeout_usec.
          See clock_gettime(2) for details about CLOCK_MONOTONIC. If there
          is no timeout to wait for this will fill in (uint64_t) -1
          instead. Note that poll() takes a relative timeout in
          milliseconds rather than an absolute timeout in microseconds. To
          convert the absolute 'µs' timeout into relative 'ms', use code
          like the following:

              uint64_t t;
              int msec;
              sd_login_monitor_get_timeout(m, &t);
              if (t == (uint64_t) -1)
                msec = -1;
              else {
                struct timespec ts;
                uint64_t n;
                clock_gettime(CLOCK_MONOTONIC, &ts);
                n = (uint64_t) ts.tv_sec * 1000000 + ts.tv_nsec / 1000;
                msec = t > n ? (int) ((t - n + 999) / 1000) : 0;
              }

          The code above does not do any error checking for brevity's sake.
          The calculated msec integer can be passed directly as poll()'s
          timeout parameter.


-----------------------------------------------------------------

::

          On success, sd_login_monitor_new(), sd_login_monitor_flush() and
          sd_login_monitor_get_timeout() return 0 or a positive integer. On
          success, sd_login_monitor_get_fd() returns a Unix file
          descriptor. On success, sd_login_monitor_get_events() returns a
          combination of POLLIN, POLLOUT and suchlike. On failure, these
          calls return a negative errno-style error code.

          sd_login_monitor_unref() always returns NULL.

      Errors
          Returned errors may indicate the following problems:

          -EINVAL
              An input parameter was invalid (out of range, or NULL, where
              that is not accepted). The specified category to watch is not
              known.

          -ENOMEM
              Memory allocation failed.


---------------------------------------------------

::

          These APIs are implemented as a shared library, which can be
          compiled and linked to with the libsystemd pkg-config(1) file.


---------------------------------------------------------

::

          systemd(1), sd-login(3), sd_get_seats(3), poll(2),
          clock_gettime(2)

.. _notes-top-1:


---------------------------------------------------

::

           1. Clean-up Variable Attribute
              https://gcc.gnu.org/onlinedocs/gcc/Common-Variable-Attributes.html

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

   systemd 249                                      SD_LOGIN_MONITOR_NEW(3)

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
