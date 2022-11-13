.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

pmns(5) — Linux manual page
===========================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `DISTRI                           |                                   |
| BUTED PMNS <#DISTRIBUTED_PMNS>`__ |                                   |
| \|                                |                                   |
| `PROCESSING FRA                   |                                   |
| MEWORK <#PROCESSING_FRAMEWORK>`__ |                                   |
| \| `SYNTAX <#SYNTAX>`__ \|        |                                   |
| `EXAMPLE <#EXAMPLE>`__ \|         |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   PMNS(5)                    File Formats Manual                   PMNS(5)

NAME
-------------------------------------------------

::

          PMNS - the performance metrics name space


---------------------------------------------------------

::

          $PCP_VAR_DIR/pmns


---------------------------------------------------------------

::

          When using the Performance Metrics Programming Interface (PMAPI)
          of the Performance Co-Pilot (PCP), performance metrics are
          identified by an external name in a hierarchic Performance
          Metrics Name Space (PMNS), and an internal identifier, the
          Performance Metric Identifier (PMID).

          A PMNS specifies the association between a metric's name and its
          PMID.

          A PMNS is defined on one or more ASCII source files.

          Loading of a PMNS is done by calling pmLoadNameSpace(3) or
          pmLoadASCIINameSpace(3).

          As of Version 3.10.3 of PCP, by default duplicate names for the
          same PMID are allowed in the PMNS, although
          pmLoadASCIINameSpace(3) provides an alternative interface with
          user-defined control over the processing of duplicate names in
          the PMNS.  The external format for a PMNS conforms to the syntax
          and semantics described in the following sections.

          There is one default PMNS in the files below $PCP_VAR_DIR/pmns,
          although users and application developers are free to create and
          use alternate PMNS's.  For an example of this, see the PCP
          Tutorial in $PCP_DEMOS_DIR/Tutorial.

          Although an application can call pmLoadNameSpace(3), normally
          this is only done directly for the -n command line option where
          an explicit root PMNS file is specified.  Since PCP version 2
          uses a distributed PMNS (see below), an application can extract
          PMNS information from a host's PMCD or an archive.  If the PMNS
          source is a version 1 archive (see PCPIntro(1)), however, then
          the local PMNS will be loaded using the path specified by the
          environment variable PMNS_DEFAULT.


-------------------------------------------------------------------------

::

          In PCP version 1, the PMNS functions in the API all operated on a
          PMNS loaded locally from a file. Since PCP version 2, however,
          PMNS functions may get the PMNS information remotely from a PMCD
          or directly from the meta data of an archive.


---------------------------------------------------------------------------------

::

          The PMNS specification is initially passed through pmcpp(1).
          This means the following facilities may be used in the
          specification

          +  C-style comments

          +  #include directives

          +  #define directives and macro substitution

          +  conditional processing via #ifdef ...  #endif, etc.

          When pmcpp(1) is executed, the ``standard'' include directories
          are the current directory and $PCP_VAR_DIR/pmns.

          The pre-processing with pmcpp(1) may be omitted in some cases
          where the PMNS is known to not contain any C-style comments,
          preprocessor directives or macros.  Refer to the descriptions of
          pmLoadASCIINameSpace(3) and pmLoadNameSpace(3) for details.


-----------------------------------------------------

::

          The general syntax for a non-leaf node in the PMNS is as follows

          pathname {
                  name      [pmid]
                  ...
          }

          Where pathname is the full pathname from the root of the PMNS to
          this non-leaf node, with each component in the pathname separated
          by a ``.''.  The root node for the PMNS must have the special
          name ``root'', but the common prefix ``root.'' must be omitted
          from all pathnames.  Each component in the pathname must begin
          with an alphabetic character, and be followed by zero or more
          characters drawn from the alphabetics, the digits and the
          underscore ``_'') character.  For alphabetic characters in a
          pathname component, upper and lower case are distinguished.

          Non-leaf nodes in the PMNS may be defined in any order.

          The descendent nodes are defined by the set of names, relative to
          the pathname of their parent non-leaf node.  For the descendent
          nodes, leaf nodes have a pmid specification, non-leaf nodes do
          not.  The syntax for the pmid specification has been chosen to
          help manage the allocation of PMIDs across disjoint and
          autonomous domains of administration and implementation.  Each
          pmid consists of 3 integer parts, separated by colons, e.g.
          14:27:11.  This hierarchic numbering scheme is intended to mirror
          the implementation hierarchy of performance metric domain,
          metrics cluster (data structure or operational similarity) and
          individual metric.  In practice, the two leading components are
          likely to be macros in the PMNS specification source, and
          pmcpp(1) will convert the macros to integers.  These macros for
          the initial components of the pmid are likely to be defined
          either in a standard include file, e.g.
          $PCP_VAR_DIR/pmns/stdpmid, or in the current source file.

          To support dynamic metrics, where the existence of a metric is
          known to a PMDA, but not visible in the PMNS, a variant syntax
          for the pmid is supported, namely a domain number followed by
          asterisks for the other components of the pmid, e.g. 14:*:*.  The
          corresponding metric name forms the root of a subtree of dynamic
          metric names defined in the corresponding PMDA as identified by
          the domain number.

          The current allocation of the high-order (PMD or domain)
          component of PMIDs is as follows.

               ┌────────┬────────────────────────────────────────────┐
               │ Range  │                 Allocation                 │
               ├────────┼────────────────────────────────────────────┤
               │      0 │ reserved                                   │
               ├────────┼────────────────────────────────────────────┤
               │  1-384 │ production PMDAs from PCP packages         │
               ├────────┼────────────────────────────────────────────┤
               │385-510 │ end-user PMDAs (allocate from high to low) │
               ├────────┼────────────────────────────────────────────┤
               │    511 │ reserved for dynamic PMNS entries          │
               └────────┴────────────────────────────────────────────┘


-------------------------------------------------------

::

          #define KERNEL 1
          #define FOO 387
          root {
              network
              cpu
              dynamic     FOO:*:*
          }

          #define NETWORK 26
          network {
              intrate     KERNEL:NETWORK:1
              packetrate
          }

          network.packetrate {
              in          KERNEL:NETWORK:35
              out         KERNEL:NETWORK:36
          }

          #define CPU 10
          cpu {
              syscallrate KERNEL:CPU:10
              util
          }

          #define USER 20
          #define SYSTEM 21
          #define IDLE 22

          cpu.util {
              user        KERNEL:CPU:USER
              sys         KERNEL:CPU:SYSTEM
              idle        KERNEL:CPU:IDLE
          }


---------------------------------------------------------

::

          PCPIntro(1), pmcd(1), pmcpp(1), PCPIntro(3), PMAPI(3),
          pmErrStr(3), pmGetConfig(3), pmLoadASCIINameSpace(3),
          pmLoadNameSpace(3), pcp.conf(5) and pcp.env(5).

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

   Performance Co-Pilot               PCP                           PMNS(5)

--------------

Pages that refer to this page: `chkhelp(1) <../man1/chkhelp.1.html>`__, 
`collectl2pcp(1) <../man1/collectl2pcp.1.html>`__, 
`dbpmda(1) <../man1/dbpmda.1.html>`__, 
`genpmda(1) <../man1/genpmda.1.html>`__, 
`newhelp(1) <../man1/newhelp.1.html>`__, 
`pcp(1) <../man1/pcp.1.html>`__, 
`pcp2elasticsearch(1) <../man1/pcp2elasticsearch.1.html>`__, 
`pcp2graphite(1) <../man1/pcp2graphite.1.html>`__, 
`pcp2influxdb(1) <../man1/pcp2influxdb.1.html>`__, 
`pcp2json(1) <../man1/pcp2json.1.html>`__, 
`pcp2spark(1) <../man1/pcp2spark.1.html>`__, 
`pcp2template(1) <../man1/pcp2template.1.html>`__, 
`pcp2xlsx(1) <../man1/pcp2xlsx.1.html>`__, 
`pcp2xml(1) <../man1/pcp2xml.1.html>`__, 
`pcp2zabbix(1) <../man1/pcp2zabbix.1.html>`__, 
`pcp-dstat(1) <../man1/pcp-dstat.1.html>`__, 
`pcpintro(1) <../man1/pcpintro.1.html>`__, 
`pmcd(1) <../man1/pmcd.1.html>`__, 
`pmchart(1) <../man1/pmchart.1.html>`__, 
`pmclient(1) <../man1/pmclient.1.html>`__, 
`pmcpp(1) <../man1/pmcpp.1.html>`__, 
`pmdabcc(1) <../man1/pmdabcc.1.html>`__, 
`pmdanetcheck(1) <../man1/pmdanetcheck.1.html>`__, 
`pmdumplog(1) <../man1/pmdumplog.1.html>`__, 
`pmgenmap(1) <../man1/pmgenmap.1.html>`__, 
`pmie(1) <../man1/pmie.1.html>`__, 
`pminfo(1) <../man1/pminfo.1.html>`__, 
`pmlc(1) <../man1/pmlc.1.html>`__, 
`pmlogcheck(1) <../man1/pmlogcheck.1.html>`__, 
`pmlogextract(1) <../man1/pmlogextract.1.html>`__, 
`pmlogger(1) <../man1/pmlogger.1.html>`__, 
`pmlogrewrite(1) <../man1/pmlogrewrite.1.html>`__, 
`pmlogsummary(1) <../man1/pmlogsummary.1.html>`__, 
`pmnsadd(1) <../man1/pmnsadd.1.html>`__, 
`pmnscomp(1) <../man1/pmnscomp.1.html>`__, 
`pmnsdel(1) <../man1/pmnsdel.1.html>`__, 
`pmnsmerge(1) <../man1/pmnsmerge.1.html>`__, 
`pmprobe(1) <../man1/pmprobe.1.html>`__, 
`pmrep(1) <../man1/pmrep.1.html>`__, 
`pmstat(1) <../man1/pmstat.1.html>`__, 
`pmstore(1) <../man1/pmstore.1.html>`__, 
`pmval(1) <../man1/pmval.1.html>`__, 
`sheet2pcp(1) <../man1/sheet2pcp.1.html>`__, 
`pcpintro(3) <../man3/pcpintro.3.html>`__, 
`pmaddderived(3) <../man3/pmaddderived.3.html>`__, 
`pmapi(3) <../man3/pmapi.3.html>`__, 
`pmda(3) <../man3/pmda.3.html>`__, 
`pmgetchildren(3) <../man3/pmgetchildren.3.html>`__, 
`pmgetchildrenstatus(3) <../man3/pmgetchildrenstatus.3.html>`__, 
`pmgetderivedcontrol(3) <../man3/pmgetderivedcontrol.3.html>`__, 
`pmgetpmnslocation(3) <../man3/pmgetpmnslocation.3.html>`__, 
`pmloadasciinamespace(3) <../man3/pmloadasciinamespace.3.html>`__, 
`pmloadderivedconfig(3) <../man3/pmloadderivedconfig.3.html>`__, 
`pmloadnamespace(3) <../man3/pmloadnamespace.3.html>`__, 
`pmnameall(3) <../man3/pmnameall.3.html>`__, 
`pmnameid(3) <../man3/pmnameid.3.html>`__, 
`pmregisterderived(3) <../man3/pmregisterderived.3.html>`__, 
`pmtrimnamespace(3) <../man3/pmtrimnamespace.3.html>`__, 
`pmunloadnamespace(3) <../man3/pmunloadnamespace.3.html>`__, 
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
