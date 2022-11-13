.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

pmstore(3) — Linux manual page
==============================

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

   PMSTORE(3)              Library Functions Manual              PMSTORE(3)

NAME
-------------------------------------------------

::

          pmStore - modify values of performance metrics


-------------------------------------------------------------

::

          #include <pcp/pmapi.h>

          int pmStore(const pmResult *result);

          cc ... -lpcp


---------------------------------------------------------------

::

          In some special cases it may be helpful to modify the current
          values of performance metrics, e.g. to reset a counter to zero,
          or to modify a ``metric'' which is a control variable for some
          agent collecting performance metrics.

          The routine pmStore is a lightweight inverse of pmFetch(3).

          The caller must build the pmResult data structure (of course,
          this could have been returned from an earlier pmFetch(3) call)
          and then call pmStore.

          It is an error to pass a request to pmStore in which the numval
          field within any of the pmValueSet structure has a value less
          than one.

          The current Performance Metrics Application Programming Interface
          (PMAPI) context must be one with a host as the source of metrics,
          and the current value of the nominated metrics will be changed,
          i.e.  pmStore cannot be used to make retrospective changes to
          information in either the archive logs, or in the recent past for
          real-time sources of metrics.

          The return code from pmStore is zero for success.


---------------------------------------------------------------

::

          PM_ERR_GENERIC
                 At least one of the modifications was rejected.  No other
                 status is available from below the PMAPI (this is the
                 lightweight part of the functionality!).  In cases where
                 the outcome of pmStore for individual metrics is
                 important, the caller should make one call to pmStore for
                 each metric. On the other hand, a bulk modification can be
                 performed in a single pmStore call for situations in which
                 the outcome is not critical.

          PM_ERR_NOTHOST
                 The current PMAPI context is an archive rather than a
                 host, or it is a host that is not set to the current time,
                 i.e. has been ``rewound'' to the recent past using
                 pmSetMode(3).

          PM_ERR_TOOSMALL
                 The number of metrics specified in result is less than
                 one.

          PM_ERR_VALUE
                 One or more of the pmValueSets in result has a numval
                 field with a value less than one.


---------------------------------------------------------

::

          PMAPI(3), pmFetch(3) and pmSetMode(3).

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

   Performance Co-Pilot               PCP                        PMSTORE(3)

--------------

Pages that refer to this page:
`pmdagfs2(1) <../man1/pmdagfs2.1.html>`__, 
`pmdaoracle(1) <../man1/pmdaoracle.1.html>`__, 
`pmdapipe(1) <../man1/pmdapipe.1.html>`__, 
`pmdaproc(1) <../man1/pmdaproc.1.html>`__, 
`pmstore(1) <../man1/pmstore.1.html>`__, 
`pmval(1) <../man1/pmval.1.html>`__, 
`pcpintro(3) <../man3/pcpintro.3.html>`__, 
`pmdastore(3) <../man3/pmdastore.3.html>`__, 
`pmwebapi(3) <../man3/pmwebapi.3.html>`__

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
