.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

slapd.backends(5) — Linux manual page
=====================================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `FILES <#FILES>`__ \|             |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `ACKNOW                           |                                   |
| LEDGEMENTS <#ACKNOWLEDGEMENTS>`__ |                                   |
| \| `COLOPHON <#COLOPHON>`__       |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   SLAPD.BACKENDS(5)          File Formats Manual         SLAPD.BACKENDS(5)

NAME
-------------------------------------------------

::

          slapd.backends - backends for slapd, the stand-alone LDAP daemon


---------------------------------------------------------------

::

          The slapd(8) daemon can use a variety of different backends for
          serving LDAP requests.  Backends may be compiled statically into
          slapd, or when module support is enabled, they may be dynamically
          loaded. Multiple instances of a backend can be configured, to
          serve separate databases from the same slapd server.

          Configuration options for each backend are documented separately
          in the corresponding slapd-<backend>(5) manual pages.

          asyncmeta
                 This backend performs basic LDAP proxying with respect to
                 a set of remote LDAP servers. It is an enhancement of the
                 ldap backend that operates asynchronously, to prevent
                 tying up slapd threads while waiting for operations to
                 complete.

          config This backend is used to manage the configuration of slapd
                 at run-time.  Unlike other backends, only a single
                 instance of the config backend may be defined. It also
                 instantiates itself automatically, so it is always present
                 even if not explicitly defined in the slapd.conf(5) file.

          dnssrv This backend is experimental.  It serves up referrals
                 based upon SRV resource records held in the Domain Name
                 System.

          ldap   This backend acts as a proxy to forward incoming requests
                 to another LDAP server.

          ldif   This database uses the filesystem to build the tree
                 structure of the database, using plain ascii files to
                 store data.  Its usage should be limited to very simple
                 databases, where performance is not a requirement. This
                 backend also supports subtree renames.

          mdb    This is the recommended primary backend.  This backend
                 uses OpenLDAP's own MDB transactional database library.
                 This backend also supports subtree renames.

          meta   This backend performs basic LDAP proxying with respect to
                 a set of remote LDAP servers. It is an enhancement of the
                 ldap backend.

          monitor
                 This backend provides information about the running status
                 of the slapd daemon. Only a single instance of the monitor
                 backend may be defined.

          null   Operations in this backend succeed but do nothing.

          passwd This backend is provided for demonstration purposes only.
                 It serves up user account information from the system
                 passwd(5) file.

          perl   This backend embeds a perl(1) interpreter into slapd.  It
                 runs Perl subroutines to implement LDAP operations.  This
                 backend is deprecated.

          relay  This backend is experimental.  It redirects LDAP
                 operations to another database in the same server, based
                 on the naming context of the request.  Its use requires
                 the rwm overlay (see slapo-rwm(5) for details) to rewrite
                 the naming context of the request.  It is primarily
                 intended to implement virtual views on databases that
                 actually store data.

          sql    This backend is experimental and deprecated.  It services
                 LDAP requests from an SQL database.

          wiredtiger
                 This backend is experimental.  It services LDAP requests
                 from a wiredtiger database.


---------------------------------------------------

::

          ETCDIR/slapd.conf
                 default slapd configuration file

          ETCDIR/slapd.d
                 default slapd configuration directory


---------------------------------------------------------

::

          ldap(3), slapd-asyncmeta(5), slapd-config(5), slapd-dnssrv(5),
          slapd-ldap(5), slapd-ldif(5), slapd-mdb(5), slapd-meta(5),
          slapd-monitor(5), slapd-null(5), slapd-passwd(5), slapd-perl(5),
          slapd-relay(5), slapd-sql(5), slapd-wt(5), slapd.conf(5),
          slapd.overlays(5), slapd(8).  "OpenLDAP Administrator's Guide"
          (http://www.OpenLDAP.org/doc/admin/)


-------------------------------------------------------------------------

::

          OpenLDAP Software is developed and maintained by The OpenLDAP
          Project <http://www.openldap.org/>.  OpenLDAP Software is derived
          from the University of Michigan LDAP 3.3 Release.

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

   OpenLDAP LDVERSION             RELEASEDATE             SLAPD.BACKENDS(5)

--------------

Pages that refer to this page:
`slapd.conf(5) <../man5/slapd.conf.5.html>`__, 
`slapd-config(5) <../man5/slapd-config.5.html>`__, 
`slapd.overlays(5) <../man5/slapd.overlays.5.html>`__

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
