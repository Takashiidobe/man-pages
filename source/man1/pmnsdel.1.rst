.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

pmnsdel(1) — Linux manual page
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

   PMNSDEL(1)               General Commands Manual              PMNSDEL(1)

NAME
-------------------------------------------------

::

          pmnsdel - delete a subtree of names from the Performance Co-Pilot
          PMNS


---------------------------------------------------------

::

          $PCP_BINADM_DIR/pmnsdel [-?]  [-n namespace] metricpath [...]


---------------------------------------------------------------

::

          pmnsdel removes subtrees of names from a Performance Metrics Name
          Space (PMNS), as used by the components of the Performance Co-
          Pilot (PCP).

          Normally pmnsdel operates on the default Performance Metrics Name
          Space (PMNS), however if the -n option is specified an
          alternative namespace is used from the file namespace.

          The default PMNS is found in the file $PCP_VAR_DIR/pmns/root
          unless the environment variable PMNS_DEFAULT is set, in which
          case the value is assumed to be the pathname to the file
          containing the default PMNS.

          The metric names to be deleted are all those for which one of the
          metricpath arguments is a prefix in the PMNS, see PMNS(5).

          All of the files defining the PMNS must be located within the
          directory that contains the root of the PMNS, and this would
          typically be $PCP_VAR_DIR/pmns for the default PMNS, and this
          would typically imply running pmnsdel as root.

          Provided some initial integrity checks are satisfied, pmnsdel
          will update the necessary PMNS files.  Should an error be
          encountered the original namespace is restored.  Note that any
          PMNS files that are no longer referenced by the modified
          namespace will not be removed, even though their contents are not
          part of the new namespace.


-------------------------------------------------------

::

          The available command line options are:

          -n pmnsfile, --namespace=pmnsfile
               Load an alternative Performance Metrics Name Space (PMNS(5))
               from the file pmnsfile.

          -?, --help
               Display usage message and exit.


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

          pmnsadd(1), pmnsmerge(1), pcp.conf(5), pcp.env(5) and PMNS(5).

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

   Performance Co-Pilot               PCP                        PMNSDEL(1)

--------------

Pages that refer to this page: `pmnsadd(1) <../man1/pmnsadd.1.html>`__, 
`pmnscomp(1) <../man1/pmnscomp.1.html>`__, 
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
