.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

sd_bus_wait(3) — Linux manual page
==================================

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

   SD_BUS_WAIT(3)                 sd_bus_wait                SD_BUS_WAIT(3)

NAME
-------------------------------------------------

::

          sd_bus_wait - Wait for I/O on a bus connection


---------------------------------------------------------

::

          #include <systemd/sd-bus.h>

          int sd_bus_wait(sd_bus *bus, uint64_t timeout_usec);


---------------------------------------------------------------

::

          sd_bus_wait() synchronously waits for I/O on the specified bus
          connection object. This function is supposed to be called
          whenever sd_bus_process(3) returns zero, indicating that no work
          is pending on the connection. Internally, this call invokes
          ppoll(2), to wait for I/O on the bus connection. If the
          timeout_sec parameter is specified, the call will block at most
          for the specified amount of time in µs. Pass UINT64_MAX to permit
          it to sleep indefinitely.

          After each invocation of sd_bus_wait() the sd_bus_process() call
          should be invoked in order to process any now pending I/O work.

          Note that sd_bus_wait() is suitable only for simple programs as
          it does not permit waiting for other I/O events. For more complex
          programs either connect the bus connection object to an external
          event loop using sd_bus_get_fd(3) or to an sd-event(3) event loop
          using sd_bus_attach_event(3).


-----------------------------------------------------------------

::

          If any I/O was seen, a positive value is returned, zero
          otherwise. If an error occurs, a negative errno-style error code
          is returned.

      Errors
          Returned errors may indicate the following problems:

          -EINVAL
              An invalid bus object was passed.

          -ECHILD
              The bus connection was allocated in a parent process and is
              being reused in a child process after fork().

          -ENOTCONN
              The bus connection has been terminated already.


---------------------------------------------------

::

          These APIs are implemented as a shared library, which can be
          compiled and linked to with the libsystemd pkg-config(1) file.


---------------------------------------------------------

::

          systemd(1), sd-bus(3), sd_bus_process(3), sd_bus_get_fd(3),
          sd-event(3), sd_bus_attach_event(3)

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

   systemd 249                                               SD_BUS_WAIT(3)

--------------

Pages that refer to this page:
`sd_bus_attach_event(3) <../man3/sd_bus_attach_event.3.html>`__, 
`sd_bus_get_fd(3) <../man3/sd_bus_get_fd.3.html>`__, 
`sd_bus_process(3) <../man3/sd_bus_process.3.html>`__

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
