.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

sd_event_add_time(3) — Linux manual page
========================================

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

   SD_EVENT_ADD_TIME(3)        sd_event_add_time       SD_EVENT_ADD_TIME(3)

NAME
-------------------------------------------------

::

          sd_event_add_time, sd_event_add_time_relative,
          sd_event_source_get_time, sd_event_source_set_time,
          sd_event_source_set_time_relative,
          sd_event_source_get_time_accuracy,
          sd_event_source_set_time_accuracy,
          sd_event_source_get_time_clock, sd_event_time_handler_t - Add a
          timer event source to an event loop


---------------------------------------------------------

::

          #include <systemd/sd-event.h>

          typedef struct sd_event_source sd_event_source;

          typedef int (*sd_event_time_handler_t)(sd_event_source *s,
                                                 uint64_t usec,
                                                 void *userdata);

          int sd_event_add_time(sd_event *event, sd_event_source **source,
                                clockid_t clock, uint64_t usec,
                                uint64_t accuracy,
                                sd_event_time_handler_t handler,
                                void *userdata);

          int sd_event_add_time_relative(sd_event *event,
                                         sd_event_source **source,
                                         clockid_t clock, uint64_t usec,
                                         uint64_t accuracy,
                                         sd_event_time_handler_t handler,
                                         void *userdata);

          int sd_event_source_get_time(sd_event_source *source,
                                       uint64_t *usec);

          int sd_event_source_set_time(sd_event_source *source,
                                       uint64_t usec);

          int sd_event_source_set_time_relative(sd_event_source *source,
                                                uint64_t usec);

          int sd_event_source_get_time_accuracy(sd_event_source *source,
                                                uint64_t *usec);

          int sd_event_source_set_time_accuracy(sd_event_source *source,
                                                uint64_t usec);

          int sd_event_source_get_time_clock(sd_event_source *source,
                                             clockid_t *clock);


---------------------------------------------------------------

::

          sd_event_add_time() adds a new timer event source to an event
          loop. The event loop object is specified in the event parameter,
          the event source object is returned in the source parameter. The
          clock parameter takes a clock identifier, one of CLOCK_REALTIME,
          CLOCK_MONOTONIC, CLOCK_BOOTTIME, CLOCK_REALTIME_ALARM, or
          CLOCK_BOOTTIME_ALARM. See timerfd_create(2) for details regarding
          the various types of clocks. The usec parameter specifies the
          earliest time, in microseconds (µs), relative to the clock's
          epoch, when the timer shall be triggered. If a time already in
          the past is specified (including 0), this timer source "fires"
          immediately and is ready to be dispatched. If the parameter is
          specified as UINT64_MAX the timer event will never elapse, which
          may be used as an alternative to explicitly disabling a timer
          event source with sd_event_source_set_enabled(3). The accuracy
          parameter specifies an additional accuracy value in µs specifying
          how much the timer event may be delayed. Use 0 to select the
          default accuracy (250ms). Use 1µs for maximum accuracy. Consider
          specifying 60000000µs (1min) or larger for long-running events
          that may be delayed substantially. Picking higher accuracy values
          allows the system to coalesce timer events more aggressively,
          improving power efficiency. The handler parameter shall reference
          a function to call when the timer elapses. The handler function
          will be passed the userdata pointer, which may be chosen freely
          by the caller. The handler is also passed the configured trigger
          time, even if it is actually called slightly later, subject to
          the specified accuracy value, the kernel timer slack (see
          prctl(2)), and additional scheduling latencies. To query the
          actual time the handler was called use sd_event_now(3).

          By default, the timer will elapse once (SD_EVENT_ONESHOT), but
          this may be changed with sd_event_source_set_enabled(3). If the
          handler function returns a negative error code, it will be
          disabled after the invocation, even if the SD_EVENT_ON mode was
          requested before. Note that a timer event set to SD_EVENT_ON will
          fire continuously unless its configured time is updated using
          sd_event_source_set_time().

          sd_event_add_time_relative() is like sd_event_add_time(), but
          takes a relative time specification. It's relative to the current
          time of the event loop iteration, as returned by sd_event_now(3).

          To destroy an event source object use sd_event_source_unref(3),
          but note that the event source is only removed from the event
          loop when all references to the event source are dropped. To make
          sure an event source does not fire anymore, even if it is still
          referenced, disable the event source using
          sd_event_source_set_enabled(3) with SD_EVENT_OFF.

          If the second parameter of sd_event_add_time() is NULL no
          reference to the event source object is returned. In this case
          the event source is considered "floating", and will be destroyed
          implicitly when the event loop itself is destroyed.

          If the handler parameter to sd_event_add_time() is NULL, and the
          event source fires, this will be considered a request to exit the
          event loop. In this case, the userdata parameter, cast to an
          integer, is passed as the exit code parameter to
          sd_event_exit(3).

          Use CLOCK_BOOTTIME_ALARM and CLOCK_REALTIME_ALARM to define event
          sources that may wake up the system from suspend.

          In order to set up relative timers (that is, relative to the
          current time), retrieve the current time via sd_event_now(3), add
          the desired timespan to it, and use the result as the usec
          parameter to sd_event_add_time().

          In order to set up repetitive timers (that is, timers that are
          triggered in regular intervals), set up the timer normally, for
          the first invocation. Each time the event handler is invoked,
          update the timer's trigger time with sd_event_source_set_time(3)
          for the next timer iteration, and reenable the timer using
          sd_event_source_set_enabled(). To calculate the next point in
          time to pass to sd_event_source_set_time(), either use as base
          the usec parameter passed to the timer callback, or the timestamp
          returned by sd_event_now(). In the former case timer events will
          be regular, while in the latter case the scheduling latency will
          keep accumulating on the timer.

          sd_event_source_get_time() retrieves the configured time value of
          an event source created previously with sd_event_add_time() or
          sd_event_add_time_relative(). It takes the event source object
          and a pointer to a variable to store the time in, relative to the
          selected clock's epoch, in µs. The returned value is relative to
          the epoch, even if the event source was created with a relative
          time via sd_event_add_time_relative().

          sd_event_source_set_time() changes the time of an event source
          created previously with sd_event_add_time() or
          sd_event_add_time_relative(). It takes the event source object
          and a time relative to the selected clock's epoch, in µs.

          sd_event_source_set_time_relative() is similar to
          sd_event_source_set_time(), but takes a time relative to the
          current time of the event loop iteration, as returned by
          sd_event_now().

          sd_event_source_get_time_accuracy() retrieves the configured
          accuracy value of an event source created previously with
          sd_event_add_time(). It takes the event source object and a
          pointer to a variable to store the accuracy in. The accuracy is
          specified in µs.

          sd_event_source_set_time_accuracy() changes the configured
          accuracy of a timer event source created previously with
          sd_event_add_time(). It takes the event source object and
          accuracy, in µs.

          sd_event_source_get_time_clock() retrieves the configured clock
          of an event source created previously with sd_event_add_time().
          It takes the event source object and a pointer to a variable to
          store the clock identifier in.


-----------------------------------------------------------------

::

          On success, these functions return 0 or a positive integer. On
          failure, they return a negative errno-style error code.

      Errors
          Returned values may indicate the following problems:

          -ENOMEM
              Not enough memory to allocate an object.

          -EINVAL
              An invalid argument has been passed.

          -ESTALE
              The event loop is already terminated.

          -ECHILD
              The event loop has been created in a different process.

          -EOPNOTSUPP
              The selected clock is not supported by the event loop
              implementation.

          -EDOM
              The passed event source is not a timer event source.

          -EOVERFLOW
              The passed relative time is outside of the allowed range for
              time values (i.e. the specified value added to the current
              time is outside the 64 bit unsigned integer range).


---------------------------------------------------

::

          These APIs are implemented as a shared library, which can be
          compiled and linked to with the libsystemd pkg-config(1) file.


---------------------------------------------------------

::

          systemd(1), sd-event(3), sd_event_new(3), sd_event_now(3),
          sd_event_add_io(3), sd_event_add_signal(3),
          sd_event_add_child(3), sd_event_add_inotify(3),
          sd_event_add_defer(3), sd_event_source_set_enabled(3),
          sd_event_source_set_priority(3), sd_event_source_set_userdata(3),
          sd_event_source_set_description(3),
          sd_event_source_set_floating(3), clock_gettime(2),
          timerfd_create(2), prctl(2)

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

   systemd 249                                         SD_EVENT_ADD_TIME(3)

--------------

Pages that refer to this page:
`sd-event(3) <../man3/sd-event.3.html>`__, 
`sd_event_add_child(3) <../man3/sd_event_add_child.3.html>`__, 
`sd_event_add_defer(3) <../man3/sd_event_add_defer.3.html>`__, 
`sd_event_add_inotify(3) <../man3/sd_event_add_inotify.3.html>`__, 
`sd_event_add_io(3) <../man3/sd_event_add_io.3.html>`__, 
`sd_event_add_signal(3) <../man3/sd_event_add_signal.3.html>`__, 
`sd_event_add_time(3) <../man3/sd_event_add_time.3.html>`__, 
`sd_event_exit(3) <../man3/sd_event_exit.3.html>`__, 
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
