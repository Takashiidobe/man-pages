.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

stap-server(8) — Linux manual page
==================================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `ARGUMENTS <#ARGUMENTS>`__ \|     |                                   |
| `OPTIONS <#OPTIONS>`__ \|         |                                   |
| `                                 |                                   |
| CONFIGURATION <#CONFIGURATION>`__ |                                   |
| \|                                |                                   |
| `Global Configu                   |                                   |
| ration <#Global_Configuration>`__ |                                   |
| \|                                |                                   |
| `Ind                              |                                   |
| ividual Server Configuration <#In |                                   |
| dividual_Server_Configuration>`__ |                                   |
| \|                                |                                   |
| `SERVER AUTHENTIC                 |                                   |
| ATION <#SERVER_AUTHENTICATION>`__ |                                   |
| \| `EXAMPLES <#EXAMPLES>`__ \|    |                                   |
| `SAFETY AND S                     |                                   |
| ECURITY <#SAFETY_AND_SECURITY>`__ |                                   |
| \| `FILES <#FILES>`__ \|          |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `BUGS <#BUGS>`__ \|               |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   STAP-SERVER(8)           System Manager's Manual          STAP-SERVER(8)

NAME
-------------------------------------------------

::

          stap-server - systemtap compile server management


---------------------------------------------------------

::

          [ service ] stap-server { start | stop | restart | condrestart |
          try-restart | force-reload | status } [ options ]


---------------------------------------------------------------

::

          A systemtap compile server listens for connections from stap
          clients on a secure SSL network port and accepts requests to run
          the stap front end. Each server advertises its presence and
          configuration on the local network using mDNS (avahi) allowing
          for automatic detection by clients.

          The stap-server script aims to provide:

          •   management of systemtap compile servers as a service.

          •   convenient control over configured servers and individual
              (ad-hoc) servers.


-----------------------------------------------------------

::

          One of the actions below must be specified:

          start  Start servers. The specified servers are started.  If no
                 server is specified, the configured servers are started.
                 If no servers are configured, a server for the kernel
                 release and architecture of the host is started.  If a
                 specified server is already started, this action will be
                 ignored for that server. If a server fails to start, this
                 action fails.

          stop   Stop server(s). The specified servers are stopped.  If no
                 server is specified, all currently running servers are
                 stopped.  If a specified server is not running, this
                 action will be successful for that server. If a server
                 fails to stop, this action fails.

          restart
                 Stop and restart servers. The specified servers are
                 stopped and restarted.  If no server is specified, all
                 currently running servers are stopped and restarted. If no
                 servers are running, this action behaves like start.

          condrestart
                 Stop and restart servers. The specified servers are
                 stopped and restarted.  If a specified server is not
                 running, it is not started. If no server is specified, all
                 currently running servers are stopped and restarted.  If
                 no servers are running, none will be started.

          try-restart
                 This action is identical to condrestart.

          force-reload
                 Stop all running servers, reload config files and restart
                 the service as if start was specified.

          status Print information about running servers. Information about
                 the specified server(s) will be printed. If no server is
                 specified, information about all running servers will be
                 printed.


-------------------------------------------------------

::

          The following options are used to provide additional
          configuration and to specify servers to be managed:

          -c configfile
                 This option specifies a global configuration file in
                 addition to the default global configuration file
                 described below. This file will be processed after the
                 default global configuration file. If the -c option is
                 specified more than once, the last configuration file
                 specified will be used.

          -a architecture
                 This option specifies the target architecture of the
                 server and is analogous to the -a option of stap. See the
                 stap(1) manual page for more details.  The default
                 architecture is the architecture of the host.

          -r kernel-release
                 This option specifies a target kernel release of the
                 server and is analogous to the -r option of stap.  See the
                 stap(1) manual page for more details.  The default release
                 is that of the currently running kernel.  A server can
                 handle multiple releases by specifying multiple -r flags.

          -I path
                 This option specifies an additional path to be searched by
                 the server(s) for tapsets and is analogous to the -I
                 option of stap.  See the stap(1) manual page for more
                 details.

          -R path
                 This option specifies the location of the systemtap
                 runtime to be used by the server(s) and is analogous to
                 the -R option of stap.  See the stap(1) manual page for
                 more details.

          -B options
                 This option specifies options to be passed to make when
                 building systemtap modules and is analogous to the -B
                 option of stap.  See the stap(1) manual page for more
                 details.

          -i     This option is a shortcut which specifies a server that
                 handles every release installed in /lib/modules/.

          -n nickname
                 This option allows the specification of a server
                 configuration by nickname.  When -n is specified, a
                 currently running server with the given nickname will be
                 searched for. If no currently running server with the
                 given nickname is found, a server configuration with the
                 given nickname will be searched for in the configuration
                 files for default servers, or the path configured in the
                 global configuration file or the configuration file
                 specified by the -c option. If a server configuration for
                 the given nickname is found, the -a, -r, -I, -R, -B and -u
                 options for that server will be used as if they were
                 specified on the command line. If no configuration with
                 the given nickname is found, and the action is start (or
                 an action behaving like start (see ARGUMENTS), the server
                 will be started with the given nickname.  If no
                 configuration with the given nickname is found, and the
                 action is not start (or an action behaving like start), it
                 is an error. If a nickname is not specified for a server
                 which is being started, its nickname will be its process
                 id.

          -p pid This option allows the specification of a server
                 configuration by process id.  When -p is specified, a
                 currently running server with the given process id will be
                 searched for. If no such server is found, it is an error.
                 If a server with the given process id is found, the -a,
                 -r, -I, -R, -B and -u options for that server will be used
                 as if they were specified on the command line.

          -u user-name
                 Each systemtap compile server is normally run by the user
                 name stap-server (for the initscript) or as the user
                 invoking stap-server, unless otherwise configured (see
                 FILES). This option specifies the user name used to run
                 the server(s). The user name specified must be a member of
                 the group stap-server.

          --log logfile
                 This option allows the specification of a separate log
                 file for each server.  Each --log option is added to a
                 list which will be applied, in turn, to each server
                 specified. If more servers are specified than --log
                 options, the default log file (see FILES) will be used for
                 subsequent servers.

          --port port-number
                 This option allows the specification of a specific network
                 port for each server. Each --port option is added to a
                 list which will be applied, in turn, to each server
                 specified. If more servers are specified than --port
                 options, a randomly selected port is used for subsequent
                 servers.

          --ssl certificate-db-path
                 This option allows the specification of a separate NSS
                 certificate database for each server. Each --ssl option is
                 added to a list which will be applied, in turn, to each
                 server specified. If more servers are specified than --ssl
                 options, the default certificate database (see FILES) for
                 subsequent servers.

          --max-threads threads
                 This option allows the specification of the maximum number
                 of worker threads to handle concurrent requests. If
                 threads == 0, each request will be handled on the main
                 thread, serially.  The default is the number of available
                 processor cores.

          --max-request-size size
                 This options allows the specification of the maximum size
                 of an uncompressed client request. The arguement size is
                 specified in bytes. The default is the 50000 bytes.

          --max-compressed-request size
                 This options allows the specification of the maximum size
                 of a compressed client request. The arguement size is
                 specified in bytes. The default is the 5000 bytes.


-------------------------------------------------------------------

::

          Configuration files allow us to:

          •   specify global configuration of logging, server configuration
              files, status files and other global parameters.

          •   specify which servers are to be started by default.


---------------------------------------------------------------------------------

::

          The Global Configuration file contains variable assignments used
          to configure the overall operation of the service.  Each line
          beginning with a '#' character is ignored. All other lines must
          be of the form VARIABLE=VALUE. This is not a shell script. The
          entire contents of the line after the = will be assigned as-is to
          the variable.

          The following variables may be assigned:

          CONFIG_PATH
                 Specifies the absolute path of the directory containing
                 the default server configurations.

          STAT_PATH
                 Specifies the absolute path of the running server status
                 directory.

          LOG_FILE
                 Specifies the absolute path of the log file.

          STAP_USER
                 Specifies the userid which will be used to run the
                 server(s) (default: for the initscript stap-server,
                 otherwise the user running stap-server).

          Here is an example of a Global Configuration file:

                 CONFIG_PATH=~<user>/my-stap-server-configs
                 LOG_FILE=/tmp/stap-server/log


-------------------------------------------------------------------------------------------------------

::

          Each server configuration file configures a server to be started
          when no server is specified for the start action, or an action
          behaving like the start action (see ARGUMENTS). Each
          configuration file contains variable assignments used to
          configure an individual server.

          Each line beginning with a '#' character is ignored. All other
          lines must be of the form VARIABLE=VALUE. This is not a shell
          script. The entire contents of the line after the = will be
          assigned as-is to the variable.

          Each configuration file must have a filename suffix of .conf. See
          stappaths(7) for the default location of these files.  This
          default location can be overridden in the global configuration
          file using the -c option (see OPTIONS).

          The following variables may be assigned:

          ARCH   Specifies the target architecture for this server and
                 corresponds to the -a option (see OPTIONS). If ARCH is not
                 set, the architecture of the host will be used.

          RELEASE
                 Specifies a kernel release for this server and corresponds
                 to the -r option (see OPTIONS). If RELEASE is not set, the
                 release of the kernel running on the host will be used.

          BUILD  Specifies options to be passed to the make process used by
                 systemtap to build kernel modules.  This an array variable
                 with each element corresponding to a -B option (see
                 OPTIONS). Using the form BUILD=STRING clears the array and
                 sets the first element to STRING. Using the form
                 BUILD+=STRING adds STRING as an additional element to the
                 array.

          INCLUDE
                 Specifies a list of directories to be searched by the
                 server for tapsets.  This is an array variable with each
                 element corresponding to a -I option (see OPTIONS). Using
                 the form INCLUDE=PATH clears the array and sets the first
                 element to PATH. Using the form INCLUDE+=PATH adds PATH as
                 an additional element to the array.

          RUNTIME
                 Specifies the directory which contains the systemtap
                 runtime code to be used by this server and corresponds to
                 the -R option (see OPTIONS).

          USER   Specifies the user name to be used to run this server and
                 corresponds to the -u option (see OPTIONS).

          NICKNAME
                 Specifies the nickname to be used to refer to this server
                 and corresponds to the -n option (see OPTIONS).

          LOG    Specifies the location of the log file to be used by this
                 server and corresponds to the --log option (see OPTIONS).

          PORT   Specifies the network port to be used by this server and
                 corresponds to the --port option (see OPTIONS).

          SSL    Specifies the location of the NSS certificate database to
                 be used by this server and corresponds to the --ssl option
                 (see OPTIONS).

          MAXTHREADS
                 Specifies the maximum number of worker threads to handle
                 concurrent requests to be used by this server and
                 corresponds to the --max-threads option (see OPTIONS).

          MAXREQSIZE
                 Specifies the maximum size of an uncompressed client
                 request, to be used by this server and correspnds to the
                 --max-request-size option (see OPTIONS).

          MAXCOMPRESSEDREQ
                 Specifies the maximum size of an compressed client
                 request, to be used by this server and correspnds to the
                 --max-compressed-request option (see OPTIONS).

          Here is an example of a server configuration file:

                 ARCH=
                 USER=
                 RELEASE=
                 NICKNAME=native

          By keeping the ARCH, USER, and RELEASE fields blank, they will
          default to the current arch and release and use the default user.

          A more specific example:

                 ARCH=i386
                 RELEASE=2.6.18-128.el5
                 PORT=5001
                 LOG=/path/to/log/file

          And here is a more complicated example:

                 USER=serveruser
                 RELEASE=/kernels/2.6.18-92.1.18.el5/build
                 INCLUDE=/mytapsets
                 INCLUDE+=/yourtapsets
                 BUILD='VARIABLE1=VALUE1 VARIABLE2=VALUE2'
                 DEFINE=STP_MAXMEMORY=1024
                 DEFINE+=DEBUG_TRANS
                 RUNTIME=/myruntime
                 NICKNAME=my-server
                 SSL=/path/to/NSS/certificate/database


-----------------------------------------------------------------------------------

::

          The security of the SSL network connection between the client and
          server depends on the proper management of server certificates.

          The trustworthiness of a given systemtap compile server can not
          be determined automatically without a trusted certificate
          authority issuing systemtap compile server certificates. This is
          not practical in everyday use and so, clients must authenticate
          servers against their own database of trusted server
          certificates. In this context, establishing a given server as
          trusted by a given client means adding that server's certificate
          to the client's database of trusted servers.

          For the stap-server initscript, on the local host, this is
          handled automatically.  When the systemtap-server package is
          installed, the server's certificate for the default user
          (stap-server) is automatically generated and installed. This
          means that servers started by the stap-server initscript, with
          the default user, are automatically trusted by clients on the
          local host, both as an SSL peer and as a systemtap module signer.

          Furthermore, when stap is invoked by an unprivileged user (not
          root, not a member of the group stapdev, but a member of the
          group stapusr and possibly the group stapsys), the options
          --use-server and --privilege are automatically added to the
          specified options.  This means that unprivileged users on the
          local host can use a server on the local host in unprivileged
          mode with no further setup or options required. Normal users
          (those in none of the SystemTap groups) can also use compile-
          servers through the --use-server and --privilege options. But
          they will of course be unable to load the module (the -p4 option
          can be used to stop short of loading).

          In order to use a server running on another host, that server's
          certificate must be installed on the client's host.  See the
          --trust-servers option in the stap(1) manual page for more
          details and README.unprivileged in the systemtap sources for more
          details.


---------------------------------------------------------

::

          See the stapex(3stap) manual page for a collection of sample
          systemtap scripts.

          To start the configured servers, or the default server, if none
          are configured:

           $ [ service ] stap-server start

          To start a server that handles all kernel versions installed in
          /lib/modules:

           $ [ service ] stap-server start -i

          To obtain information about the running server(s):

           $ [ service ] stap-server status

          To start a server like another one, except targeting a different
          architecture, by referencing the first server's nickname:

           $ [ service ] stap-server start -n NICKNAME -a ARCH

          To start a server for a kernel release not installed (cross-
          compiling)

           $ [ service ] stap-server start -a ARCH -r /BUILDDIR

          To stop one of the servers by referencing its process id
          (obtained by running stap-server status):

           $ [ service ] stap-server stop -p PID

          To run a script using a compile server:

           $ stap SCRIPT --use-server

          To run a script as an unprivileged user using a compile server:

           $ stap SCRIPT

          To stop all running servers:

           $ [ service ] stap-server stop

          To restart servers after a global configuration change and/or
          when default servers have been added, changed, or removed:

           $ [ service ] stap-server force-reload


-------------------------------------------------------------------------------

::

          Systemtap is an administrative tool.  It exposes kernel internal
          data structures and potentially private user information.  See
          the stap(1) manual page for additional information on safety and
          security.

          As a network server, stap-server should be activated with care in
          order to limit the potential effects of bugs or mischevious
          users.  Consider the following prophylactic measures.

          1      Run stap-server as an unprivileged user, never as root.

                 When invoked as a service (i.e. service stap-server ...),
                 each server is run, by default, as the user stap-server.
                 When invoked directly (i.e. stap-server ...), each server
                 is run, by default, as the invoking user. In each case,
                 another user may be selected by using the -u option on
                 invocation, by specifying STAP_USER=username in the global
                 configuration file or by specifying USER=username in an
                 individual server configuration file. The invoking user
                 must have authority to run processes as another user.  See
                 CONFIGURATION.

                 The selected user must have write access to the server log
                 file.  The location of the server log file may be changed
                 by setting LOG_FILE=path in the global configuration file.
                 See CONFIGURATION.

                 The selected user must have read/write access to the
                 directory containing the server status files.  The
                 location of the server status files may be changed by
                 setting STAT_PATH=path in the global configuration file.
                 See CONFIGURATION.

                 The selected user must have read/write access to the
                 uprobes.ko build directory and its files.

                 Neither form of stap-server will run if the selected user
                 is root.

          2      Run stap-server requests with resource limits that impose
                 maximum cpu time, file size, memory consumption, in order
                 to bound the effects of processing excessively large or
                 bogus inputs.

                 When the user running the server is stap-server, each
                 server request is run with limits specified in ~stap-
                 server/.systemtap/rc otherwise, no limits are imposed.

          3      Run stap-server with a TMPDIR environment variable that
                 points to a separate and/or quota-enforced directory, in
                 order to prevent filling up of important filesystems.

                 The default TMPDIR is /tmp/.

          4      Activate network firewalls to limit stap client
                 connections to relatively trustworthy networks.

                 For automatic selection of servers by clients, avahi must
                 be installed on both the server and client hosts and mDNS
                 messages must be allowed through the firewall.

          The systemtap compile server and its related utilities use the
          Secure Socket Layer (SSL) as implemented by Network Security
          Services (NSS) for network security. NSS is also used for the
          generation and management of certificates. The related
          certificate databases must be protected in order to maintain the
          security of the system.  Use of the utilities provided will help
          to ensure that the proper protection is maintained. The systemtap
          client will check for proper access permissions before making use
          of any certificate database.


---------------------------------------------------

::

          Important files and their corresponding paths can be located in
          the
                 stappaths (7) manual page.


---------------------------------------------------------

::

          stap(1),
          staprun(8),
          stapprobes(3stap),
          stappaths(7),
          stapex(3stap),
          avahi,
          ulimit(1),
          NSS


-------------------------------------------------

::

          Use the Bugzilla link of the project web page or our mailing
          list.  http://sourceware.org/systemtap/ ,
          <systemtap@sourceware.org>.

COLOPHON
---------------------------------------------------------

::

          This page is part of the systemtap (a tracing and live-system
          analysis tool) project.  Information about the project can be
          found at ⟨https://sourceware.org/systemtap/⟩.  If you have a bug
          report for this manual page, send it to systemtap@sourceware.org.
          This page was obtained from the project's upstream Git repository
          ⟨git://sourceware.org/git/systemtap.git⟩ on 2021-08-27.  (At that
          time, the date of the most recent commit that was found in the
          repository was 2021-08-26.)  If you discover any rendering
          problems in this HTML version of the page, or you believe there
          is a better or more up-to-date source for the page, or you have
          corrections or improvements to the information in this COLOPHON
          (which is not part of the original manual page), send a mail to
          man-pages@man7.org

                                                             STAP-SERVER(8)

--------------

Pages that refer to this page: `stap(1) <../man1/stap.1.html>`__, 
`stap-merge(1) <../man1/stap-merge.1.html>`__, 
`stappaths(7) <../man7/stappaths.7.html>`__, 
`warning::debuginfo(7stap) <../man7/warning::debuginfo.7stap.html>`__, 
`stapdyn(8) <../man8/stapdyn.8.html>`__, 
`staprun(8) <../man8/staprun.8.html>`__

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
