.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

pcp-kube-pods(1) — Linux manual page
====================================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
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

   PCP_KUBE_PODS(1)         General Commands Manual        PCP_KUBE_PODS(1)

NAME
-------------------------------------------------

::

          pcp-kube-pods - list Kubernetes pods to scan for running PCP
          services


---------------------------------------------------------

::

          $PCP_BINADM_DIR/discover/pcp-kube-pods


---------------------------------------------------------------

::

          pcp-kube-pods uses kubectl(1) to provide a list of IP addresses
          for PODs running in a local Kubenetes cluster, that may be
          running PCP services like pmcd(1) and pmproxy(1).

          It is used by the pmfind(1) command and the pmDiscoverServices(3)
          API as a ``shell'' command.

          The script invokes the kubectl get pod command line (see
          kubectl-get(1)) to discover IP addresses for pods.  The
          .status.podIP output field is extracted from the Kubernetes pod
          object(s).  Additional options can be specified via configuration
          file, such as -l service=database to restrict the results using
          Kubernetes pod labels.  The default configuration file is
          $PCP_SYSCONF_DIR/discover/pcp-kube-pods.conf.

          If no local kubectl command is found, nothing is reported and an
          exit code indicating success is returned.


---------------------------------------------------------------

::

          All diagnostics produced are provided by the kubectl command.

          The kubectl exit status is propogated unchanged.


---------------------------------------------------

::

          $PCP_BINADM_DIR/discover
               default path to address discovery commands like pcp-kube-
               pods

          $PCP_SYSCONF_DIR/discover/pcp-kube-pods.conf
               configuration file containing command line options passed to
               kubectl-get

          $PCP_SYSCONF_DIR/discover/pcp-kube-pods.disabled
               existence of this file causes the script to report nothing


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

          kubectl-get(1), kubectl(1), pmcd(1), pmfind(1),
          pmDiscoverServices(3) and pcp.env(5).

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

   Performance Co-Pilot               PCP                  PCP_KUBE_PODS(1)

--------------

Pages that refer to this page: `pmfind(1) <../man1/pmfind.1.html>`__, 
`pmdiscoverservices(3) <../man3/pmdiscoverservices.3.html>`__

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
