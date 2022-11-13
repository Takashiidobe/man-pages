.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

sd_event_source_get_pending(3) — Linux manual page
==================================================

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

   SD_EVENT_SOURCE_GET_PENDING(3)t_source_get_pending_SOURCE_GET_PENDING(3)

NAME
-------------------------------------------------

::

          sd_event_source_get_pending - Determine pending state of event
          sources


---------------------------------------------------------

::

          #include <systemd/sd-event.h>

          int sd_event_source_get_pending(sd_event_source *source);


---------------------------------------------------------------

::

          sd_event_source_get_pending() may be used to determine whether
          the event source object specified as source has seen events but
          has not been dispatched yet (and thus is marked "pending").

          Event source objects initially are not marked pending, when they
          are created with calls such as sd_event_add_io(3),
          sd_event_add_time(3), with the exception of those created with
          sd_event_add_defer(3) which are immediately marked pending, and
          sd_event_add_exit(3) for which the "pending" concept is not
          defined. For details see the respective manual pages.

          In each event loop iteration one event source of those marked
          pending is dispatched, in the order defined by the event source
          priority, as set with sd_event_source_set_priority(3).

          For I/O event sources, as created with sd_event_add_io(3), the
          call sd_event_source_get_io_revents(3) may be used to query the
          type of event pending in more detail.


-----------------------------------------------------------------

::

          On success, sd_event_source_get_pending() returns an integer
          greater than zero when the event source is marked pending, and
          zero when the event source is not marked pending. On failure, it
          returns a negative errno-style error code.

      Errors
          Returned errors may indicate the following problems:

          -EINVAL
              source is not a valid pointer to an sd_event_source object.

          -EDOM
              source refers to an event source object created with
              sd_event_add_exit(3).

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
          sd_event_add_inotify(3), sd_event_add_defer(3),
          sd_event_source_unref(3)

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

   systemd 249                               SD_EVENT_SOURCE_GET_PENDING(3)

--------------

Pages that refer to this page:
`sd-event(3) <../man3/sd-event.3.html>`__, 
`sd_event_add_io(3) <../man3/sd_event_add_io.3.html>`__

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
