.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

\__pmlocalpmda(3) — Linux manual page
=====================================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `C SYNOPSIS <#C_SYNOPSIS>`__ \|   |                                   |
| `CAVEAT <#CAVEAT>`__ \|           |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `RETURN VALUE <#RETURN_VALUE>`__  |                                   |
| \| `SEE ALSO <#SEE_ALSO>`__ \|    |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   PMLOCALPMDA(3)          Library Functions Manual          PMLOCALPMDA(3)

NAME
-------------------------------------------------

::

          __pmLocalPMDA - change the table of DSO PMDAs for
          PM_CONTEXT_LOCAL contexts


-------------------------------------------------------------

::

          #include "pmapi.h"
          #include "libpcp.h"

          int __pmLocalPMDA(int op, int domain, const char *name,
                  const char *init);

          cc ... -lpcp


-----------------------------------------------------

::

          This documentation is intended for internal Performance Co-Pilot
          (PCP) developer use.

          These interfaces are not part of the PCP APIs that are guaranteed
          to remain fixed across releases, and they may not work, or may
          provide different semantics at some point in the future.


---------------------------------------------------------------

::

          PCP contexts of type PM_CONTEXT_LOCAL are used by clients that
          wish to fetch metrics directly from one or more PMDAs on the
          local host without involving pmcd(1).  A PMDA that is to be used
          in this way must have been built as a Dynamic Shared Object
          (DSO).

          Historically the table of PMDAs available for use with
          PM_CONTEXT_LOCAL was hardcoded to the following:

          * The PMDA (or PMDAs) that export the operating system
            performance data and data about process activity.
          * The mmv PMDA.
          * The sample PMDA provided $PCP_LITE_SAMPLE or $PMDA_LOCAL_SAMPLE
            is set in the environment - used mostly for QA and testing.

          The initial table of PMDAs available for use with
          PM_CONTEXT_LOCAL is now generated dynamically from all those
          PMDAs that have been installed as DSOs on the local host.  The
          one exception is the ``pmcd'' PMDA which only operates correctly
          in the address space of a running pmcd(1) process and so is not
          available to an application using a PM_CONTEXT_LOCAL context.

          __pmLocalPMDA provides a number of services to amend the table of
          PMDAs available for use with PM_CONTEXT_LOCAL.

          The op argument specifies the what should be done and takes one
          of the following values and actions:

          PM_LOCAL_ADD    Append an entry to the table for the PMDA with a
                          Performance Metrics Domain (PMD) of domain, the
                          path to the DSO PMDA is given by path and the
                          PMDA's initialization routine is init.

          PM_LOCAL_DEL    Removes all entries in the table where the domain
                          matches, or the path matches.  Setting the
                          arguments domain to -1 or path to NULL to force
                          matching on the other argument.  The init
                          argument is ignored.

          PM_LOCAL_CLEAR  Remove all entries from the table.  All the other
                          arguments are ignored in this case.

          The domain, name and init arguments have similar syntax and
          semantics to the associated fields in the pmcd(1) configuration
          file.  The one difference is the path argument which is used by
          __pmLocalPMDA to find a likely looking DSO by searching in this
          order: $PCP_PMDAS_DIR/path, path, $PCP_PMDAS_DIR/path.dso-suffix
          and finally path.dso-suffix (dso-suffix is the local platform
          specific default file name suffix for a DSO, e.g.  so for Linux,
          dylib for Mac OS X, dll for Windows, etc.).


-----------------------------------------------------------------

::

          In most cases, __pmLocalPMDA returns 0 to indicate success.  If
          op is invalid, then the return value is PM_ERR_CONV else if there
          is no matching table entry found for a PM_LOCAL_DEL operation,
          PM_ERR_INDOM is returned.


---------------------------------------------------------

::

          pmcd(1), PMAPI(3), pmNewContext(3) and __pmSpecLocalPMDA(3).

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

   Performance Co-Pilot                                      PMLOCALPMDA(3)

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
