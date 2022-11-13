.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

sd_event_source_unref(3) — Linux manual page
============================================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `RETURN VALUE <#RETURN_VALUE>`__  |                                   |
| \| `NOTES <#NOTES>`__ \|          |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `NOTES <#NOTES>`__ \|             |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   SD_EVENT_SOURCE_UNREF(3)  sd_event_source_unref SD_EVENT_SOURCE_UNREF(3)

NAME
-------------------------------------------------

::

          sd_event_source_unref, sd_event_source_unrefp,
          sd_event_source_ref, sd_event_source_disable_unref,
          sd_event_source_disable_unrefp - Increase or decrease event
          source reference counters


---------------------------------------------------------

::

          #include <systemd/sd-event.h>

          sd_event_source* sd_event_source_unref(sd_event_source *source);

          void sd_event_source_unrefp(sd_event_source **source);

          sd_event_source* sd_event_source_ref(sd_event_source *source);

          sd_event_source*
                                                         sd_event_source_disable_unref(sd_event_source *source);

          void sd_event_source_disable_unrefp(sd_event_source **source);


---------------------------------------------------------------

::

          sd_event_source_unref() may be used to decrement by one the
          reference counter of the event source object specified as source.
          The reference counter is initially set to one, when the event
          source is created with calls such as sd_event_add_io(3) or
          sd_event_add_time(3). When the reference counter reaches zero it
          is removed from its event loop object and destroyed.

          sd_event_source_unrefp() is similar to sd_event_source_unref()
          but takes a pointer to a pointer to an sd_event_source object.
          This call is useful in conjunction with GCC's and LLVM's Clean-up
          Variable Attribute[1]. Note that this function is defined as
          inline function.

          sd_event_source_ref() may be used to increase by one the
          reference counter of the event source object specified as source.

          sd_event_source_unref(), sd_bus_creds_unrefp() and
          sd_bus_creds_ref() execute no operation if the passed event
          source object is NULL.

          Note that event source objects stay alive and may be dispatched
          as long as they have a reference counter greater than zero. In
          order to drop a reference of an event source and make sure the
          associated event source handler function is not called anymore it
          is recommended to combine a call of sd_event_source_unref() with
          a prior call to sd_event_source_set_enabled() with SD_EVENT_OFF
          or call sd_event_source_disable_unref(), see below.

          sd_event_source_disable_unref() combines a call to
          sd_event_source_set_enabled() with SD_EVENT_OFF with
          sd_event_source_unref(). This ensures that the source is disabled
          before the local reference to it is lost. The source parameter is
          allowed to be NULL.

          sd_event_source_disable_unrefp() is similar to
          sd_event_source_unrefp(), but in addition disables the source
          first. This call is useful in conjunction with GCC's and LLVM's
          Clean-up Variable Attribute[1]. Note that this function is
          defined as inline function.


-----------------------------------------------------------------

::

          sd_event_source_unref() and sd_event_source_disable_unref()
          always return NULL.  sd_event_source_ref() always returns the
          event source object passed in.


---------------------------------------------------

::

          These APIs are implemented as a shared library, which can be
          compiled and linked to with the libsystemd pkg-config(1) file.


---------------------------------------------------------

::

          sd-event(3), sd_event_add_io(3), sd_event_add_time(3),
          sd_event_add_signal(3), sd_event_add_child(3),
          sd_event_add_inotify(3), sd_event_add_defer(3),
          sd_event_source_set_enabled(3)

.. _notes-top-1:


---------------------------------------------------

::

           1. Clean-up Variable Attribute
              https://gcc.gnu.org/onlinedocs/gcc/Common-Variable-Attributes.html

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

   systemd 249                                     SD_EVENT_SOURCE_UNREF(3)

--------------

Pages that refer to this page:
`sd-event(3) <../man3/sd-event.3.html>`__, 
`sd_event_add_child(3) <../man3/sd_event_add_child.3.html>`__, 
`sd_event_add_defer(3) <../man3/sd_event_add_defer.3.html>`__, 
`sd_event_add_inotify(3) <../man3/sd_event_add_inotify.3.html>`__, 
`sd_event_add_io(3) <../man3/sd_event_add_io.3.html>`__, 
`sd_event_add_signal(3) <../man3/sd_event_add_signal.3.html>`__, 
`sd_event_add_time(3) <../man3/sd_event_add_time.3.html>`__, 
`sd_event_source_get_pending(3) <../man3/sd_event_source_get_pending.3.html>`__, 
`sd_event_source_set_enabled(3) <../man3/sd_event_source_set_enabled.3.html>`__

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
