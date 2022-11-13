.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

pfm_get_event_attr_info(3) — Linux manual page
==============================================

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

          pfm_get_event_attr_info - get event attribute information


---------------------------------------------------------

::

          #include <perfmon/pfmlib.h>

          int pfm_get_event_attr_info(int idx, int attr, pfm_os_t os, pfm_event_attr_info_t *info);


---------------------------------------------------------------

::

          This function returns in info information about the attribute
          designated by attr for the event specified in idx and the os
          layer in os.

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

          The pfm_event_attr_info_t structure is defined as follows:
          typedef struct {
                  const char              *name;
                  const char              *desc;
                  const char              *equiv;
                  size_t           size;
                  uint64_t                code;
                  pfm_attr_t              type;
                  int                     idx;
                  pfm_attr_ctrl_t         ctrl;
                  int                     reserved1;
                  struct {
                          int             is_dfl:1;
                          int             is_precise:1;
                          int             is_speculative:2;
                          int             reserved:28;
                  };
                  union {
                          uint64_t        dfl_val64;
                          const char      *dfl_str;
                          int             dfl_bool;
                          int             dfl_int;
                  };
          } pfm_event_attr_info_t;

          The fields of this structure are defined as follows:

          name   This is the name of the attribute. This is a read-only
                 string.

          desc   This is the description of the attribute. This is a read-
                 only string.  It may contain multiple sentences.

          equiv  Certain attributes may be just variations of other
                 attributes for the same event.  They may be provided as
                 handy shortcuts to avoid supplying a long list of
                 attributes.  For those attributes, this field is not NULL
                 and contains the complete equivalent attribute string.
                 This string, once appended to the event name, may be used
                 library calls requiring an event string.

          code   This is the raw attribute code. For PFM_ATTR_UMASK, this
                 is the unit mask code. For all other attributes, this is
                 an opaque index.

          type   This is the type of the attribute. Attributes represent
                 either sub-events or extra filters that can be applied to
                 the event. Filters (also called modifiers)  may be tied to
                 the event or the PMU register the event is programmed
                 into. The type of an attribute determines how it must be
                 specified. The following types are defined:

                 PFM_ATTR_UMASK
                        This is a unit mask, i.e., a sub-event. It is
                        specified using its name.  Depending on the event,
                        it may be possible to specify multiple unit masks.

                 PFM_ATTR_MOD_BOOL
                        This is a boolean attribute. It has a value of 0,
                        1, y or n. The value is specified after the equal
                        sign, e.g., foo=1. As a convenience, the equal sign
                        and value may be omitted, in which case this is
                        equivalent to =1.

                 PFM_ATTR_MOD_INTEGER
                        This is an integer attribute. It has a value which
                        must be passed after the equal sign. The range of
                        valid values depends on the attribute and is
                        usually specified in its description.

          idx    This is the attribute index. It is identical to the value
                 of attr passed to the call and is provided for
                 completeness.

          size   This field contains the size of the struct passed. This
                 field is used to provide for extensibility of the struct
                 without compromising backward compatibility.  The value
                 should be set to sizeof(pfm_event_attr_info_t). If
                 instead, a value of 0 is specified, the library assumes
                 the struct passed is identical to the first ABI version
                 which size is PFM_ATTR_INFO_ABI0. Thus, if fields were
                 added after the first ABI, they will not be set by the
                 library. The library does check that bytes beyond what is
                 implemented are zeroes.

          is_dfl This field indicates whether or not this attribute is set
                 by default. This applies mostly for PFM_ATTR_UMASK. If a
                 unit mask is marked as default, and no unit mask is
                 specified in the event string, then the library uses it by
                 default. Note that there may be multiple defaults per
                 event depending on how unit masks are grouped.

          is_precise
                 This field indicates whether or not this umask supports
                 precise sampling.  Precise sampling is a hardware
                 mechanism that avoids instruction address skid when using
                 interrupt-based sampling. On Intel X86 processors, this
                 field indicates that the umask supports Precise Event-
                 Based Sampling (PEBS).

          is_speculative
                 This bitfield indicates whether or not the attribute
                 includes occurrences happening during speculative
                 execution for both wrong and correct paths. Given that
                 this kind of event information is not always available
                 from vendors, this field uses multiple bits. A value of
                 PFM_EVENT_INFO_SPEC_NA indicates that speculation
                 information is not available. A value of
                 PFM_EVENT_INFO_SPEC_TRUE indicates that the attribute
                 counts during speculative execution. A value of
                 PFM_EVENT_INFO_SPEC_FALSE indicates that the attribute
                 does not count during speculative execution.

          dfl_val64, dfl_str, dfl_bool, dfl_int
                 This union contains the value of an attribute. For
                 PFM_ATTR_UMASK, the is the unit mask code, for all other
                 types this is the actual value of the attribute.

          ctrl   This field indicates which layer or source controls the
                 attribute.  The following sources are defined:

                 PFM_ATTR_CTRL_UNKNOWN
                        The source controlling the attribute is not known.

                 PFM_ATTR_CTRL_PMU
                        The attribute is controlled by the PMU hardware.

                 PFM_ATTR_CTRL_PERF_EVENT
                        The attribute is controlled by the perf_events
                        kernel interface.

          reserved
                 These fields must be set to zero.


-----------------------------------------------------

::

          If successful, the function returns PFM_SUCCESS and attribute
          information in info, otherwise it returns an error code.


-----------------------------------------------------

::

          PFMLIB_ERR_NOINIT
                 Library has not been initialized properly.

          PFMLIB_ERR_INVAL
                 The idx or attr arguments are invalid or info is NULL or
                 size is not zero.

          PFM_ERR_NOTSUPP
                 The requested os layer has not been detected on the host
                 system.


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
