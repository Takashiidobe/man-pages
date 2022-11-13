.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

sd_event_run(3) — Linux manual page
===================================

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

   SD_EVENT_RUN(3)               sd_event_run               SD_EVENT_RUN(3)

NAME
-------------------------------------------------

::

          sd_event_run, sd_event_loop - Run an event loop


---------------------------------------------------------

::

          #include <systemd/sd-event.h>

          int sd_event_run(sd_event *event, uint64_t usec);

          int sd_event_loop(sd_event *event);


---------------------------------------------------------------

::

          sd_event_run() may be used to run a single iteration of the event
          loop specified in the event parameter. The function waits until
          an event to process is available, and dispatches the registered
          handler for it. The usec parameter specifies the maximum time (in
          microseconds) to wait for an event. Use (uint64_t) -1 to specify
          an infinite timeout.

          sd_event_loop() invokes sd_event_run() in a loop, thus
          implementing the actual event loop. The call returns as soon as
          exiting was requested using sd_event_exit(3).

          The event loop object event is created with sd_event_new(3).
          Events sources to wait for and their handlers may be registered
          with sd_event_add_io(3), sd_event_add_time(3),
          sd_event_add_signal(3), sd_event_add_child(3),
          sd_event_add_defer(3), sd_event_add_post(3) and
          sd_event_add_exit(3).

          For low-level control of event loop execution, use
          sd_event_prepare(3), sd_event_wait(3) and sd_event_dispatch(3)
          which are wrapped by sd_event_run(). Along with
          sd_event_get_fd(3), these functions allow integration of an
          sd-event(3) event loop into foreign event loop implementations.


-----------------------------------------------------------------

::

          On failure, these functions return a negative errno-style error
          code.  sd_event_run() returns a positive, non-zero integer if an
          event source was dispatched, and zero when the specified timeout
          hit before an event source has seen any event, and hence no event
          source was dispatched.  sd_event_loop() returns the exit code
          specified when invoking sd_event_exit().

      Errors
          Returned errors may indicate the following problems:

          -EINVAL
              The event parameter is invalid or NULL.

          -EBUSY
              The event loop object is not in the right state (see
              sd_event_prepare(3) for an explanation of possible states).

          -ESTALE
              The event loop is already terminated.

          -ECHILD
              The event loop has been created in a different process.

          Other errors are possible, too.


---------------------------------------------------

::

          These APIs are implemented as a shared library, which can be
          compiled and linked to with the libsystemd pkg-config(1) file.


---------------------------------------------------------

::

          systemd(1), sd-event(3), sd_event_new(3), sd_event_add_io(3),
          sd_event_add_time(3), sd_event_add_signal(3),
          sd_event_add_child(3), sd_event_add_inotify(3),
          sd_event_add_defer(3), sd_event_exit(3), sd_event_get_fd(3),
          sd_event_wait(3), GLib Main Event Loop[1]

.. _notes-top-1:


---------------------------------------------------

::

           1. GLib Main Event Loop
              https://developer.gnome.org/glib/unstable/glib-The-Main-Event-Loop.html

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

   systemd 249                                              SD_EVENT_RUN(3)

--------------

Pages that refer to this page:
`sd-event(3) <../man3/sd-event.3.html>`__, 
`sd_event_exit(3) <../man3/sd_event_exit.3.html>`__, 
`sd_event_new(3) <../man3/sd_event_new.3.html>`__, 
`sd_event_wait(3) <../man3/sd_event_wait.3.html>`__

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
