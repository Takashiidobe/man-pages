.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

pfm_get_event_info(3) — Linux manual page
=========================================

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

          pfm_get_event_info - get event information


---------------------------------------------------------

::

          #include <perfmon/pfmlib.h>

          int pfm_get_event_info(int idx, pfm_os_t os, pfm_event_info_t *info);


---------------------------------------------------------------

::

          This function returns in info information about a specific event
          designated by its opaque unique identifier in idx for the
          operating system specified in os.

          The pfm_event_info_t structure is defined as follows:
          typedef struct {
                  const char              *name;
                  const char              *desc;
                  const char              *equiv;
                  size_t           size;
                  uint64_t                code;
                  pfm_pmu_t               pmu;
                  pfm_dtype_t             dtype
                  int                     idx;
                  int                     nattrs;
                  struct {
                    unsigned int is_precise:1;
                    unsigned int reserved_bits:31;
                  };
          } pfm_event_info_t;

          The fields of this structure are defined as follows:

          name   This is the name of the event. This is a read-only string.

          desc   This is the description of the event. This is a read-only
                 string. It may contain multiple sentences.

          equiv  Certain events may be just variations of actual events.
                 They may be provided as handy shortcuts to avoid supplying
                 a long list of attributes. For those events, this field is
                 not NULL and contains the complete equivalent event
                 string.

          code   This is the raw event code. It should not be confused with
                 the encoding of the event. This field represents only the
                 event selection code, it does not include any unit mask or
                 attribute settings.

          pmu    This is the identification of the PMU model this event
                 belongs to. It is of type pfm_pmu_t. Using this value and
                 the pfm_get_pmu_info function, it is possible to get PMU
                 information.

          dtype  This field returns the representation of the event data.
                 By default, it is PFM_DATA_UINT64.

                 idx This is the event unique opaque identifier. It is
                 identical to the idx passed to the call and is provided
                 for completeness.

          nattrs This is the number of attributes supported by this event.
                 Attributes may be unit masks or modifiers. If the event
                 has not attribute, then the value of this field is simply
                 0.

          size   This field contains the size of the struct passed. This
                 field is used to provide for extensibility of the struct
                 without compromising backward compatibility.  The value
                 should be set to sizeof(pfm_event_info_t). If instead, a
                 value of 0 is specified, the library assumes the struct
                 passed is identical to the first ABI version which size is
                 PFM_EVENT_INFO_ABI0. Thus, if fields were added after the
                 first ABI, they will not be set by the library. The
                 library does check that bytes beyond what is implemented
                 are zeroes.

          is_precise
                 This bitfield indicates whether or not the event support
                 precise sampling.  Precise sampling is a hardware
                 mechanism that avoids instruction address skid when using
                 interrupt-based sampling. When the event has umasks, this
                 field means that at least one umask supports precise
                 sampling. On Intel X86 processors, this indicates whether
                 the event supports Precise Event-Based Sampling (PEBS).

          is_speculative
                 This bitfield indicates whether or not the event includes
                 occurrences happening during speculative execution for
                 both wrong and correct path. Given that this kind of event
                 information is not always available from vendors, this
                 field uses multiple bits. A value of
                 PFM_EVENT_INFO_SPEC_NA indicates that speculation
                 information is not available. A value of
                 PFM_EVENT_INFO_SPEC_TRUE indicates that the event count
                 during speculative execution. A value of
                 PFM_EVENT_INFO_SPEC_FALS indicates that the event does not
                 count during speculative execution.

          The pfm_os_t enumeration provides the following choices:

          PFM_OS_NONE
                 The returned information pertains only to what the PMU
                 hardware exports.  No operating system attributes is taken
                 into account.

          PFM_OS_PERF_EVENT
                 The returned information includes the actual PMU hardware
                 and the additional attributes exported by the perf_events
                 kernel interface.  The perf_event attributes pertain only
                 the PMU hardware.  In case perf_events is not detected, an
                 error is returned.

          PFM_OS_PERF_EVENT_EXT
                 The returned information includes all of what is already
                 provided by PFM_OS_PERF_EVENT plus all the software
                 attributes controlled by perf_events, such as sampling
                 period, precise sampling.


-----------------------------------------------------

::

          If successful, the function returns PFM_SUCCESS and event
          information in info, otherwise it returns an error code.


-----------------------------------------------------

::

          PFMLIB_ERR_NOINIT
                 Library has not been initialized properly.

          PFMLIB_ERR_INVAL
                 The idx argument is invalid or info is NULL or size is not
                 zero.

          PFMLIB_ERR_NOTSUPP
                 The requested os is not detected or supported.


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
