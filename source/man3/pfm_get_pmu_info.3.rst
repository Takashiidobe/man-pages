.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

pfm_get_pmu_info(3) — Linux manual page
=======================================

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

          pfm_get_pmu_info - get PMU information


---------------------------------------------------------

::

          #include <perfmon/pfmlib.h>

          int pfm_get_pmu_info(pfm_pmu_t pmu, pfm_pmu_info_t *info);


---------------------------------------------------------------

::

          This function returns in info information about a PMU model
          designated by its identifier in pmu.

          The pfm_pmu_info structure is defined as follows:
          typedef struct {
                  const char              *name;
                  const char              *desc;
                  pfm_pmu_t               pmu;
                  pfm_pmu_type_t          type;
                  int                     size;
                  int                     nevents;
                  int                     first_event;
                  int                     max_encoding;
                  int                     num_cntrs;
                  int                     num_fixed_cntrs;
                  struct {
                          int             is_present:1;
                          int             is_arch_default:1;
                          int             is_core:1;
                          int             is_uncore:1;
                          int             reserved:28;
                  };
          } pfm_pmu_info_t;

          The fields of this structure are defined as follows:

          name   This is the symbolic name of the PMU. This name can be
                 used as a prefix in an event string. This is a read-only
                 string.

          desc   This is the description of PMU. This is a read-only
                 string.

          pmu    This is the unique PMU identification code. It is
                 identical to the value passed in pmu and it provided only
                 for completeness.

          type   This field contains the type of the PMU. The following
                 types are defined:

                 PFM_PMU_TYPE_UNKNOWN
                        The type of the PMU could not be determined.

                 PFM_PMU_TYPE_CORE
                        This field is set to one when the PMU is
                        implemented by the processor core.

                 PFM_PMU_TYPE_UNCORE
                        This field is set to one when the PMU is
                        implemented on the processor die but at the socket
                        level, i.e., capturing events for all cores.

          nevents
                 This is the number of available events for this PMU model
                 based on the host processor. It is only valid if the
                 is_present field is set to 1. Event identifiers are not
                 guaranteed contiguous. In other words, it is not because
                 nevents is equal to 100, that event identifiers go from 0
                 to 99. The iterator function pfm_get_event_next() must be
                 used to go from one identifier to the next.

          first_event
                 This field returns the opaque index of the first event for
                 this PMU model. The index can be used with
                 pfm_get_event_info() or pfm_get_event_next() functions.
                 In case no event is available, this field contains -1.

          num_cntrs
                 This field contains the number of generic counters
                 supported by the PMU.  A counter is generic if it can
                 count more than one event. When it is not possible to
                 determine the number of generic counters, this field
                 contains -1.

          num_fixed_cntrs
                 This field contains the number of fixed counters supported
                 by the PMU.  A counter is fixed if it hardwired to count
                 only one event. When it is not possible to determine the
                 number of generic counters, this field contains -1.

          size   This field contains the size of the struct passed. This
                 field is used to provide for extensibility of the struct
                 without compromising backward compatibility.  The value
                 should be set to sizeof(pfm_pmu_info_t). If instead, a
                 value of 0 is specified, the library assumes the struct
                 passed is identical to the first ABI version which size is
                 PFM_PMU_INFO_ABI0. Thus, if fields were added after the
                 first ABI, they will not be set by the library. The
                 library does check that bytes beyond what is implemented
                 are zeroes.

          max_encoding
                 This field returns the number of event codes returned by
                 pfm_get_event_encoding().

          is_present
                 This field is set to one is the PMU model has been
                 detected on the host system.

          is_dfl This field is set to one if the PMU is the default PMU for
                 this architecture.  Otherwise this field is zero.


-----------------------------------------------------

::

          If successful, the function returns PFM_SUCCESS and PMU
          information in info, otherwise it returns an error code.


-----------------------------------------------------

::

          PFMLIB_ERR_NOINIT
                 Library has not been initialized properly.

          PFMLIB_ERR_NOTSUPP
                 PMU model is not supported by the library.

          PFMLIB_ERR_INVAL
                 The pmu argument is invalid or info is NULL or size is not
                 zero.


---------------------------------------------------------

::

          pfm_get_event_next(3)


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

                                December, 2009                    LIBPFM(3)

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
