.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

pmgetchildrenstatus(3) — Linux manual page
==========================================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `C SYNOPSIS <#C_SYNOPSIS>`__ \|   |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `DIAGNOSTICS <#DIAGNOSTICS>`__ \| |                                   |
| `PCP                              |                                   |
| ENVIRONMENT <#PCP_ENVIRONMENT>`__ |                                   |
| \| `SEE ALSO <#SEE_ALSO>`__ \|    |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   PMGETCHILDRENSTATUS(3)  Library Functions Manual  PMGETCHILDRENSTATUS(3)

NAME
-------------------------------------------------

::

          pmGetChildrenStatus - return the descendent nodes of a PMNS node
          and their respective status


-------------------------------------------------------------

::

          #include <pcp/pmapi.h>

          int pmGetChildrenStatus(const char *name, char ***offspring,
                  int **status);

          cc ... -lpcp


---------------------------------------------------------------

::

          Given a fully qualified pathname to a node in the current
          Performance Metrics Name Space (PMNS), as identified by name,
          pmGetChildrenStatus returns via offspring a list of the relative
          names of all of the immediate descendent nodes of name in the
          current PMNS.

          As a special case, if name is an empty string (i.e.""), the
          immediate descendants of the root node in the PMNS will be
          returned.

          If status is not NULL, then pmGetChildrenStatus will also return
          the status of each child via status.  The status will refer to
          either a leaf node (with value PMNS_LEAF_STATUS) or a non-leaf
          node (with value PMNS_NONLEAF_STATUS).

          Normally, pmGetChildrenStatus will return the number of
          descendent names discovered, else a value less than zero for an
          error.  The value zero indicates that name is a valid metric
          name, i.e. is associated with a leaf node in the PMNS.

          The resulting list of pointers offspring and the values (the
          relative names) that the pointers reference will have been
          allocated by pmGetChildrenStatus with a single call to malloc(3),
          and it is the responsibility of the pmGetChildrenStatus caller to
          free(offspring) to release the space when it is no longer
          required.  The same holds true for the status array.

          When an error occurs, or name is a leaf node (i.e. the result of
          pmGetChildrenStatus is less than one), both offspring and status
          are undefined (no space will have been allocated and so calling
          free(3) is a singularly bad idea).


---------------------------------------------------------------

::

          PM_ERR_NOPMNS
                 Failed to access a PMNS for operation.  Note that if the
                 application hasn't a priori called pmLoadNameSpace(3) and
                 wants to use the distributed PMNS, then a call to
                 pmGetChildrenStatus must be made inside a current context.

          PM_ERR_NAME
                 The pathname name is not valid in the current PMNS

          PM_ERR_*
                 Other diagnostics are for protocol failures when accessing
                 the distributed PMNS.


-----------------------------------------------------------------------

::

          Environment variables with the prefix PCP_ are used to
          parameterize the file and directory names used by PCP.  On each
          installation, the file /etc/pcp.conf contains the local values
          for these variables.  The $PCP_CONF variable may be used to
          specify an alternative configuration file, as described in
          pcp.conf(5).  Values for these variables may be obtained
          programmatically using the pmGetConfig(3) function.


---------------------------------------------------------

::

          PMAPI(3), pmGetChildren(3), pmGetConfig(3),
          pmLoadASCIINameSpace(3), pmLoadNameSpace(3), pmLookupName(3),
          pmNameID(3), pcp.conf(5), pcp.env(5) and PMNS(5).

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

   Performance Co-Pilot               PCP            PMGETCHILDRENSTATUS(3)

--------------

Pages that refer to this page:
`pmgetchildren(3) <../man3/pmgetchildren.3.html>`__, 
`pmgetderivedcontrol(3) <../man3/pmgetderivedcontrol.3.html>`__, 
`pmlookupname(3) <../man3/pmlookupname.3.html>`__, 
`pmnameall(3) <../man3/pmnameall.3.html>`__, 
`pmnameid(3) <../man3/pmnameid.3.html>`__, 
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
