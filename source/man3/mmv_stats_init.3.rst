.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

mmv_stats_init(3) — Linux manual page
=====================================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `C SYNOPSIS <#C_SYNOPSIS>`__ \|   |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `                                 |                                   |
| RETURN VALUES <#RETURN_VALUES>`__ |                                   |
| \| `SEE ALSO <#SEE_ALSO>`__ \|    |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   MMV_STATS_INIT(3)       Library Functions Manual       MMV_STATS_INIT(3)

NAME
-------------------------------------------------

::

          mmv_stats_init, mmv_stats2_init - create and initialize Memory
          Mapped Value file


-------------------------------------------------------------

::

          #include <pcp/pmapi.h>
          #include <pcp/mmv_stats.h>

          void *mmv_stats_init(const char *name, int cluster,
                  mmv_stats_flags_t flags, const mmv_metric_t *stats,
                  int nstats, mmv_indom_t *indoms, int nindoms);
          void *mmv_stats2_init(const char *name, int cluster,
                  mmv_stats_flags_t flags, const mmv_metric2_t *stats2,
                  int nstats2, mmv_indom2_t *indoms2, int nindoms2);

          cc ... -lpcp_mmv -lpcp


---------------------------------------------------------------

::

          Note: these functions are deprecated - see mmv_stats_registry(3).

          mmv_stats_init creates and initializes the content of the MMV(5)
          file, returning a handle that is used in subsequent MMV API
          calls.

          mmv_stats2_init is equivalent to mmv_stats_init except that it
          provides an option for longer metric and instance names.

          mmv_stats_stop performs an orderly shutdown of the mapping handle
          returned by an earlier initialization call.

          The file is created in the $PCP_TMP_DIR/mmv directory, name
          argument is expected to be a basename of the file, not the full
          path.  The metadata content of the file does not change after the
          file has been created.

          The old file is removed unconditionally unless there was an
          error.

          cluster is the preferred MMV PMDA cluster ID to be used for the
          metrics originating from this call to mmv_stats_init.  The flags
          provide additional control over the behaviour of the MMV PMDA -
          e.g. use of MMV_FLAG_PROCESS will ensure values are only exported
          when the instrumented application is running - this is verified
          on each request for new values.

          stats is the array of mmv_metric_t elements of length nstats.
          Each element of the array describes one PCP metric.

                  typedef struct {
                      char name[MMV_NAMEMAX];     /* Name of the metric */
                      __uint32_t item;            /* Item component of PMID */
                      mmv_metric_type_t type;     /* Type of the metric */
                      mmv_metric_sem_t semantics; /* Semantics of the metric */
                      pmUnits dimension;          /* Dimensions (TIME,SPACE,etc) */
                      __uint32_t indom;           /* Instance domain identifier */
                      char *shorttext;            /* Optional, one-line help */
                      char *helptext;             /* Optional, full help text */
                  } mmv_metric_t;

          stats2 is the array of mmv_metric2_t elements of length nstats2.
          Each element of the array describes one PCP metric, the only
          difference to stats is the lifting of the restriction on name
          length (previously MMV_NAMEMAX, which is 64 bytes).

                  typedef struct {
                      char *name;                 /* Name of the metric */
                      __uint32_t item;            /* Item component of PMID */
                      mmv_metric_type_t type;     /* Type of the metric */
                      mmv_metric_sem_t semantics; /* Semantics of the metric */
                      pmUnits dimension;          /* Dimensions (TIME,SPACE,etc) */
                      __uint32_t indom;           /* Instance domain identifier */
                      char *shorttext;            /* Optional, one-line help */
                      char *helptext;             /* Optional, full help text */
                  } mmv_metric2_t;

          If indom is not zero and not PM_INDOM_NULL, then the metric has
          multiple values and there must be a corresponding indom entry in
          the indom list (uniquely identified by serial number).

          The stats and stats2 arrays cannot contain any elements which
          have no name - this is considered an error and no metrics will be
          exported in this case.

          indoms is the array of mmv_indom_t elements of length nindoms.
          Each element of the array describes one PCP instance domain.

                  typedef struct {
                      __int32_t internal;
                      char external[MMV_NAMEMAX];
                  } mmv_instances_t;

                  typedef struct {
                      __uint32_t serial;           /* Unique serial number */
                      __uint32_t count;            /* Number of instances */
                      mmv_instances_t *instances;  /* Internal/external IDs */
                      char *shorttext;             /* Short help text */
                      char *helptext;              /* Long help text */
                  } mmv_indom_t;

          indoms2 is the array of mmv_indom2_t elements of length nindoms2.
          Each element of the array describes one PCP instance domain, and
          the only difference to indoms is the lifting of the restriction
          on external instance name lengths (previously MMV_NAMEMAX, which
          is 64 bytes).

                  typedef struct {
                      __int32_t internal;
                      char *external;
                  } mmv_instances2_t;

                  typedef struct {
                      __uint32_t serial;           /* Unique serial number */
                      __uint32_t count;            /* Number of instances */
                      mmv_instances2_t *instances; /* Internal/external IDs */
                      char *shorttext;             /* Short help text */
                      char *helptext;              /* Long help text */
                  } mmv_indom2_t;


-------------------------------------------------------------------

::

          These functions return the address of the memory mapped region on
          success.  On failure, NULL is returned and errno is set to a
          value suitable for decoding with strerror(3).


---------------------------------------------------------

::

          mmv_stats_registry(3), mmv_lookup_value_desc(3),
          mmv_inc_value(3), strerror(3) and mmv(5).

COLOPHON
---------------------------------------------------------

::

          This page is part of the PCP (Performance Co-Pilot) project.
          Information about the project can be found at 
          ⟨http://www.pcp.io/⟩.  If you have a bug report for this manual
          page, send it to pcp@groups.io.  This page was obtained from the
          project's upstream Git repository
          ⟨https://github.com/performancecopilot/pcp.git⟩ on 2021-08-27.
          (At that time, the date of the most recent commit that was found
          in the repository was 2021-08-27.)  If you discover any rendering
          problems in this HTML version of the page, or you believe there
          is a better or more up-to-date source for the page, or you have
          corrections or improvements to the information in this COLOPHON
          (which is not part of the original manual page), send a mail to
          man-pages@man7.org

   Performance Co-Pilot                                   MMV_STATS_INIT(3)

--------------

Pages that refer to this page: `pmdammv(1) <../man1/pmdammv.1.html>`__, 
`mmv_inc_value(3) <../man3/mmv_inc_value.3.html>`__, 
`mmv_lookup_value_desc(3) <../man3/mmv_lookup_value_desc.3.html>`__, 
`mmv(5) <../man5/mmv.5.html>`__

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
