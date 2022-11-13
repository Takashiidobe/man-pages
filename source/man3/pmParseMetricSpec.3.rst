.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

pmparsemetricspec(3) — Linux manual page
========================================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `C SYNOPSIS <#C_SYNOPSIS>`__ \|   |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   PMPARSEMETRICSPEC(3)    Library Functions Manual    PMPARSEMETRICSPEC(3)

NAME
-------------------------------------------------

::

          pmParseMetricSpec, pmFreeMetricSpec - uniform metric
          specification parser


-------------------------------------------------------------

::

          #include <pcp/pmapi.h>

          int pmParseMetricSpec(const char *string, int isarch,
                  char *source, pmMetricSpec **rsltp, char **errmsg);
          void pmFreeMetricSpec(pmMetricSpec *rslt);

          cc ... -lpcp


---------------------------------------------------------------

::

          pmParseMetricSpec accepts a string specifying the name of a PCP
          performance metric, and optionally the source (either a hostname
          or a PCP archive log filename) and instances for that metric.
          The syntax is described in PCPIntro(1).

          If neither host nor archive component of the metric specification
          is provided, the isarch and source arguments are used to fill in
          the returned pmMetricSpec structure.

          The pmMetricSpec structure that is returned via rsltp represents
          the parsed string and has the following declaration:

              typedef struct {
                  int     isarch;      /* source type: 0 -> live host, 1 -> archive, 2 -> local context */
                  char    *source;     /* name of source host or archive */
                  char    *metric;     /* name of metric */
                  int     ninst;       /* number of instances, 0 -> all */
                  char    *inst[1];    /* array of instance names */
              } pmMetricSpec;

          pmParseMetricSpec returns 0 if the given string was successfully
          parsed.  In this case all the storage allocated by
          pmParseMetricSpec can be released by a single call to free(3)
          using the address returned from pmMetricSpec via rsltp.  The
          convenience macro pmFreeMetricSpec is a thinly disguised wrapper
          for free(3).

          pmParseMetricSpec returns PM_ERR_GENERIC and a dynamically
          allocated error message string in errmsg, if the given string
          does not parse.  Be sure to free(3) the error message string in
          this situation.

          In the case of an error, rsltp is undefined.  In the case of
          success, errmsg is undefined.  If rsltp->ninst is 0, then
          rsltp->inst[0] is undefined.


---------------------------------------------------------

::

          PMAPI(3) and pmLookupName(3).

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

   Performance Co-Pilot               PCP              PMPARSEMETRICSPEC(3)

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
