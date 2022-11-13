.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

getent(1) — Linux manual page
=============================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `OPTIONS <#OPTIONS>`__ \|         |                                   |
| `EXIT STATUS <#EXIT_STATUS>`__ \| |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   GETENT(1)                     User Commands                    GETENT(1)

NAME
-------------------------------------------------

::

          getent - get entries from Name Service Switch libraries


---------------------------------------------------------

::

          getent [option]... database key...


---------------------------------------------------------------

::

          The getent command displays entries from databases supported by
          the Name Service Switch libraries, which are configured in
          /etc/nsswitch.conf.  If one or more key arguments are provided,
          then only the entries that match the supplied keys will be
          displayed.  Otherwise, if no key is provided, all entries will be
          displayed (unless the database does not support enumeration).

          The database may be any of those supported by the GNU C Library,
          listed below:

             ahosts When no key is provided, use sethostent(3),
                    gethostent(3), and endhostent(3) to enumerate the hosts
                    database.  This is identical to using hosts.  When one
                    or more key arguments are provided, pass each key in
                    succession to getaddrinfo(3) with the address family
                    AF_UNSPEC, enumerating each socket address structure
                    returned.

             ahostsv4
                    Same as ahosts, but use the address family AF_INET.

             ahostsv6
                    Same as ahosts, but use the address family AF_INET6.
                    The call to getaddrinfo(3) in this case includes the
                    AI_V4MAPPED flag.

             aliases
                    When no key is provided, use setaliasent(3),
                    getaliasent(3), and endaliasent(3) to enumerate the
                    aliases database.  When one or more key arguments are
                    provided, pass each key in succession to
                    getaliasbyname(3) and display the result.

             ethers When one or more key arguments are provided, pass each
                    key in succession to ether_aton(3) and ether_hostton(3)
                    until a result is obtained, and display the result.
                    Enumeration is not supported on ethers, so a key must
                    be provided.

             group  When no key is provided, use setgrent(3), getgrent(3),
                    and endgrent(3) to enumerate the group database.  When
                    one or more key arguments are provided, pass each
                    numeric key to getgrgid(3) and each nonnumeric key to
                    getgrnam(3) and display the result.

             gshadow
                    When no key is provided, use setsgent(3), getsgent(3),
                    and endsgent(3) to enumerate the gshadow database.
                    When one or more key arguments are provided, pass each
                    key in succession to getsgnam(3) and display the
                    result.

             hosts  When no key is provided, use sethostent(3),
                    gethostent(3), and endhostent(3) to enumerate the hosts
                    database.  When one or more key arguments are provided,
                    pass each key to gethostbyaddr(3) or gethostbyname2(3),
                    depending on whether a call to inet_pton(3) indicates
                    that the key is an IPv6 or IPv4 address or not, and
                    display the result.

             initgroups
                    When one or more key arguments are provided, pass each
                    key in succession to getgrouplist(3) and display the
                    result.  Enumeration is not supported on initgroups, so
                    a key must be provided.

             netgroup
                    When one key is provided, pass the key to
                    setnetgrent(3) and, using getnetgrent(3) display the
                    resulting string triple (hostname, username,
                    domainname).  Alternatively, three keys may be
                    provided, which are interpreted as the hostname,
                    username, and domainname to match to a netgroup name
                    via innetgr(3).  Enumeration is not supported on
                    netgroup, so either one or three keys must be provided.

             networks
                    When no key is provided, use setnetent(3),
                    getnetent(3), and endnetent(3) to enumerate the
                    networks database.  When one or more key arguments are
                    provided, pass each numeric key to getnetbyaddr(3) and
                    each nonnumeric key to getnetbyname(3) and display the
                    result.

             passwd When no key is provided, use setpwent(3), getpwent(3),
                    and endpwent(3) to enumerate the passwd database.  When
                    one or more key arguments are provided, pass each
                    numeric key to getpwuid(3) and each nonnumeric key to
                    getpwnam(3) and display the result.

             protocols
                    When no key is provided, use setprotoent(3),
                    getprotoent(3), and endprotoent(3) to enumerate the
                    protocols database.  When one or more key arguments are
                    provided, pass each numeric key to getprotobynumber(3)
                    and each nonnumeric key to getprotobyname(3) and
                    display the result.

             rpc    When no key is provided, use setrpcent(3),
                    getrpcent(3), and endrpcent(3) to enumerate the rpc
                    database.  When one or more key arguments are provided,
                    pass each numeric key to getrpcbynumber(3) and each
                    nonnumeric key to getrpcbyname(3) and display the
                    result.

             services
                    When no key is provided, use setservent(3),
                    getservent(3), and endservent(3) to enumerate the
                    services database.  When one or more key arguments are
                    provided, pass each numeric key to getservbynumber(3)
                    and each nonnumeric key to getservbyname(3) and display
                    the result.

             shadow When no key is provided, use setspent(3), getspent(3),
                    and endspent(3) to enumerate the shadow database.  When
                    one or more key arguments are provided, pass each key
                    in succession to getspnam(3) and display the result.


-------------------------------------------------------

::

          -s service, --service service
                 Override all databases with the specified service.  (Since
                 glibc 2.2.5.)

          -s database:service, --service database:service
                 Override only specified databases with the specified
                 service.  The option may be used multiple times, but only
                 the last service for each database will be used.  (Since
                 glibc 2.4.)

          -i, --no-idn
                 Disables IDN encoding in lookups for ahosts/getaddrinfo(3)
                 (Since glibc-2.13.)

          -?, --help
                 Print a usage summary and exit.

          --usage
                 Print a short usage summary and exit.

          -V, --version
                 Print the version number, license, and disclaimer of
                 warranty for getent.


---------------------------------------------------------------

::

          One of the following exit values can be returned by getent:

             0      Command completed successfully.

             1      Missing arguments, or database unknown.

             2      One or more supplied key could not be found in the
                    database.

             3      Enumeration not supported on this database.


---------------------------------------------------------

::

          nsswitch.conf(5)

COLOPHON
---------------------------------------------------------

::

          This page is part of release 5.13 of the Linux man-pages project.
          A description of the project, information about reporting bugs,
          and the latest version of this page, can be found at
          https://www.kernel.org/doc/man-pages/.

   Linux                          2021-03-22                      GETENT(1)

--------------

Pages that refer to this page: `groups(1) <../man1/groups.1.html>`__, 
`homectl(1) <../man1/homectl.1.html>`__, 
`userdbctl(1) <../man1/userdbctl.1.html>`__, 
`users(1) <../man1/users.1.html>`__, 
`nsswitch.conf(5) <../man5/nsswitch.conf.5.html>`__, 
`passwd(5@@shadow-utils) <../man5/passwd.5@@shadow-utils.html>`__, 
`nss-myhostname(8) <../man8/nss-myhostname.8.html>`__, 
`nss-mymachines(8) <../man8/nss-mymachines.8.html>`__, 
`nss-systemd(8) <../man8/nss-systemd.8.html>`__

--------------

`Copyright and license for this manual
page <../man1/getent.1.license.html>`__

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
