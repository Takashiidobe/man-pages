.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

pmloadnamespace(3) — Linux manual page
======================================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `C SYNOPSIS <#C_SYNOPSIS>`__ \|   |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `DIAGNOSTICS <#DIAGNOSTICS>`__ \| |                                   |
| `FILES <#FILES>`__ \|             |                                   |
| `PCP                              |                                   |
| ENVIRONMENT <#PCP_ENVIRONMENT>`__ |                                   |
| \| `SEE ALSO <#SEE_ALSO>`__ \|    |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   PMLOADNAMESPACE(3)      Library Functions Manual      PMLOADNAMESPACE(3)

NAME
-------------------------------------------------

::

          pmLoadNameSpace - load a local PMNS for an application


-------------------------------------------------------------

::

          #include <pcp/pmapi.h>

          int pmLoadNameSpace(const char *filename);

          cc ... -lpcp


---------------------------------------------------------------

::

          If the application wants to force using a local Performance
          Metrics Name Space (PMNS) instead of a distributed PMNS then it
          must load the PMNS using pmLoadNameSpace or
          pmLoadASCIINameSpace(3).  If the application is to use a
          distributed PMNS, then it should NOT make a call to load the PMNS
          explicitly.

          Most applications using a Performance Metrics Application
          Programming Interface (PMAPI) context (of any type, so
          PM_CONTEXT_HOST or PM_CONTEXT_ARCHIVE or PM_CONTEXT_LOCAL) should
          not need to call pmLoadNameSpace.

          The filename argument designates the PMNS of interest.  For
          applications not requiring a tailored PMNS, the special value
          PM_NS_DEFAULT may be used for filename, to force the default
          local PMNS to be loaded.

          The default local PMNS is found in the file
          $PCP_VAR_DIR/pmns/root unless the environment variable
          PMNS_DEFAULT is set, in which case the value is assumed to be the
          pathname to the file containing the default local PMNS.

          Externally a PMNS is stored in an ASCII format as described in
          PMNS(5).  However, note that pmLoadNameSpace assumes filename
          does not contain any C-style comments, pre-processor directives
          or macros; if this is not the case, pmLoadASCIINameSpace(3)
          should be used instead.

          As of Version 3.10.3 of PCP, by default, multiple names in the
          PMNS are allowed to be associated with a single Performance
          Metrics Identifier (PMID) and this is unconditionally allowed by
          pmLoadNameSpace.  pmLoadASCIINameSpace(3) provides an alternative
          interface with user-defined control over the handling of
          duplicate names for the same PMID in the PMNS.

          pmLoadNameSpace returns zero on success.


---------------------------------------------------------------

::

          Syntax and other errors in the parsing of the PMNS are reported
          on stderr with a message of the form ``Error Parsing ASCII PMNS:
          ...''.

          PM_ERR_DUPPMNS

                 It is an error to try and load more than one PMNS, or to
                 call either pmLoadNameSpace and/or pmLoadASCIINameSpace(3)
                 more than once.

          PM_ERR_PMNS

                 Syntax error in the PMNS file.


---------------------------------------------------

::

          $PCP_VAR_DIR/pmns/root   the default local PMNS, when the
                                   environment variable PMNS_DEFAULT is
                                   unset


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

          PMAPI(3), pmGetConfig(3), pmLoadASCIINameSpace(3),
          pmTrimNameSpace(3), pcp.conf(5), pcp.env(5) and PMNS(5).

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

   Performance Co-Pilot               PCP                PMLOADNAMESPACE(3)

--------------

Pages that refer to this page:
`pcpintro(1) <../man1/pcpintro.1.html>`__, 
`pmcpp(1) <../man1/pmcpp.1.html>`__, 
`pmnscomp(1) <../man1/pmnscomp.1.html>`__, 
`pcpintro(3) <../man3/pcpintro.3.html>`__, 
`pmapi(3) <../man3/pmapi.3.html>`__, 
`pmgetchildren(3) <../man3/pmgetchildren.3.html>`__, 
`pmgetchildrenstatus(3) <../man3/pmgetchildrenstatus.3.html>`__, 
`pmgetpmnslocation(3) <../man3/pmgetpmnslocation.3.html>`__, 
`pmloadasciinamespace(3) <../man3/pmloadasciinamespace.3.html>`__, 
`pmlookupname(3) <../man3/pmlookupname.3.html>`__, 
`pmnameall(3) <../man3/pmnameall.3.html>`__, 
`pmnameid(3) <../man3/pmnameid.3.html>`__, 
`pmtrimnamespace(3) <../man3/pmtrimnamespace.3.html>`__, 
`pmunloadnamespace(3) <../man3/pmunloadnamespace.3.html>`__, 
`pmns(5) <../man5/pmns.5.html>`__

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
