.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

pmdiscoverservices(3) — Linux manual page
=========================================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `C SYNOPSIS <#C_SYNOPSIS>`__ \|   |                                   |
| `CAVEAT <#CAVEAT>`__ \|           |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `PCP                              |                                   |
| ENVIRONMENT <#PCP_ENVIRONMENT>`__ |                                   |
| \| `DIAGNOSTICS <#DIAGNOSTICS>`__ |                                   |
| \| `SEE ALSO <#SEE_ALSO>`__ \|    |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   PMDISCOVERSERVICES(3)   Library Functions Manual   PMDISCOVERSERVICES(3)

NAME
-------------------------------------------------

::

          pmDiscoverServices, __pmDiscoverServicesWithOptions - discover
          PCP services on the network


-------------------------------------------------------------

::

          #include <pcp/pmapi.h>

          int pmDiscoverServices(const char *service, const char *mechanism, char ***urls);

          #include <pcp/libpcp.h>

          int __pmDiscoverServicesWithOptions(const char *service, const char *mechanism, const char *optionsString, const volatile unsigned *flags, char ***urls);

          cc ... -lpcp


-----------------------------------------------------

::

          This documentation is intended for internal Performance Co-Pilot
          (PCP) developer use.

          These interfaces are not part of the PCP APIs that are guaranteed
          to remain fixed across releases, and they may not work, or may
          provide different semantics at some point in the future.


---------------------------------------------------------------

::

          Given a PCP service name, as identified by service, and using the
          type of discovery optionally specified in mechanism,
          pmDiscoverServices returns, via urls, a list of URLs representing
          the services discovered on the network.

          The internal function __pmDiscoverServicesWithOptions performs
          the same function and adds arguments for global options and a
          mechanism for interrupting the discovery process.

          The pmfind(1) utility provides command line access to both of
          these interfaces.

          Calling

          pmDiscoverServices(service, mechanism, urls)

          is equivalent to calling

          __pmDiscoverServicesWithOptions(service, mechanism, NULL, NULL,
          urls);

          service specifies the PCP service to be discovered.  Currently
          supported services are PM_SERVER_SERVICE_SPEC and
          PM_PROXY_SERVICE_SPEC which search for pmcd(1), and pmproxy(1)
          servers respectively.

          mechanism specifies the style of discovery to be used.

          The currently supported mechanisms are:

          avahi  This searches for services which are broadcasting using
                 mDNS via avahi-daemon(8).  An optional suffix ",timeout=N"
                 may be added to specify the discovery timeout in floating-
                 point multiples of one second.  The default timeout is 0.5
                 seconds, which may be overridden by the
                 AVAHI_DISCOVERY_TIMEOUT environment variable, also
                 specified in floating-point multiples of one second.  If
                 both are specified, then the value specified in the
                 environment variable takes precedence.

          probe=<net-address>/<mask-bits>
                 Actively probes the given subnet for the requested PCP
                 service(s).  <net-address> is an inet or ipv6 network
                 address and <mask-bits> is the number of bits used to
                 define the subnet.  For example, 192.168.1.0/24 defines an
                 8 bit subnet consisting of the addresses 192.168.1.0
                 through 192.168.1.255.  An optional suffix ",maxThreads=N"
                 may be added to limit the number of threads used while
                 probing.  The default is the value of FD_SETSIZE (which is
                 typically 1024) or the number of addresses in the subnet,
                 whichever is less.  An optional suffix ",timeout=N" may be
                 added to specify the timeout for each connection attempt
                 in floating-point multiples of one second.  The default is
                 0.02 seconds (20 milliseconds).

          shell  Probes the list of addresses provided by scripts for
                 requested PCP service(s).  Several optional, comma-
                 separated parameters can also be provided.  Firstly, the
                 "path=DIR" option specifies the directory where commands
                 like pcp-kube-pods(1) are located (defaults to
                 $PCP_BINADM_DIR/discover/).  This setting can be further
                 restricted to an individual command using the command=CMD
                 option, but the default is to use all available commands
                 from the path.  The "maxThreads=N" option limits the
                 number of threads used while probing.  The default is the
                 value of FD_SETSIZE (which is typically 1024) or the
                 number of addresses returned by the scripts, whichever is
                 less.  The "timeout=N" option may be added to limit the
                 amount of time spent waiting for each connection attempt.
                 N is a floating point number specifying the number of
                 seconds to wait.  The default is 0.02 seconds (20
                 milliseconds).

          mechanism may also be NULL, which means to use all available
          discovery mechanisms.

          For __pmDiscoverServicesWithOptions, optionsString specifies
          global options to be applied to the discovery process.  Options
          are comma-separated and may be one or more of the following:

          resolve
                 This requests that DNS name resolution be attempted for
                 the addresses of any discovered services.

          timeout=N
                 This specifies a timeout period after which the discovery
                 process will be interrupted.  N is a floating point number
                 representing the number of seconds before timing out.

          optionsString may also be NULL, which means that no global
          options are specified.

          For __pmDiscoverServicesWithOptions, flags specifies a pointer to
          an object of type unsigned which is a bit mask of options/status
          flags for the discovery process.  The supported flags are:

          PM_SERVICE_DISCOVERY_RESOLVE
                 Specifying this flag is equivalent to specifying resolve
                 in the optionsString

          PM_SERVICE_DISCOVERY_INTERRUPTED
                 This flag must be unset when calling
                 __pmDiscoverServicesWithOptions but may be set
                 asynchronously (by an interrupt handler, for example) in
                 order to interrupt the service discovery process.

          flags may also be NULL, which indicates that no flags are set.

          pmDiscoverServices and __pmDiscoverServicesWithOptions will
          return the number of services discovered, else a value less than
          zero for an error.  The value zero indicates that no services
          were discovered.

          The resulting list of pointers, urls, and the values (the URLs)
          that the pointers reference will have been allocated by
          pmDiscoverServices or __pmDiscoverServicesWithOptions with a
          single call to malloc(3), and it is the responsibility of the
          pmDiscoverServices or __pmDiscoverServicesWithOptions caller to
          free(urls) to release the space when it is no longer required.

          When an error occurs, or no services are discovered, urls is
          undefined (no space will have been allocated, and so calling
          free(3) is a singularly bad idea).


-----------------------------------------------------------------------

::

          Environment variables with the prefix PCP_ are used to
          parameterize the file and directory names used by PCP.  On each
          installation, the file /etc/pcp.conf contains the local values
          for these variables.  The $PCP_CONF variable may be used to
          specify an alternative configuration file, as described in
          pcp.conf(5).  Values for these variables may be obtained
          programmatically using the pmGetConfig(3) function.


---------------------------------------------------------------

::

          -EINVAL
                 An invalid argument has been specified.

          -ENOMEM
                 Unable to allocate memory required to process the request.

          -EOPNOTSUPP
                 The specified mechanism is not supported.


---------------------------------------------------------

::

          pmcd(1), pmfind(1), pmproxy(1), pcp-kube-pods(1), PMAPI(3),
          pmGetConfig(3), pcp.conf(5), pcp.env(5) and avahi-daemon(8).

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

   Performance Co-Pilot               PCP             PMDISCOVERSERVICES(3)

--------------

Pages that refer to this page:
`pcp-kube-pods(1) <../man1/pcp-kube-pods.1.html>`__, 
`pmfind(1) <../man1/pmfind.1.html>`__

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
