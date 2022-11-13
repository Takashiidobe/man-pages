.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

pmspeclocalpmda(3) — Linux manual page
======================================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `C SYNOPSIS <#C_SYNOPSIS>`__ \|   |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `RETURN VALUE <#RETURN_VALUE>`__  |                                   |
| \| `EXAMPLES <#EXAMPLES>`__ \|    |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   PMSPECLOCALPMDA(3)      Library Functions Manual      PMSPECLOCALPMDA(3)

NAME
-------------------------------------------------

::

          pmSpecLocalPMDA - process command-line argument for the table of
          DSO PMDAs


-------------------------------------------------------------

::

          #include "pmapi.h"
          #include "libpcp.h"

          char *pmSpecLocalPMDA(const char *spec);

          cc ... -lpcp


---------------------------------------------------------------

::

          For Performance Co-Pilot (PCP) applications, contexts of type
          PM_CONTEXT_LOCAL are used by clients that wish to fetch metrics
          directly from one or more PMDAs on the local host without
          involving pmcd(1).

          pmSpecLocalPMDA provides a convenience wrapper to be used by
          applications that wish to use a command line argument (usually
          with -K) to control the DSO PMDAs that are available for a
          PM_CONTEXT_LOCAL context.

          The spec argument specifies actions for one or more DSO PMDAs
          using up to four fields separated by commas (``,''), namely:
          -      an opcode with one of the values add (add a new entry),
                 del (delete an existing entry) or clear (clear all entries
                 from the table).
          -      the PMDA's domain number
          -      the path to the PMDA DSO (may be absolute or relative to
                 the $PCP_VAR_DIR/pmdas directory and the DSO suffix is
                 optional), and
          -      the name of the PMDA's initialization routine.

          All fields are required to add a new entry.  To delete an entry
          the opcode is required plus either or both of the domain number
          and path fields.  To clear all entries, only the opcode is
          required.

          If spec is parsed successfully, then the DSO table is updated
          with the extracted fields.


-----------------------------------------------------------------

::

          On success, pmSpecLocalPMDA will return NULL.

          On error or failure, pmSpecLocalPMDA will return a pointer to a
          static error message.


---------------------------------------------------------

::

          Some examples of valid spec strings:

          clear  Delete all entries from the DSO table.

          add,123,foo/foo_pmda,foo_init
                 Add the ``foo'' PMDA using domain 123.  The PMDA's DSO is
                 most likely in below the directory $PCP_PMDAS_DIR and
                 named foo/foo_pmda.so (for ELF-style platforms) or
                 foo/foo_pmda.dylib (for BSD-style platforms) or
                 foo\foo_pmda.dll (for Windows-style platforms).  The
                 initialization routine for the ``foo'' PMDA is foo_init().

          del,123
                 Delete the entry for the DSO with domain 123.

          del,,foo/foo_pmda
                 Delete the entry with a pathname to the DSO that matches
                 foo/foo_pmda.

          del,123,foo/foo_pmda
                 Delete the entry for the DSO with either domain 123 and/or
                 a pathname to the DSO that matches foo/foo_pmda.


---------------------------------------------------------

::

          pmcd(1), PMAPI(3) and pmNewContext(3).

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

   Performance Co-Pilot                                  PMSPECLOCALPMDA(3)

--------------

Pages that refer to this page:
`pcp2elasticsearch(1) <../man1/pcp2elasticsearch.1.html>`__, 
`pcp2graphite(1) <../man1/pcp2graphite.1.html>`__, 
`pcp2influxdb(1) <../man1/pcp2influxdb.1.html>`__, 
`pcp2json(1) <../man1/pcp2json.1.html>`__, 
`pcp2spark(1) <../man1/pcp2spark.1.html>`__, 
`pcp2template(1) <../man1/pcp2template.1.html>`__, 
`pcp2xlsx(1) <../man1/pcp2xlsx.1.html>`__, 
`pcp2xml(1) <../man1/pcp2xml.1.html>`__, 
`pcp2zabbix(1) <../man1/pcp2zabbix.1.html>`__, 
`pmchart(1) <../man1/pmchart.1.html>`__, 
`pminfo(1) <../man1/pminfo.1.html>`__, 
`pmlogger(1) <../man1/pmlogger.1.html>`__, 
`pmprobe(1) <../man1/pmprobe.1.html>`__, 
`pmrep(1) <../man1/pmrep.1.html>`__, 
`pmstat(1) <../man1/pmstat.1.html>`__, 
`pmstore(1) <../man1/pmstore.1.html>`__, 
`pmval(1) <../man1/pmval.1.html>`__, 
`pmgetoptions(3) <../man3/pmgetoptions.3.html>`__, 
`pmrep.conf(5) <../man5/pmrep.conf.5.html>`__

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
