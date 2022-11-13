.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

pmfetcharchive(3) — Linux manual page
=====================================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `C SYNOPSIS <#C_SYNOPSIS>`__ \|   |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `DIAGNOSTICS <#DIAGNOSTICS>`__ \| |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   PMFETCHARCHIVE(3)       Library Functions Manual       PMFETCHARCHIVE(3)

NAME
-------------------------------------------------

::

          pmFetchArchive - get performance metrics directly from a set if
          archive logs


-------------------------------------------------------------

::

          #include <pcp/pmapi.h>

          int pmFetchArchive(pmResult **result);

          cc ... -lpcp


---------------------------------------------------------------

::

          pmFetchArchive is a variant of pmFetch(3) that may only be used
          when the current Performance Metrics Application Programming
          Interface (PMAPI) context is associated with a set of archive
          logs.

          The result is instantiated with all of the metrics (and
          instances) from the next archive record, consequently there is no
          notion of a list of desired metrics, and the instance profile of
          the PMAPI context is ignored.

          pmFetchArchive may return a result in which numpmid is zero.
          This is a <mark> record that indicates a temporal discontinuity
          in the time series of performance metrics.  This can happen at
          the boundary between archive logs in a set or if the archive log
          associated with the current PMAPI context was created using
          pmlogextract(1) to concatenate two or more PCP archive logs, and
          the <mark> record marks a point in time between the end of one
          input archive and the start of the next input archive.

          It is expected that pmFetchArchive would be used to create
          utilities that scan sets of archive logs, while the more common
          access to the archives would be via the pmFetch(3) interface.

          To skip records within the set of archive logs, use pmSetMode(3)
          to change the collection time within the current PMAPI context,
          then call pmFetchArchive.

          Note that the result returned by pmFetchArchive is dynamically
          allocated, and must be released using pmFreeResult(3), not
          free(3).  See pmFetch(3) and pmFreeResult(3) for further details.

          pmFetchArchive returns zero on success.


---------------------------------------------------------------

::

          PM_ERR_NOTARCHIVE
                 the current PMAPI context is not associated with a set of
                 archive logs


---------------------------------------------------------

::

          PMAPI(3), pmFetch(3), pmFreeResult(3), pmNewContext(3),
          pmSetMode(3) and pmTrimNameSpace(3).

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

   Performance Co-Pilot               PCP                 PMFETCHARCHIVE(3)

--------------

Pages that refer to this page:
`pcpintro(3) <../man3/pcpintro.3.html>`__, 
`pmfetch(3) <../man3/pmfetch.3.html>`__, 
`pmgetarchiveend(3) <../man3/pmgetarchiveend.3.html>`__, 
`pmregisterderived(3) <../man3/pmregisterderived.3.html>`__, 
`pmsetmode(3) <../man3/pmsetmode.3.html>`__

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
