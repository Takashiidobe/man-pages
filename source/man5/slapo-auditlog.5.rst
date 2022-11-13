.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

slapo-auditlog(5) — Linux manual page
=====================================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `                                 |                                   |
| CONFIGURATION <#CONFIGURATION>`__ |                                   |
| \|                                |                                   |
| `COMMENT FIELD INFORMATIO         |                                   |
| N <#COMMENT_FIELD_INFORMATION>`__ |                                   |
| \| `EXAMPLE <#EXAMPLE>`__ \|      |                                   |
| `EXAMPLE                          |                                   |
| CHANGELOG <#EXAMPLE_CHANGELOG>`__ |                                   |
| \| `FILES <#FILES>`__ \|          |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   SLAPO-AUDITLOG(5)          File Formats Manual         SLAPO-AUDITLOG(5)

NAME
-------------------------------------------------

::

          slapo-auditlog - Audit Logging overlay to slapd


---------------------------------------------------------

::

          ETCDIR/slapd.conf

          ETCDIR/slapd.d


---------------------------------------------------------------

::

          The Audit Logging overlay can be used to record all changes on a
          given backend database to a specified log file. Changes are
          logged as standard LDIF, with an additional comment header
          providing six fields of information about the change. A second
          comment header is added at the end of the operation to note the
          termination of the change.

          For Add and Modify operations the identity comes from the
          modifiersName associated with the operation. This is usually the
          same as the requestor's identity, but may be set by other
          overlays to reflect other values.


-------------------------------------------------------------------

::

          This slapd.conf option applies to the Audit Logging overlay.  It
          should appear after the overlay directive.

          auditlog <filename>
                 Specify the fully qualified path for the log file.

          olcAuditlogFile <filename>
                 For use with cn=config


-------------------------------------------------------------------------------------------

::

          The first field is the operation type.
          The second field is the timestamp of the operation in seconds
          since epoch.
          The third field is the suffix of the database.
          The fourth field is the recorded modifiersName.
          The fifth field is the originating IP address and port.
          The sixth field is the connection number. A connection number of
          -1 indicates an internal slapd operation.


-------------------------------------------------------

::

          The following LDIF could be used to add this overlay to cn=config
          (adjust to suit)

                 dn: olcOverlay=auditlog,olcDatabase={1}mdb,cn=config
                 changetype: add
                 objectClass: olcOverlayConfig
                 objectClass: olcAuditLogConfig
                 olcOverlay: auditlog
                 olcAuditlogFile: /tmp/auditlog.ldif


---------------------------------------------------------------------------

::

                 # modify 1614223245 dc=example,dc=com cn=admin,dc=example,dc=com IP=[::1]:47270 conn=1002
                 dn: uid=joepublic,ou=people,dc=example,dc=com
                 changetype: modify
                 replace: displayName
                 displayName: Joe Public
                 -
                 replace: entryCSN
                 entryCSN: 20210225032045.045229Z#000000#001#000000
                 -
                 replace: modifiersName
                 modifiersName: cn=admin,dc=example,dc=com
                 -
                 replace: modifyTimestamp
                 modifyTimestamp: 20210225032045Z
                 -
                 # end modify 1614223245


---------------------------------------------------

::

          ETCDIR/slapd.conf
                 default slapd configuration file

          ETCDIR/slapd.d
                 default slapd configuration directory


---------------------------------------------------------

::

          slapd.conf(5), slapd-config(5).

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

   OpenLDAP LDVERSION             RELEASEDATE             SLAPO-AUDITLOG(5)

--------------

Pages that refer to this page:
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
