.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

sd_bus_process(3) — Linux manual page
=====================================

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

   SD_BUS_PROCESS(3)            sd_bus_process            SD_BUS_PROCESS(3)

NAME
-------------------------------------------------

::

          sd_bus_process - Drive the connection


---------------------------------------------------------

::

          #include <systemd/sd-bus.h>

          int sd_bus_process(sd_bus *bus, sd_bus_message **ret);


---------------------------------------------------------------

::

          sd_bus_process() drives the connection between the client and the
          message bus. That is, it handles connecting, authentication, and
          message processing. When invoked pending I/O work is executed,
          and queued incoming messages are dispatched to registered
          callbacks. Each time it is invoked a single operation is
          executed. It returns zero when no operations were pending and
          positive if a message was processed. When zero is returned the
          caller should synchronously poll for I/O events before calling
          into sd_bus_process() again. For that either use the simple,
          synchronous sd_bus_wait(3) call, or hook up the bus connection
          object to an external or manual event loop using
          sd_bus_get_fd(3).

          sd_bus_process() processes at most one incoming message per call.
          If the parameter ret is not NULL and the call processed a
          message, *ret is set to this message. The caller owns a reference
          to this message and should call sd_bus_message_unref(3) when the
          message is no longer needed. If ret is not NULL, progress was
          made, but no message was processed, *ret is set to NULL.

          If the bus object is connected to an sd-event(3) event loop (with
          sd_bus_attach_event(3)), it is not necessary to call
          sd_bus_process() directly as it is invoked automatically when
          necessary.


-----------------------------------------------------------------

::

          If progress was made, a positive integer is returned. If no
          progress was made, 0 is returned. If an error occurs, a negative
          errno-style error code is returned.

      Errors
          Returned errors may indicate the following problems:

          -EINVAL
              An invalid bus object was passed.

          -ECHILD
              The bus connection was allocated in a parent process and is
              being reused in a child process after fork().

          -ENOTCONN
              The bus connection has been terminated already.

          -ECONNRESET
              The bus connection has been terminated just now.

          -EBUSY
              This function is already being called, i.e.  sd_bus_process()
              has been called from a callback function that itself was
              called by sd_bus_process().


---------------------------------------------------

::

          These APIs are implemented as a shared library, which can be
          compiled and linked to with the libsystemd pkg-config(1) file.


---------------------------------------------------------

::

          systemd(1), sd-bus(3), sd_bus_wait(3), sd_bus_get_fd(3),
          sd_bus_message_unref(3), sd-event(3), sd_bus_attach_event(3)

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

   systemd 249                                            SD_BUS_PROCESS(3)

--------------

Pages that refer to this page: `sd-bus(3) <../man3/sd-bus.3.html>`__, 
`sd_bus_attach_event(3) <../man3/sd_bus_attach_event.3.html>`__, 
`sd_bus_get_fd(3) <../man3/sd_bus_get_fd.3.html>`__, 
`sd_bus_get_n_queued_read(3) <../man3/sd_bus_get_n_queued_read.3.html>`__, 
`sd_bus_send(3) <../man3/sd_bus_send.3.html>`__, 
`sd_bus_start(3) <../man3/sd_bus_start.3.html>`__, 
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
