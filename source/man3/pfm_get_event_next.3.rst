.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

pfm_get_event_next(3) — Linux manual page
=========================================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `RETURN <#RETURN>`__ \|           |                                   |
| `ERRORS <#ERRORS>`__ \|           |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
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

          pfm_get_event_next - iterate over events


---------------------------------------------------------

::

          #include <perfmon/pfmlib.h>

          int pfm_get_event_next(int idx);


---------------------------------------------------------------

::

          Events are uniquely identified with opaque integer identifiers.
          There is no guaranteed order within identifiers. Thus, to list
          all the events, it is necessary to use iterators.

          Events are grouped in tables within the library. A table usually
          corresponds to a PMU model or family. The library contains
          support for multiple PMU models, thus it has multiple tables.
          Based on the host hardware and software environments, tables get
          activated when the library is initialized via pfm_initialize().
          Events from activated tables are called active events. Events
          from non-activated tables are called supported events.

          Event identifiers are usually retrieved via pfm_find_event() or
          when encoding events.

          To iterate over a list of events for a given PMU model, all that
          is needed is an initial identifier for the PMU. The first event
          identifier is usually obtained via pfm_get_pmu_info().

          The pfm_get_event_next() function returns the identifier of next
          supported event after the one passed in idx. This iterator stops
          when the last event for the PMU is passed as argument, in which
          case the function returns -1.

          void list_pmu_events(pfm_pmu_t pmu)
          {
             struct pfm_event_info info;
             struct pfm_pmu_info pinfo;
             int i, ret;

             memset(&info, 0, sizeof(info));
             memset(&pinfo, 0, sizeof(pinfo));

             info.size = sizeof(info);
             pinfo.size = sizeof(pinfo);

             ret = pfm_get_pmu_info(pmu, &pinfo);
             if (ret != PFM_SUCCESS)
                errx(1, "cannot get pmu info");

             for (i = pinfo.first_event; i != -1; i = pfm_get_event_next(i)) {
                ret = pfm_get_event_info(i, &info);
                if (ret != PFM_SUCCESS)
                  errx(1, "cannot get event info");

                  printf("%s Event: %s::%s\n",
                         pinfo.present ? "Active" : "Supported",
                         pinfo.name, info.name);
            }
          }


-----------------------------------------------------

::

          The function returns the identifier of the next supported event.
          It returns -1 when the argument is already the last event for the
          PMU.


-----------------------------------------------------

::

          No error code, besides -1, is returned by this function.


---------------------------------------------------------

::

          pfm_find_event(3)


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
`pfm_get_pmu_info(3) <../man3/pfm_get_pmu_info.3.html>`__

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
