.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

sd_event_get_fd(3) — Linux manual page
======================================

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

   SD_EVENT_GET_FD(3)           sd_event_get_fd          SD_EVENT_GET_FD(3)

NAME
-------------------------------------------------

::

          sd_event_get_fd - Obtain a file descriptor to poll for event loop
          events


---------------------------------------------------------

::

          #include <systemd/sd-event.h>

          int sd_event_get_fd(sd_event *event);


---------------------------------------------------------------

::

          sd_event_get_fd() returns the file descriptor that an event loop
          object returned by the sd_event_new(3) function uses to wait for
          events. This file descriptor may itself be polled for
          POLLIN/EPOLLIN events. This makes it possible to embed an
          sd-event(3) event loop into another, possibly foreign, event
          loop.

          The returned file descriptor refers to an epoll(7) object. It is
          recommended not to alter it by invoking epoll_ctl(2) on it, in
          order to avoid interference with the event loop's inner logic and
          assumptions.


-----------------------------------------------------------------

::

          On success, sd_event_get_fd() returns a non-negative file
          descriptor. On failure, it returns a negative errno-style error
          code.

      Errors
          Returned errors may indicate the following problems:

          -EINVAL
              event is not a valid pointer to an sd_event structure.

          -ECHILD
              The event loop has been created in a different process.


---------------------------------------------------------

::

          Example 1. Integration in the GLib event loop

              /* SPDX-License-Identifier: MIT */

              #include <stdlib.h>
              #include <glib.h>
              #include <systemd/sd-event.h>

              typedef struct SDEventSource {
                GSource source;
                GPollFD pollfd;
                sd_event *event;
              } SDEventSource;

              static gboolean event_prepare(GSource *source, gint *timeout_) {
                return sd_event_prepare(((SDEventSource *)source)->event) > 0;
              }

              static gboolean event_check(GSource *source) {
                return sd_event_wait(((SDEventSource *)source)->event, 0) > 0;
              }

              static gboolean event_dispatch(GSource *source, GSourceFunc callback, gpointer user_data) {
                return sd_event_dispatch(((SDEventSource *)source)->event) > 0;
              }

              static void event_finalize(GSource *source) {
                sd_event_unref(((SDEventSource *)source)->event);
              }

              static GSourceFuncs event_funcs = {
                .prepare = event_prepare,
                .check = event_check,
                .dispatch = event_dispatch,
                .finalize = event_finalize,
              };

              GSource *g_sd_event_create_source(sd_event *event) {
                SDEventSource *source;

                source = (SDEventSource *)g_source_new(&event_funcs, sizeof(SDEventSource));

                source->event = sd_event_ref(event);
                source->pollfd.fd = sd_event_get_fd(event);
                source->pollfd.events = G_IO_IN | G_IO_HUP | G_IO_ERR;

                g_source_add_poll((GSource *)source, &source->pollfd);

                return (GSource *)source;
              }


---------------------------------------------------

::

          These APIs are implemented as a shared library, which can be
          compiled and linked to with the libsystemd pkg-config(1) file.


---------------------------------------------------------

::

          sd-event(3), sd_event_new(3), sd_event_wait(3), epoll_ctl(2),
          epoll(7)

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

   systemd 249                                           SD_EVENT_GET_FD(3)

--------------

Pages that refer to this page:
`sd-event(3) <../man3/sd-event.3.html>`__, 
`sd_event_run(3) <../man3/sd_event_run.3.html>`__, 
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
