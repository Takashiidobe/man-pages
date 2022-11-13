.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

sd_event_wait(3) — Linux manual page
====================================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `                                 |                                   |
| STATE MACHINE <#STATE_MACHINE>`__ |                                   |
| \|                                |                                   |
| `RETURN VALUE <#RETURN_VALUE>`__  |                                   |
| \| `NOTES <#NOTES>`__ \|          |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   SD_EVENT_WAIT(3)              sd_event_wait             SD_EVENT_WAIT(3)

NAME
-------------------------------------------------

::

          sd_event_wait, sd_event_prepare, sd_event_dispatch,
          sd_event_get_state, sd_event_get_iteration, SD_EVENT_INITIAL,
          SD_EVENT_PREPARING, SD_EVENT_ARMED, SD_EVENT_PENDING,
          SD_EVENT_RUNNING, SD_EVENT_EXITING, SD_EVENT_FINISHED - Low-level
          event loop operations


---------------------------------------------------------

::

          #include <systemd/sd-event.h>

          enum {
                  SD_EVENT_INITIAL,
                  SD_EVENT_PREPARING,
                  SD_EVENT_ARMED,
                  SD_EVENT_PENDING,
                  SD_EVENT_RUNNING,
                  SD_EVENT_EXITING,
                  SD_EVENT_FINISHED,
          };

          int sd_event_prepare(sd_event *event);

          int sd_event_wait(sd_event *event, uint64_t usec);

          int sd_event_dispatch(sd_event *event);

          int sd_event_get_state(sd_event *event);

          int sd_event_get_iteration(sd_event *event, uint64_t *ret);


---------------------------------------------------------------

::

          The low-level sd_event_prepare(), sd_event_wait() and
          sd_event_dispatch() functions may be used to execute specific
          phases of an event loop. See sd_event_run(3) and sd_event_loop(3)
          for higher-level functions that execute individual but complete
          iterations of an event loop or run it continuously.

          sd_event_prepare() checks for pending events and arms necessary
          timers. If any events are ready to be processed ("pending"), it
          returns a positive, non-zero value, and the caller should process
          these events with sd_event_dispatch().

          sd_event_dispatch() dispatches the highest priority event source
          that has a pending event. On success, sd_event_dispatch() returns
          either zero, which indicates that no further event sources may be
          dispatched and exiting of the event loop was requested via
          sd_event_exit(3); or a positive non-zero value, which means that
          an event source was dispatched and the loop returned to its
          initial state, and the caller should initiate the next event loop
          iteration by invoking sd_event_prepare() again.

          In case sd_event_prepare() returned zero, sd_event_wait() should
          be called to wait for further events or a timeout. If any events
          are ready to be processed, it returns a positive, non-zero value,
          and the events should be dispatched with sd_event_dispatch().
          Otherwise, the event loop returned to its initial state and the
          next event loop iteration should be initiated by invoking
          sd_event_prepare() again.

          sd_event_get_state() may be used to determine the state the event
          loop is currently in. It returns one of the states described
          below.

          sd_event_get_iteration() may be used to determine the current
          iteration of the event loop. It returns an unsigned 64bit integer
          containing a counter that increases monotonically with each
          iteration of the event loop, starting with 0. The counter is
          increased at the time of the sd_event_prepare() invocation.

          All five functions take, as the first argument, the event loop
          object event that has been created with sd_event_new(). The
          timeout for sd_event_wait() is specified in usec in microseconds.
          (uint64_t) -1 may be used to specify an infinite timeout.


-------------------------------------------------------------------

::

          The event loop knows the following states, that may be queried
          with sd_event_get_state().

          SD_EVENT_INITIAL
              The initial state the event loop is in, before each event
              loop iteration. Use sd_event_prepare() to transition the
              event loop into the SD_EVENT_ARMED or SD_EVENT_PENDING
              states.

          SD_EVENT_PREPARING
              An event source is currently being prepared, i.e. the
              preparation handler is currently being executed, as set with
              sd_event_source_set_prepare(3). This state is only seen in
              the event source preparation handler that is invoked from the
              sd_event_prepare() call and is immediately followed by
              SD_EVENT_ARMED or SD_EVENT_PENDING.

          SD_EVENT_ARMED
              sd_event_prepare() has been called and no event sources were
              ready to be dispatched. Use sd_event_wait() to wait for new
              events, and transition into SD_EVENT_PENDING or back into
              SD_EVENT_INITIAL.

          SD_EVENT_PENDING
              sd_event_prepare() or sd_event_wait() have been called and
              there were event sources with events pending. Use
              sd_event_dispatch() to dispatch the highest priority event
              source and transition back to SD_EVENT_INITIAL, or
              SD_EVENT_FINISHED.

          SD_EVENT_RUNNING
              A regular event source is currently being dispatched. This
              state is only seen in the event source handler that is
              invoked from the sd_event_dispatch() call, and is immediately
              followed by SD_EVENT_INITIAL or SD_EVENT_FINISHED as soon the
              event source handler returns. Note that during dispatching of
              exit event sources the SD_EVENT_EXITING state is seen
              instead.

          SD_EVENT_EXITING
              Similar to SD_EVENT_RUNNING but is the state in effect while
              dispatching exit event sources. It is followed by
              SD_EVENT_INITIAL or SD_EVENT_FINISHED as soon as the event
              handler returns.

          SD_EVENT_FINISHED
              The event loop has exited. All exit event sources have run.
              If the event loop is in this state it serves no purpose
              anymore, and should be freed.

          A simplified flow chart of the states and the calls to transition
          between them is shown below. Note that SD_EVENT_PREPARING,
          SD_EVENT_RUNNING and SD_EVENT_EXITING are not shown here.

                        INITIAL -<---<---<---<---<---<---<---<---<---<---<---<---\
                           |                                                     |
                           |                                                     ^
                           |                                                     |
                           v                 ret == 0                            |
                    sd_event_prepare() >--->--->--->--->- ARMED                  |
                           |                                |                    ^
                           | ret > 0                        |                    |
                           |                                |                    |
                           v                                v          ret == 0  |
                        PENDING <---<---<---<---<---< sd_event_wait() >--->--->--+
                           |           ret > 0                                   ^
                           |                                                     |
                           |                                                     |
                           v                                                     |
                    sd_event_dispatch() >--->--->--->--->--->--->--->--->--->--->/
                           |                             ret > 0
                           | ret == 0
                           |
                           v
                        FINISHED


-----------------------------------------------------------------

::

          On success, these functions return 0 or a positive integer. On
          failure, they return a negative errno-style error code. In case
          of sd_event_prepare() and sd_event_wait(), a positive, non-zero
          return code indicates that events are ready to be processed and
          zero indicates that no events are ready. In case of
          sd_event_dispatch(), a positive, non-zero return code indicates
          that the event loop returned to its initial state and zero
          indicates the event loop has exited.  sd_event_get_state()
          returns a positive or zero state on success.

      Errors
          Returned errors may indicate the following problems:

          -EINVAL
              The event parameter is invalid or NULL.

          -EBUSY
              The event loop object is not in the right state.

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

          systemd(1), sd_event_new(3), sd_event_add_io(3),
          sd_event_add_time(3), sd_event_add_signal(3),
          sd_event_add_child(3), sd_event_add_inotify(3),
          sd_event_add_defer(3), sd_event_run(3), sd_event_get_fd(3),
          sd_event_source_set_prepare(3)

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

   systemd 249                                             SD_EVENT_WAIT(3)

--------------

Pages that refer to this page:
`sd-event(3) <../man3/sd-event.3.html>`__, 
`sd_event_get_fd(3) <../man3/sd_event_get_fd.3.html>`__, 
`sd_event_run(3) <../man3/sd_event_run.3.html>`__

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
