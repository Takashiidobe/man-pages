.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

slapo-refint(5) — Linux manual page
===================================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `                                 |                                   |
| CONFIGURATION <#CONFIGURATION>`__ |                                   |
| \| `FILES <#FILES>`__ \|          |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `ACKNOW                           |                                   |
| LEDGEMENTS <#ACKNOWLEDGEMENTS>`__ |                                   |
| \| `COLOPHON <#COLOPHON>`__       |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   SLAPO-REFINT(5)            File Formats Manual           SLAPO-REFINT(5)

NAME
-------------------------------------------------

::

          slapo-refint - Referential Integrity overlay to slapd


---------------------------------------------------------

::

          ETCDIR/slapd.conf


---------------------------------------------------------------

::

          The Referential Integrity overlay can be used with a backend
          database such as slapd-mdb(5) to maintain the cohesiveness of a
          schema which utilizes reference attributes.

          Integrity is maintained by updating database records which
          contain the named attributes to match the results of a modrdn or
          delete operation. For example, if the integrity attribute were
          configured as manager, deletion of the record
          "uid=robert,ou=people,dc=example,dc=com" would trigger a search
          for all other records which have a manager attribute containing
          that DN. Entries matching that search would have their manager
          attribute removed.  Or, renaming the same record into
          "uid=george,ou=people,dc=example,dc=com" would trigger a search
          for all other records which have a manager attribute containing
          that DN.  Entries matching that search would have their manager
          attribute deleted and replaced by the new DN.

          rootdn must be set for the database.  refint runs as the rootdn
          to gain access to make its updates.  rootpw is not needed.


-------------------------------------------------------------------

::

          These slapd.conf options apply to the Referential Integrity
          overlay.  They should appear after the overlay directive.

          refint_attributes <attribute> [...]
                 Specify one or more attributes for which integrity will be
                 maintained as described above.

          refint_nothing <string>
                 Specify an arbitrary value to be used as a placeholder
                 when the last value would otherwise be deleted from an
                 attribute. This can be useful in cases where the schema
                 requires the existence of an attribute for which
                 referential integrity is enforced. The attempted deletion
                 of a required attribute will otherwise result in an Object
                 Class Violation, causing the request to fail.  The string
                 must be a valid DN.

          refint_modifiersname <DN>
                 Specify the DN to be used as the modifiersName of the
                 internal modifications performed by the overlay.  It
                 defaults to "cn=Referential Integrity Overlay".

          Modifications performed by this overlay are not propagated during
          replication. This overlay must be configured identically on
          replication consumers in order to maintain full synchronization
          with the provider.


---------------------------------------------------

::

          ETCDIR/slapd.conf
                 default slapd configuration file


---------------------------------------------------------

::

          slapd.conf(5), slapd-config(5).


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

   OpenLDAP LDVERSION             RELEASEDATE               SLAPO-REFINT(5)

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
