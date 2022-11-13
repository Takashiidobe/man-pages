.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

nss(5) — Linux manual page
==========================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `FILES <#FILES>`__ \|             |                                   |
| `EXAMPLES <#EXAMPLES>`__ \|       |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   NSS(5)                  Linux Programmer's Manual                 NSS(5)

NAME
-------------------------------------------------

::

          nss - Name Service Switch configuration file


---------------------------------------------------------------

::

          Each call to a function which retrieves data from a system
          database like the password or group database is handled by the
          Name Service Switch implementation in the GNU C library.  The
          various services provided are implemented by independent modules,
          each of which naturally varies widely from the other.

          The default implementations coming with the GNU C library are by
          default conservative and do not use unsafe data.  This might be
          very costly in some situations, especially when the databases are
          large.  Some modules allow the system administrator to request
          taking shortcuts if these are known to be safe.  It is then the
          system administrator's responsibility to ensure the assumption is
          correct.

          There are other modules where the implementation changed over
          time.  If an implementation used to sacrifice speed for memory
          consumption, it might create problems if the preference is
          switched.

          The /etc/default/nss file contains a number of variable
          assignments.  Each variable controls the behavior of one or more
          NSS modules.  White spaces are ignored.  Lines beginning with '#'
          are treated as comments.

          The variables currently recognized are:

          NETID_AUTHORITATIVE = TRUE|FALSE
                 If set to TRUE, the NIS backend for the initgroups(3)
                 function will accept the information from the netid.byname
                 NIS map as authoritative.  This can speed up the function
                 significantly if the group.byname map is large.  The
                 content of the netid.byname map is used as is.  The system
                 administrator has to make sure it is correctly generated.

          SERVICES_AUTHORITATIVE = TRUE|FALSE
                 If set to TRUE, the NIS backend for the getservbyname(3)
                 and getservbyname_r(3) functions will assume that the
                 services.byservicename NIS map exists and is
                 authoritative, particularly that it contains both keys
                 with /proto and without /proto for both primary service
                 names and service aliases.  The system administrator has
                 to make sure it is correctly generated.

          SETENT_BATCH_READ = TRUE|FALSE
                 If set to TRUE, the NIS backend for the setpwent(3) and
                 setgrent(3) functions will read the entire database at
                 once and then hand out the requests one by one from memory
                 with every corresponding getpwent(3) or getgrent(3) call
                 respectively.  Otherwise, each getpwent(3) or getgrent(3)
                 call might result in a network communication with the
                 server to get the next entry.


---------------------------------------------------

::

          /etc/default/nss


---------------------------------------------------------

::

          The default configuration corresponds to the following
          configuration file:

              NETID_AUTHORITATIVE=FALSE
              SERVICES_AUTHORITATIVE=FALSE
              SETENT_BATCH_READ=FALSE


---------------------------------------------------------

::

          nsswitch.conf

COLOPHON
---------------------------------------------------------

::

          This page is part of release 5.13 of the Linux man-pages project.
          A description of the project, information about reporting bugs,
          and the latest version of this page, can be found at
          https://www.kernel.org/doc/man-pages/.

   Linux                          2020-06-09                         NSS(5)

--------------

Pages that refer to this page:
`nsswitch.conf(5) <../man5/nsswitch.conf.5.html>`__, 
`systemd-resolved.service(8) <../man8/systemd-resolved.service.8.html>`__

--------------

`Copyright and license for this manual
page <../man5/nss.5.license.html>`__

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
