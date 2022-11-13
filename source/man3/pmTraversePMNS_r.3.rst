.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

pmtraversepmns(3) — Linux manual page
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

   PMTRAVERSEPMNS(3)       Library Functions Manual       PMTRAVERSEPMNS(3)

NAME
-------------------------------------------------

::

          pmTraversePMNS, pmTraversePMNS_r - traverse the performance
          metrics name space


-------------------------------------------------------------

::

          #include <pcp/pmapi.h>

          int pmTraversePMNS(const char *name, void (*dometric)(const char *));
          int pmTraversePMNS_r(const char *name, void (*dometric_r)(const char *, void *), void *closure);

          cc ... -lpcp


---------------------------------------------------------------

::

          The routine pmTraversePMNS may be used to perform a depth-first
          traversal of the Performance Metrics Name Space (PMNS).

          The traversal starts at the node identified by name - if name is
          an empty string (i.e. ""), the traversal starts at the root of
          the PMNS.  Usually name would be the pathname of a non-leaf node
          in the PMNS.

          For each leaf node (i.e. performance metric) found in the
          traversal, the user-supplied routine dometric is called with the
          full pathname of that metric in the PMNS as the single argument.
          This argument is null-byte terminated, and is constructed from a
          buffer that is managed internally to pmTraversePMNS.
          Consequently the value is only valid during the call to dometric
          - if the pathname needs to be retained, it should be copied using
          strdup(3) before returning from dometric.

          The pmTraversePMNS_r routine performs the same function, except
          the callback method func_r has an additional parameter that will
          be closure from the initial call to pmTraversePMNS_r.  The
          additional parameter to pmTraversePMNS_r and the callback method
          allows the caller to pass context through pmTraversePMNS_r and
          into the callback method func_r, making the service more useful
          for multi-threaded applications where thread-private data can be
          accessed in the callback method via the closure argument.

          On success pmTraversePMNS and pmTraversePMNS_r return the number
          of leaf nodes found in the traversal, which will be one (1) if
          name is either a leaf node, or a derived metric or a non-leaf
          node with one child.  If name is a non-leaf node, the returned
          value will be zero or greater (zero is returned in the special
          case where name is a dynamic root node that currently has no
          children).  In all cases, derived metrics present in the PMNS
          subtree below name are counted as leaf-nodes.  If an an error
          occurs, pmTraversePMNS and pmTraversePMNS_r will return a
          negative error code, as described in the DIAGNOSTICS section
          below.


---------------------------------------------------------------

::

          PM_ERR_NOPMNS
                 Failed to access a PMNS for operation.  Note that if the
                 application hasn't a priori called pmLoadNameSpace(3) and
                 wants to use the distributed PMNS, then a call to
                 pmTraversePMNS must be made inside a current context.

          PM_ERR_NAME
                 The initial pathname name is not valid in the current
                 PMNS.

          PM_ERR_*
                 Other diagnostics are for protocol failures when accessing
                 the distributed PMNS.


---------------------------------------------------------

::

          PMAPI(3) and pmGetChildren(3).

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

   Performance Co-Pilot               PCP                 PMTRAVERSEPMNS(3)

--------------

Pages that refer to this page:
`pcp-mpstat(1) <../man1/pcp-mpstat.1.html>`__, 
`pmdachildren(3) <../man3/pmdachildren.3.html>`__, 
`pmdainit(3) <../man3/pmdainit.3.html>`__, 
`pmgetderivedcontrol(3) <../man3/pmgetderivedcontrol.3.html>`__

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
