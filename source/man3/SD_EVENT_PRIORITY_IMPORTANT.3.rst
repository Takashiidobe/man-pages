.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

sd_event_source_set_priority(3) — Linux manual page
===================================================

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

   SD_EVENT_SOURCE_SET_PRIORITY(3)source_set_prioritySOURCE_SET_PRIORITY(3)

NAME
-------------------------------------------------

::

          sd_event_source_set_priority, sd_event_source_get_priority,
          SD_EVENT_PRIORITY_IMPORTANT, SD_EVENT_PRIORITY_NORMAL,
          SD_EVENT_PRIORITY_IDLE - Set or retrieve the priority of event
          sources


---------------------------------------------------------

::

          #include <systemd/sd-event.h>

          enum {
                  SD_EVENT_PRIORITY_IMPORTANT = -100,
                  SD_EVENT_PRIORITY_NORMAL = 0,
                  SD_EVENT_PRIORITY_IDLE = 100,
          };

          int sd_event_source_set_priority(sd_event_source *source,
                                           int64_t priority);

          int sd_event_source_get_priority(sd_event_source *source,
                                           int64_t *priority);


---------------------------------------------------------------

::

          sd_event_source_set_priority() may be used to set the priority
          for the event source object specified as source. The priority is
          specified as an arbitrary signed 64bit integer. The priority is
          initialized to SD_EVENT_PRIORITY_NORMAL (0) when the event source
          is allocated with a call such as sd_event_add_io(3) or
          sd_event_add_time(3), and may be changed with this call. If
          multiple event sources have seen events at the same time, they
          are dispatched in the order indicated by the event sources'
          priorities. Event sources with smaller priority values are
          dispatched first. As well-known points of reference, the
          constants SD_EVENT_PRIORITY_IMPORTANT (-100),
          SD_EVENT_PRIORITY_NORMAL (0) and SD_EVENT_PRIORITY_IDLE (100) may
          be used to indicate event sources that shall be dispatched early,
          normally or late. It is recommended to specify priorities based
          on these definitions, and relative to them — however, the full
          64bit signed integer range is available for ordering event
          sources.

          Priorities define the order in which event sources that have seen
          events are dispatched. Care should be taken to ensure that
          high-priority event sources (those with negative priority values
          assigned) do not cause starvation of low-priority event sources
          (those with positive priority values assigned).

          The order in which event sources with the same priority are
          dispatched is undefined, but the event loop generally tries to
          dispatch them in the order it learnt about events on them. As the
          backing kernel primitives do not provide accurate information
          about the order in which events occurred this is not necessarily
          reliable. However, it is guaranteed that if events are seen on
          multiple same-priority event sources at the same time, each one
          is not dispatched again until all others have been dispatched
          once. This behavior guarantees that within each priority
          particular event sources do not starve or dominate the event
          loop.

          The priority of event sources may be changed at any time of their
          lifetime, with the exception of inotify event sources (i.e. those
          created with sd_event_add_inotify(3)) whose priority may only be
          changed in the time between their initial creation and the first
          subsequent event loop iteration.

          sd_event_source_get_priority() may be used to query the current
          priority assigned to the event source object source.


-----------------------------------------------------------------

::

          On success, sd_event_source_set_priority() and
          sd_event_source_get_priority() return a non-negative integer. On
          failure, they return a negative errno-style error code.

      Errors
          Returned errors may indicate the following problems:

          -EINVAL
              source is not a valid pointer to an sd_event_source object.

          -ENOMEM
              Not enough memory.

          -ESTALE
              The event loop is already terminated.

          -ECHILD
              The event loop has been created in a different process.


---------------------------------------------------

::

          These APIs are implemented as a shared library, which can be
          compiled and linked to with the libsystemd pkg-config(1) file.


---------------------------------------------------------

::

          sd-event(3), sd_event_add_io(3), sd_event_add_time(3),
          sd_event_add_signal(3), sd_event_add_child(3),
          sd_event_add_inotify(3), sd_event_add_defer(3)

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

   systemd 249                              SD_EVENT_SOURCE_SET_PRIORITY(3)

--------------

Pages that refer to this page:
`sd_bus_attach_event(3) <../man3/sd_bus_attach_event.3.html>`__, 
`sd-event(3) <../man3/sd-event.3.html>`__, 
`sd_event_add_child(3) <../man3/sd_event_add_child.3.html>`__, 
`sd_event_add_defer(3) <../man3/sd_event_add_defer.3.html>`__, 
`sd_event_add_inotify(3) <../man3/sd_event_add_inotify.3.html>`__, 
`sd_event_add_io(3) <../man3/sd_event_add_io.3.html>`__, 
`sd_event_add_time(3) <../man3/sd_event_add_time.3.html>`__, 
`sd_event_source_get_pending(3) <../man3/sd_event_source_get_pending.3.html>`__, 
`sd_event_source_set_floating(3) <../man3/sd_event_source_set_floating.3.html>`__, 
`sd_event_source_set_prepare(3) <../man3/sd_event_source_set_prepare.3.html>`__

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
