.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

pmnscomp(1) — Linux manual page
===============================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `CAVEAT <#CAVEAT>`__ \|           |                                   |
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

   PMNSCOMP(1)              General Commands Manual             PMNSCOMP(1)

NAME
-------------------------------------------------

::

          pmnscomp - compile an ASCII performance metrics namespace into
          binary format.


---------------------------------------------------------

::

          pmnscomp [-d] [-f] [-n namespace] [-v version] outfile


---------------------------------------------------------------

::

          pmnscomp compiles a Performance Metrics Name Space (PMNS) in
          ASCII format into a more efficient binary representation.
          pmLoadNameSpace(3) is able to load this binary representation
          significantly faster than the equivalent ASCII representation.

          If outfile already exists pmnscomp will exit without overwriting
          it.

          By convention, the name of the compiled namespace is that of the
          root file of the ASCII namespace, with .bin appended.  For
          example, the root of the default PMNS is a file named root and
          the compiled version of the entire namespace is root.bin.

          The options are;

          -d   By default the PMNS to be compiled is expected to contain at
               most one name for each unique Performance Metric Identifier
               (PMID).  The -d option relaxes this restriction and allows
               the compilation of a PMNS in which multiple names may be
               associated with a single PMID.  Duplicate names are useful
               when a particular metric may be logically associated with
               more than one group of related metrics, or when it is
               desired to create abbreviated aliases to name a set of
               frequently used metrics.

          -f   Force overwriting of an existing outfile if it already
               exists.

          -n   Normally pmnscomp operates on the default PMNS, however if
               the -n option is specified an alternative namespace is
               loaded from the file namespace.

          -v   By default, pmnscomp writes a version 2 compiled namespace.
               If version is 1 then pmnscomp will write a version 1
               namespace which is similar to version 2, without the extra
               integrity afforded by checksums.  Note that PCP version 2.0
               or later can handle both versions 1 and 2 of the binary PMNS
               format.

          The default input PMNS is found in the file
          $PCP_VAR_DIR/pmns/root unless the environment variable
          PMNS_DEFAULT is set, in which case the value is assumed to be the
          pathname to the file containing the default input PMNS.


-----------------------------------------------------

::

          Once the writing of the new outfile has begun, the signals
          SIGINT, SIGHUP and SIGTERM will be ignored to protect the
          integrity of the new file.


---------------------------------------------------------------

::

          Cannot open ``xyz'' - the filename for the root of the PMNS that
          was passed to pmLoadNameSpace(3) is bogus.

          Illegal PMID - either one of the three PMID components (see
          pmns(5)) is not an integer, or the value for one of the
          components is negative, or too large.

          Expected ... - specific syntax errors when a particular type of
          lexical symbol was expected and not found; the messages are
          intended to be self-explanatory.

          Internal botch - implementation problem for the parser ...

          Duplicate name ``abc'' in subtree for ``pqr.xyz'' - for each non-
          leaf node, the names of all immediate descendents must be unique.

          No name space entry for ``root'' - the special non-leaf node with
          a pathname of ``root'' defines the root of the PMNS, and must
          appear somewhere in the PMNS specification.

          Multiple name space entries for ``root'' - more than one ``root''
          node does not make sense!

          Disconnected subtree (``abc.xyz.def'') in name space - the
          pathname for this non-leaf node does not correspond to any
          pathname in the PMNS, hence this non-leaf node is ``orphaned'' in
          the PMNS.

          Cannot find definition for non-terminal node ``xyz'' in name
          space - a non-terminal node is named as part of its parent's
          specification, but is never defined.

          Duplicate metric id (xxx) in name space for metrics ``abc'' and
          ``xyz'' - each PMID must be unique across the PMNS.


---------------------------------------------------

::

          $PCP_VAR_DIR/pmns/*
                 default PMNS specification files
          $PCP_VAR_DIR/pmns/root.bin
                 compiled version of the default PMNS, when the environment
                 variable PMNS_DEFAULT is unset
          $PCP_VAR_DIR/pmns/stdpmid
                 some standard macros for PMID generation


-----------------------------------------------------------------------

::

          Environment variables with the prefix PCP_ are used to
          parameterize the file and directory names used by PCP.  On each
          installation, the file /etc/pcp.conf contains the local values
          for these variables.  The $PCP_CONF variable may be used to
          specify an alternative configuration file, as described in
          pcp.conf(5).


---------------------------------------------------------

::

          pmnsadd(1), pmnsdel(1), pmnsmerge(1), PMAPI(3),
          pmLoadNameSpace(3), pcp.conf(5), pcp.env(5) and pmns(5).

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

   Performance Co-Pilot               PCP                       PMNSCOMP(1)

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
