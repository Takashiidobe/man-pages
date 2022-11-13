.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

slapd.overlays(5) — Linux manual page
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

   SLAPD.OVERLAYS(5)          File Formats Manual         SLAPD.OVERLAYS(5)

NAME
-------------------------------------------------

::

          slapd.overlays - overlays for slapd, the stand-alone LDAP daemon


---------------------------------------------------------------

::

          The slapd(8) daemon can use a variety of different overlays to
          alter or extend the normal behavior of a database backend.
          Overlays may be compiled statically into slapd, or when module
          support is enabled, they may be dynamically loaded. Most of the
          overlays are only allowed to be configured on individual
          databases, but some may also be configured globally.

          Configuration options for each overlay are documented separately
          in the corresponding slapo-<overlay>(5) manual pages.

          accesslog
                 Access Logging.  This overlay can record accesses to a
                 given backend database on another database.

          auditlog
                 Audit Logging.  This overlay records changes on a given
                 backend database to an LDIF log file.  By default it is
                 not built.

          autoca Automatic Certificate Authority overlay.  This overlay can
                 generate X.509 certificate/key pairs for entries in the
                 directory if slapd is linked to OpenSSL.  By default it is
                 not built.

          chain  Chaining.  This overlay allows automatic referral chasing
                 when a referral would have been returned, either when
                 configured by the server or when requested by the client.

          collect
                 Collective Attributes.  This overlay implements RFC 3671
                 collective attributes; these attributes share common
                 values over all the members of the collection as inherited
                 from an ancestor entry.

          constraint
                 Constraint.  This overlay enforces a regular expression
                 constraint on all values of specified attributes. It is
                 used to enforce a more rigorous syntax when the underlying
                 attribute syntax is too general.

          dds    Dynamic Directory Services.  This overlay supports dynamic
                 objects, which have a limited life after which they expire
                 and are automatically deleted.

          deref  Dereference Control.  This overlay implements the draft
                 Dereference control. The overlay can be used with any
                 backend or globally for all backends.

          dyngroup
                 Dynamic Group.  This is a demo overlay which extends the
                 Compare operation to detect members of a dynamic group.
                 It has no effect on any other operations.

          dynlist
                 Dynamic List.  This overlay allows expansion of dynamic
                 groups and more.

          homedir
                 Home Directory Provisioning.  This overlay manages
                 creation/deletion of home directories for LDAP-based Unix
                 accounts.

          memberof
                 MemberOf.  This overlay maintains automatic reverse group
                 membership values, typically stored in an attribute called
                 memberOf. This overlay is deprecated and should be
                 replaced with dynlist.

          otp    OATH One-Time Password module.  This module allows time-
                 based one-time password, AKA "authenticator-style", and
                 HMAC-based one-time password authentication to be used in
                 conjunction with a standard LDAP password for two factor
                 authentication.

          pbind  Proxybind.  This overlay forwards simple bind requests on
                 a local database to a remote LDAP server.

          pcache Proxycache.  This overlay allows caching of LDAP search
                 requests in a local database.  It is most often used with
                 the slapd-ldap(5) or slapd-meta(5) backends.

          ppolicy
                 Password Policy.  This overlay provides a variety of
                 password control mechanisms, e.g. password aging, password
                 reuse and duplication control, mandatory password resets,
                 etc.

          refint Referential Integrity.  This overlay can be used with a
                 backend database such as slapd-mdb(5) to maintain the
                 cohesiveness of a schema which utilizes reference
                 attributes.

          remoteauth
                 Remote Authentication.  This overlay delegates
                 authentication requests to remote directories.

          retcode
                 Return Code.  This overlay is useful to test the behavior
                 of clients when server-generated erroneous and/or unusual
                 responses occur.

          rwm    Rewrite/remap.  This overlay is experimental.  It performs
                 basic DN/data rewrite and objectClass/attributeType
                 mapping.

          sssvlv Server Side Sorting and Virtual List Views.  This overlay
                 implements the RFC2891 server-side sorting control and
                 virtual list view controls, and replaces the RFC2696
                 paged-results implementation to ensure it works with the
                 sorting technique.

          syncprov
                 Syncrepl Provider.  This overlay implements the provider-
                 side support for syncrepl replication, including
                 persistent search functionality.

          translucent
                 Translucent Proxy.  This overlay can be used with a
                 backend database such as slapd-mdb(5) to create a
                 "translucent proxy".  Content of entries retrieved from a
                 remote LDAP server can be partially overridden by the
                 database.

          unique Attribute Uniqueness.  This overlay can be used with a
                 backend database such as slapd-mdb(5) to enforce the
                 uniqueness of some or all attributes within a subtree.

          valsort
                 Value Sorting.  This overlay can be used to enforce a
                 specific order for the values of an attribute when it is
                 returned in a search.


---------------------------------------------------

::

          ETCDIR/slapd.conf
                 default slapd configuration file

          ETCDIR/slapd.d
                 default slapd configuration directory


---------------------------------------------------------

::

          ldap(3), slapo-accesslog(5), slapo-auditlog(5), slapo-autoca(5),
          slapo-chain(5), slapo-collect(5), slapo-constraint(5),
          slapo-dds(5), slapo-deref(5), slapo-dyngroup(5),
          slapo-dynlist(5), slapo-memberof(5), slapo-pbind(5),
          slapo-pcache(5), slapo-ppolicy(5), slapo-refint(5),
          slapo-remoteauth(5), slapo-retcode(5), slapo-rwm(5),
          slapo-sssvlv(5), slapo-syncprov(5), slapo-translucent(5),
          slapo-unique(5).  slapo-valsort(5).  slapd-config(5),
          slapd.conf(5), slapd.backends(5), slapd(8).  "OpenLDAP
          Administrator's Guide" (http://www.OpenLDAP.org/doc/admin/)


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

   OpenLDAP LDVERSION             RELEASEDATE             SLAPD.OVERLAYS(5)

--------------

Pages that refer to this page:
`slapd.backends(5) <../man5/slapd.backends.5.html>`__, 
`slapd.conf(5) <../man5/slapd.conf.5.html>`__, 
`slapd-config(5) <../man5/slapd-config.5.html>`__

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
