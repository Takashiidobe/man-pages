.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

pmdacisco(1) — Linux manual page
================================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `INTERFACE IDENTIFICATI           |                                   |
| ON <#INTERFACE_IDENTIFICATION>`__ |                                   |
| \|                                |                                   |
| `HELPER                           |                                   |
|  UTILITIES <#HELPER_UTILITIES>`__ |                                   |
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

   PMDACISCO(1)             General Commands Manual            PMDACISCO(1)

NAME
-------------------------------------------------

::

          pmdacisco - Cisco router performance metrics domain agent (PMDA)


---------------------------------------------------------

::

          $PCP_PMDAS_DIR/cisco/pmdacisco [-d domain] [-l logfile] [-U
          username] [-P password] [-r refresh] [-s prompt] [-M username]
          [-x port] host:interface-spec [...]
          $PCP_PMDAS_DIR/cisco/parse [options] host:interface-spec [...]
          $PCP_PMDAS_DIR/cisco/probe [-P password] [-s prompt] [-U
          username] [-x port] host


---------------------------------------------------------------

::

          pmdacisco is a Performance Metrics Domain Agent (PMDA) which
          extracts performance metrics from one or more Cisco routers.

          A brief description of the pmdacisco command line options
          follows:

          -d   It is absolutely crucial that the performance metrics domain
               number specified here is unique and consistent.  That is,
               domain should be different for every PMDA on the one host,
               and the same domain number should be used for the same PMDA
               on all hosts.

          -l   Location of the log file.  By default, a log file named
               cisco.log is written in the current directory of pmcd(1)
               when pmdacisco is started, i.e.  $PCP_LOG_DIR/pmcd.  If the
               log file cannot be created or is not writable, output is
               written to the standard error instead.

          -P   By default, it is assumed that no user-level password is
               required to access the Cisco's telnet port.  If user-level
               passwords have been enabled on the Ciscos, then those
               passwords must be specified to pmdacisco.  If specified with
               the -P option, password will be used as the default user-
               level password for all Ciscos.  See also the INTERFACE
               IDENTIFICATION section below.

          -r   pmdacisco will refresh the current values for all
               performance metrics by contacting each Cisco router once
               every refresh seconds.  The default refresh is 120 seconds.

          -s   The Cisco command prompt ends with the string prompt.  The
               default value is ``>''.  The only way pmdacisco can
               synchronize the sending of commands and the parsing of
               output is by recognizing prompt as a unique string that
               comes at the end of all output, i.e. as the command prompt
               when waiting for the next command.

          -U   By default, it is assumed that no username login is required
               to access the Cisco's telnet port.  If username login has
               been enabled on the Ciscos, then the corresponding usernames
               must be specified to pmdacisco.  If specified with the -U
               option, username will be used as the default username login
               for all Ciscos.  See also the INTERFACE IDENTIFICATION
               section below.

          -M   User account under which to run the agent.  The default is
               the unprivileged "pcp" account in current versions of PCP,
               but in older versions the superuser account ("root") was
               used by default.

          -x   Connect to the Cisco via TCP port number port rather than
               the default 23 for a telnet connection.

          For each interface, once the telnet connection is established,
          pmdacisco is willing to wait up to 5 seconds for the Cisco to
          provide a new snapshot of the requested information.  If this
          does not happen, the telnet connection is broken and no values
          are returned.  This prevents pmdacisco tying up the Cisco's
          telnet ports waiting indefinitely when the response from the
          router is not what is expected, e.g. if the format of the ``show
          int'' output changes, or the command is in error because an
          interface is no longer configured on the router.


-----------------------------------------------------------------------------------------

::

          As each Cisco router can support multiple network interfaces
          and/or multiple communications protocols, it is necessary to tell
          pmdacisco which interfaces are to be monitored.

          The host:interface-spec arguments on the command line define a
          particular interface on a particular Cisco router.  host should
          be a hostname or a ``dot-notation'' IP address that identifies
          the telnet port of a particular Cisco router.  There are several
          components of the interface-spec as follows.

          protocol
                 One of the abbreviations a, B, E, e, f, G, h, s or Vl
                 respectively for ATM, BRI (ISDN), FastEthernet, Ethernet,
                 FDDI, GigabitEthernet, HSSI, serial or Vlan.

          interface
                 Depending on the model of the Cisco, this will either be
                 an integer, e.g. s0, or an integer followed by a slash
                 (``/'') followed by a subinterface identification in one
                 of a variety of syntactic forms, e.g. e1/0, G0/0/1 or
                 s4/2.1.

                 To discover the valid interfaces on a particular Cisco,
                 connect to the telnet port (using telnet(1)) and enter the
                 command "show int" and look for the interface identifiers
                 following the keywords ``Ethernet'', ``Fddi'', ``Serial'',
                 etc.

                 Alternatively run the probe command.

          username
                 If there is a username login, and it is different to the
                 default (see -U above), it may be optionally specified
                 here by appending ``@'' and the username to the end of
                 interface-spec.

          password
                 If there is a user-level password, and it is different to
                 the default (see -P above), it may be optionally specified
                 here by appending a question mark (``?'') and the password
                 to the end of interface-spec.

          prompt If the Cisco command prompt is different to the default
                 (see -s above), it may be optionally specified here by
                 appending an exclamation mark (``!'') and the prompt to
                 the end of interface-spec.

          The following are examples of valid interface-spec arguments.
                    my-router:e1/2
                    123.456.789.0:s0
                    wancisco:f2/3?trust_me
                    somecisco:G1/0!myprompt
                    cisco34.foo.bar.com:e2?way2cool
                    mycisco:s2/2.1@mylogin
                    yourcisco:E0/0@yourlogin?yourpassword
                    mycisco:E0/0@mylogin?mypassword!myprompt


-------------------------------------------------------------------------

::

          The probe command may be used to discover the names of all
          interfaces for a particular Cisco router identified by host.  The
          -P argument is the same as for pmdacisco.

          The parse command takes exactly the same arguments as pmdacisco,
          but executes outside the control of any pmcd(1) and so may be
          used to diagnose problems with handling a particular Cisco router
          and/or one of its interfaces.

          Additional diagnostic verbosity may be produced using the -D
          appl0,appl1,appl2 command line option.  appl0 logs connect and
          disconnect events, login progress, high-level flow of control and
          extracted statistics.  appl1 traces all commands sent to the
          Cisco device.  appl2 logs tokenizing and parsing of the output
          from the Cisco device.  Diagnostics are generated on standard
          error as each sample is fetched and parsed.


-----------------------------------------------------------------

::

          If you want access to the names, help text and values for the
          Cisco performance metrics, do the following as root:

               # cd $PCP_PMDAS_DIR/cisco
               # ./Install

          If you want to undo the installation, do the following as root:

               # cd $PCP_PMDAS_DIR/cisco
               # ./Remove

          pmdacisco is launched by pmcd(1) and should never be executed
          directly.  The Install and Remove scripts notify pmcd(1) when the
          agent is installed or removed.


---------------------------------------------------

::

          $PCP_PMCDCONF_PATH
                 command line options used to launch pmdacisco
          $PCP_PMDAS_DIR/cisco/help
                 default help text file for the Cisco metrics
          $PCP_PMDAS_DIR/cisco/Install
                 installation script for the pmdacisco agent
          $PCP_PMDAS_DIR/cisco/Remove
                 undo installation script for the pmdacisco agent
          $PCP_LOG_DIR/pmcd/cisco.log
                 default log file for error messages and other information
                 from pmdacisco


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

          pmcd(1), pcp.conf(5) and pcp.env(5).

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

   Performance Co-Pilot               PCP                      PMDACISCO(1)

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
