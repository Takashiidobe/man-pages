.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

pmdalmsensors(1) — Linux manual page
====================================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `INSTALLATION <#INSTALLATION>`__  |                                   |
| \| `OPTIONS <#OPTIONS>`__ \|      |                                   |
| `FILES <#FILES>`__ \|             |                                   |
| `PCP                              |                                   |
| ENVIRONMENT <#PCP_ENVIRONMENT>`__ |                                   |
| \| `SEE ALSO <#SEE_ALSO>`__ \|    |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   PMDALMSENSORS(1)                                        PMDALMSENSORS(1)

NAME
-------------------------------------------------

::

          pmdalmsensors - Linux hardware monitoring performance metrics
          domain agent (PMDA)


---------------------------------------------------------

::

          $PCP_PMDAS_DIR/lmsensors/pmdalmsensors [debug]


---------------------------------------------------------------

::

          pmdalmsensors is a Performance Metrics Domain Agent (PMDA) which
          extracts performance metrics describing the state of hardware
          using the lm-sensors software on compatible motherboards.

          The lmsensors PMDA exports metrics that measure fan speeds and
          core temperatures.


-----------------------------------------------------------------

::

          If you want access to the names, help text and values for the
          lmsensors performance metrics, do the following as root:

               # cd $PCP_PMDAS_DIR/lmsensors
               # ./Install

          If you want to undo the installation, do the following as root:

               # cd $PCP_PMDAS_DIR/lmsensors
               # ./Remove

          pmdalmsensors.python is usually launched by pmcd (1), and not
          executed directly. Direct execution is mostly used for debugging
          purposes.

          The Install and Remove scripts notify pmcd (1) when the agent is
          installed or removed.


-------------------------------------------------------

::

          pmdalmsensors.python supports the following options.

          -i, --inject
                 inject data from file instead of using sensors

          -d, --debug
                 debug level: 0 (default), 1 or 2

          -h, --help
                 show a help message

                 To use options while pmdalmsensors.python is run from
                 PMCD, you might want to use 'args' in the 'Install'
                 stript, for example

                 args="-i /path/static_sensors_output.txt"


---------------------------------------------------

::

          $PCP_PMCDCONF_PATH
                 command line options used to launch pmdalmsensors
          $PCP_PMDAS_DIR/lmsensors/help
                 default help text file for the lmsensors metrics
          $PCP_PMDAS_DIR/lmsensors/Install
                 installation script for the pmdalmsensors agent
          $PCP_PMDAS_DIR/lmsensors/Remove
                 undo installation script for the pmdalmsensors agent


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

          PCPIntro(1), pmcd(1), pcp.conf(5), pcp.env(5) and sensors(1).

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

   Performance Co-Pilot               PCP                  PMDALMSENSORS(1)

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
