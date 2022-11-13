.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

sd_event_add_signal(3) — Linux manual page
==========================================

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

   SD_EVENT_ADD_SIGNAL(3)     sd_event_add_signal    SD_EVENT_ADD_SIGNAL(3)

NAME
-------------------------------------------------

::

          sd_event_add_signal, sd_event_source_get_signal,
          sd_event_signal_handler_t - Add a UNIX process signal event
          source to an event loop


---------------------------------------------------------

::

          #include <systemd/sd-event.h>

          typedef struct sd_event_source sd_event_source;

          typedef int (*sd_event_signal_handler_t)(sd_event_source *s,
                                                   const struct signalfd_siginfo *si,
                                                   void *userdata);

          int sd_event_add_signal(sd_event *event,
                                  sd_event_source **source, int signal,
                                  sd_event_signal_handler_t handler,
                                  void *userdata);

          int sd_event_source_get_signal(sd_event_source *source);


---------------------------------------------------------------

::

          sd_event_add_signal() adds a new UNIX process signal event source
          to an event loop. The event loop object is specified in the event
          parameter, and the event source object is returned in the source
          parameter. The signal parameter specifies the numeric signal to
          be handled (see signal(7)). The handler parameter must reference
          a function to call when the signal is received or be NULL. The
          handler function will be passed the userdata pointer, which may
          be chosen freely by the caller. The handler also receives a
          pointer to a signalfd_siginfo structure containing information
          about the received signal. See signalfd(2) for further
          information.

          Only a single handler may be installed for a specific signal. The
          signal must be blocked in all threads before this function is
          called (using sigprocmask(2) or pthread_sigmask(3)).

          By default, the event source is enabled permanently
          (SD_EVENT_ON), but this may be changed with
          sd_event_source_set_enabled(3). If the handler function returns a
          negative error code, it will be disabled after the invocation,
          even if the SD_EVENT_ON mode was requested before.

          To destroy an event source object use sd_event_source_unref(3),
          but note that the event source is only removed from the event
          loop when all references to the event source are dropped. To make
          sure an event source does not fire anymore, even if it is still
          referenced, disable the event source using
          sd_event_source_set_enabled(3) with SD_EVENT_OFF.

          If the second parameter of sd_event_add_signal() is NULL no
          reference to the event source object is returned. In this case
          the event source is considered "floating", and will be destroyed
          implicitly when the event loop itself is destroyed.

          If the handler parameter to sd_event_add_signal() is NULL, and
          the event source fires, this will be considered a request to exit
          the event loop. In this case, the userdata parameter, cast to an
          integer, is passed as the exit code parameter to
          sd_event_exit(3).

          sd_event_source_get_signal() returns the configured signal number
          of an event source created previously with sd_event_add_signal().
          It takes the event source object as the source parameter.


-----------------------------------------------------------------

::

          On success, these functions return 0 or a positive integer. On
          failure, they return a negative errno-style error code.

      Errors
          Returned errors may indicate the following problems:

          -ENOMEM
              Not enough memory to allocate an object.

          -EINVAL
              An invalid argument has been passed.

          -EBUSY
              A handler is already installed for this signal or the signal
              was not blocked previously.

          -ESTALE
              The event loop is already terminated.

          -ECHILD
              The event loop has been created in a different process.

          -EDOM
              The passed event source is not a signal event source.


---------------------------------------------------

::

          These APIs are implemented as a shared library, which can be
          compiled and linked to with the libsystemd pkg-config(1) file.


---------------------------------------------------------

::

          systemd(1), sd-event(3), sd_event_new(3), sd_event_now(3),
          sd_event_add_io(3), sd_event_add_time(3), sd_event_add_child(3),
          sd_event_add_inotify(3), sd_event_add_defer(3),
          sd_event_source_set_enabled(3),
          sd_event_source_set_description(3),
          sd_event_source_set_userdata(3), sd_event_source_set_floating(3),
          signal(7), signalfd(2), sigprocmask(2), pthread_sigmask(3)

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

   systemd 249                                       SD_EVENT_ADD_SIGNAL(3)

--------------

Pages that refer to this page:
`sd-event(3) <../man3/sd-event.3.html>`__, 
`sd_event_add_child(3) <../man3/sd_event_add_child.3.html>`__, 
`sd_event_add_defer(3) <../man3/sd_event_add_defer.3.html>`__, 
`sd_event_add_inotify(3) <../man3/sd_event_add_inotify.3.html>`__, 
`sd_event_add_io(3) <../man3/sd_event_add_io.3.html>`__, 
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
