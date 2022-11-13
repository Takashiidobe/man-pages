.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

slapd-wt(5) — Linux manual page
===============================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `                                 |                                   |
| CONFIGURATION <#CONFIGURATION>`__ |                                   |
| \|                                |                                   |
| `AC                               |                                   |
| CESS CONTROL <#ACCESS_CONTROL>`__ |                                   |
| \| `FILES <#FILES>`__ \|          |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `ACKNOW                           |                                   |
| LEDGEMENTS <#ACKNOWLEDGEMENTS>`__ |                                   |
| \| `COLOPHON <#COLOPHON>`__       |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   SLAPD-WT(5)                File Formats Manual               SLAPD-WT(5)

NAME
-------------------------------------------------

::

          slapd-wt - WiredTiger backend to slapd


---------------------------------------------------------

::

          ETCDIR/slapd.conf


---------------------------------------------------------------

::

          The wt backend to slapd(8) uses WiredTiger database library to
          store data.

          The wt backend is experimental module that have potential high
          write performance and high concurrency performance.  This backend
          have not some basic feature yet. Please backup data using slapcat
          before update the module.


-------------------------------------------------------------------

::

          These slapd.conf options apply to the wt backend database.  That
          is, they must follow a "database wt" line and come before any
          subsequent "backend" or "database" lines.  Other database options
          are described in the slapd.conf(5) manual page.

          directory <directory>
                 Specify WiredTiger home directory that containing this
                 database and associated indexes live.  A separate
                 directory must be specified for each database.  The
                 default is LOCALSTATEDIR/openldap-data.

          idlcache <boolean>
                 Use the in-memory idlcache. The default is true.

          index {<attrlist>|default} [pres,eq,approx,sub,<special>]
                 Specify the indexes to maintain for the given attribute
                 (or list of attributes).  Some attributes only support a
                 subset of indexes.  If only an <attr> is given, the
                 indices specified for default are maintained.  Note that
                 setting a default does not imply that all attributes will
                 be indexed. Also, for best performance, an eq index should
                 always be configured for the objectClass attribute.

          mode <integer>
                 back-wt does not support mode option. use umask instead.

          wtconfig {create,cache_size=512M,async=(enabled)}
                 Specify configuration for wiredtiger, This parameter is
                 pass to wiredtiger_open(3).

                 create create the database if it does not exist.

                 cache_size
                        maximum heap memory to allocate for the cache.

                 async  asynchronous operations configuration options.
                        disabled by default.


---------------------------------------------------------------------

::

          The wt backend honors access control semantics as indicated in
          slapd.access(5).


---------------------------------------------------

::

          ETCDIR/slapd.conf
                 default slapd configuration file


---------------------------------------------------------

::

          slapd.conf(5), slapd-config(5), slapd(8), slapadd(8), slapcat(8),
          slapindex(8), slapmodify(8), WiredTiger documentation.


-------------------------------------------------------------------------

::

          OpenLDAP Software is developed and maintained by The OpenLDAP
          Project <http://www.openldap.org/>.  OpenLDAP Software is derived
          from the University of Michigan LDAP 3.3 Release.  Written by
          HAMANO Tsukasa <hamano@osstech.co.jp>.

COLOPHON
---------------------------------------------------------

::

          This page is part of the OpenLDAP (an open source implementation
          of the Lightweight Directory Access Protocol) project.
          Information about the project can be found at 
          ⟨http://www.openldap.org/⟩.  If you have a bug report for this
          manual page, see ⟨http://www.openldap.org/its/⟩.  This page was
          obtained from the project's upstream Git repository
          ⟨https://git.openldap.org/openldap/openldap.git⟩ on 2021-08-27.
          (At that time, the date of the most recent commit that was found
          in the repository was 2021-08-26.)  If you discover any rendering
          problems in this HTML version of the page, or you believe there
          is a better or more up-to-date source for the page, or you have
          corrections or improvements to the information in this COLOPHON
          (which is not part of the original manual page), send a mail to
          man-pages@man7.org

   OpenLDAP LDVERSION             RELEASEDATE                   SLAPD-WT(5)

--------------

Pages that refer to this page:
`slapd.backends(5) <../man5/slapd.backends.5.html>`__

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
