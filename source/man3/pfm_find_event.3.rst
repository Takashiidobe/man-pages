.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

pfm_find_event(3) — Linux manual page
=====================================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `RETURN <#RETURN>`__ \|           |                                   |
| `ERRORS <#ERRORS>`__ \|           |                                   |
| `AUTHOR <#AUTHOR>`__ \|           |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   LIBPFM(3)               Linux Programmer's Manual              LIBPFM(3)

NAME
-------------------------------------------------

::

          pfm_find_event - search for an event masks


---------------------------------------------------------

::

          #include <perfmon/pfmlib.h>

          int pfm_find_event(const char *str);


---------------------------------------------------------------

::

          This function is used to convert an event string passed in str
          into an opaque event identifier, i.e., the return value.

          Events are first manipulated a strings which contain the event
          name, sub-event names and optional filters and modifiers. This
          function analyzes the string and try to find the matching event.

          The event string is a structured string and it is composed as
          follows:

          [pmu_name::]event_name[:unit_mask][:modifier|:modifier=val]

          The various components are separated by : or ::, they are defined
          as follows:

          pmu_name
                 This is an optional prefix to designate a specific PMU
                 model. With the prefix the event which matches the
                 event_name is used. In case multiple PMU models are
                 activated, there may be conflict with identical event
                 names to mean the same or different things. In that case,
                 it is necessary to fully specify the event with a
                 pmu_name. That string corresponds to what is returned by
                 pfm_get_pmu_name().

          event_name
                 This is the event name and is required. The library is not
                 case sensitive on event string. The event name must match
                 completely the actual event name; it cannot be a
                 substring.

          unit_mask
                 The optional unit mask which can be considered like a sub-
                 event of the major event. If a event has unit masks, and
                 there is no default, then at least one unit mask must be
                 passed in the string. Multiple unit masks may be specified
                 for a single event.

          modifier
                 A modifier is an optional filter which is provided by the
                 hardware register hosting the event or by the underlying
                 kernel infrastructure.  Typical modifiers include
                 privilege level filters. Some modifiers are simple
                 boolean, in which case just passing their names is
                 equivalent to setting their value to true. Other modifiers
                 need a specific value, in which case it is provided after
                 the equal sign. No space is tolerate around the equal
                 sign. The list of modifiers depends on the host PMU and
                 underlying kernel API. They are documented in PMU-specific
                 documentation. Multiple modifiers may be passed. There is
                 not order between unit masks and modifiers.

          The library uses the generic term attribute to designate both
          unit masks and modifiers.

          Here are a few examples of event strings:

          amd64::RETIRED_INSTRUCTIONS:u
                 Event RETIRED_INSTRUCTION on AMD64 processor, measure at
                 user privilege level only

          RS_UOPS_DISPATCHED:c=1:i:u
                 Event RS_UOPS_DISPATCHED measured at user privilege level
                 only, and with counter-mask set to 1

          For the purpose of this function, only the pmu_name and
          event_name are considered, everything else is parsed, thus must
          be valid, but is ignored.

          The function searches only for one event per call. As a
          convenience, the function will identify the event up to the first
          comma. In other words, if str is equal to "EVENTA,EVENTB", then
          the function will only look at EVENTA and will not return an
          error because of invalid event string. This is handy when parsing
          constant event strings containing multiple, comma-separated,
          events.


-----------------------------------------------------

::

          The function returns the opaque event identifier that corresponds
          that the event string. In case of error, a negative error code is
          returned instead.


-----------------------------------------------------

::

          PFMLIB_ERR_NOINIT
                 The library has not been initialized properly.

          PFMLIB_ERR_INVAL
                 The event string is NULL.

          PFMLIB_ERR_NOMEM
                 The library ran out of memory.

          PFMLIB_ERR_NOTFOUND
                 The event was not found

          PFMLIB_ERR_ATTR
                 Invalid event attribute

          PFMLIB_ERR_ATTR_VAL
                 Invalid event attribute value

          PFMLIB_ERR_TOOMANY
                 Too many event attributes passed


-----------------------------------------------------

::

          Stephane Eranian <eranian@gmail.com>

COLOPHON
---------------------------------------------------------

::

          This page is part of the perfmon2 (a performance monitoring
          library) project.  Information about the project can be found at
          ⟨http://perfmon2.sourceforge.net/⟩.  If you have a bug report for
          this manual page, send it to
          perfmon2-devel@lists.sourceforge.net.  This page was obtained
          from the project's upstream Git repository
          ⟨git://git.code.sf.net/p/perfmon2/libpfm4 perfmon2-libpfm4⟩ on
          2021-08-27.  (At that time, the date of the most recent commit
          that was found in the repository was 2021-08-04.)  If you
          discover any rendering problems in this HTML version of the page,
          or you believe there is a better or more up-to-date source for
          the page, or you have corrections or improvements to the
          information in this COLOPHON (which is not part of the original
          manual page), send a mail to man-pages@man7.org

                                September, 2009                   LIBPFM(3)

--------------

Pages that refer to this page:
`pfm_get_event_next(3) <../man3/pfm_get_event_next.3.html>`__

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
