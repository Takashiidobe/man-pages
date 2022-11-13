.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

gssd(8) — Linux manual page
===========================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `INTRODUCTION <#INTRODUCTION>`__  |                                   |
| \| `DESCRIPTION <#DESCRIPTION>`__ |                                   |
| \| `OPTIONS <#OPTIONS>`__ \|      |                                   |
| `CONFIGURAT                       |                                   |
| ION FILE <#CONFIGURATION_FILE>`__ |                                   |
| \| `SEE ALSO <#SEE_ALSO>`__ \|    |                                   |
| `AUTHORS <#AUTHORS>`__ \|         |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   rpc.gssd(8)              System Manager's Manual             rpc.gssd(8)

NAME
-------------------------------------------------

::

          rpc.gssd - RPCSEC_GSS daemon


---------------------------------------------------------

::

          rpc.gssd [-DfMnlvrHC] [-k keytab] [-p pipefsdir] [-d ccachedir]
          [-t timeout] [-T timeout] [-U timeout] [-R realm]


-----------------------------------------------------------------

::

          The RPCSEC_GSS protocol, defined in RFC 5403, is used to provide
          strong security for RPC-based protocols such as NFS.

          Before exchanging RPC requests using RPCSEC_GSS, an RPC client
          must establish a GSS security context.  A security context is
          shared state on each end of a network transport that enables GSS-
          API security services.

          Security contexts are established using security credentials.  A
          credential grants temporary access to a secure network service,
          much as a railway ticket grants temporary access to use a rail
          service.

          A user typically obtains a credential by providing a password to
          the kinit(1) command, or via a PAM library at login time.  A
          credential acquired with a user principal is known as a user
          credential (see kerberos(1) for more on principals).

          Certain operations require a credential that represents no
          particular user or represents the host itself.  This kind of
          credential is called a machine credential.

          A host establishes its machine credential using a service
          principal whose encrypted password is stored in a local file
          known as a keytab.  A machine credential remains effective
          without user intervention as long as the host can renew it.

          Once obtained, credentials are typically stored in local
          temporary files with well-known pathnames.


---------------------------------------------------------------

::

          To establish GSS security contexts using these credential files,
          the Linux kernel RPC client depends on a userspace daemon called
          rpc.gssd.  The rpc.gssd daemon uses the rpc_pipefs filesystem to
          communicate with the kernel.

      User Credentials
          When a user authenticates using a command such as kinit(1), the
          resulting credential is stored in a file with a well-known name
          constructed using the user's UID.

          To interact with an NFS server on behalf of a particular
          Kerberos-authenticated user, the Linux kernel RPC client requests
          that rpc.gssd initialize a security context with the credential
          in that user's credential file.

          Typically, credential files are placed in /tmp.  However,
          rpc.gssd can search for credential files in more than one
          directory.  See the description of the -d option for details.

      Machine Credentials
          rpc.gssd searches the default keytab, /etc/krb5.keytab, in the
          following order for a principal and password to use when
          establishing the machine credential.  For the search, rpc.gssd
          replaces <hostname> and <REALM> with the local system's hostname
          and Kerberos realm.

             <HOSTNAME>$@<REALM>
             root/<hostname>@<REALM>
             nfs/<hostname>@<REALM>
             host/<hostname>@<REALM>
             root/<anyname>@<REALM>
             nfs/<anyname>@<REALM>
             host/<anyname>@<REALM>

          rpc.gssd selects one of the <anyname> entries if it does not find
          a service principal matching the local hostname, e.g. if DHCP
          assigns the local hostname dynamically.  The <anyname> facility
          enables the use of the same keytab on multiple systems.  However,
          using the same service principal to establish a machine
          credential on multiple hosts can create unwanted security
          exposures and is therefore not recommended.

          Note that <HOSTNAME>$@<REALM> is a user principal that enables
          Kerberized NFS when the local system is joined to an Active
          Directory domain using Samba.  The keytab provides the password
          for this principal.

          You can specify a different keytab by using the -k option if
          /etc/krb5.keytab does not exist or does not provide one of these
          principals.

      Credentials for UID 0
          UID 0 is a special case.  By default rpc.gssd uses the system's
          machine credentials for UID 0 accesses that require GSS
          authentication.  This limits the privileges of the root user when
          accessing network resources that require authentication.

          Specify the -n option when starting rpc.gssd if you'd like to
          force the root user to obtain a user credential rather than use
          the local system's machine credential.

          When -n is specified, the kernel continues to request a GSS
          context established with a machine credential for NFSv4
          operations, such as SETCLIENTID or RENEW, that manage state.  If
          rpc.gssd cannot obtain a machine credential (say, the local
          system has no keytab), NFSv4 operations that require machine
          credentials will fail.

      Encryption types
          A realm administrator can choose to add keys encoded in a number
          of different encryption types to the local system's keytab.  For
          instance, a host/ principal might have keys for the aes256-cts-
          hmac-sha1-96, aes128-cts-hmac-sha1-96, des3-cbc-sha1, and
          arcfour-hmac encryption types.  This permits rpc.gssd to choose
          an appropriate encryption type that the target NFS server
          supports.

          These encryption types are stronger than legacy single-DES
          encryption types.  To interoperate in environments where servers
          support only weak encryption types, you can restrict your client
          to use only single-DES encryption types by specifying the -l
          option when starting rpc.gssd.


-------------------------------------------------------

::

          -D     The server name passed to GSSAPI for authentication is
                 normally the name exactly as requested.  e.g. for NFS it
                 is the server name in the "servername:/path" mount
                 request.  Only if this servername appears to be an IP
                 address (IPv4 or IPv6) or an unqualified name (no dots)
                 will a reverse DNS lookup will be performed to get the
                 canoncial server name.

                 If -D is present, a reverse DNS lookup will always be
                 used, even if the server name looks like a canonical name.
                 So it is needed if partially qualified, or non canonical
                 names are regularly used.

                 Using -D can introduce a security vulnerability, so it is
                 recommended that -D not be used, and that canonical names
                 always be used when requesting services.

          -f     Runs rpc.gssd in the foreground and sends output to stderr
                 (as opposed to syslogd)

          -n     When specified, UID 0 is forced to obtain user credentials
                 which are used instead of the local system's machine
                 credentials.

          -k keytab
                 Tells rpc.gssd to use the keys found in keytab to obtain
                 machine credentials.  The default value is
                 /etc/krb5.keytab.

          -l     When specified, restricts rpc.gssd to sessions to weak
                 encryption types such as des-cbc-crc.  This option is
                 available only when the local system's Kerberos library
                 supports settable encryption types.

          -p path
                 Tells rpc.gssd where to look for the rpc_pipefs
                 filesystem.  The default value is /var/lib/nfs/rpc_pipefs.

          -d search-path
                 This option specifies a colon separated list of
                 directories that rpc.gssd searches for credential files.
                 The default value is /tmp:/run/user/%U.  The literal
                 sequence "%U" can be specified to substitue the UID of the
                 user for whom credentials are being searched.

          -M     By default, machine credentials are stored in files in the
                 first directory in the credential directory search path
                 (see the -d option).  When -M is set, rpc.gssd stores
                 machine credentials in memory instead.

          -v     Increases the verbosity of the output (can be specified
                 multiple times).

          -r     If the RPCSEC_GSS library supports setting debug level,
                 increases the verbosity of the output (can be specified
                 multiple times).

          -R realm
                 Kerberos tickets from this realm will be preferred when
                 scanning available credentials cache files to be used to
                 create a context.  By default, the default realm, as
                 configured in the Kerberos configuration file, is
                 preferred.

          -t timeout
                 Timeout, in seconds, for kernel GSS contexts. This option
                 allows you to force new kernel contexts to be negotiated
                 after timeout seconds, which allows changing Kerberos
                 tickets and identities frequently.  The default is no
                 explicit timeout, which means the kernel context will live
                 the lifetime of the Kerberos service ticket used in its
                 creation.

          -T timeout
                 Timeout, in seconds, to create an RPC connection with a
                 server while establishing an authenticated gss context for
                 a user.  The default timeout is set to 5 seconds.  If you
                 get messages like "WARNING: can't create tcp rpc_clnt to
                 server %servername% for user with uid %uid%: RPC: Remote
                 system error - Connection timed out", you should consider
                 an increase of this timeout.

          -U timeout
                 Timeout, in seconds, for upcall threads.  Threads
                 executing longer than timeout seconds will cause an error
                 message to be logged.  The default timeout is 30 seconds.
                 The minimum is 5 seconds.  The maximum is 600 seconds.

          -C     In addition to logging an error message for threads that
                 have timed out, the thread will be canceled and an error
                 of -ETIMEDOUT will be reported to the kernel.

          -H     Avoids setting $HOME to "/". This allows rpc.gssd to read
                 per user k5identity files versus trying to read
                 /.k5identity for each user.

                 If -H is not set, rpc.gssd will use the first match found
                 in /var/kerberos/krb5/user/$EUID/client.keytab and will
                 not use a principal based on host and/or service
                 parameters listed in $HOME/.k5identity.


-----------------------------------------------------------------------------

::

          Many of the options that can be set on the command line can also
          be controlled through values set in the [gssd] section of the
          /etc/nfs.conf configuration file.  Values recognized include:

          verbosity
                 Value which is equivalent to the number of -v.

          rpc-verbosity
                 Value which is equivalent to the number of -r.

          use-memcache
                 A Boolean flag equivalent to -M.

          use-machine-creds
                 A Boolean flag. Setting to false is equivalent to giving
                 the -n flag.

          avoid-dns
                 Setting to false is equivalent to providing the -D flag.

          limit-to-legacy-enctypes
                 Equivalent to -l.

          context-timeout
                 Equivalent to -t.

          rpc-timeout
                 Equivalent to -T.

          keytab-file
                 Equivalent to -k.

          cred-cache-directory
                 Equivalent to -d.

          preferred-realm
                 Equivalent to -R.

          upcall-timeout
                 Equivalent to -U.

          cancel-timed-out-upcalls
                 Setting to true is equivalent to providing the -C flag.

          set-home
                 Setting to false is equivalent to providing the -H flag.

          In addtion, the following value is recognized from the [general]
          section:

          pipefs-directory
                 Equivalent to -p.


---------------------------------------------------------

::

          rpc.svcgssd(8), kerberos(1), kinit(1), krb5.conf(5)


-------------------------------------------------------

::

          Dug Song <dugsong@umich.edu>
          Andy Adamson <andros@umich.edu>
          Marius Aamodt Eriksen <marius@umich.edu>
          J. Bruce Fields <bfields@umich.edu>

COLOPHON
---------------------------------------------------------

::

          This page is part of the nfs-utils (NFS utilities) project.
          Information about the project can be found at 
          ⟨http://linux-nfs.org/wiki/index.php/Main_Page⟩.  If you have a
          bug report for this manual page, see
          ⟨http://linux-nfs.org/wiki/index.php/Main_Page⟩.  This page was
          obtained from the project's upstream Git repository
          ⟨http://git.linux-nfs.org/?p=steved/nfs-utils.git;a=summary⟩ on
          2021-08-27.  (At that time, the date of the most recent commit
          that was found in the repository was 2021-08-21.)  If you
          discover any rendering problems in this HTML version of the page,
          or you believe there is a better or more up-to-date source for
          the page, or you have corrections or improvements to the
          information in this COLOPHON (which is not part of the original
          manual page), send a mail to man-pages@man7.org

                                  20 Feb 2013                   rpc.gssd(8)

--------------

Pages that refer to this page: `nfs(5) <../man5/nfs.5.html>`__, 
`nfs.conf(5) <../man5/nfs.conf.5.html>`__, 
`svcgssd(8) <../man8/svcgssd.8.html>`__

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
