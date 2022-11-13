.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

pmjsonget(3) — Linux manual page
================================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `C SYNOPSIS <#C_SYNOPSIS>`__ \|   |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `EXAMPLE <#EXAMPLE>`__ \|         |                                   |
| `RETURN CODE <#RETURN_CODE>`__ \| |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   PMJSONGET(3)            Library Functions Manual            PMJSONGET(3)

NAME
-------------------------------------------------

::

          pmjsonGet, pmjsonPrint, pmjsonInit, pmjsonInitIndom - JSON string
          helpers and metrics extraction


-------------------------------------------------------------

::

          #include <pcp/pmapi.h>
          #include <pcp/pmjson.h>

          typedef int (*json_get)(void *buffer, int length, void *data);
          int pmjsonGet(json_metric_desc *json_metrics, int nmetrics,
                  pmInDom indom, json_get callback, void *data);
          int pmjsonPrint(FILE *fp, json_flag *output_flags, const char
                  *json_pointer, json_get callback, void *data);

          int pmjsonInit(int fd, json_metric_desc *json_metrics, int
                  nmetrics);
          int pmjsonInitIndom(int fd, json_metric_desc *json_metrics, int
                  nmetrics, pmInDom indom);

          cc ... -lpcp_web


---------------------------------------------------------------

::

          pmjsonGet performs metric value extraction from JSON strings for
          a Performance Metric Domain Agent (PMDA(3)).  Metrics and
          instances are defined by the json_metrics parameter.  The result
          of parsing is the extraction of values for the requested metrics
          (as defined in the json_pointer field) in the values field.

          A simple diagnostic utility for reporting JSON strings iss
          provided as a convenience as well.  Its output_flags argument
          allows it to support a variety of alternate output formats,
          including minimal JSON (no optional whitespace), pretty-printed,
          and a simple YAML subset.

          json_metrics is the array of json_metric_desc struct which
          contains the json pointer to the metric data, possible flags to
          check the data against, number of values (in the case of an
          array), pmAtomValue where the data is stored, as well as the
          instance domain in the event the PMDA has multiple instance
          domains.  The number of elements in the json_metrics array is
          indicated by the nmetrics parameter.

          Interfaces for common cases are provided - pmjsonInit specifies a
          call to the JSON parsing and metric value extraction
          functionality where there are no instance domains (or the PMDA
          wishes to perform instance domain operations itself) and where
          data can be read directly from an open file descriptor.
          pmjsonInitIndom is similar, but makes use of the pmdaCacheAdd(3)
          function where possible.

          The JSON string must be provided by the callback function.  This
          function is passed a memory buffer of length bytes and an opaque
          user data pointer which is unchanged from the original call to
          pmjsonGet or pmjsonPrint.  The returned result must be the number
          of bytes written into buffer, zero when no more data is available
          or less than zero on error conditions.

          indom is the instance domain to be passed to pmdaCacheAdd.

               typedef struct json_metrics_desc {
                   char          *json_pointer;  /* json pointer to metric */
                   int           flags;          /* flags to check if set */
                   int           num_values;     /* number of values */
                   pmAtomValue   values;         /* metric value */
                   char          *dom;           /* instance domain */
               } json_metric_desc;

          The JSON Pointer syntax current follows RFC6901 in specifying a
          metrics location within the JSON document.


-------------------------------------------------------

::

          For the sample JSON document:

          {
              "Name": "/clever_almeida",
              "State": {
                  "Dead": false,
                  "Error": "",
                  "ExitCode": 0,
                  "FinishedAt": "2016-07-18T21:21:20.332488706Z",
                  "OOMKilled": false,
                  "Paused": false,
                  "Pid": 0,
                  "Restarting": false,
                  "Running": false,
                  "StartedAt": "2016-07-18T14:10:58.52487316Z"
              }
          }

          A possible corresponding json_metric array would be as follows
          for the Pid, Name, and metrics to indicate whether the container
          is Running, Paused, or Restarting.

          static json_metric_desc json_metrics[] = {
              { "State/Pid", 0, 1, {0}, ""},
              { "Name", 0, 1, {0}, ""},
              { "State/Running", CONTAINER_FLAG_RUNNING, 1, {0}, ""},
              { "State/Paused", CONTAINER_FLAG_PAUSED, 1, {0}, ""},
              { "State/Restarting", CONTAINER_FLAG_RESTARTING, 1, {0}, ""},
          };


---------------------------------------------------------------

::

          The functions return zero on success, otherwise an error code
          suitable for passing to pmErrStr_r(3) is returned.


---------------------------------------------------------

::

          PMDA(3), pmErrStr_r(3), pmdaCacheAdd(3), http://json.org/ ,
          https://tools.ietf.org/html/rfc7159 , and
          https://tools.ietf.org/html/rfc6901 .

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

   Performance Co-Pilot               PCP                      PMJSONGET(3)

--------------

Pages that refer to this page:
`pmhttpnewclient(3) <../man3/pmhttpnewclient.3.html>`__

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
