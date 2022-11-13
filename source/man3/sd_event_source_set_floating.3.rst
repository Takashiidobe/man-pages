.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

sd_event_source_set_floating(3) — Linux manual page
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

   SD_EVENT_SOURCE_SET_FLOATING(3)source_set_floatingSOURCE_SET_FLOATING(3)

NAME
-------------------------------------------------

::

          sd_event_source_set_floating, sd_event_source_get_floating - Set
          or retrieve 'floating' state of event sources


---------------------------------------------------------

::

          #include <systemd/sd-event.h>

          int sd_event_source_set_floating(sd_event_source *source,
                                           int floating);

          int sd_event_source_get_floating(sd_event_source *source);


---------------------------------------------------------------

::

          sd_event_source_set_floating() takes a boolean and sets the
          'floating' state of the specified event source object. This is
          used to change the direction of reference counts for the object
          and the event loop it is associated with. In non-floating mode,
          the event source object holds a reference to the event loop
          object, but not vice versa. The creator of the event source
          object must hold a reference to it as long as the source should
          exist. In floating mode, the event loop holds a reference to the
          source object, and will decrease the reference count when being
          freed. This means that a reference to the event loop should be
          held to prevent both from being destroyed.

          Various calls that allocate event source objects (i.e.
          sd_event_add_io(3), sd_event_add_time(3) and similar) will
          automatically set an event source object to 'floating' mode if
          the caller passed NULL in the parameter used to return a
          reference to the event source object. Nevertheless, it may be
          necessary to gain temporary access to the source object, for
          example to adjust event source properties after allocation (e.g.
          its priority or description string). In those cases the object
          may be created in non-floating mode, and the returned reference
          used to adjust the properties, and the object marked as floating
          afterwards, and the reference in the caller dropped.

          sd_event_source_get_floating() may be used to query the current
          'floating' state of the event source object source. It returns
          zero if 'floating' mode is off, positive if it is on.


-----------------------------------------------------------------

::

          On success, sd_event_source_set_floating() and
          sd_event_source_get_floating() return a non-negative integer. On
          failure, they return a negative errno-style error code.

      Errors
          Returned errors may indicate the following problems:

          -EINVAL
              source is not a valid pointer to an sd_event_source object.

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
          sd_event_source_set_description(3),
          sd_event_source_set_priority(3)

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

   systemd 249                              SD_EVENT_SOURCE_SET_FLOATING(3)

--------------

Pages that refer to this page:
`sd_event_add_child(3) <../man3/sd_event_add_child.3.html>`__, 
`sd_event_add_defer(3) <../man3/sd_event_add_defer.3.html>`__, 
`sd_event_add_inotify(3) <../man3/sd_event_add_inotify.3.html>`__, 
`sd_event_add_io(3) <../man3/sd_event_add_io.3.html>`__, 
`sd_event_add_signal(3) <../man3/sd_event_add_signal.3.html>`__, 
`sd_event_add_time(3) <../man3/sd_event_add_time.3.html>`__

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
