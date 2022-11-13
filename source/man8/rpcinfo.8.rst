.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

rpcinfo(8) — Linux manual page
==============================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `OPTIONS <#OPTIONS>`__ \|         |                                   |
| `EXAMPLES <#EXAMPLES>`__ \|       |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   RPCINFO(8)             BSD System Manager's Manual            RPCINFO(8)

NAME
-------------------------------------------------

::

        rpcinfo — report RPC information


---------------------------------------------------------

::

        rpcinfo [-m | -s] [host]
        rpcinfo -p [host]
        rpcinfo -T transport host prognum [versnum]
        rpcinfo -l [-T transport] host prognum versnum
        rpcinfo [-n portnum] -u host prognum [versnum]
        rpcinfo [-n portnum] [-t] host prognum [versnum]
        rpcinfo -a serv_address -T transport prognum [versnum]
        rpcinfo -b [-T transport] prognum versnum
        rpcinfo -d [-T transport] prognum versnum


---------------------------------------------------------------

::

        rpcinfo makes an RPC call to an RPC server and reports what it
        finds.

        In the first synopsis, rpcinfo lists all the registered RPC
        services with rpcbind on host.  If host is not specified, the local
        host is the default.  If -s is used, the information is displayed
        in a concise format.

        In the second synopsis, rpcinfo lists all the RPC services
        registered with rpcbind, version 2.  Also note that the format of
        the information is different in the first and the second synopsis.
        This is because the second synopsis is an older protocol used to
        collect the information displayed (version 2 of the rpcbind
        protocol).

        The third synopsis makes an RPC call to procedure 0 of prognum and
        versnum on the specified host and reports whether a response was
        received.  transport is the transport which has to be used for
        contacting the given service.  The remote address of the service is
        obtained by making a call to the remote rpcbind.

        The prognum argument is a number that represents an RPC program
        number.  If a versnum is specified, rpcinfo attempts to call that
        version of the specified prognum.  Otherwise, rpcinfo attempts to
        find all the registered version numbers for the specified prognum
        by calling version 0, which is presumed not to exist; if it does
        exist, rpcinfo attempts to obtain this information by calling an
        extremely high version number instead, and attempts to call each
        registered version.  Note: the version number is required for -b
        and -d options.


-------------------------------------------------------

::

        -T transport
                Specify the transport on which the service is required.  If
                this option is not specified, rpcinfo uses the transport
                specified in the NETPATH environment variable, or if that
                is unset or null, the transport in the netconfig(5)
                database is used.  This is a generic option, and can be
                used in conjunction with other options as shown in the
                SYNOPSIS.

        -a serv_address
                Use serv_address as the (universal) address for the service
                on transport to ping procedure 0 of the specified prognum
                and report whether a response was received.  The -T option
                is required with the -a option.

                If versnum is not specified, rpcinfo tries to ping all
                available version numbers for that program number.  This
                option avoids calls to remote rpcbind to find the address
                of the service.  The serv_address is specified in universal
                address format of the given transport.

        -b      Make an RPC broadcast to procedure 0 of the specified
                prognum and versnum and report all hosts that respond.  If
                transport is specified, it broadcasts its request only on
                the specified transport.  If broadcasting is not supported
                by any transport, an error message is printed.  Use of
                broadcasting should be limited because of the potential for
                adverse effect on other systems.

        -d      Delete registration for the RPC service of the specified
                prognum and versnum.  If transport is specified, unregister
                the service on only that transport, otherwise unregister
                the service on all the transports on which it was
                registered.  Only the owner of a service can delete a
                registration, except the super-user who can delete any
                service.

        -l      Display a list of entries with a given prognum and versnum
                on the specified host.  Entries are returned for all
                transports in the same protocol family as that used to
                contact the remote rpcbind.

        -m      Display a table of statistics of rpcbind operations on the
                given host.  The table shows statistics for each version of
                rpcbind (versions 2, 3 and 4), giving the number of times
                each procedure was requested and successfully serviced, the
                number and type of remote call requests that were made, and
                information about RPC address lookups that were handled.
                This is useful for monitoring RPC activities on host.

        -n portnum
                Use portnum as the port number for the -t and -u options
                instead of the port number given by rpcbind.  Use of this
                option avoids a call to the remote rpcbind to find out the
                address of the service. This option is made obsolete by the
                -a option.

        -p      Probe rpcbind on host using version 2 of the rpcbind
                protocol, and display a list of all registered RPC
                programs.  If host is not specified, it defaults to the
                local host.  Note: Version 2 of the rpcbind protocol was
                previously known as the portmapper protocol.

        -s      Display a concise list of all registered RPC programs on
                host.  If host is not specified, it defaults to the local
                host.

        -t      Make an RPC call to procedure 0 of prognum on the specified
                host using TCP, and report whether a response was received.
                This option is made obsolete by the -T option as shown in
                the third synopsis.

        -u      Make an RPC call to procedure 0 of prognum on the specified
                host using UDP, and report whether a response was received.
                This option is made obsolete by the -T option as shown in
                the third synopsis.


---------------------------------------------------------

::

        To show all of the RPC services registered on the local machine
        use:

                example% rpcinfo

        To show all of the RPC services registered with rpcbind on the
        machine named klaxon use:

                example% rpcinfo klaxon

        The information displayed by the above commands can be quite
        lengthy.  Use the -s option to display a more concise list:

                example$ rpcinfo -s klaxon

        program   version(s)                          netid(s)   service      owner
        100000    2,3,4     local,tcp,udp,tcp6,udp6   rpcbind    super-user
        100008    1         udp,tcp,udp6,tcp6         walld      super-user
        100002    2,1       udp,udp6                  rusersd    super-user
        100001    2,3,4     udp,udp6                  rstatd     super-user
        100012    1         udp,tcp                   sprayd     super-user
        100007    3         udp,tcp                   ypbind     super-user

        To show whether the RPC service with program number prognum and
        version versnum is registered on the machine named klaxon for the
        transport TCP use:

                example% rpcinfo -T tcp klaxon prognum versnum

        To show all RPC services registered with version 2 of the rpcbind
        protocol on the local machine use:

                example% rpcinfo -p

        To delete the registration for version 1 of the walld (program
        number 100008 ) service for all transports use:

                example# rpcinfo -d 100008 1

        or

                example# rpcinfo -d walld 1


---------------------------------------------------------

::

        rpc(3), netconfig(5), rpc(5), rpcbind(8)

COLOPHON
---------------------------------------------------------

::

        This page is part of the rpcbind (convert RPC numbers to universal
        addresses) project.  Information about the project can be found at
        http://sourceforge.net/projects/rpcbind/.  If you have a bug report
        for this manual page, see
        ⟨http://sourceforge.net/p/rpcbind/bugs/?source=navbar⟩.  This page
        was obtained from the project's upstream Git repository
        ⟨git://linux-nfs.org/~steved/rpcbind⟩ on 2021-08-27.  (At that
        time, the date of the most recent commit that was found in the
        repository was 2021-05-10.)  If you discover any rendering problems
        in this HTML version of the page, or you believe there is a better
        or more up-to-date source for the page, or you have corrections or
        improvements to the information in this COLOPHON (which is not part
        of the original manual page), send a mail to man-pages@man7.org

                                August 18, 1992

--------------

Pages that refer to this page:
`getrpcent(3) <../man3/getrpcent.3.html>`__

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
