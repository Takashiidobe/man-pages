.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

mmv_stats_registry(3) — Linux manual page
=========================================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `C SYNOPSIS <#C_SYNOPSIS>`__ \|   |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `ADD METRICS <#ADD_METRICS>`__ \| |                                   |
| `ADD INDOMS <#ADD_INDOMS>`__ \|   |                                   |
| `                                 |                                   |
| ADD INSTANCES <#ADD_INSTANCES>`__ |                                   |
| \| `ADD LABELS <#ADD_LABELS>`__   |                                   |
| \|                                |                                   |
| `                                 |                                   |
| RETURN VALUES <#RETURN_VALUES>`__ |                                   |
| \| `SEE ALSO <#SEE_ALSO>`__ \|    |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   MMV_STATS_REGISTRY(3)   Library Functions Manual   MMV_STATS_REGISTRY(3)

NAME
-------------------------------------------------

::

          mmv_stats_registry, mmv_stats_start, mmv_stats_stop - Initialize
          the Memory Mapped Value file


-------------------------------------------------------------

::

          #include <pcp/pmapi.h>
          #include <pcp/mmv_stats.h>

          mmv_registry_t *mmv_stats_registry(const char *file, int cluster,
                                              mmv_stats_flags_t flags);

          void *mmv_stats_start(mmv_registry_t *registry);
          void  mmv_stats_stop(const char *fname, void *addr);

          cc ... -lpcp_mmv -lpcp


---------------------------------------------------------------

::

          mmv_stats_registry initializes an opaque structure that defines
          various aspects of a memory mapped file.  This file is used for
          lightweight interprocess communication between an instrumented
          application and pmdammv(1).

          The mmv_stats_registry interface is used to allocate a registry,
          and allows the name of the MMV(5) file, the cluster identifier
          and the flags (if any) to be set.  It returns a handle that is
          used in subsequent MMV API calls when adding metrics, indoms,
          instances and labels to the registry - before actually creating
          the file.

          mmv_stats_start is the call that creates the MMV(5) file with the
          handle that returns mmv_stats_registry.  It returns the mapped
          memory handle used in subsequent MMV API calls, such as
          mmv_inc_value(3).

          mmv_stats_stop performs an orderly shutdown of the mapping handle
          returned by an earlier initialization call and also frees the
          registry structure.

          The combination of mmv_stats_registry and mmv_stats_start do the
          same as the deprecated calls mmv_stats(2)_init.  However, now,
          one should first call mmv_stats_registry and then the API calls
          that add instances, indoms, metrics and labels.  In this way,
          there is no need to know in advance which version of the
          MMV(1|2|3) mapping will be used as it is calculated
          automatically.

          The file is created in the $PCP_TMP_DIR/mmv directory, the name
          argument is expected to be a basename of the file, not the full
          path.  The metadata content of the file does not change after the
          file has been created.

          The old file is removed unconditionally unless there was an
          error.

          cluster is the preferred MMV PMDA cluster ID to be used for the
          metrics the originates the call mmv_stats_start.  The flags
          provide additional control over the behaviour of the MMV PMDA -
          e.g. use of MMV_FLAG_PROCESS will ensure values are only exported
          when the instrumented application is running - this is verified
          on each request for new values.

          The next sections explain how to add metrics, indoms, instances
          and labels.


---------------------------------------------------------------

::

          int mmv_stats_add_metric(mmv_registry_t *registry,
          const char *name, int item,
                                  mmv_metric_type_t type, mmv_metric_sem_t
          sem, pmUnits units,
                                  int serial, const char *shorthelp,
          const char *longhelp);

          When adding a metric, internally it is being handled using the
          next struct.  sem match in the struct is semantics. units match
          in the struct is dimension. serial match in the struct is indom.

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


-------------------------------------------------------------

::

          int mmv_stats_add_indom(mmv_registry_t *registry, int serial,
                                  const char *shorthelp,
          const char *longhelp);

          When adding an indom, internally it is being handled using the
          next struct.

                  typedef struct {
                      __uint32_t serial;           /* Unique serial number */
                      __uint32_t count;            /* Number of instances */
                      mmv_instances2_t *instances; /* Internal/external IDs */
                      char *shorttext;             /* Short help text */
                      char *helptext;              /* Long help text */
                  } mmv_indom2_t;


-------------------------------------------------------------------

::

          int mmv_stats_add_instance(mmv_registry_t *registry, int serial,
                                     int instid, const char *instname);

          When adding an instance, internally it is being handled using the
          next struct.  instid match in the struct is internal while
          instname is external.

                  typedef struct {
                      __int32_t internal;
                      char *external;
                  } mmv_instances2_t;

          It is worth mentioning that if the indom of the instance is not
          found it returns an error.


-------------------------------------------------------------

::

          int mmv_stats_add_registry_label(mmv_registry_t *registry,
                                           const char *name, const char
          *value,
                                           mmv_value_type_t type, int
          optional);

          int mmv_stats_add_indom_label(mmv_registry_t *registry, int
                  serial,
                                        const char *name, const char
                  *value,
                                        mmv_value_type_t type, int
                  optional);

          int mmv_stats_add_metric_label(mmv_registry_t *registry, int
                  item,
                                         const char *name, const char
                  *value,
                                         mmv_value_type_t type, int
                  optional);

          int mmv_stats_add_instance_label(mmv_registry_t *registry, int
                  serial,
                                           int instid, const char *name,
                  const char *value,
                                           mmv_value_type_t type, int
                  optional);

          registry is the handle obtained from mmv_stats_registry. name and
                  value are the strings that will form the label.

          type specifies the value type that can be: MMV_STRING_TYPE,
          MMV_NUMBER_TYPE, MMV_BOOLEAN_TYPE, MMV_NULL_TYPE, MMV_ARRAY_TYPE
          and MMV_MAP_TYPE.

          At the moment there is a simple check of the correctness of the
          value.  After adding a label, it is called a function to verify
          if it is correct.

          Additionally, if optional is set, it is added the flag
          PM_LABEL_OPTIONAL.

          serial is the serial of the indom when adding an indom or
          instance label.  item is the metric identifier when adding a
          metric label. Finally, when adding a registry label it is not
          necessary to give the cluster id because it will be taken from
          the internal registry struct already created.

          mmv_stats_add_registry_label adds a PM_LABEL_CLUSTER.

          mmv_stats_add_indom_label adds a PM_LABEL_INDOM.

          mmv_stats_add_metric_label adds a PM_LABEL_ITEM.

          mmv_stats_add_instance_label adds a PM_LABEL_INSTANCES.


-------------------------------------------------------------------

::

           When adding metrics, indoms, instances and labels, if correct
          returns 0
           and if not it returns an errno code. The other functions return
          the address
           of the memory mapped region on success. On failure, NULL is
          returned and
           errno is set to a value suitable for decoding with strerror(3).


---------------------------------------------------------

::

          mmv_inc_value(3), mmv_lookup_value_desc(3), strerror(3) and
          mmv(5).

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

   Performance Co-Pilot                               MMV_STATS_REGISTRY(3)

--------------

Pages that refer to this page:
`mmv_stats_init(3) <../man3/mmv_stats_init.3.html>`__, 
`pmdiscoversetup(3) <../man3/pmdiscoversetup.3.html>`__, 
`pmsearchsetup(3) <../man3/pmsearchsetup.3.html>`__, 
`pmseriessetup(3) <../man3/pmseriessetup.3.html>`__, 
`pmwebtimerregister(3) <../man3/pmwebtimerregister.3.html>`__

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
