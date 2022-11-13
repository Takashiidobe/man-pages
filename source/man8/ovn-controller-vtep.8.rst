.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

ovn-controller-vtep(8) — Linux manual page
==========================================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `                                 |                                   |
| CONFIGURATION <#CONFIGURATION>`__ |                                   |
| \| `COLOPHON <#COLOPHON>`__       |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   ovn-controller-vtep(8)     Open vSwitch Manual    ovn-controller-vtep(8)

NAME
-------------------------------------------------

::

          ovn-controller-vtep - Open Virtual Network local controller for
          vtep enabled physical switches.


---------------------------------------------------------

::

          ovn-controller-vtep [options] [--vtep-db=vtep-database] [--ovnsb-
          db=ovnsb-database]


---------------------------------------------------------------

::

          ovn-controller-vtep is the local controller daemon in OVN, the
          Open Virtual Network, for VTEP enabled physical switches. It
          connects up to the OVN Southbound database (see ovn-sb(5)) over
          the OVSDB protocol, and down to the VTEP database (see vtep(5))
          over the OVSDB protocol.

      PKI Options
          PKI configuration is required in order to use SSL for the
          connections to the VTEP and Southbound databases.

                 -p privkey.pem
                 --private-key=privkey.pem
                      Specifies a PEM file containing the private key used
                      as identity for outgoing SSL connections.

                 -c cert.pem
                 --certificate=cert.pem
                      Specifies a PEM file containing a certificate that
                      certifies the private key specified on -p or
                      --private-key to be trustworthy. The certificate must
                      be signed by the certificate authority (CA) that the
                      peer in SSL connections will use to verify it.

                 -C cacert.pem
                 --ca-cert=cacert.pem
                      Specifies a PEM file containing the CA certificate
                      for verifying certificates presented to this program
                      by SSL peers. (This may be the same certificate that
                      SSL peers use to verify the certificate specified on
                      -c or --certificate, or it may be a different one,
                      depending on the PKI design in use.)

                 -C none
                 --ca-cert=none
                      Disables verification of certificates presented by
                      SSL peers. This introduces a security risk, because
                      it means that certificates cannot be verified to be
                      those of known trusted hosts.

                 --bootstrap-ca-cert=cacert.pem
                        When cacert.pem exists, this option has the same
                        effect as -C or --ca-cert. If it does not exist,
                        then the executable will attempt to obtain the CA
                        certificate from the SSL peer on its first SSL
                        connection and save it to the named PEM file. If it
                        is successful, it will immediately drop the
                        connection and reconnect, and from then on all SSL
                        connections must be authenticated by a certificate
                        signed by the CA certificate thus obtained.

                        This option exposes the SSL connection to a man-in-
                        the-middle attack obtaining the initial CA
                        certificate, but it may be useful for
                        bootstrapping.

                        This option is only useful if the SSL peer sends
                        its CA certificate as part of the SSL certificate
                        chain. The SSL protocol does not require the server
                        to send the CA certificate.

                        This option is mutually exclusive with -C and
                        --ca-cert.

                 --peer-ca-cert=peer-cacert.pem
                        Specifies a PEM file that contains one or more
                        additional certificates to send to SSL peers. peer-
                        cacert.pem should be the CA certificate used to
                        sign the program’s own certificate, that is, the
                        certificate specified on -c or --certificate. If
                        the program’s certificate is self-signed, then
                        --certificate and --peer-ca-cert should specify the
                        same file.

                        This option is not useful in normal operation,
                        because the SSL peer must already have the CA
                        certificate for the peer to have any confidence in
                        the program’s identity. However, this offers a way
                        for a new installation to bootstrap the CA
                        certificate on its first SSL connection.


-------------------------------------------------------------------

::

          ovn-controller-vtep retrieves its configuration information from
          both the ovnsb and the vtep database. If the database locations
          are not given from command line, the default is the db.sock in
          local OVSDB’s ’run’ directory. The datapath location must take
          one of the following forms:

                 •      ssl:host:port

                        The specified SSL port on the give host, which can
                        either be a DNS name (if built with unbound
                        library) or an IP address (IPv4 or IPv6). If host
                        is an IPv6 address, then wrap host with square
                        brackets, e.g.: ssl:[::1]:6640. The --private-key,
                        --certificate and either of --ca-cert or
                        --bootstrap-ca-cert options are mandatory when this
                        form is used.

                 •      tcp:host:port

                        Connect to the given TCP port on host, where host
                        can be a DNS name (if built with unbound library)
                        or IP address (IPv4 or IPv6). If host is an IPv6
                        address, then wrap host with square brackets, e.g.:
                        tcp:[::1]:6640.

                 •      unix:file

                        On POSIX, connect to the Unix domain server socket
                        named file.

                        On Windows, connect to a localhost TCP port whose
                        value is written in file.

COLOPHON
---------------------------------------------------------

::

          This page is part of the Open vSwitch (a distributed virtual
          multilayer switch) project.  Information about the project can be
          found at ⟨http://openvswitch.org/⟩.  If you have a bug report for
          this manual page, send it to bugs@openvswitch.org.  This page was
          obtained from the project's upstream Git repository
          ⟨https://github.com/openvswitch/ovs.git⟩ on 2021-08-27.  (At that
          time, the date of the most recent commit that was found in the
          repository was 2021-08-20.)  If you discover any rendering
          problems in this HTML version of the page, or you believe there
          is a better or more up-to-date source for the page, or you have
          corrections or improvements to the information in this COLOPHON
          (which is not part of the original manual page), send a mail to
          man-pages@man7.org

   Open vSwitch 2.10.90       ovn-controller-vtep    ovn-controller-vtep(8)

--------------

Pages that refer to this page: `ovn-sb(5) <../man5/ovn-sb.5.html>`__

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
