.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

pmdajson(1) — Linux manual page
===============================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `JSON DAT                         |                                   |
| A SOURCES <#JSON_DATA_SOURCES>`__ |                                   |
| \|                                |                                   |
| `SE                               |                                   |
| CURITY MODEL <#SECURITY_MODEL>`__ |                                   |
| \|                                |                                   |
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

   PMDAJSON(1)              General Commands Manual             PMDAJSON(1)

NAME
-------------------------------------------------

::

          pmdajson - JSON PMDA


---------------------------------------------------------------

::

          pmdajson is a Performance Metrics Domain Agent (PMDA) which
          exports metrics from arbitrary sources generating JavaScript
          Object Notation (JSON) syntax.

          At least one pair of JSON inputs are required for pmdajson to
          provide metrics for PCP clients; one describing metric metadata
          and one containing metric values data.  Metadata is read once
          from a file at PMDA startup while the data is read every time a
          request for metric values is made by a PCP client.  The data is
          read either from a JSON file or an external command generating
          JSON output.  More than one pair of JSON inputs can be used to
          support arbitrary number of metric sources in different
          configured directories.

          The overall JSON format description is at http://www.json.org/ .


---------------------------------------------------------------------------

::

          pmdajson reads a mandatory JSON configuration file

              • $PCP_PMDAS_DIR/json/config.json

          This file can contain the following PMDA options using the JSON
          syntax:

              • directory_list
              • trusted_directory_list

          pmdajson searches the directories listed for these options
          looking for files named metadata.json and (by default) data.json.
          The JSON metadata files describe the metric names, types, and
          other details of the associated JSON metric data.  The JSON data
          file name is configurable, and can also be an external command
          instead of a periodically updated (by external tools) data file.

          Each of these found JSON file/command pairs form a JSON data
          source.

          For example, let us assume the following simple JSON data file
          that contains values for two metrics, one of type string and one
          numeric:

            {
              "string_value": "testing, 1, 2, 3",
              "read_count": 0
            }

          For these metrics the metadata file needed by pmdajson would be:

            {
              "metrics": [
                {
                  "name": "string_value",
                  "pointer": "/string_value",
                  "type": "string"
                },
                {
                  "name": "read_count",
                  "pointer": "/read_count",
                  "type": "integer",
                  "description": "Times values read"
                }
              ]
            }

          For further details on the JSON metadata format and options, see
          the README file included as part of pmdajson installation.


---------------------------------------------------------------------

::

          JSON data sources listed for the directory_list option are not
          trusted, meaning that if external commands to generate the needed
          JSON data are used, these commands are run as user nobody.

          JSON data sources listed for the trusted_directory_list option
          are trusted, meaning that if external commands to generate the
          needed JSON data are used, these commands are run as user root.

          For further details on security and description on running
          external commands, see the README file included as part of
          pmdajson installation.


-----------------------------------------------------------------

::

          Install the JSON PMDA by using the Install script as root:

              # cd $PCP_PMDAS_DIR/json
              # ./Install

          To uninstall, do the following as root:

              # cd $PCP_PMDAS_DIR/json
              # ./Remove

          pmdajson is launched by pmcd(1) and should never be executed
          directly.  The Install and Remove scripts notify pmcd(1) when the
          agent is installed or removed.


---------------------------------------------------

::

          $PCP_PMDAS_DIR/json/README
                 additional documentation for pmdajson used JSON files

          $PCP_PMDAS_DIR/json/config.json
                 configuration file for the pmdajson agent

          $PCP_PMDAS_DIR/json/Install
                 installation script for the pmdajson agent

          $PCP_PMDAS_DIR/json/Remove
                 undo installation script for the pmdajson agent

          $PCP_LOG_DIR/pmcd/json.log
                 default log file for messages from the pmdajson agent


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

          PCPIntro(1), pmcd(1) and pminfo(1).

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

   Performance Co-Pilot               PCP                       PMDAJSON(1)

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
