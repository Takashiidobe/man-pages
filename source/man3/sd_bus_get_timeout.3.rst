.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

sd_bus_get_fd(3) — Linux manual page
====================================

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

   SD_BUS_GET_FD(3)              sd_bus_get_fd             SD_BUS_GET_FD(3)

NAME
-------------------------------------------------

::

          sd_bus_get_fd, sd_bus_get_events, sd_bus_get_timeout - Get the
          file descriptor, I/O events and timeout to wait for from a
          message bus object


---------------------------------------------------------

::

          #include <systemd/sd-bus.h>

          int sd_bus_get_fd(sd_bus *bus);

          int sd_bus_get_events(sd_bus *bus);

          int sd_bus_get_timeout(sd_bus *bus, uint64_t *timeout_usec);


---------------------------------------------------------------

::

          sd_bus_get_fd() returns the file descriptor used to communicate
          from a message bus object. This descriptor can be used with
          poll(3) or a similar function to wait for I/O events on the
          specified bus connection object. If the bus object was configured
          with the sd_bus_set_fd() function, then the input_fd file
          descriptor used in that call is returned.

          sd_bus_get_events() returns the I/O events to wait for, suitable
          for passing to poll() or a similar call. Returns a combination of
          POLLIN, POLLOUT, ... events, or negative on error.

          sd_bus_get_timeout() returns the timeout in µs to pass to poll()
          or a similar call when waiting for events on the specified bus
          connection. The returned timeout may be zero, in which case a
          subsequent I/O polling call should be invoked in non-blocking
          mode. The returned timeout may be UINT64_MAX in which case the
          I/O polling call may block indefinitely, without any applied
          timeout. Note that the returned timeout should be considered only
          a maximum sleeping time. It is permissible (and even expected)
          that shorter timeouts are used by the calling program, in case
          other event sources are polled in the same event loop. Note that
          the returned time-value is relative and specified in
          microseconds. When converting this value in order to pass it as
          third argument to poll() (which expects milliseconds), care
          should be taken to use a division that rounds up to ensure the
          I/O polling operation doesn't sleep for shorter than necessary,
          which might result in unintended busy looping (alternatively, use
          ppoll(2) instead of plain poll(), which understands timeouts with
          nano-second granularity).

          These three functions are useful to hook up a bus connection
          object with an external or manual event loop involving poll() or
          a similar I/O polling call. Before each invocation of the I/O
          polling call, all three functions should be invoked: the file
          descriptor returned by sd_bus_get_fd() should be polled for the
          events indicated by sd_bus_get_events(), and the I/O call should
          block for that up to the timeout returned by
          sd_bus_get_timeout(). After each I/O polling call the bus
          connection needs to process incoming or outgoing data, by
          invoking sd_bus_process(3).

          Note that these functions are only one of three supported ways to
          implement I/O event handling for bus connections. Alternatively
          use sd_bus_attach_event(3) to attach a bus connection to an
          sd-event(3) event loop. Or use sd_bus_wait(3) as a simple
          synchronous, blocking I/O waiting call.


-----------------------------------------------------------------

::

          On success, sd_bus_get_fd() returns the file descriptor used for
          communication. On failure, it returns a negative errno-style
          error code.

          On success, sd_bus_get_events() returns the I/O event mask to use
          for I/O event watching. On failure, it returns a negative
          errno-style error code.

          On success, sd_bus_get_timeout() returns a non-negative integer.
          On failure, it returns a negative errno-style error code.

      Errors
          Returned errors may indicate the following problems:

          -EINVAL
              An invalid bus object was passed.

          -ECHILD
              The bus connection was allocated in a parent process and is
              being reused in a child process after fork().

          -ENOTCONN
              The bus connection has been terminated.

          -EPERM
              Two distinct file descriptors were passed for input and
              output using sd_bus_set_fd(), which sd_bus_get_fd() cannot
              return.

          -ENOPKG
              The bus cannot be resolved.


---------------------------------------------------

::

          These APIs are implemented as a shared library, which can be
          compiled and linked to with the libsystemd pkg-config(1) file.


---------------------------------------------------------

::

          systemd(1), sd-bus(3), sd_bus_process(3), sd_bus_attach_event(3),
          sd_bus_wait(3), sd_bus_set_fd(3), poll(3)

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

   systemd 249                                             SD_BUS_GET_FD(3)

--------------

Pages that refer to this page: `sd-bus(3) <../man3/sd-bus.3.html>`__, 
`sd_bus_attach_event(3) <../man3/sd_bus_attach_event.3.html>`__, 
`sd_bus_process(3) <../man3/sd_bus_process.3.html>`__, 
`sd_bus_set_fd(3) <../man3/sd_bus_set_fd.3.html>`__, 
`sd_bus_wait(3) <../man3/sd_bus_wait.3.html>`__

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
