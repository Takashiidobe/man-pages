.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

hostname(7) — Linux manual page
===============================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   HOSTNAME(7)             Linux Programmer's Manual            HOSTNAME(7)

NAME
-------------------------------------------------

::

          hostname - hostname resolution description


---------------------------------------------------------------

::

          Hostnames are domains, where a domain is a hierarchical, dot-
          separated list of subdomains; for example, the machine "monet",
          in the "example" subdomain of the "com" domain would be
          represented as "monet.example.com".

          Each element of the hostname must be from 1 to 63 characters long
          and the entire hostname, including the dots, can be at most 253
          characters long.  Valid characters for hostnames are ASCII(7)
          letters from a to z, the digits from 0 to 9, and the hyphen (-).
          A hostname may not start with a hyphen.

          Hostnames are often used with network client and server programs,
          which must generally translate the name to an address for use.
          (This task is generally performed by either getaddrinfo(3) or the
          obsolete gethostbyname(3).)

          Hostnames are resolved by the NSS framework in glibc according to
          the hosts configuration in nsswitch.conf.  The DNS-based name
          resolver (in the dns NSS service module) resolves them in the
          following fashion.

          If the name consists of a single component, that is, contains no
          dot, and if the environment variable HOSTALIASES is set to the
          name of a file, that file is searched for any string matching the
          input hostname.  The file should consist of lines made up of two
          white-space separated strings, the first of which is the hostname
          alias, and the second of which is the complete hostname to be
          substituted for that alias.  If a case-insensitive match is found
          between the hostname to be resolved and the first field of a line
          in the file, the substituted name is looked up with no further
          processing.

          If the input name ends with a trailing dot, the trailing dot is
          removed, and the remaining name is looked up with no further
          processing.

          If the input name does not end with a trailing dot, it is looked
          up by searching through a list of domains until a match is found.
          The default search list includes first the local domain, then its
          parent domains with at least 2 name components (longest first).
          For example, in the domain cs.example.com, the name lithium.cchem
          will be checked first as lithium.cchem.cs.example and then as
          lithium.cchem.example.com.  lithium.cchem.com will not be tried,
          as there is only one component remaining from the local domain.
          The search path can be changed from the default by a system-wide
          configuration file (see resolver(5)).


---------------------------------------------------------

::

          getaddrinfo(3), gethostbyname(3), nsswitch.conf(5), resolver(5),
          mailaddr(7), named(8)

          IETF RFC 1123 ⟨http://www.ietf.org/rfc/rfc1123.txt⟩

          IETF RFC 1178 ⟨http://www.ietf.org/rfc/rfc1178.txt⟩

COLOPHON
---------------------------------------------------------

::

          This page is part of release 5.13 of the Linux man-pages project.
          A description of the project, information about reporting bugs,
          and the latest version of this page, can be found at
          https://www.kernel.org/doc/man-pages/.

   Linux                          2019-05-09                    HOSTNAME(7)

--------------

Pages that refer to this page:
`getaddrinfo(3) <../man3/getaddrinfo.3.html>`__, 
`getaddrinfo_a(3) <../man3/getaddrinfo_a.3.html>`__, 
`gethostbyname(3) <../man3/gethostbyname.3.html>`__, 
`getnameinfo(3) <../man3/getnameinfo.3.html>`__, 
`resolver(3) <../man3/resolver.3.html>`__, 
`host.conf(5) <../man5/host.conf.5.html>`__, 
`hostname(5) <../man5/hostname.5.html>`__, 
`hosts(5) <../man5/hosts.5.html>`__, 
`resolv.conf(5) <../man5/resolv.conf.5.html>`__, 
`sm-notify(8) <../man8/sm-notify.8.html>`__

--------------

`Copyright and license for this manual
page <../man7/hostname.7.license.html>`__

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
