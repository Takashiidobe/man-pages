.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

pfm_get_os_event_encoding(3) — Linux manual page
================================================

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

          pfm_get_os_event_encoding - get event encoding for a specific
          operating system


---------------------------------------------------------

::

          #include <perfmon/pfmlib.h>

          int pfm_get_os_event_encoding(const char *str, int dfl_plm, pfm_os_t os,  void *arg);


---------------------------------------------------------------

::

          This is the key function to retrieve the encoding of an event for
          a specific operating system interface. The event string passed in
          str is parsed and encoded for the operating system specified by
          os. Only one event per call can be encoded. As such, str can
          contain only one symbolic event name. The event is encoded to
          monitor at the privilege levels specified by the dfl_plm mask, if
          supported, otherwise this parameter is ignored. The operating
          system specific input and output arguments are passed in arg.

          The event string, str, may contains sub-event masks (umask) and
          any other supported modifiers. Only one event is parsed from the
          string. For convenience, it is possible to pass a comma-separated
          list of events in str but only the first event is encoded.

          The following values are supported for os:

          PFM_OS_NONE
                 This value causes the event to be encoded purely as
                 specified by the PMU hardware. The arg argument must be a
                 pointer to a pfm_pmu_encode_arg_t structure which is
                 defined as follows:

                 typedef struct {
                     uint64_t    *codes;
                     char        **fstr;
                     size_t      size;
                     int         count;
                     int         idx;
                 } pfm_pmu_encode_arg_t;

                 The fields are defined as follows:

                 codes  A pointer to an array of 64-bit values. On input,
                        if codes is NULL, then the library allocates
                        whatever is necessary to store the encoding of the
                        event. If codes is not NULL on input, then count
                        must reflect its actual number of elements. If
                        count is big enough, the library stores the
                        encoding at the address provided.  Otherwise, an
                        error is returned.

                 count  On input, the field contains the maximum number of
                        elements in the array codes. Upon return, it
                        contains the number of actual entries in codes. If
                        codes is NULL, then count must be zero.

                 fstr   If the caller is interested in retrieving the fully
                        qualified event string where all used unit masks
                        and all modifiers are spelled out, this field must
                        be set to a non-null address of a pointer to a
                        string (char **).  Upon return, if fstr was not
                        NULL, then the string pointer passed on entry
                        points to the event string. The string is
                        dynamically allocated and must eventually be freed
                        by the caller. If fstr was NULL on entry, then
                        nothing is returned in this field. The typical
                        calling sequence looks as follows:
                           char *fstr = NULL
                           pfm_pmu_encode_arg_t arg;
                           arg.fstr = &fstr;
                           ret = pfm_get_os_event_encoding("event",
                                                           PFM_PLM0|PFM_PLM3,
                                                           PFM_OS_NONE,
                                                           &e);
                           if (ret == PFM_SUCCESS) {
                              printf("fstr=%s\n", fstr);
                              free(fstr);
                           }

                 size   This field contains the size of the struct passed.
                        This field is used to provide for extensibility of
                        the struct without compromising backward
                        compatibility.  The value should be set to
                        sizeof(pfm_pmu_encode_arg_t). If instead, a value
                        of 0 is specified, the library assumes the struct
                        passed is identical to the first ABI version which
                        size is PFM_RAW_ENCODE_ABI0. Thus, if fields were
                        added after the first ABI, they will not be set by
                        the library. The library does check that bytes
                        beyond what is implemented are zeroes.

                 idx    Upon return, this field contains the opaque unique
                        identifier for the event described in str.  This
                        index can be used to retrieve information about the
                        event using pfm_get_event_info(), for instance.

          PFM_OS_PERF_EVENT, PFM_OS_PERF_EVENT_EXT
                 This value causes the event to be encoded for the
                 perf_event Linux kernel interface (available since
                 2.6.31).  The arg must be a pointer to a
                 pfm_perf_encode_arg_t structure. The PFM_OS_PERF_EVENT
                 layer provides the modifiers exported by the underlying
                 PMU hardware, some of which may actually be overridden by
                 the perf_event interface, such as the monitoring privilege
                 levels. The PFM_OS_PERF_EVENT_EXT extends
                 PFM_OS_PERF_EVENT to add modifiers controlled only by the
                 perf_event interface, such as sampling period (period),
                 frequency (freq) and exclusive resource access (excl).

                 typedef struct {
                     struct perf_event_attr *attr;
                     char **fstr;
                     size_t size;
                     int idx;
                     int cpu;
                     int flags;
                 } pfm_perf_encode_arg_t;
                 The fields are defined as follows:

                 attr   A pointer to a struct perf_event_attr as defined in
                        perf_event.h. This field cannot be NULL on entry.
                        The struct is not completely overwritten by the
                        call. The library only modifies the fields it knows
                        about, thereby allowing perf_event ABI mismatch
                        between caller and library.

                 fstr   Same behavior as is described for PFM_OS_NONE
                        above.

                 size   This field contains the size of the struct passed.
                        This field is used to provide for extensibility of
                        the struct without compromising backward
                        compatibility.  The value should be set to
                        sizeof(pfm_perf_encode_arg_t). If instead, a value
                        of 0 is specified, the library assumes the struct
                        passed is identical to the first ABI version which
                        size is PFM_PERF_ENCODE_ABI0. Thus, if fields were
                        added after the first ABI, they will not be set by
                        the library. The library does check that bytes
                        beyond what is implemented are zeroes.

                 idx    Upon return, this field contains the opaque unique
                        identifier for the event described in str.  This
                        index can be used to retrieve information about the
                        event using pfm_get_event_info(), for instance.

                 cpu    Not used yet.

                 flags  Not used yet.

          Here is a example of how this function could be used with
          PFM_OS_NONE:
          #include <inttypes.h>
          #include <err.h>
          #include <perfmon/pfmlib.h>
          int main(int argc, char **argv)
          {
             pfm_pmu_encode_t arg;
             int ret;

             ret = pfm_initialize();
             if (ret != PFMLIB_SUCCESS)
                errx(1, "cannot initialize library %s", pfm_strerror(ret));

             memset(&arg, 0, sizeof(arg));

             ret = pfm_get_os_event_encoding("RETIRED_INSTRUCTIONS", PFM_PLM3, PFM_OS_NONE, &arg);
             if (ret != PFM_SUCCESS)
                err(1", cannot get encoding %s", pfm_strerror(ret));

             for(i=0; i < arg.count; i++)
                printf("count[%d]=0x%"PRIx64"\n", i, arg.codes[i]);

             free(arg.codes);
             return 0;
          }


-----------------------------------------------------

::

          The function returns in arg the encoding of the event for the os
          passed in os. The content of arg depends on the os argument. Upon
          success, PFM_SUCCESS is returned otherwise a specific error code
          is returned.


-----------------------------------------------------

::

          PFM_ERR_TOOSMALL
                 The code argument is too small for the encoding.

          PFM_ERR_INVAL
                 The code or count argument is NULL or the str contains
                 more than one symbolic event.

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

                                 January, 2011                    LIBPFM(3)

--------------

Pages that refer to this page:
`pfm_get_event_encoding(3) <../man3/pfm_get_event_encoding.3.html>`__, 
`pfm_get_perf_event_encoding(3) <../man3/pfm_get_perf_event_encoding.3.html>`__

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
