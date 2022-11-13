.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

sd_event_source_set_ratelimit(3) — Linux manual page
====================================================

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

   SD_EVENT_SOURCE_SET_RATELIMIT(3)ource_set_ratelimitURCE_SET_RATELIMIT(3)

NAME
-------------------------------------------------

::

          sd_event_source_set_ratelimit, sd_event_source_get_ratelimit,
          sd_event_source_is_ratelimited - Configure rate limiting on event
          sources


---------------------------------------------------------

::

          #include <systemd/sd-event.h>

          int sd_event_source_set_ratelimit(sd_event_source *source,
                                            uint64_t interval_usec,
                                            unsigned burst);

          int sd_event_source_get_ratelimit(sd_event_source *source,
                                            uint64_t* ret_interval_usec,
                                            unsigned* ret_burst);

          int sd_event_source_is_ratelimited(sd_event_source *source);


---------------------------------------------------------------

::

          sd_event_source_set_ratelimit() may be used to enforce rate
          limiting on an event source. When used an event source will be
          temporarily turned off when it fires more often then a specified
          burst number within a specified time interval. This is useful as
          simple mechanism to avoid event source starvation if high
          priority event sources fire very frequently.

          Pass the event source to operate on as first argument, a time
          interval in microseconds as second argument and a maximum
          dispatch limit ("burst") as third parameter. Whenever the event
          source is dispatched more often than the specified burst within
          the specified interval it is placed in a mode similar to being
          disabled with sd_event_source_set_enabled(3) and the SD_EVENT_OFF
          parameter. However it is disabled only temporarily – once the
          specified interval is over regular operation resumes. It is again
          disabled temporarily once the specified rate limiting is hit the
          next time. If either the interval or the burst value are
          specified as zero, rate limiting is turned off. By default event
          sources do not have rate limiting enabled. Note that rate
          limiting and disabling via sd_event_source_set_enabled() are
          independent of each other, and an event source will only effect
          event loop wake-ups and is dispatched while it both is enabled
          and rate limiting is not in effect.

          sd_event_source_get_ratelimit() may be used to query the current
          rate limiting parameters set on the event source object source.
          The previously set interval and burst vales are returned in the
          second and third argument.

          sd_event_source_is_ratelimited() may be used to query whether the
          event source is currently affected by rate limiting, i.e. it has
          recently hit the rate limit and is currently temporarily disabled
          due to that.

          Rate limiting is currently implemented for I/O, timer, signal,
          defer and inotify event sources.


-----------------------------------------------------------------

::

          On success, sd_event_source_set_ratelimit() and
          sd_event_source_get_ratelimit() return a non-negative integer. On
          failure, they return a negative errno-style error code.
          sd_event_source_is_ratelimited returns zero if rate limiting is
          currently not in effect and greater than zero if it is in effect;
          it returns a negative errno-style error code on failure.

      Errors
          Returned errors may indicate the following problems:

          -EINVAL
              source is not a valid pointer to an sd_event_source object.

          -ECHILD
              The event loop has been created in a different process.

          -EDOM
              It was attempted to use the rate limiting feature on an event
              source type that does not support rate limiting.

          -ENOEXEC
              sd_event_source_get_ratelimit() was called on an event source
              that doesn't have rate limiting configured.


---------------------------------------------------

::

          These APIs are implemented as a shared library, which can be
          compiled and linked to with the libsystemd pkg-config(1) file.


---------------------------------------------------------

::

          sd-event(3), sd_event_add_io(3), sd_event_add_time(3),
          sd_event_add_signal(3), sd_event_add_inotify(3),
          sd_event_add_defer(3), sd_event_source_set_enabled(3)

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

   systemd 249                             SD_EVENT_SOURCE_SET_RATELIMIT(3)

--------------

Pages that refer to this page:
`sd-event(3) <../man3/sd-event.3.html>`__, 
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
