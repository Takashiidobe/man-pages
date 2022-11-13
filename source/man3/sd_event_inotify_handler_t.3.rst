.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

sd_event_add_inotify(3) — Linux manual page
===========================================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `RETURN VALUE <#RETURN_VALUE>`__  |                                   |
| \| `EXAMPLES <#EXAMPLES>`__ \|    |                                   |
| `NOTES <#NOTES>`__ \|             |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   SD_EVENT_ADD_INOTIFY(3)   sd_event_add_inotify   SD_EVENT_ADD_INOTIFY(3)

NAME
-------------------------------------------------

::

          sd_event_add_inotify, sd_event_source_get_inotify_mask,
          sd_event_inotify_handler_t - Add an "inotify" file system inode
          event source to an event loop


---------------------------------------------------------

::

          #include <systemd/sd-event.h>

          typedef struct sd_event_source sd_event_source;

          typedef int (*sd_event_inotify_handler_t)(sd_event_source *s,
                                                    const struct inotify_event *event,
                                                    void *userdata);

          int sd_event_add_inotify(sd_event *event,
                                   sd_event_source **source,
                                   const char *path, uint32_t mask,
                                   sd_event_inotify_handler_t handler,
                                   void *userdata);

          int sd_event_source_get_inotify_mask(sd_event_source *source,
                                               uint32_t *mask);


---------------------------------------------------------------

::

          sd_event_add_inotify() adds a new inotify(7) file system inode
          event source to an event loop. The event loop object is specified
          in the event parameter, the event source object is returned in
          the source parameter. The path parameter specifies the path of
          the file system inode to watch. The handler must reference a
          function to call when the inode changes. The handler function
          will be passed the userdata pointer, which may be chosen freely
          by the caller. The handler also receives a pointer to a struct
          inotify_event structure containing information about the inode
          event. The mask parameter specifies which types of inode events
          to watch specifically. It must contain an OR-ed combination of
          IN_ACCESS, IN_ATTRIB, IN_CLOSE_WRITE, ... flags. See inotify(7)
          for further information.

          If multiple event sources are installed for the same inode the
          backing inotify watch descriptor is automatically shared. The
          mask parameter may contain any flag defined by the inotify API,
          with the exception of IN_MASK_ADD.

          The handler is enabled continuously (SD_EVENT_ON), but this may
          be changed with sd_event_source_set_enabled(3). Alternatively,
          the IN_ONESHOT mask flag may be used to request SD_EVENT_ONESHOT
          mode. If the handler function returns a negative error code, it
          will be disabled after the invocation, even if the SD_EVENT_ON
          mode was requested before.

          As a special limitation the priority of inotify event sources may
          only be altered (see sd_event_source_set_priority(3)) in the time
          between creation of the event source object with
          sd_event_add_inotify() and the beginning of the next event loop
          iteration. Attempts of changing the priority any later will be
          refused. Consider freeing and allocating a new inotify event
          source to change the priority at that point.

          To destroy an event source object use sd_event_source_unref(3),
          but note that the event source is only removed from the event
          loop when all references to the event source are dropped. To make
          sure an event source does not fire anymore, even when there's
          still a reference to it kept, consider disabling it with
          sd_event_source_set_enabled(3).

          If the second parameter of sd_event_add_inotify() is passed as
          NULL no reference to the event source object is returned. In this
          case the event source is considered "floating", and will be
          destroyed implicitly when the event loop itself is destroyed.

          If the handler parameter to sd_event_add_inotify() is NULL, and
          the event source fires, this will be considered a request to exit
          the event loop. In this case, the userdata parameter, cast to an
          integer, is passed as the exit code parameter to
          sd_event_exit(3).

          sd_event_source_get_inotify_mask() retrieves the configured
          inotify watch mask of an event source created previously with
          sd_event_add_inotify(). It takes the event source object as the
          source parameter and a pointer to a uint32_t variable to return
          the mask in.


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
              a mask with IN_MASK_ADD set.

          -ESTALE
              The event loop is already terminated.

          -ECHILD
              The event loop has been created in a different process.

          -EDOM
              The passed event source is not an inotify process event
              source.


---------------------------------------------------------

::

          Example 1. A simple program that uses inotify to monitor one or
          two directories

              #include <stdio.h>
              #include <string.h>
              #include <sys/inotify.h>

              #include <systemd/sd-event.h>

              #define _cleanup_(f) __attribute__((cleanup(f)))

              static int inotify_handler(sd_event_source *source,
                                         const struct inotify_event *event,
                                         void *userdata) {

                const char *desc = NULL;

                sd_event_source_get_description(source, &desc);

                if (event->mask & IN_Q_OVERFLOW)
                  printf("inotify-handler <%s>: overflow\n", desc);
                else if (event->mask & IN_CREATE)
                  printf("inotify-handler <%s>: create on %s\n", desc, event->name);
                else if (event->mask & IN_DELETE)
                  printf("inotify-handler <%s>: delete on %s\n", desc, event->name);
                else if (event->mask & IN_MOVED_TO)
                  printf("inotify-handler <%s>: moved-to on %s\n", desc, event->name);

                /* Terminate the program if an "exit" file appears */
                if ((event->mask & (IN_CREATE|IN_MOVED_TO)) &&
                    strcmp(event->name, "exit") == 0)
                  sd_event_exit(sd_event_source_get_event(source), 0);

                return 1;
              }

              int main(int argc, char **argv) {
                _cleanup_(sd_event_unrefp) sd_event *event = NULL;
                _cleanup_(sd_event_source_unrefp) sd_event_source *source1 = NULL, *source2 = NULL;

                const char *path1 = argc > 1 ? argv[1] : "/tmp";
                const char *path2 = argc > 2 ? argv[2] : NULL;

                /* Note: failure handling is omitted for brevity */

                sd_event_default(&event);

                sd_event_add_inotify(event, &source1, path1,
                                     IN_CREATE | IN_DELETE | IN_MODIFY | IN_MOVED_TO,
                                     inotify_handler, NULL);
                if (path2)
                  sd_event_add_inotify(event, &source2, path2,
                                       IN_CREATE | IN_DELETE | IN_MODIFY | IN_MOVED_TO,
                                       inotify_handler, NULL);

                sd_event_loop(event);

                return 0;
              }


---------------------------------------------------

::

          These APIs are implemented as a shared library, which can be
          compiled and linked to with the libsystemd pkg-config(1) file.


---------------------------------------------------------

::

          systemd(1), sd-event(3), sd_event_new(3), sd_event_now(3),
          sd_event_add_io(3), sd_event_add_time(3), sd_event_add_signal(3),
          sd_event_add_defer(3), sd_event_add_child(3),
          sd_event_source_set_enabled(3), sd_event_source_set_priority(3),
          sd_event_source_set_userdata(3),
          sd_event_source_set_description(3),
          sd_event_source_set_floating(3), waitid(2)

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

   systemd 249                                      SD_EVENT_ADD_INOTIFY(3)

--------------

Pages that refer to this page:
`sd-event(3) <../man3/sd-event.3.html>`__, 
`sd_event_add_child(3) <../man3/sd_event_add_child.3.html>`__, 
`sd_event_add_defer(3) <../man3/sd_event_add_defer.3.html>`__, 
`sd_event_add_io(3) <../man3/sd_event_add_io.3.html>`__, 
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
