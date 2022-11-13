.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

sd-event(3) — Linux manual page
===============================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `NOTES <#NOTES>`__ \|             |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   SD-EVENT(3)                     sd-event                     SD-EVENT(3)

NAME
-------------------------------------------------

::

          sd-event - A generic event loop implementation


---------------------------------------------------------

::

          #include <systemd/sd-event.h>

          pkg-config --cflags --libs libsystemd


---------------------------------------------------------------

::

          sd-event.h provides a generic event loop implementation, based on
          Linux epoll(7).

          See sd_event_new(3), sd_event_run(3), sd_event_add_io(3),
          sd_event_add_time(3), sd_event_add_signal(3),
          sd_event_add_child(3), sd_event_add_inotify(3),
          sd_event_add_defer(3), sd_event_source_unref(3),
          sd_event_source_set_priority(3), sd_event_source_set_enabled(3),
          sd_event_source_set_userdata(3), sd_event_source_get_event(3),
          sd_event_source_get_pending(3),
          sd_event_source_set_description(3),
          sd_event_source_set_prepare(3), sd_event_source_set_ratelimit(3),
          sd_event_wait(3), sd_event_get_fd(3), sd_event_set_watchdog(3),
          sd_event_exit(3), sd_event_now(3) for more information about the
          functions available.

          The event loop design is targeted on running a separate instance
          of the event loop in each thread; it has no concept of
          distributing events from a single event loop instance onto
          multiple worker threads. Dispatching events is strictly ordered
          and subject to configurable priorities. In each event loop
          iteration a single event source is dispatched. Each time an event
          source is dispatched the kernel is polled for new events, before
          the next event source is dispatched. The event loop is designed
          to honor priorities and provide fairness within each priority. It
          is not designed to provide optimal throughput, as this
          contradicts these goals due the limitations of the underlying
          epoll(7) primitives.

          The event loop implementation provides the following features:

           1. I/O event sources, based on epoll(7)'s file descriptor
              watching, including edge triggered events (EPOLLET). See
              sd_event_add_io(3).

           2. Timer event sources, based on timerfd_create(2), supporting
              the CLOCK_MONOTONIC, CLOCK_REALTIME, CLOCK_BOOTIME clocks, as
              well as the CLOCK_REALTIME_ALARM and CLOCK_BOOTTIME_ALARM
              clocks that can resume the system from suspend. When creating
              timer events a required accuracy parameter may be specified
              which allows coalescing of timer events to minimize power
              consumption. See sd_event_add_time(3).

           3. UNIX process signal events, based on signalfd(2), including
              full support for real-time signals, and queued parameters.
              See sd_event_add_signal(3).

           4. Child process state change events, based on waitid(2). See
              sd_event_add_child(3).

           5. Static event sources, of three types: defer, post and exit,
              for invoking calls in each event loop, after other event
              sources or at event loop termination. See
              sd_event_add_defer(3).

           6. Event sources may be assigned a 64bit priority value, that
              controls the order in which event sources are dispatched if
              multiple are pending simultaneously. See
              sd_event_source_set_priority(3).

           7. The event loop may automatically send watchdog notification
              messages to the service manager. See
              sd_event_set_watchdog(3).

           8. The event loop may be integrated into foreign event loops,
              such as the GLib one. See sd_event_get_fd(3) for an example.


---------------------------------------------------

::

          These APIs are implemented as a shared library, which can be
          compiled and linked to with the libsystemd pkg-config(1) file.


---------------------------------------------------------

::

          systemd(1), sd_event_new(3), sd_event_run(3), sd_event_add_io(3),
          sd_event_add_time(3), sd_event_add_signal(3),
          sd_event_add_child(3), sd_event_add_inotify(3),
          sd_event_add_defer(3), sd_event_source_unref(3),
          sd_event_source_set_priority(3), sd_event_source_set_enabled(3),
          sd_event_source_set_userdata(3), sd_event_source_get_event(3),
          sd_event_source_get_pending(3),
          sd_event_source_set_description(3),
          sd_event_source_set_prepare(3), sd_event_source_set_ratelimit(3),
          sd_event_wait(3), sd_event_get_fd(3), sd_event_set_watchdog(3),
          sd_event_exit(3), sd_event_now(3), epoll(7), timerfd_create(2),
          signalfd(2), waitid(2)

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

   systemd 249                                                  SD-EVENT(3)

--------------

Pages that refer to this page: `sd-bus(3) <../man3/sd-bus.3.html>`__, 
`sd_bus_attach_event(3) <../man3/sd_bus_attach_event.3.html>`__, 
`sd_bus_get_fd(3) <../man3/sd_bus_get_fd.3.html>`__, 
`sd_bus_process(3) <../man3/sd_bus_process.3.html>`__, 
`sd_bus_set_close_on_exit(3) <../man3/sd_bus_set_close_on_exit.3.html>`__, 
`sd_bus_set_exit_on_disconnect(3) <../man3/sd_bus_set_exit_on_disconnect.3.html>`__, 
`sd_bus_wait(3) <../man3/sd_bus_wait.3.html>`__, 
`sd_event_add_child(3) <../man3/sd_event_add_child.3.html>`__, 
`sd_event_add_defer(3) <../man3/sd_event_add_defer.3.html>`__, 
`sd_event_add_inotify(3) <../man3/sd_event_add_inotify.3.html>`__, 
`sd_event_add_io(3) <../man3/sd_event_add_io.3.html>`__, 
`sd_event_add_signal(3) <../man3/sd_event_add_signal.3.html>`__, 
`sd_event_add_time(3) <../man3/sd_event_add_time.3.html>`__, 
`sd_event_exit(3) <../man3/sd_event_exit.3.html>`__, 
`sd_event_get_fd(3) <../man3/sd_event_get_fd.3.html>`__, 
`sd_event_new(3) <../man3/sd_event_new.3.html>`__, 
`sd_event_now(3) <../man3/sd_event_now.3.html>`__, 
`sd_event_run(3) <../man3/sd_event_run.3.html>`__, 
`sd_event_set_watchdog(3) <../man3/sd_event_set_watchdog.3.html>`__, 
`sd_event_source_get_event(3) <../man3/sd_event_source_get_event.3.html>`__, 
`sd_event_source_get_pending(3) <../man3/sd_event_source_get_pending.3.html>`__, 
`sd_event_source_set_description(3) <../man3/sd_event_source_set_description.3.html>`__, 
`sd_event_source_set_destroy_callback(3) <../man3/sd_event_source_set_destroy_callback.3.html>`__, 
`sd_event_source_set_enabled(3) <../man3/sd_event_source_set_enabled.3.html>`__, 
`sd_event_source_set_exit_on_failure(3) <../man3/sd_event_source_set_exit_on_failure.3.html>`__, 
`sd_event_source_set_floating(3) <../man3/sd_event_source_set_floating.3.html>`__, 
`sd_event_source_set_prepare(3) <../man3/sd_event_source_set_prepare.3.html>`__, 
`sd_event_source_set_priority(3) <../man3/sd_event_source_set_priority.3.html>`__, 
`sd_event_source_set_ratelimit(3) <../man3/sd_event_source_set_ratelimit.3.html>`__, 
`sd_event_source_set_userdata(3) <../man3/sd_event_source_set_userdata.3.html>`__, 
`sd_event_source_unref(3) <../man3/sd_event_source_unref.3.html>`__, 
`sd_watchdog_enabled(3) <../man3/sd_watchdog_enabled.3.html>`__

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
