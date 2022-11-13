.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

ssh-keyscan(1) — Linux manual page
==================================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `FILES <#FILES>`__ \|             |                                   |
| `EXAMPLES <#EXAMPLES>`__ \|       |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `AUTHORS <#AUTHORS>`__ \|         |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   SSH-KEYSCAN(1)         BSD General Commands Manual        SSH-KEYSCAN(1)

NAME
-------------------------------------------------

::

        ssh-keyscan — gather SSH public keys from servers


---------------------------------------------------------

::

        ssh-keyscan [-46cDHv] [-f file] [-p port] [-T timeout] [-t type]
                    [host | addrlist namelist]


---------------------------------------------------------------

::

        ssh-keyscan is a utility for gathering the public SSH host keys of
        a number of hosts.  It was designed to aid in building and
        verifying ssh_known_hosts files, the format of which is documented
        in sshd(8).  ssh-keyscan provides a minimal interface suitable for
        use by shell and perl scripts.

        ssh-keyscan uses non-blocking socket I/O to contact as many hosts
        as possible in parallel, so it is very efficient.  The keys from a
        domain of 1,000 hosts can be collected in tens of seconds, even
        when some of those hosts are down or do not run sshd(8).  For
        scanning, one does not need login access to the machines that are
        being scanned, nor does the scanning process involve any
        encryption.

        The options are as follows:

        -4      Force ssh-keyscan to use IPv4 addresses only.

        -6      Force ssh-keyscan to use IPv6 addresses only.

        -c      Request certificates from target hosts instead of plain
                keys.

        -D      Print keys found as SSHFP DNS records.  The default is to
                print keys in a format usable as a ssh(1) known_hosts file.

        -f file
                Read hosts or “addrlist namelist” pairs from file, one per
                line.  If ‘-’ is supplied instead of a filename,
                ssh-keyscan will read from the standard input.  Input is
                expected in the format:

                1.2.3.4,1.2.4.4 name.my.domain,name,n.my.domain,n,1.2.3.4,1.2.4.4

        -H      Hash all hostnames and addresses in the output.  Hashed
                names may be used normally by ssh(1) and sshd(8), but they
                do not reveal identifying information should the file's
                contents be disclosed.

        -p port
                Connect to port on the remote host.

        -T timeout
                Set the timeout for connection attempts.  If timeout
                seconds have elapsed since a connection was initiated to a
                host or since the last time anything was read from that
                host, the connection is closed and the host in question
                considered unavailable.  The default is 5 seconds.

        -t type
                Specify the type of the key to fetch from the scanned
                hosts.  The possible values are “dsa”, “ecdsa”, “ed25519”,
                or “rsa”.  Multiple values may be specified by separating
                them with commas.  The default is to fetch “rsa”, “ecdsa”,
                and “ed25519” keys.

        -v      Verbose mode: print debugging messages about progress.

        If an ssh_known_hosts file is constructed using ssh-keyscan without
        verifying the keys, users will be vulnerable to man in the middle
        attacks.  On the other hand, if the security model allows such a
        risk, ssh-keyscan can help in the detection of tampered keyfiles or
        man in the middle attacks which have begun after the
        ssh_known_hosts file was created.


---------------------------------------------------

::

        /etc/ssh/ssh_known_hosts


---------------------------------------------------------

::

        Print the RSA host key for machine hostname:

              $ ssh-keyscan -t rsa hostname

        Find all hosts from the file ssh_hosts which have new or different
        keys from those in the sorted file ssh_known_hosts:

              $ ssh-keyscan -t rsa,dsa,ecdsa,ed25519 -f ssh_hosts | \
                      sort -u - ssh_known_hosts | diff ssh_known_hosts -


---------------------------------------------------------

::

        ssh(1), sshd(8)

        Using DNS to Securely Publish Secure Shell (SSH) Key Fingerprints,
        RFC 4255, 2006.


-------------------------------------------------------

::

        David Mazieres <dm@lcs.mit.edu> wrote the initial version, and
        Wayne Davison <wayned@users.sourceforge.net> added support for
        protocol version 2.

COLOPHON
---------------------------------------------------------

::

        This page is part of the openssh (Portable OpenSSH) project.
        Information about the project can be found at
        http://www.openssh.com/portable.html.  If you have a bug report for
        this manual page, see ⟨http://www.openssh.com/report.html⟩.  This
        page was obtained from the tarball openssh-8.7p1.tar.gz fetched
        from ⟨http://ftp.eu.openbsd.org/pub/OpenBSD/OpenSSH/portable/⟩ on
        2021-08-27.  If you discover any rendering problems in this HTML
        version of the page, or you believe there is a better or more up-
        to-date source for the page, or you have corrections or
        improvements to the information in this COLOPHON (which is not part
        of the original manual page), send a mail to man-pages@man7.org

   BSD                         November 30, 2019                        BSD

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
