.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

pmdasample(1) — Linux manual page
=================================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `INSTALLATION <#INSTALLATION>`__  |                                   |
| \| `FILES <#FILES>`__ \|          |                                   |
| `PCP                              |                                   |
| ENVIRONMENT <#PCP_ENVIRONMENT>`__ |                                   |
| \| `SEE ALSO <#SEE_ALSO>`__ \|    |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   PMDASAMPLE(1)            General Commands Manual           PMDASAMPLE(1)

NAME
-------------------------------------------------

::

          pmdasample - sample performance metrics domain agent (PMDA)


---------------------------------------------------------

::

          $PCP_PMDAS_DIR/pmdasample [-d domain] [-i port] [-l logfile] [-p]
          [-u socket] [-U username]


---------------------------------------------------------------

::

          pmdasample is a sample Performance Metrics Domain Agent (PMDA)
          which exports a variety of synthetic performance metrics.

          This PMDA was developed as part of the quality assurance testing
          for the PCP product, but has other uses, most notably in the
          development of new PCP clients.

          The metrics exported by the sample PMDA cover the full range of
          data types, data semantics, value cardinality, instance domain
          stability and error conditions found in real PMDAs.

          A brief description of the pmdasample command line options
          follows:

          -d   It is absolutely crucial that the performance metrics domain
               number specified here is unique and consistent.  That is,
               domain should be different for every PMDA on the one host,
               and the same domain number should be used for the same PMDA
               on all hosts.

          -i   Expect PMCD to connect to pmdasample on the specified TCP/IP
               port.  port may be a port number or port name.

          -l   Location of the log file.  By default, a log file named
               sample.log is written in the current directory of pmcd(1)
               when pmdasample is started, i.e.  $PCP_LOG_DIR/pmcd.  If the
               log file cannot be created or is not writable, output is
               written to the standard error instead.

          -p   Expect PMCD to create a pipe and the connection to
               pmdasample is via standard input and standard output.  This
               is the default connection mode.

          -u   Expect PMCD to connect to pmdasample on the Unix domain
               socket named socket.

          -U   User account under which to run the agent.  The default is
               the unprivileged "pcp" account in current versions of PCP,
               but in older versions the superuser account ("root") was
               used by default.

          At most one of the options -i, -p and -u may be specified.


-----------------------------------------------------------------

::

          If you want access to the names, help text and values for the
          sample performance metrics, do the following as root:

               # cd $PCP_PMDAS_DIR/sample
               # ./Install

          Note that the installation script also installs the DSO version
          of the sample PMDA, so there are in fact two PMDAs installed, and
          two sets of performance metrics, namely sample.*  and
          sampledso.*.

          If you want to undo the installation (and remove both PMDAs), do
          the following as root:

               # cd $PCP_PMDAS_DIR/sample
               # ./Remove

          pmdasample is launched by pmcd(1) and should never be executed
          directly.  The Install and Remove scripts notify pmcd(1) when the
          agent is installed or removed.


---------------------------------------------------

::

          $PCP_PMCDCONF_PATH
                 command line options used to launch pmdasample
          $PCP_PMDAS_DIR/sample/help
                 default help text file for the sample metrics
          $PCP_PMDAS_DIR/sample/Install
                 installation script for the pmdasample agent
          $PCP_PMDAS_DIR/sample/Remove
                 undo installation script for the pmdasample agent
          $PCP_LOG_DIR/pmcd/sample.log
                 default log file for error messages and other information
                 from pmdasample


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

          PCPIntro(1), pmcd(1), pmdasimple(1), pmdatrivial(1),
          pmdatxmon(1), pcp.conf(5) and pcp.env(5).

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

   Performance Co-Pilot               PCP                     PMDASAMPLE(1)

--------------

Pages that refer to this page:
`pmdasimple(1) <../man1/pmdasimple.1.html>`__, 
`pmdatrivial(1) <../man1/pmdatrivial.1.html>`__, 
`pmdatxmon(1) <../man1/pmdatxmon.1.html>`__, 
`pmlookuplabels(3) <../man3/pmlookuplabels.3.html>`__

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
