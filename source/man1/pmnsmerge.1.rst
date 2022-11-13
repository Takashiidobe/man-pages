.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

pmnsmerge(1) — Linux manual page
================================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `OPTIONS <#OPTIONS>`__ \|         |                                   |
| `CAVEATS <#CAVEATS>`__ \|         |                                   |
| `PCP                              |                                   |
| ENVIRONMENT <#PCP_ENVIRONMENT>`__ |                                   |
| \| `SEE ALSO <#SEE_ALSO>`__ \|    |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   PMNSMERGE(1)             General Commands Manual            PMNSMERGE(1)

NAME
-------------------------------------------------

::

          pmnsmerge - merge multiple versions of a Performance Co-Pilot
          PMNS


---------------------------------------------------------

::

          $PCP_BINADM_DIR/pmnsmerge [-adfxv] infile [...]  outfile


---------------------------------------------------------------

::

          pmnsmerge merges multiple instances of a Performance Metrics Name
          Space (PMNS), as used by the components of the Performance Co-
          Pilot (PCP).

          Each infile argument names a file that includes the root of a
          PMNS, of the form

                    root {
                        /* arbitrary stuff */
                    }

          The order in which the infile files are processed is determined
          by the presence or absence of embedded control lines of the form

          #define _DATESTAMP YYYYMMDD

          Files without a control line are processed first and in the order
          they appear on the command line.  The other files are then
          processed in order of ascending _DATESTAMP.

          The -a option suppresses the argument re-ordering and processes
          all files in the order they appear on the command line.

          The merging proceeds by matching names in PMNS, only those new
          names in each PMNS are considered, and these are added after any
          existing metrics with the longest possible matching prefix in
          their names.  For example, merging these two input PMNS

                    root {                    root {
                                                  surprise  1:1:3
                        mine       1:1:1          mine      1:1:1
                        foo                       foo
                                                  yawn
                        yours      1:1:2
                    }                         }
                    foo {                     foo {
                        fumble     1:2:1
                                                  mumble    1:2:3
                        stumble    1:2:2          stumble   1:2:2
                    }                         }
                                              yawn {
                                                  sleepy    1:3:1
                                              }

          Produces the resulting PMNS in out.

                    root {
                        mine      1:1:1
                        foo
                        yours     1:1:2
                        surprise  1:1:3
                        yawn
                    }
                    foo {
                        fumble    1:2:1
                        stumble   1:2:2
                        mumble    1:2:3
                    }
                    yawn {
                        sleepy    1:3:1
                    }

          To avoid accidental over-writing of PMNS files, outfile is
          expected to not exist when pmnsmerge starts.  The -f option
          allows an existing outfile to be unlinked (if possible) and
          truncated before writing starts.

          Normally duplicate names for the same Performance Metric
          Identifier (PMID) in a PMNS are allowed.  The -d option is the
          default option and is included for backwards compatibility.  The
          -x option reverses the default and pmnsmerge will report an error
          and exit with a non-zero status if a duplicate name is found for
          a PMID in any of the input PMNS files or in the merged output
          PMNS.

          The -v option produces one line of diagnostic output as each
          infile is processed.

          Once all of the merging has been completed, pmnsmerge will
          attempt to load the resultant namespace using
          pmLoadASCIINameSpace(3) - if this fails for any reason, outfile
          will still be created, but pmnsmerge will report the problem and
          exit with non-zero status.

          Using pmnsmerge with a single input argument allows that PMNS
          file to be checked.  In addition to syntactic checking,
          specifying -x will also enable a check for duplicate names for
          all PMIDs.


-------------------------------------------------------

::

          The available command line options are:

          -a   Process files in command line order.

          -d, --dupok
               Allow duplicate metric names per PMID.  This is the default.

          -f, --force
               Overwrite output file if it already exists.

          -v, --verbose
               Verbose input processing.

          -x, --nodups
               Do not allow duplicate metric names per PMID.

          -?, --help
               Display usage message and exit.


-------------------------------------------------------

::

          Once the writing of the new outfile file has begun, the signals
          SIGINT, SIGHUP and SIGTERM will be ignored to protect the
          integrity of the new file.


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

          pmnsadd(1), pmnsdel(1), pmLoadASCIINameSpace(3), pcp.conf(5),
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

   Performance Co-Pilot               PCP                      PMNSMERGE(1)

--------------

Pages that refer to this page: `pmnsadd(1) <../man1/pmnsadd.1.html>`__, 
`pmnscomp(1) <../man1/pmnscomp.1.html>`__, 
`pmnsdel(1) <../man1/pmnsdel.1.html>`__

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
