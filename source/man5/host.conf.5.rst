.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

host.conf(5) — Linux manual page
================================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `ENVIRONMENT <#ENVIRONMENT>`__ \| |                                   |
| `FILES <#FILES>`__ \|             |                                   |
| `NOTES <#NOTES>`__ \|             |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   HOST.CONF(5)           Linux System Administration          HOST.CONF(5)

NAME
-------------------------------------------------

::

          host.conf - resolver configuration file


---------------------------------------------------------------

::

          The file /etc/host.conf contains configuration information
          specific to the resolver library.  It should contain one
          configuration keyword per line, followed by appropriate
          configuration information.  The following keywords are
          recognized:

          trim   This keyword may be listed more than once.  Each time it
                 should be followed by a list of domains, separated by
                 colons (':'), semicolons (';') or commas (','), with the
                 leading dot.  When set, the resolver library will
                 automatically trim the given domain name from the end of
                 any hostname resolved via DNS.  This is intended for use
                 with local hosts and domains.  (Related note: trim will
                 not affect hostnames gathered via NIS or the hosts(5)
                 file.  Care should be taken to ensure that the first
                 hostname for each entry in the hosts file is fully
                 qualified or unqualified, as appropriate for the local
                 installation.)

          multi  Valid values are on and off.  If set to on, the resolver
                 library will return all valid addresses for a host that
                 appears in the /etc/hosts file, instead of only the first.
                 This is off by default, as it may cause a substantial
                 performance loss at sites with large hosts files.

          reorder
                 Valid values are on and off.  If set to on, the resolver
                 library will attempt to reorder host addresses so that
                 local addresses (i.e., on the same subnet) are listed
                 first when a gethostbyname(3) is performed.  Reordering is
                 done for all lookup methods.  The default value is off.


---------------------------------------------------------------

::

          The following environment variables can be used to allow users to
          override the behavior which is configured in /etc/host.conf:

          RESOLV_HOST_CONF
                 If set, this variable points to a file that should be read
                 instead of /etc/host.conf.

          RESOLV_MULTI
                 Overrides the multi command.

          RESOLV_REORDER
                 Overrides the reorder command.

          RESOLV_ADD_TRIM_DOMAINS
                 A list of domains,  separated by colons (':'), semicolons
                 (';'), or commas (','), with the leading dot, which will
                 be added to the list of domains that should be trimmed.

          RESOLV_OVERRIDE_TRIM_DOMAINS
                 A list of domains,  separated by colons (':'), semicolons
                 (';'), or commas (','), with the leading dot, which will
                 replace the list of domains that should be trimmed.
                 Overrides the trim command.


---------------------------------------------------

::

          /etc/host.conf
                 Resolver configuration file

          /etc/resolv.conf
                 Resolver configuration file

          /etc/hosts
                 Local hosts database


---------------------------------------------------

::

          The following differences exist compared to the original
          implementation.  A new command spoof and a new environment
          variable RESOLV_SPOOF_CHECK can take arguments like off, nowarn,
          and warn.  Line comments can appear anywhere and not only at the
          beginning of a line.

      Historical
          The nsswitch.conf(5) file is the modern way of controlling the
          order of host lookups.

          In glibc 2.4 and earlier, the following keyword is recognized:

          order  This keyword specifies how host lookups are to be
                 performed.  It should be followed by one or more lookup
                 methods, separated by commas.  Valid methods are bind,
                 hosts, and nis.

          RESOLV_SERV_ORDER
                 Overrides the order command.

          Since glibc 2.0.7, and up through glibc 2.24, the following
          keywords and environment variable have been recognized but never
          implemented:

          nospoof
                 Valid values are on and off.  If set to on, the resolver
                 library will attempt to prevent hostname spoofing to
                 enhance the security of rlogin and rsh.  It works as
                 follows: after performing a host address lookup, the
                 resolver library will perform a hostname lookup for that
                 address.  If the two hostnames do not match, the query
                 fails.  The default value is off.

          spoofalert
                 Valid values are on and off.  If this option is set to on
                 and the nospoof option is also set, the resolver library
                 will log a warning of the error via the syslog facility.
                 The default value is off.

          spoof  Valid values are off, nowarn, and warn.  If this option is
                 set to off, spoofed addresses are permitted and no
                 warnings will be emitted via the syslog facility.  If this
                 option is set to warn, the resolver library will attempt
                 to prevent hostname spoofing to enhance the security and
                 log a warning of the error via the syslog facility.  If
                 this option is set to nowarn, the resolver library will
                 attempt to prevent hostname spoofing to enhance the
                 security but not emit warnings via the syslog facility.
                 Setting this option to anything else is equal to setting
                 it to nowarn.

          RESOLV_SPOOF_CHECK
                 Overrides the nospoof, spoofalert, and spoof commands in
                 the same way as the spoof command is parsed.  Valid values
                 are off, nowarn, and warn.


---------------------------------------------------------

::

          gethostbyname(3), hosts(5), nsswitch.conf(5), resolv.conf(5),
          hostname(7), named(8)

COLOPHON
---------------------------------------------------------

::

          This page is part of release 5.13 of the Linux man-pages project.
          A description of the project, information about reporting bugs,
          and the latest version of this page, can be found at
          https://www.kernel.org/doc/man-pages/.

   Linux                          2019-03-06                   HOST.CONF(5)

--------------

Pages that refer to this page:
`gethostbyname(3) <../man3/gethostbyname.3.html>`__, 
`hosts(5) <../man5/hosts.5.html>`__, 
`resolv.conf(5) <../man5/resolv.conf.5.html>`__

--------------

`Copyright and license for this manual
page <../man5/host.conf.5.license.html>`__

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
