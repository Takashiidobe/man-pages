.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

curvetun(8) — Linux manual page
===============================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `OPTIONS <#OPTIONS>`__ \|         |                                   |
| `                                 |                                   |
| USAGE EXAMPLE <#USAGE_EXAMPLE>`__ |                                   |
| \|                                |                                   |
| `CRYPTOGRAPHY <#CRYPTOGRAPHY>`__  |                                   |
| \| `SETUP HOWTO <#SETUP_HOWTO>`__ |                                   |
| \| `NOTE <#NOTE>`__ \|            |                                   |
| `BUGS <#BUGS>`__ \|               |                                   |
| `LEGAL <#LEGAL>`__ \|             |                                   |
| `HISTORY <#HISTORY>`__ \|         |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `AUTHOR <#AUTHOR>`__ \|           |                                   |
| `COLOPHON <#COLOPHON>`__ \|       |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   CURVETUN(8)                netsniff-ng toolkit               CURVETUN(8)

NAME
-------------------------------------------------

::

          curvetun - a lightweight curve25519 ip4/6 tunnel


---------------------------------------------------------

::

          curvetun [options]


---------------------------------------------------------------

::

          curvetun is a lightweight, high-speed ECDH multiuser IP tunnel
          for Linux that is based on epoll(2).  curvetun uses the Linux
          TUN/TAP interface and supports {IPv4, IPv6} over {IPv4, IPv6}
          with UDP or TCP as carrier protocols.

          It has an integrated packet forwarding tree, thus multiple users
          with different IPs can be handled via a single tunnel device on
          the server side, and flows are scheduled for processing in a CPU
          efficient way, at least in the case of TCP as the carrier
          protocol.

          For key management, public-key cryptography based on elliptic
          curves are used and packets are encrypted end-to-end by the
          symmetric stream cipher Salsa20 and authenticated by the MAC
          Poly1305, where keys have previously been computed with the ECDH
          key agreement protocol Curve25519.

          Cryptography is based on Daniel J. Bernstein's networking and
          cryptography library “NaCl”. By design, curvetun does not provide
          any particular pattern or default port numbers that gives
          certainty that the connection from a particular flow is actually
          running curvetun.

          However, if you have a further need to bypass censorship, you can
          try using curvetun in combination with Tor's obfsproxy or Telex.
          Furthermore, curvetun also protects you against replay attacks
          and DH man-in-the-middle attacks.  Additionally, server-side
          syslog event logging can also be disabled to avoid revealing
          critical user connection data.

           1. obfsproxy from the TOR project
              https://www.torproject.org/projects/obfsproxy.html.en

           2. Telex, anti-censorship in the network infrastructure
              https://telex.cc/


-------------------------------------------------------

::

          -d <tundev>, --dev <tundev>
                 Defines the name of the tunnel device that is being
                 created. If this option is not set, then the default
                 names, curves{0,1,2,..} for a curvetun server, and
                 curvec{0,1,2,...} for a curvetun client are used.

          -p <num>, --port <num>
                 Defines the port the curvetun server should listen on.
                 There is no default port for curvetun, so setting this
                 option for server bootstrap is mandatory. This option is
                 for servers only.

          -t <server>, --stun <server>
                 If needed, this options enables an STUN lookup in order to
                 show public IP to port mapping and to punch a hole into
                 the firewall. In case you are unsure what STUN server to
                 use, simply use ''--stun stunserver.org''.

          -c[=alias], --client[=alias]
                 Starts curvetun in client mode and connects to the given
                 connection alias that is defined in the configuration
                 file.

          -k, --keygen
                 Generate private and public keypair. This must be done
                 initially.

          -x, --export
                 Export user and key combination to stdout as a one-liner.

          -C, --dumpc
                 Dump all known clients that may connect to the local
                 curvetun server and exit.

          -S, --dumps
                 Dump all known servers curvetun as a client can connect
                 to, and exit.

          -D, --nofork
                 Do not fork off as a client or server on startup.

          -s, --server
                 Start curvetun in server mode. Additional parameters are
                 needed, at least the definition of the port that clients
                 can connect to is required.

          -N, --no-logging
                 Disable all curvetun logging of user information. This
                 option can be used to enable curvetun users to connect
                 more anonymously. This option is for servers only.

          -u, --udp
                 Use UDP as a carrier protocol instead of TCP. By default,
                 TCP is the carrier protocol. This option is for servers
                 only.

          -4, --ipv4
                 Defines IPv4 as the underlying network protocol to be used
                 on the tunnel device. IPv4 is the default. This option is
                 for servers only.

          -6, --ipv6
                 Defines IPv6 as the underlying network protocol to be used
                 on the tunnel device. This option is for servers only.

          -v, --version
                 Show version information and exit.

          -h, --help
                 Show user help and exit.


-------------------------------------------------------------------

::

          curvetun --server -4 -u -N --port 6666 --stun stunserver.org
                 Starts curvetun in server mode with IPv4 as network
                 protocol and UDP as a transport carrier protocol. The
                 curvetun server listens for incoming connections on port
                 6666 and performs an STUN lookup on startup to
                 stunserver.org.

          curvetun --client=ethz
                 Starts curvetun in client mode and connects to the defined
                 connection alias ''ethz'' that is defined in the curvetun
                 ~/.curvetun/servers configuration file.

          curvetun --keygen
                 Generates initial keypairs and stores them in the
                 ~/.curvetun/ directory.

          curvetun --export
                 Export user data to stdout for configuration of a curvetun
                 server.


-----------------------------------------------------------------

::

          Encrypted IP tunnels are often used to create virtual private
          networks (VPN), where parts of the network can only be reached
          via an insecure or untrusted medium such as the Internet. Only a
          few software utilities exist to create such tunnels, or, VPNs.
          Two popular representatives of such software are OpenVPN and
          VTUN.

          The latter also introduced the TUN/TAP interfaces into the Linux
          kernel. VTUN only has a rather basic encryption module, that does
          not fit today's cryptographic needs. By default, MD5 is used to
          create 128-Bit wide keys for the symmetric BlowFish cipher in ECB
          mode [1].

          Although OpenSSL is used in both VTUN and OpenVPN, OpenVPN is
          much more feature rich regarding ciphers and user authentication.
          Nevertheless, letting people choose ciphers or authentication
          methods is not necessarily a good thing: administrators could
          either prefer speed over security and therefore choose weak
          ciphers, so that the communication system will be as good as
          without any cipher; they could choose weak passwords for
          symmetric encryption or they could misconfigure the communication
          system by having too much choice of ciphers and too little
          experience for picking the right one.

          Next to the administration issues, there are also software
          development issues.  Cryptographic libraries like OpenSSL are a
          huge mess and too low-level and complex to fully understand or
          correctly apply, so that they form further ground for
          vulnerabilities of such software.

          In 2010, the cryptographers Tanja Lange and Daniel J. Bernstein
          have therefore created and published a cryptographic library for
          networking, which is named NaCl (pronounced ''salt''). NaCl
          addresses such problems as mentioned in OpenSSL and, in contrast
          to the rather generic use of OpenSSL, was created with a strong
          focus on public-key authenticated encryption based on elliptic
          curve cryptography, which is used in curvetun. Partially quoting
          Daniel J.  Bernstein:

          "RSA is somewhat older than elliptic-curve cryptography: RSA was
          introduced in 1977, while elliptic-curve cryptography was
          introduced in 1985. However, RSA has shown many more weaknesses
          than elliptic-curve cryptography. RSA's effective security level
          was dramatically reduced by the linear sieve in the late 1970s,
          by the quadratic sieve and ECM in the 1980s, and by the number-
          field sieve in the 1990s. For comparison, a few attacks have been
          developed against some rare elliptic curves having special
          algebraic structures, and the amount of computer power available
          to attackers has predictably increased, but typical elliptic
          curves require just as much computer power to break today as they
          required twenty years ago.

          IEEE P1363 standardized elliptic-curve cryptography in the late
          1990s, including a stringent list of security criteria for
          elliptic curves. NIST used the IEEE P1363 criteria to select
          fifteen specific elliptic curves at five different security
          levels. In 2005, NSA issued a new ''Suite B'' standard,
          recommending the NIST elliptic curves (at two specific security
          levels) for all public-key cryptography and withdrawing previous
          recommendations of RSA."

          curvetun uses a particular elliptic curve, Curve25519, introduced
          in the following paper: Daniel J. Bernstein, ''Curve25519: new
          Diffie-Hellman speed records,'' pages 207-228 in Proceedings of
          PKC 2006, edited by Moti Yung, Yevgeniy Dodis, Aggelos Kiayias,
          and Tal Malkin, Lecture Notes in Computer Science 3958, Springer,
          2006, ISBN 3-540-33851-9.

          This elliptic curve follows all of the standard IEEE P1363
          security criteria.  It also follows new recommendations that
          achieve ''side-channel immunity'' and ''twist security'' while
          improving speed. What this means is that secure implementations
          of Curve25519 are considerably simpler and faster than secure
          implementations of, for example, NIST P-256; there are fewer
          opportunities for implementors to make mistakes that compromise
          security, and mistakes are more easily caught by reviewers.

          An attacker who spends a billion dollars on special-purpose chips
          to attack Curve25519, using the best attacks available today, has
          about 1 chance in 1000000000000000000000000000 of breaking
          Curve25519 after a year of computation.  One could achieve
          similar levels of security with 3000-bit RSA, but encryption and
          authentication with 3000-bit RSA are not nearly fast enough to
          handle tunnel traffic and would require much more space in
          network packets.

           1. Security analysis of VTun
              http://www.off.net/~jme/vtun_secu.html

           2. NaCl: Networking and Cryptography library
              http://nacl.cr.yp.to/


---------------------------------------------------------------

::

          If you have not run curvetun before, you need to do an initial
          setup once.

          First, make sure that the servers and clients clocks are
          periodically synced, for example, by running an NTP daemon. This
          is necessary to protect against replay attacks. Also, make sure
          you have read and write access to /dev/net/tun. You should not
          run curvetun as root! Then, after you have assured this, the
          first step is to generate keys and config files. On both the
          client and server do:

          curvetun -k

          You are asked for a user name. You can use an email address or
          whatever suits you. Here, we assume you have entered 'mysrv1' on
          the server and 'myclient1' on the client side.

          Now, all necessary files have been created under ~/.curvetun.
          Files include “priv.key”, “pub.key”, “username”, “clients” and
          “servers”.

          “clients” and “servers” are empty at the beginning and need to be
          filled. The “clients” file is meant for the server, so that it
          knows what clients are allowed to connect. The “servers” file is
          for the client, where it can select curvetun servers to connect
          to. Both files are kept very simple, so that a single
          configuration line per client or server is sufficient.

          The client needs to export its public key data for the server

          curvetun -x

          where it prints a string in the following format:

            myclient1;11:11:11:11:11:11:11:11:11:11:11:11:11:11:11:11:11:11:11:11:11:11:11:11:11:11:11:11:11:11:11:11
            \_______/
          \_____________________________________________________________________________________________/
             username  32 byte public key for 'myclient1'

          This line is transferred to the server admin (yes, we assume a
          manual on-site key exchange scenario where, for example, the
          admin sets up server and clients), where the admin then adds this
          entry into his ''clients'' file like:

            server$ echo
          "myclient1;11:11:11:11:11:11:11:11:11:11:11:11:11:11:11:11:11:" \
                         "11:11:11:11:11:11:11:11:11:11:11:11:11:11:11" >>
          ~/.curvetun/clients

          The server admin can check if the server has registered it
          properly as follows:

            server$ curvetun -C

          which prints all parsed clients from ''~/.curvetun/clients''.
          This process could easily be automated or scripted with, for
          example, Perl and LDAP.

          Now, the client ''myclient1'' is known to the server; that
          completes the server configuration. The next step is to tell the
          client where it needs to connect to the server.

          We assume in this example that the tunnel server has a public IP
          address, e.g. 1.2.3.4, runs on port 6666 and uses UDP as a
          carrier protocol. In case you are behind NAT, you can use
          curvetun's ''--stun'' option for starting the server, to obtain
          your mapping. However, in this example we continue with 1.2.3.4
          and 6666, UDP.

          First, the server needs to export its key to the client, as
          follows:

            server$ curvetun -x

          where it prints a string in the following format:

            mysrv1;22:22:22:22:22:22:22:22:22:22:22:22:22:22:22:22:22:22:22:22:22:22:22:22:22:22:22:22:22:22:22:22
            \____/
          \_____________________________________________________________________________________________/
           username  32 byte public key for 'mysrv1'
                     ^-- you need this public key

          Thus, you now have the server IP address, server port, server
          transport protocol and the server's public key at hand. On the
          client side it can be put all together in the config as follows:

            client$ echo
          "myfirstserver;1.2.3.4;6666;udp;22:22:22:22:22:22:22:22:22:22:" \
                         "22:22:22:22:22:22:22:22:22:22:22:22:22:22:22:22:22:22:22:22:"
          \
                         "22:22" >> ~/.curvetun/servers

          The client can check its config using:

            client$ curvetun -S

          Then we start the server with:

            server$ curvetun -s -p 6666 -u
            server# ifconfig curves0 up
            server# ifconfig curves0 10.0.0.1/24

          Then, we start the client with:

            client$ curvetun -c=myfirstserver
            client# ifconfig curvec0 up
            client# ifconfig curvec0 10.0.0.2/24

          Also, client-side information, errors, or warnings will appear in
          syslog! By now we should be able to ping the server:

            client$ ping 10.0.0.1

          That's it! Routing example:

          Server side's public IP on eth0 is, for example, 1.2.3.4:

            server$ ... start curvetun server ...
            server# ifconfig curves0 up
            server# ifconfig curves0 10.0.0.1/24
            server# echo 1 > /proc/sys/net/ipv4/ip_forward
            server# iptables -t nat -A POSTROUTING -o eth0 -j MASQUERADE
            server# iptables -A FORWARD -i eth0 -o curves0 -m state --state
          RELATED,ESTABLISHED -j ACCEPT
            server# iptables -A FORWARD -i curves0 -o eth0 -j ACCEPT

          Client side's IP on eth0 is, for example, 5.6.7.8:

            client$ ... start curvetun client ...
            client# ... lookup your default gateway (e.g. via route, here:
          5.6.7.9) ...
            client# ifconfig curvec0 up
            client# ifconfig curvec0 10.0.0.2/24
            client# route add -net 1.2.3.0 netmask 255.255.255.0 gw 5.6.7.9
          dev eth0
            client# route add default gw 10.0.0.1
            client# route del default gw 5.6.7.9

          That should be it, happy browsing and emailing via curvetun
          tunnels!


-------------------------------------------------

::

          This software is an experimental prototype intended for
          researchers. It will most likely mature over time, but it is
          currently not advised to use this software when life is put at
          risk.


-------------------------------------------------

::

          Blackhole tunneling is currently not supported.


---------------------------------------------------

::

          curvetun is licensed under the GNU GPL version 2.0.


-------------------------------------------------------

::

          curvetun was originally written for the netsniff-ng toolkit by
          Daniel Borkmann. It is currently maintained by Tobias Klauser
          <tklauser@distanz.ch> and Daniel Borkmann
          <dborkma@tik.ee.ethz.ch>.


---------------------------------------------------------

::

          netsniff-ng(8), trafgen(8), mausezahn(8), bpfc(8), ifpps(8),
          flowtop(8), astraceroute(8)


-----------------------------------------------------

::

          Manpage was written by Daniel Borkmann.

COLOPHON
---------------------------------------------------------

::

          This page is part of the Linux netsniff-ng toolkit project. A
          description of the project, and information about reporting bugs,
          can be found at http://netsniff-ng.org/.

.. _colophon-top-1:

COLOPHON
---------------------------------------------------------

::

          This page is part of the netsniff-ng (a free Linux networking
          toolkit) project.  Information about the project can be found at
          ⟨http://netsniff-ng.org/⟩.  If you have a bug report for this
          manual page, send it to netsniff-ng@googlegroups.com.  This page
          was obtained from the project's upstream Git repository
          ⟨git://github.com/netsniff-ng/netsniff-ng.git⟩ on 2021-08-27.
          (At that time, the date of the most recent commit that was found
          in the repository was 2021-04-06.)  If you discover any rendering
          problems in this HTML version of the page, or you believe there
          is a better or more up-to-date source for the page, or you have
          corrections or improvements to the information in this COLOPHON
          (which is not part of the original manual page), send a mail to
          man-pages@man7.org

   Linux                         03 March 2013                  CURVETUN(8)

--------------

Pages that refer to this page:
`astraceroute(8) <../man8/astraceroute.8.html>`__, 
`bpfc(8) <../man8/bpfc.8.html>`__, 
`flowtop(8) <../man8/flowtop.8.html>`__, 
`ifpps(8) <../man8/ifpps.8.html>`__, 
`mausezahn(8) <../man8/mausezahn.8.html>`__, 
`netsniff-ng(8) <../man8/netsniff-ng.8.html>`__, 
`trafgen(8) <../man8/trafgen.8.html>`__

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
