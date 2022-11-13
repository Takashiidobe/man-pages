.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

pmnsadd(1) — Linux manual page
==============================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `OPTIONS <#OPTIONS>`__ \|         |                                   |
| `CAVEATS <#CAVEATS>`__ \|         |                                   |
| `FILES <#FILES>`__ \|             |                                   |
| `PCP                              |                                   |
| ENVIRONMENT <#PCP_ENVIRONMENT>`__ |                                   |
| \| `SEE ALSO <#SEE_ALSO>`__ \|    |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   PMNSADD(1)               General Commands Manual              PMNSADD(1)

NAME
-------------------------------------------------

::

          pmnsadd - add new names to the Performance Co-Pilot PMNS


---------------------------------------------------------

::

          $PCP_BINADM_DIR/pmnsadd [-?]  [-n namespace] file


---------------------------------------------------------------

::

          pmnsmerge(1) performs the same function as pmnsadd and is faster,
          more robust and more flexible.  It is therefore recommended that
          pmnsmerge(1) be used instead.

          pmnsadd adds subtree(s) of new names into a Performance Metrics
          Name Space (PMNS), as used by the components of the Performance
          Co-Pilot (PCP).

          Normally pmnsadd operates on the default Performance Metrics Name
          Space (PMNS), however if the -n option is specified an
          alternative namespace is used from the file namespace.

          The default PMNS is found in the file $PCP_VAR_DIR/pmns/root
          unless the environment variable PMNS_DEFAULT is set, in which
          case the value is assumed to be the pathname to the file
          containing the default PMNS.

          The new names are specified in the file, arguments and conform to
          the syntax for PMNS specifications, see PMNS(5).  There is one
          PMNS subtree in each file, and the base PMNS pathname to the
          inserted subtree is identified by the first group named in each
          file, e.g. if the specifications begin

                    myagent.foo.stuff {
                        mumble     123:45:1
                        fumble     123:45:2
                    }

          then the new names will be added into the PMNS at the non-leaf
          position identified by myagent.foo.stuff, and following all other
          names with the prefix myagent.foo.

          The new names must be contained within a single subtree of the
          namespace.  If disjoint subtrees need to be added, these must be
          packaged into separate files and pmnsadd used on each, one at a
          time.

          All of the files defining the PMNS must be located within the
          directory that contains the root of the PMNS, this would
          typically be $PCP_VAR_DIR/pmns for the default PMNS, and this
          would typically imply running pmnsadd as root.

          As a special case, if file contains a line that begins root {
          then it is assumed to be a complete PMNS that needs to be merged,
          so none of the subtree extraction and rewriting is performed and
          file is handed directly to pmnsmerge(1).

          Provided some initial integrity checks are satisfied, pmnsadd
          will update the PMNS using pmnsmerge(1) - if this fails for any
          reason, the original namespace remains unchanged.


-------------------------------------------------------

::

          The available command line options are:

          -n pmnsfile
               Load an alternative Performance Metrics Name Space (PMNS(5))
               from the file pmnsfile.

          -?   Display usage message and exit.


-------------------------------------------------------

::

          Once the writing of the new namespace file has begun, the signals
          SIGINT, SIGHUP and SIGTERM will be ignored to protect the
          integrity of the new files.


---------------------------------------------------

::

          $PCP_VAR_DIR/pmns/root
               the default PMNS, when the environment variable PMNS_DEFAULT
               is unset


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

          pmnsdel(1), pmnsmerge(1), pcp.conf(5), pcp.env(5) and PMNS(5).

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

   Performance Co-Pilot               PCP                        PMNSADD(1)

--------------

Pages that refer to this page:
`pmnscomp(1) <../man1/pmnscomp.1.html>`__, 
`pmnsdel(1) <../man1/pmnsdel.1.html>`__, 
`pmnsmerge(1) <../man1/pmnsmerge.1.html>`__, 
`pmda(3) <../man3/pmda.3.html>`__

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
