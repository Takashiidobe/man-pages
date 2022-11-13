.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

pfm_get_perf_event_encoding(3) — Linux manual page
==================================================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `RETURN <#RETURN>`__ \|           |                                   |
| `ERRORS <#ERRORS>`__ \|           |                                   |
| `AUTHOR <#AUTHOR>`__ \|           |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   LIBPFM(3)               Linux Programmer's Manual              LIBPFM(3)

NAME
-------------------------------------------------

::

          pfm_get_perf_event_encoding - encode event for perf_event API


---------------------------------------------------------

::

          #include <perfmon/pfmlib_perf_event.h>

          int pfm_get_perf_event_encoding(const char *str, int dfl_plm, struct perf_event_attr *attr, char **fstr, int *idx);


---------------------------------------------------------------

::

          This function can be used in conjunction with the perf_events
          Linux kernel API which provides access to hardware performance
          counters, kernel software counters and tracepoints.  The function
          takes an event string in str and a default privilege level mask
          in dfl_plm and fills out the relevant parts of the perf_events
          specific data structure in attr.

          This function is deprecated. It is superseded by
          pfm_get_os_event_encoding() with the OS argument set to either
          PFM_OS_PERF_EVENT or PFM_OS_PERF_EVENT_EXT.  Using this function
          provides extended support for perf_events. Certain perf_event
          configuration option are only available through this new
          interface.

          The following examples illustrates the transition:

             struct perf_event_attr attr;
             int i, count = 0;
             uint64_t *codes;

             memset(&attr, 0, sizeof(attr));

             ret = pfm_get_perf_event_encoding("RETIRED_INSTRUCTIONS", PFM_PLM3, &attrs, NULL, NULL);
             if (ret != PFM_SUCCESS)
                err(1", cannot get encoding %s", pfm_strerror(ret));

          is equivalent to:

             #include <perfmon/pfmlib_perf_event.h>
             struct perf_event_attr attr;
             pfm_perf_encode_arg_t arg;

             memset(&arg, 0, sizeof(arg));
             arg.size = sizeof(arg);
             arg.attr = &attr;

             ret = pfm_get_os_event_encoding("RETIRED_INSTRUCTIONS", PFM_PLM3, PFM_OS_PERF, &arg);
             if (ret != PFM_SUCCESS)
                err(1", cannot get encoding %s", pfm_strerror(ret));

          The dfl_plm cannot be zero, though it may not necessarily be used by the event.
          Depending on the event, combination of the following privilege levels may be used:

          PFM_PLM3
                 Measure at privilege level 3. This usually corresponds to user level. On X86, it corresponds
                 to privilege levels 3, 2, 1. Check the PMU specific man page to verify if this level
                 is supported by your PMU model.

          PFM_PLM2
                 Measure at privilege level 2. Check the PMU specific man page to verify if this level
                 is supported by your PMU model.

          PFM_PLM1
                 Measure at privilege level 1. Check the PMU specific man page to verify if this level
                 is supported by your PMU model.

          PFM_PLM0
                 Measure at privilege level 0. This usually corresponds to kernel level. Check the PMU
                 specific man page to verify if this level is supported by your PMU model.

          PFM_PLMH
                 Measure at hypervisor privilege level. This is used in conjunction with hardware virtualization.
                 Check the PMU specific man page to verify if this level is supported by your PMU model.

          If fstr is not NULL, the function will make it point to the fully qualified event string,
          i.e., a string with the event name, all unit masks set, and the value of all modifiers.
          The library will allocate memory to store the event string but it is the responsibility of the
          caller to eventually free that string using free().

          If idx is not NULL, it returns the corresponding unique event identifier.

          Only select fields are modified by the function, the others are untouched.
          The following fields in attr are modified:

          type   The type of the event

          config The encoding of the event

          exclude_user
                 Whether or not user level execution should be excluded from monitoring. The definition
                 of user is PMU model specific.

          exclude_kernel
                 Whether or not kernel level execution should be excluded from monitoring. The definition
                 of kernel is PMU model specific.

          exclude_hv
                 Whether or not hypervisor level execution should be excluded from monitoring. The definition
                 of hypervisor is PMU model specific.

          By default, if no privilege level modifier is specified in the event string, the library clears
          exclude_user, exclude_kernel and exclude_hv, resulting in the event being
          measured at all levels subject to hardware support.

          The function is able to work on only one event at a time. For convenience, it accepts
          event strings with commas. In that case, it will translate the first event up to the
          first comma. This is handy in case tools gets passed events as a comma-separated list.


-----------------------------------------------------

::

          The function returns in attr the perf_event encoding which
          corresponds to the event string. If idx is not NULL, then it will
          contain the unique event identifier upon successful return. The
          value PFM_SUCCESS is returned if successful, otherwise a negative
          error code is returned.


-----------------------------------------------------

::

          PFM_ERR_TOOSMALL
                 The code argument is too small for the encoding.

          PFM_ERR_INVAL
                 The attr argument is NULL.

          PFM_ERR_NOMEM
                 Not enough memory.

          PFM_ERR_NOTFOUND
                 Event not found.

          PFM_ERR_ATTR
                 Invalid event attribute (unit mask or modifier)

          PFM_ERR_ATTR_VAL
                 Invalid modifier value.

          PFM_ERR_ATTR_SET
                 attribute already set, cannot be changed.

          PFM_ERR_ATTR_UMASK
                 Missing unit mask.

          PFM_ERR_ATTR_FEATCOMB
                 Unit masks or features cannot be combined into a single
                 event.


-----------------------------------------------------

::

          Stephane Eranian <eranian@gmail.com>


---------------------------------------------------------

::

          pfm_get_os_event_encoding(3)

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

Pages that refer to this page: `libpfm(3) <../man3/libpfm.3.html>`__

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
