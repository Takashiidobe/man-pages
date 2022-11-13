.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

pmdaib(1) — Linux manual page
=============================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSYS <#SYNOPSYS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `CONFIG FILE <#CONFIG_FILE>`__ \| |                                   |
| `                                 |                                   |
| LOCAL CONTEXT <#LOCAL_CONTEXT>`__ |                                   |
| \| `SEE ALSO <#SEE_ALSO>`__ \|    |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   PMDAIB(1)                General Commands Manual               PMDAIB(1)

NAME
-------------------------------------------------

::

          pmdaib - Infiniband performance metrics domain agent (PMDA)


---------------------------------------------------------

::

          $PCP_PMDAS_DIR/infiniband/pmdaib [-c configFile] [-D debug] [-d
          domain] [-l logfile] [-w]


---------------------------------------------------------------

::

          pmdaib is a Performance Metrics Domain Agent (PMDA) which exports
          information and performance metrics about local Infiniband HCAs
          and local or remote Infiniband GUIDs.

          A brief description of the pmdaib command line options follows:

          -c   Location of the config file.  By default, the config file is
               named $PCP_PMDAS_DIR/infiniband/config.  See CONFIG FILE for
               more information.

          -D   A debug values, as specified by pmdbg(1)

          -d   Specify an alternate performance metrics domain number.
               Almost never necessary.

          -l   Location of the log file.  By default, a log file named
               ib.log is written to $PCP_LOG_DIR/pmcd.  If the log file
               cannot be created or is not writable, output is written to
               the standard error instead.

          -w   Write out the default config file to
               $PCP_PMDAS_DIRS/infiniband and exit immediately.  The
               written config file will contain the local HCA ports.  It
               will not overwrite an existing file.  This argument should
               only be used to create the template config file and should
               never appear in pmcd.conf.  See CONFIG FILE for more
               information on the file format and on monitoring remote
               GUIDs.


---------------------------------------------------------------

::

          By default, the PMDA will operate without using a config file.
          In this mode of operation the local HCA ports will be monitored.
          Note that if a new HCA is added to the machine that instance
          domain naming may change because it will always be based on the
          kernel's naming.

          In cases where this is not acceptable, or in the case where
          monitoring remote Infiniband ports is required, a config file
          must be created.  A "template" file can be created by running the
          pmdaib daemon with the -w argument.  This will create a config
          file with the local ports and GUIDs.

          If the config file is executable then it will be run and the
          output will be used as the config file.

          The config file is composed of line-based records.  Blank lines
          and everything after the hash (#) character are ignored.  Each
          line has 6 fields:

          [instName] [portGUID] [portNum] via
          [localPortName]:[localPortNum]

          The first field is used to give a static instance name to the
          Infiniband port that has a specific GUID.  All of the other
          fields must be properly specified in order to monitor a
          particular port.

          For example, to monitor port 1 of the local HCA called 'mthca0' a
          possible config file line would be:

          myPort1 0xdeadbeef01234567 1 via mthca0:1

          Remote ports can be easily monitored by specifying the GUID of
          the HCA or switch and specifying the remote port number.  The
          localPortName:localPortNum tuple specifies which local HCA and
          port to use as the "first hop" in contacting the remote GUID.
          E.g., to monitor port 13 of a remote switch which is connected to
          the fabric on the first port of the second HCA:

          switch13 0xfeeffeefabcdabcd 13 via mthca1:1


-------------------------------------------------------------------

::

          The Infiniband pmda also supports accessing the metrics via
          PM_CONTEXT_LOCAL when using the PMAPI interface.  In order to use
          the Infiniband pmda in this way, set the environment variable
          PMDA_LOCAL_IB prior to calling pmNewContext(3).


---------------------------------------------------------

::

          PCPIntro(1), pmcd(1), PMAPI(3), pmContextNew(3) and
          ibnetdiscover(8).

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

   Performance Co-Pilot               PCP                         PMDAIB(1)

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
