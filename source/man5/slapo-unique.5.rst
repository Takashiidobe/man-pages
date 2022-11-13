.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

slapo-unique(5) — Linux manual page
===================================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `                                 |                                   |
| CONFIGURATION <#CONFIGURATION>`__ |                                   |
| \| `CAVEATS <#CAVEATS>`__ \|      |                                   |
| `FILES <#FILES>`__ \|             |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   SLAPO-UNIQUE(5)            File Formats Manual           SLAPO-UNIQUE(5)

NAME
-------------------------------------------------

::

          slapo-unique - Attribute Uniqueness overlay to slapd


---------------------------------------------------------

::

          ETCDIR/slapd.conf


---------------------------------------------------------------

::

          The Attribute Uniqueness overlay can be used with a backend
          database such as slapd-mdb(5) to enforce the uniqueness of some
          or all attributes within a scope. This subtree defaults to all
          objects within the subtree of the database for which the
          Uniqueness overlay is configured.

          Uniqueness is enforced by searching the subtree to ensure that
          the values of all attributes presented with an add, modify or
          modrdn operation are unique within the scope.  For example, if
          uniqueness were enforced for the uid attribute, the subtree would
          be searched for any other records which also have a uid attribute
          containing the same value. If any are found, the request is
          rejected.

          The search is performed using the rootdn of the database, to
          avoid issues with ACLs preventing the overlay from seeing all of
          the relevant data. As such, the database must have a rootdn
          configured.


-------------------------------------------------------------------

::

          These slapd.conf options apply to the Attribute Uniqueness
          overlay.  They should appear after the overlay directive.

          unique_uri <[strict ][ignore ][serialize ]URI[[ URI...]...]>
                 Configure the base, attributes, scope, and filter for
                 uniqueness checking.  Multiple URIs may be specified
                 within a domain, allowing complex selections of objects.
                 Multiple unique_uri statements or olcUniqueURI attribute
                 values will create independent domains, each with their
                 own independent lists of URIs and ignore/strict settings.

                 Keywords strict, ignore, and serialize have to be enclosed
                 in quotes (") together with the URI.

                 The LDAP URI syntax is a subset of RFC-4516, and takes the
                 form:

                 ldap:///[base dn]?[attributes...]?scope[?filter]

                 The base dn defaults to that of the back-end database.
                 Specified base dns must be within the subtree of the back-
                 end database.

                 If no attributes are specified, the URI applies to all
                 non-operational attributes.

                 The scope component is effectively mandatory, because LDAP
                 URIs default to base scope, which is not valid for
                 uniqueness, because groups of one object are always
                 unique.  Scopes of sub (for subtree) and one for one-level
                 are valid.

                 The filter component causes the domain to apply uniqueness
                 constraints only to matching objects.  e.g.
                 ldap:///?cn?sub?(sn=e*) would require unique cn attributes
                 for all objects in the subtree of the back-end database
                 whose sn starts with an e.

                 It is possible to assert uniqueness upon all non-
                 operational attributes except those listed by prepending
                 the keyword ignore If not configured, all non-operational
                 (e.g., system) attributes must be unique. Note that the
                 attributes list of an ignore URI should generally contain
                 the objectClass, dc, ou and o attributes, as these will
                 generally not be unique, nor are they operational
                 attributes.

                 It is possible to set strict checking for the uniqueness
                 domain by prepending the keyword strict.  By default,
                 uniqueness is not enforced for null values. Enabling
                 strict mode extends the concept of uniqueness to include
                 null values, such that only one attribute within a subtree
                 will be allowed to have a null value.  Strictness applies
                 to all URIs within a uniqueness domain, but some domains
                 may be strict while others are not.

                 It is possible to enforce strict serialization of
                 modifications by prepending the keyword serialize.  By
                 default, no serialization is performed, so multiple
                 modifications occurring nearly simultaneously may see
                 incomplete uniqueness results.  Using serialize will force
                 individual write operations to fully complete before
                 allowing any others to proceed, to ensure that each
                 operation's uniqueness checks are consistent.

          It is not possible to set both URIs and legacy slapo-unique
          configuration parameters simultaneously. In general, the legacy
          configuration options control pieces of a single unfiltered
          subtree domain.

          unique_base <basedn>
                 This legacy configuration parameter should be converted to
                 the base dn component of the above unique_uri style of
                 parameter.

          unique_ignore <attribute...>
                 This legacy configuration parameter should be converted to
                 a unique_uri parameter with ignore keyword as described
                 above.

          unique_attributes <attribute...>
                 This legacy configuration parameter should be converted to
                 a unique_uri parameter, as described above.

          unique_strict <attribute...>
                 This legacy configuration parameter should be converted to
                 a strict keyword prepended to a unique_uri parameter, as
                 described above.


-------------------------------------------------------

::

          unique_uri cannot be used with the old-style of configuration,
          and vice versa.  unique_uri can implement everything the older
          system can do, however.

          Typical attributes for the ignore ldap:///...  URIs are
          intentionally not hardcoded into the overlay to allow for maximum
          flexibility in meeting site-specific requirements.

          Replication and operations with the relax control are allowed to
          bypass this enforcement. It is therefore important that all
          servers accepting writes have this overlay configured in order to
          maintain uniqueness in a replicated DIT.


---------------------------------------------------

::

          ETCDIR/slapd.conf
                 default slapd configuration file


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

   OpenLDAP LDVERSION             RELEASEDATE               SLAPO-UNIQUE(5)

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
