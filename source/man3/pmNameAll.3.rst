.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

pmnameall(3) — Linux manual page
================================

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

   PMNAMEALL(3)            Library Functions Manual            PMNAMEALL(3)

NAME
-------------------------------------------------

::

          pmNameAll - translate a PMID to a set of performance metric names


-------------------------------------------------------------

::

          #include <pcp/pmapi.h>

          int pmNameAll(pmID pmid, char ***nameset);

          cc ... -lpcp


---------------------------------------------------------------

::

          Given a Performance Metric Identifier (PMID) via pmid, pmNameAll
          will determine all the corresponding metric names, if any, in the
          Performance Metrics Name Space (PMNS), and return these via
          nameset.

          The resulting list of pointers nameset and the values (the
          relative names) that the pointers reference will have been
          allocated by pmNameAll with a single call to malloc(3), and it is
          the responsibility of the pmNameAll caller to use free(nameset)
          to release the space when it is no longer required.

          In the absence of errors, pmNameAll returns the number of names
          in nameset.

          For many examples of a PMNS, there will be a 1:1 mapping between
          a name and a PMID, and under these circumstances, pmNameID(3)
          provides a slightly simpler interface in the absence of duplicate
          names for a particular PMID.


---------------------------------------------------------------

::

          PM_ERR_NOPMNS
                 Failed to access a PMNS for operation.  Note that if the
                 application hasn't a priori called pmLoadNameSpace(3) and
                 wants to use the distributed PMNS, then a call to
                 pmNameAll must be made after the creation of a context
                 (see pmNewContext(3)).

          PM_ERR_PMID
                 pmid does not correspond to a defined PMID in the PMNS.

          PM_ERR_*
                 Other diagnostics are for protocol failures when accessing
                 the distributed PMNS.


---------------------------------------------------------

::

          PMAPI(3), pmGetChildren(3), pmGetChildrenStatus(3),
          pmGetConfig(3), pmLoadASCIINameSpace(3), pmLoadNameSpace(3),
          pmLookupName(3), pmNameID(3), pmNewContext(3), pcp.conf(5),
          pcp.env(5) and PMNS(5).

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

   Performance Co-Pilot               PCP                      PMNAMEALL(3)

--------------

Pages that refer to this page:
`pmdaname(3) <../man3/pmdaname.3.html>`__, 
`pmgetderivedcontrol(3) <../man3/pmgetderivedcontrol.3.html>`__, 
`pmnameid(3) <../man3/pmnameid.3.html>`__

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
