.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

sd_event_add_child(3) — Linux manual page
=========================================

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

   SD_EVENT_ADD_CHILD(3)      sd_event_add_child      SD_EVENT_ADD_CHILD(3)

NAME
-------------------------------------------------

::

          sd_event_add_child, sd_event_add_child_pidfd,
          sd_event_source_get_child_pid, sd_event_source_get_child_pidfd,
          sd_event_source_get_child_pidfd_own,
          sd_event_source_set_child_pidfd_own,
          sd_event_source_get_child_process_own,
          sd_event_source_set_child_process_own,
          sd_event_source_send_child_signal, sd_event_child_handler_t - Add
          a child process state change event source to an event loop


---------------------------------------------------------

::

          #include <systemd/sd-event.h>

          typedef struct sd_event_source sd_event_source;

          typedef int (*sd_event_child_handler_t)(sd_event_source *s,
                                                  const siginfo_t *si,
                                                  void *userdata);

          int sd_event_add_child(sd_event *event, sd_event_source **source,
                                 pid_t pid, int options,
                                 sd_event_child_handler_t handler,
                                 void *userdata);

          int sd_event_add_child_pidfd(sd_event *event,
                                       sd_event_source **source, int pidfd,
                                       int options,
                                       sd_event_child_handler_t handler,
                                       void *userdata);

          int sd_event_source_get_child_pid(sd_event_source *source,
                                            pid_t *pid);

          int sd_event_source_get_child_pidfd(sd_event_source *source);

          int sd_event_source_get_child_pidfd_own(sd_event_source *source);

          int sd_event_source_set_child_pidfd_own(sd_event_source *source,
                                                  int own);

          int
                                                    sd_event_source_get_child_process_own(sd_event_source *source);

          int
                                                    sd_event_source_set_child_process_own(sd_event_source *source,
                                                    int own);

          int sd_event_source_send_child_signal(sd_event_source *source,
                                                int sig,
                                                const siginfo_t *info,
                                                unsigned flags);


---------------------------------------------------------------

::

          sd_event_add_child() adds a new child process state change event
          source to an event loop. The event loop object is specified in
          the event parameter, the event source object is returned in the
          source parameter. The pid parameter specifies the PID of the
          process to watch, which must be a direct child process of the
          invoking process. The handler must reference a function to call
          when the process changes state. The handler function will be
          passed the userdata pointer, which may be chosen freely by the
          caller. The handler also receives a pointer to a siginfo_t
          structure containing information about the child process event.
          The options parameter determines which state changes will be
          watched for. It must contain an OR-ed mask of WEXITED (watch for
          the child process terminating), WSTOPPED (watch for the child
          process being stopped by a signal), and WCONTINUED (watch for the
          child process being resumed by a signal). See waitid(2) for
          further information.

          Only a single handler may be installed for a specific child
          process. The handler is enabled for a single event
          (SD_EVENT_ONESHOT), but this may be changed with
          sd_event_source_set_enabled(3). If the handler function returns a
          negative error code, it will be disabled after the invocation,
          even if the SD_EVENT_ON mode was requested before.

          To destroy an event source object use sd_event_source_unref(3),
          but note that the event source is only removed from the event
          loop when all references to the event source are dropped. To make
          sure an event source does not fire anymore, even when there's
          still a reference to it kept, consider setting the event source
          to SD_EVENT_OFF with sd_event_source_set_enabled(3).

          The SIGCHLD signal must be blocked in all threads before this
          function is called (using sigprocmask(2) or pthread_sigmask(3)).

          If the second parameter of sd_event_add_child() is passed as NULL
          no reference to the event source object is returned. In this case
          the event source is considered "floating", and will be destroyed
          implicitly when the event loop itself is destroyed.

          Note that the handler function is invoked at a time where the
          child process is not reaped yet (and thus still is exposed as a
          zombie process by the kernel). However, the child will be reaped
          automatically after the function returns. Child processes for
          which no child process state change event sources are installed
          will not be reaped by the event loop implementation.

          If the handler parameter to sd_event_add_child() is NULL, and the
          event source fires, this will be considered a request to exit the
          event loop. In this case, the userdata parameter, cast to an
          integer, is passed as the exit code parameter to
          sd_event_exit(3).

          If both a child process state change event source and a SIGCHLD
          signal event source is installed in the same event loop, the
          configured event source priorities decide which event source is
          dispatched first. If the signal handler is processed first, it
          should leave the child processes for which child process state
          change event sources are installed unreaped.

          sd_event_add_child_pidfd() is similar to sd_event_add_child() but
          takes a file descriptor referencing the process ("pidfd") instead
          of the numeric PID. A suitable file descriptor may be acquired
          via pidfd_open(2) and related calls. The passed file descriptor
          is not closed when the event source is freed again, unless
          sd_event_source_set_child_pidfd_own() is used to turn this
          behaviour on. Note that regardless which of sd_event_add_child()
          and sd_event_add_child_pidfd() is used for allocating an event
          source, the watched process has to be a direct child process of
          the invoking process. Also in both cases SIGCHLD has to be
          blocked in the invoking process.

          sd_event_source_get_child_pid() retrieves the configured PID of a
          child process state change event source created previously with
          sd_event_add_child(). It takes the event source object as the
          source parameter and a pointer to a pid_t variable to return the
          process ID in.

          sd_event_source_get_child_pidfd() retrieves the file descriptor
          referencing the watched process ("pidfd") if this functionality
          is available. On kernels that support the concept the event loop
          will make use of pidfds to watch child processes, regardless if
          the individual event sources are allocated via
          sd_event_add_child() or sd_event_add_child_pidfd(). If the latter
          call was used to allocate the event source, this function returns
          the file descriptor used for allocation. On kernels that do not
          support the pidfd concept this function will fail with
          EOPNOTSUPP. This call takes the event source object as the source
          parameter and returns the numeric file descriptor.

          sd_event_source_get_child_pidfd_own() may be used to query
          whether the pidfd the event source encapsulates shall be closed
          when the event source is freed. This function returns zero if the
          pidfd shall be left open, and positive if it shall be closed
          automatically. By default this setting defaults to on if the
          event source was allocated via sd_event_add_child() and off if it
          was allocated via sd_event_add_child_pidfd(). The
          sd_event_source_set_child_pidfd_own() function may be used to
          change the setting and takes a boolean parameter with the new
          setting.

          sd_event_source_get_child_process_own() may be used to query
          whether the process the event source watches shall be killed
          (with SIGKILL) and reaped when the event source is freed. This
          function returns zero if the process shell be left running, and
          positive if it shall be killed and reaped automatically. By
          default this setting defaults to off. The
          sd_event_source_set_child_process_own() function may be used to
          change the setting and takes a boolean parameter with the new
          setting. Note that currently if the calling process is terminated
          abnormally the watched process might survive even thought the
          event source ceases to exist. This behaviour might change
          eventually.

          sd_event_source_send_child_signal() may be used to send a UNIX
          signal to the watched process. If the pidfd concept is supported
          in the kernel, this is implemented via pidfd_send_signal(2) and
          otherwise via rt_sigqueueinfo(2) (or via kill(2) in case info is
          NULL). The specified parameters match those of these underlying
          system calls, except that the info is never modified (and is thus
          declared constant). Like for the underlying system calls, the
          flags parameter currently must be zero.


-----------------------------------------------------------------

::

          On success, these functions return 0 or a positive integer. On
          failure, they return a negative errno-style error code.

      Errors
          Returned errors may indicate the following problems:

          -ENOMEM
              Not enough memory to allocate an object.

          -EINVAL
              An invalid argument has been passed. This includes specifying
              an empty mask in options or a mask which contains values
              different than a combination of WEXITED, WSTOPPED, and
              WCONTINUED.

          -EBUSY
              A handler is already installed for this child process, or
              SIGCHLD is not blocked.

          -ESTALE
              The event loop is already terminated.

          -ECHILD
              The event loop has been created in a different process.

          -EDOM
              The passed event source is not a child process event source.

          -EOPNOTSUPP
              A pidfd was requested but the kernel does not support this
              concept.


---------------------------------------------------

::

          These APIs are implemented as a shared library, which can be
          compiled and linked to with the libsystemd pkg-config(1) file.


---------------------------------------------------------

::

          systemd(1), sd-event(3), sd_event_new(3), sd_event_now(3),
          sd_event_add_io(3), sd_event_add_time(3), sd_event_add_signal(3),
          sd_event_add_inotify(3), sd_event_add_defer(3),
          sd_event_source_set_enabled(3), sd_event_source_set_priority(3),
          sd_event_source_set_userdata(3),
          sd_event_source_set_description(3),
          sd_event_source_set_floating(3), waitid(2), sigprocmask(2),
          pthread_sigmask(3), pidfd_open(2), pidfd_send_signal(2),
          rt_sigqueueinfo(2), kill(2)

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

   systemd 249                                        SD_EVENT_ADD_CHILD(3)

--------------

Pages that refer to this page:
`sd-event(3) <../man3/sd-event.3.html>`__, 
`sd_event_add_defer(3) <../man3/sd_event_add_defer.3.html>`__, 
`sd_event_add_inotify(3) <../man3/sd_event_add_inotify.3.html>`__, 
`sd_event_add_io(3) <../man3/sd_event_add_io.3.html>`__, 
`sd_event_add_signal(3) <../man3/sd_event_add_signal.3.html>`__, 
`sd_event_add_time(3) <../man3/sd_event_add_time.3.html>`__, 
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
