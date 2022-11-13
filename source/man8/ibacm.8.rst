.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

ibacm(8) — Linux manual page
============================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `OPTIONS <#OPTIONS>`__ \|         |                                   |
| `QUICK ST                         |                                   |
| ART GUIDE <#QUICK_START_GUIDE>`__ |                                   |
| \| `NOTES <#NOTES>`__ \|          |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   ibacm(8)                          ibacm                         ibacm(8)

NAME
-------------------------------------------------

::

          ibacm - address and route resolution services for InfiniBand.


---------------------------------------------------------

::

          ibacm [-D] [-P] [-A addr_file] [-O option_file]


---------------------------------------------------------------

::

          The IB ACM implements and provides a framework for name, address,
          and route (path) resolution services over InfiniBand.  It is
          intended to address connection setup scalability issues running
          MPI applications on large clusters.  The IB ACM provides
          information needed to establish a connection, but does not
          implement the CM protocol.

          A primary user of the ibacm service is the librdmacm library.
          This enables applications to make use of the ibacm service
          without code changes or needing to be aware that the service is
          in use.  librdmacm versions 1.0.12 - 1.0.15 can invoke IB ACM
          services when built using the --with-ib_acm option.  Version
          1.0.16 and newer of librdmacm will automatically use the IB ACM
          if it is installed.  The IB ACM services tie in under the
          rdma_resolve_addr, rdma_resolve_route, and rdma_getaddrinfo
          routines.  For maximum benefit, the rdma_getaddrinfo routine
          should be used, however existing applications should still see
          significant connection scaling benefits using the calls available
          in librdmacm 1.0.11 and previous releases.

          The IB ACM is focused on being scalable, efficient, and
          extensible.  It implements a plugin architecture that allows a
          vendor to supply its proprietary provider in addition to the
          default provider.  The current default provider implementation
          ibacmp limits network traffic, SA interactions, and centralized
          services.  Ibacmp supports multiple resolution protocols in order
          to handle different fabric topologies.

          The IB ACM package is comprised of three components: the ibacm
          core service, the default provider ibacmp shared library, and a
          test/configuration utility - ib_acme.  All three are userspace
          components and are available for Linux.  Additional details are
          given below.


-------------------------------------------------------

::

          -D     run in daemon mode (default)

          -P     run as standard process

          -A addr_file
                 address configuration file

          -O option_file
                 option configuration file

          --systemd
                 Enable systemd integration. This includes optional socket
                 activation of the daemon's listening socket.


---------------------------------------------------------------------------

::

          1. Prerequisites: libibverbs and libibumad must be installed.
          The IB stack should be running with IPoIB configured.  These
          steps assume that the user has administrative privileges.

          2. Install the IB ACM package.  This installs ibacm, ibacmp,
          ib_acme, and init.d scripts.

          3. Run 'ibacm' as administrator to start the ibacm daemon.

          4. Optionally, run 'ib_acme -d <dest_ip> -v' to verify that the
          ibacm service is running.

          5. Install librdmacm, using the build option --with-ib_acm if
          needed.  This build option is not needed with librdmacm 1.0.17 or
          newer.  The librdmacm will automatically use the ibacm service.
          On failures, the librdmacm will fall back to normal resolution.

          6. You can use ib_acme -P to gather performance statistics from
          the local ibacm daemon to see if the service is working
          correctly.  Similarly, the command ib_acme -e could be used to
          enumerate all endpoints created by the local ibacm service.


---------------------------------------------------

::

          ib_acme:

          The ib_acme program serves a dual role.  It acts as a utility to
          test ibacm operation and help verify if the ibacm service and
          selected protocol is usable for a given cluster configuration.
          Additionally, it automatically generates ibacm configuration
          files to assist with or eliminate manual setup.

          ibacm configuration files:

          The ibacm service relies on two configuration files.

          The ibacm_addr.cfg file contains name and address mappings for
          each IB <device, port, pkey> endpoint.  Although the names in the
          ibacm_addr.cfg file can be anything, ib_acme maps the host name
          to the IB endpoints.  IP addresses, on the other hand, are
          assigned dynamically.  If the address file cannot be found, the
          ibacm service will attempt to create one using default values.

          The ibacm_opts.cfg file provides a set of configurable options
          for the ibacm core service and default provider, such as timeout,
          number of retries, logging level, etc.  ib_acme generates the
          ibacm_opts.cfg file using static information.  If an option file
          cannot be found, ibacm will use default values.

          ibacm:

          The ibacm service is responsible for resolving names and
          addresses to InfiniBand path information and caching such data.
          It should execute with administrative privileges.

          The ibacm implements a client interface over TCP sockets, which
          is abstracted by the librdmacm library.  One or more providers
          can be loaded by the core service, depending on the
          configuration.  In the default provider ibacmp, one or more back-
          end protocols are used to satisfy user requests.  Although ibacmp
          supports standard SA path record queries on the back-end, it also
          supports a resolution protocol based on multicast traffic.  The
          latter is not usable on all fabric topologies, specifically ones
          that may not have reversible paths or fabrics using torus
          routing.  Users should use the ib_acme utility to verify that
          multicast protocol is usable before running other applications.

          Conceptually, the default provider ibacmp implements an ARP like
          protocol and either uses IB multicast records to construct path
          record data or queries the SA directly, depending on the selected
          route protocol.  By default, the ibacmp provider uses and caches
          SA path record queries.

          Specifically, all IB endpoints join a number of multicast groups.
          Multicast groups differ based on rates, mtu, sl, etc., and are
          prioritized.  All participating endpoints must be able to
          communicate on the lowest priority multicast group.  The ibacmp
          assigns one or more names/addresses to each IB endpoint using the
          ibacm_addr.cfg file.  Clients provide source and destination
          names or addresses as input to the service, and receive as output
          path record data.

          The service maps a client's source name/address to a local IB
          endpoint.  If the destination name/address is not cached locally
          in the default provider, it sends a multicast request out on the
          lowest priority multicast group on the local endpoint.  The
          request carries a list of multicast groups that the sender can
          use.  The recipient of the request selects the highest priority
          multicast group that it can use as well and returns that
          information directly to the sender.  The request data is cached
          by all endpoints that receive the multicast request message.  The
          source endpoint also caches the response and uses the multicast
          group that was selected to construct or obtain path record data,
          which is returned to the client.

          The current implementation of the provider ibacmp has several
          additional restrictions:

          - The ibacmp is limited in its handling of dynamic changes.
          ibacm must be stopped and restarted if a cluster is reconfigured.

          - Support for IPv6 has not been verified.

          - The number of multicast groups that an endpoint can support is
          limited to 2.

          The ibacmp contains several internal caches.  These include
          caches for GID and LID destination addresses.  These caches can
          be optionally preloaded. ibacm supports the OpenSM dump_pr plugin
          "full" PathRecord format which is used to preload these caches.
          The file format is specified in the ibacm_opts.cfg file via the
          route_preload setting which should be set to full_opensm_v1 for
          this file format.  Default format is none which does not preload
          these caches.  See dump_pr.notes.txt in dump_pr for more
          information on the full_opensm_v1 file format and how to
          configure OpenSM to generate this file.

          Additionally, the name, IPv4, and IPv6 caches can be be preloaded
          by using the addr_preload option.  The default is none which does
          not preload these caches. To preload these caches, set this
          option to acm_hosts and configure the addr_data_file
          appropriately.


---------------------------------------------------------

::

          ibacm(7), ib_acme(1), rdma_cm(7)

COLOPHON
---------------------------------------------------------

::

          This page is part of the rdma-core (RDMA Core Userspace Libraries
          and Daemons) project.  Information about the project can be found
          at ⟨https://github.com/linux-rdma/rdma-core⟩.  If you have a bug
          report for this manual page, send it to
          linux-rdma@vger.kernel.org.  This page was obtained from the
          project's upstream Git repository
          ⟨https://github.com/linux-rdma/rdma-core.git⟩ on 2021-08-27.  (At
          that time, the date of the most recent commit that was found in
          the repository was 2021-08-18.)  If you discover any rendering
          problems in this HTML version of the page, or you believe there
          is a better or more up-to-date source for the page, or you have
          corrections or improvements to the information in this COLOPHON
          (which is not part of the original manual page), send a mail to
          man-pages@man7.org

   ibacm                          2014-06-16                       ibacm(8)

--------------

Pages that refer to this page: `ib_acme(1) <../man1/ib_acme.1.html>`__, 
`ibacm(7) <../man7/ibacm.7.html>`__

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
