.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

sd_event_exit(3) — Linux manual page
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

   SD_EVENT_EXIT(3)              sd_event_exit             SD_EVENT_EXIT(3)

NAME
-------------------------------------------------

::

          sd_event_exit, sd_event_get_exit_code - Ask the event loop to
          exit


---------------------------------------------------------

::

          #include <systemd/sd-event.h>

          int sd_event_exit(sd_event *event, int code);

          int sd_event_get_exit_code(sd_event *event, int *code);


---------------------------------------------------------------

::

          sd_event_exit() requests the event loop specified in the event
          event loop object to exit. The code parameter may be any integer
          value and is returned as-is by sd_event_loop(3) after the last
          event loop iteration. It may also be queried using
          sd_event_get_exit_code(), see below.

          When exiting is requested the event loop will stop listening for
          and dispatching regular event sources. Instead it will proceed
          with executing only event sources registered with
          sd_event_add_exit(3) in the order defined by their priority.
          After all exit event sources have been dispatched the event loop
          is terminated.

          If sd_event_exit() is invoked a second time while the event loop
          is still processing exit event sources, the exit code stored in
          the event loop object is updated, but otherwise no further
          operation is executed.

          sd_event_get_exit_code() may be used to query the exit code
          passed into sd_event_exit() earlier.

          While the full positive and negative integer ranges may be used
          for the exit code, care should be taken not pick exit codes that
          conflict with regular exit codes returned by sd_event_loop(), if
          these exit codes shall be distinguishable.

          Note that for most event source types passing the callback
          pointer as NULL in the respective constructor call (i.e. in
          sd_event_add_time(3), sd_event_add_signal(3), ...) has the effect
          of sd_event_exit() being invoked once the event source triggers,
          with the specified userdata pointer cast to an integer as the
          exit code parameter. This is useful to automatically terminate an
          event loop after some condition, such as a time-out or reception
          of SIGTERM or similar. See the documentation for the respective
          constructor call for details.


-----------------------------------------------------------------

::

          On success, sd_event_exit() and sd_event_get_exit_code() return 0
          or a positive integer. On failure, they return a negative
          errno-style error code.

      Errors
          Returned errors may indicate the following problems:

          -EINVAL
              The event loop object or error code pointer are invalid.

          -ECHILD
              The event loop was created in a different process.

          -ESTALE
              The event loop has exited already and all exit handlers are
              already processed.

          -ENODATA
              The event loop has not been requested to exit yet.


---------------------------------------------------

::

          These APIs are implemented as a shared library, which can be
          compiled and linked to with the libsystemd pkg-config(1) file.


---------------------------------------------------------

::

          systemd(1), sd-event(3), sd_event_new(3), sd_event_add_exit(3),
          sd_event_add_time(3), sd_event_add_signal(3), sd_event_add_io(3),
          sd_event_add_defer(3), sd_event_add_inotify(3)

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

   systemd 249                                             SD_EVENT_EXIT(3)

--------------

Pages that refer to this page:
`sd_bus_set_exit_on_disconnect(3) <../man3/sd_bus_set_exit_on_disconnect.3.html>`__, 
`sd-event(3) <../man3/sd-event.3.html>`__, 
`sd_event_add_child(3) <../man3/sd_event_add_child.3.html>`__, 
`sd_event_add_defer(3) <../man3/sd_event_add_defer.3.html>`__, 
`sd_event_add_inotify(3) <../man3/sd_event_add_inotify.3.html>`__, 
`sd_event_add_io(3) <../man3/sd_event_add_io.3.html>`__, 
`sd_event_add_signal(3) <../man3/sd_event_add_signal.3.html>`__, 
`sd_event_add_time(3) <../man3/sd_event_add_time.3.html>`__, 
`sd_event_run(3) <../man3/sd_event_run.3.html>`__, 
`sd_event_source_set_exit_on_failure(3) <../man3/sd_event_source_set_exit_on_failure.3.html>`__, 
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
