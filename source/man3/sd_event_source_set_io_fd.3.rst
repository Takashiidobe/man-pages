.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

sd_event_add_io(3) — Linux manual page
======================================

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

   SD_EVENT_ADD_IO(3)           sd_event_add_io          SD_EVENT_ADD_IO(3)

NAME
-------------------------------------------------

::

          sd_event_add_io, sd_event_source_get_io_events,
          sd_event_source_set_io_events, sd_event_source_get_io_revents,
          sd_event_source_get_io_fd, sd_event_source_set_io_fd,
          sd_event_source_get_io_fd_own, sd_event_source_set_io_fd_own,
          sd_event_source, sd_event_io_handler_t - Add an I/O event source
          to an event loop


---------------------------------------------------------

::

          #include <systemd/sd-event.h>

          typedef struct sd_event_source sd_event_source;

          typedef int (*sd_event_io_handler_t)(sd_event_source *s, int fd,
                                               uint32_t revents,
                                               void *userdata);

          int sd_event_add_io(sd_event *event, sd_event_source **source,
                              int fd, uint32_t events,
                              sd_event_io_handler_t handler,
                              void *userdata);

          int sd_event_source_get_io_events(sd_event_source *source,
                                            uint32_t *events);

          int sd_event_source_set_io_events(sd_event_source *source,
                                            uint32_t events);

          int sd_event_source_get_io_revents(sd_event_source *source,
                                             uint32_t *revents);

          int sd_event_source_get_io_fd(sd_event_source *source);

          int sd_event_source_set_io_fd(sd_event_source *source, int fd);

          int sd_event_source_get_io_fd_own(sd_event_source *source);

          int sd_event_source_set_io_fd_own(sd_event_source *source,
                                            int b);


---------------------------------------------------------------

::

          sd_event_add_io() adds a new I/O event source to an event loop.
          The event loop object is specified in the event parameter, the
          event source object is returned in the source parameter. The fd
          parameter takes the UNIX file descriptor to watch, which may
          refer to a socket, a FIFO, a message queue, a serial connection,
          a character device, or any other file descriptor compatible with
          Linux epoll(7). The events parameter takes a bit mask of events
          to watch for, a combination of the following event flags:
          EPOLLIN, EPOLLOUT, EPOLLRDHUP, EPOLLPRI, and EPOLLET, see
          epoll_ctl(2) for details. The handler shall reference a function
          to call when the event source is triggered. The userdata pointer
          will be passed to the handler function, and may be chosen freely
          by the caller. The handler will also be passed the file
          descriptor the event was seen on, as well as the actual event
          flags. It's generally a subset of the events watched, however may
          additionally include EPOLLERR and EPOLLHUP.

          By default, an event source will stay enabled continuously
          (SD_EVENT_ON), but this may be changed with
          sd_event_source_set_enabled(3). If the handler function returns a
          negative error code, it will be disabled after the invocation,
          even if the SD_EVENT_ON mode was requested before. Note that an
          event source set to SD_EVENT_ON will fire continuously unless
          data is read from or written to the file descriptor to reset the
          mask of events seen.

          Setting the I/O event mask to watch for to 0 does not mean that
          the event source won't be triggered anymore, as EPOLLHUP and
          EPOLLERR may be triggered even with a zero event mask. To
          temporarily disable an I/O event source use
          sd_event_source_set_enabled(3) with SD_EVENT_OFF instead.

          To destroy an event source object use sd_event_source_unref(3),
          but note that the event source is only removed from the event
          loop when all references to the event source are dropped. To make
          sure an event source does not fire anymore, even if it is still
          referenced, disable the event source using
          sd_event_source_set_enabled(3) with SD_EVENT_OFF.

          If the second parameter of sd_event_add_io() is NULL no reference
          to the event source object is returned. In this case the event
          source is considered "floating", and will be destroyed implicitly
          when the event loop itself is destroyed.

          If the handler to sd_event_add_io() is NULL, and the event source
          fires, this will be considered a request to exit the event loop.
          In this case, the userdata parameter, cast to an integer, is
          passed as the exit code parameter to sd_event_exit(3).

          Note that this call does not take possession of the file
          descriptor passed in, ownership (and thus the duty to close it
          when it is no longer needed) remains with the caller. However,
          with the sd_event_source_set_io_fd_own() call (see below) the
          event source may optionally take ownership of the file descriptor
          after the event source has been created. In that case the file
          descriptor is closed automatically as soon as the event source is
          released.

          It is recommended to use sd_event_add_io() only in conjunction
          with file descriptors that have O_NONBLOCK set, to ensure that
          all I/O operations from invoked handlers are properly
          asynchronous and non-blocking. Using file descriptors without
          O_NONBLOCK might result in unexpected starvation of other event
          sources. See fcntl(2) for details on enabling O_NONBLOCK mode.

          sd_event_source_get_io_events() retrieves the configured mask of
          watched I/O events of an event source created previously with
          sd_event_add_io(). It takes the event source object and a pointer
          to a variable to store the mask in.

          sd_event_source_set_io_events() configures the mask of watched
          I/O events of an event source created previously with
          sd_event_add_io(). It takes the event source object and the new
          event mask.

          sd_event_source_get_io_revents() retrieves the I/O event mask of
          currently seen but undispatched events from an event source
          created previously with sd_event_add_io(). It takes the event
          source object and a pointer to a variable to store the event mask
          in. When called from a handler function on the handler's event
          source object this will return the same mask as passed to the
          handler's revents parameter. This call is primarily useful to
          check for undispatched events of an event source from the handler
          of an unrelated (possibly higher priority) event source. Note the
          relation between sd_event_source_get_pending() and
          sd_event_source_get_io_revents(): both functions will report
          non-zero results when there's an event pending for the event
          source, but the former applies to all event source types, the
          latter only to I/O event sources.

          sd_event_source_get_io_fd() retrieves the UNIX file descriptor of
          an event source created previously with sd_event_add_io(). It
          takes the event source object and returns the non-negative file
          descriptor or a negative error number on error (see below).

          sd_event_source_set_io_fd() changes the UNIX file descriptor of
          an I/O event source created previously with sd_event_add_io(). It
          takes the event source object and the new file descriptor.

          sd_event_source_set_io_fd_own() controls whether the file
          descriptor of the event source shall be closed automatically when
          the event source is freed, i.e. whether it shall be considered
          'owned' by the event source object. By default it is not closed
          automatically, and the application has to do this on its own. The
          b parameter is a boolean parameter: if zero, the file descriptor
          is not closed automatically when the event source is freed,
          otherwise it is closed.

          sd_event_source_get_io_fd_own() may be used to query the current
          setting of the file descriptor ownership boolean flag as set with
          sd_event_source_set_io_fd_own(). It returns positive if the file
          descriptor is closed automatically when the event source is
          destroyed, zero if not, and negative on error.


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

          -EDOM
              The passed event source is not an I/O event source.


---------------------------------------------------

::

          These APIs are implemented as a shared library, which can be
          compiled and linked to with the libsystemd pkg-config(1) file.


---------------------------------------------------------

::

          systemd(1), sd-event(3), sd_event_new(3), sd_event_now(3),
          sd_event_add_time(3), sd_event_add_signal(3),
          sd_event_add_child(3), sd_event_add_inotify(3),
          sd_event_add_defer(3), sd_event_source_set_enabled(3),
          sd_event_source_set_priority(3), sd_event_source_set_userdata(3),
          sd_event_source_set_description(3),
          sd_event_source_get_pending(3), sd_event_source_set_floating(3),
          epoll_ctl(2), epoll(7)

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

   systemd 249                                           SD_EVENT_ADD_IO(3)

--------------

Pages that refer to this page:
`sd-event(3) <../man3/sd-event.3.html>`__, 
`sd_event_add_child(3) <../man3/sd_event_add_child.3.html>`__, 
`sd_event_add_defer(3) <../man3/sd_event_add_defer.3.html>`__, 
`sd_event_add_inotify(3) <../man3/sd_event_add_inotify.3.html>`__, 
`sd_event_add_signal(3) <../man3/sd_event_add_signal.3.html>`__, 
`sd_event_add_time(3) <../man3/sd_event_add_time.3.html>`__, 
`sd_event_exit(3) <../man3/sd_event_exit.3.html>`__, 
`sd_event_new(3) <../man3/sd_event_new.3.html>`__, 
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
