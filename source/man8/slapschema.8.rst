.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

slapschema(8) — Linux manual page
=================================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `OPTIONS <#OPTIONS>`__ \|         |                                   |
| `LIMITATIONS <#LIMITATIONS>`__ \| |                                   |
| `EXAMPLES <#EXAMPLES>`__ \|       |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `ACKNOW                           |                                   |
| LEDGEMENTS <#ACKNOWLEDGEMENTS>`__ |                                   |
| \| `COLOPHON <#COLOPHON>`__       |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   SLAPSCHEMA(8C)                                            SLAPSCHEMA(8C)

NAME
-------------------------------------------------

::

          slapschema - SLAPD in-database schema checking utility


---------------------------------------------------------

::

          SBINDIR/slapschema [-afilter] [-bsuffix] [-c] [-ddebug-level]
          [-fslapd.conf] [-Fconfdir] [-g] [-HURI] [-lerror-file] [-ndbnum]
          [-ooption[=value]] [-ssubtree-dn] [-v]


---------------------------------------------------------------

::

          Slapschema is used to check schema compliance of the contents of
          a slapd(8) database.  It opens the given database determined by
          the database number or suffix and checks the compliance of its
          contents with the corresponding schema. Errors are written to
          standard output or the specified file.  Databases configured as
          subordinate of this one are also output, unless -g is specified.

          Administrators may need to modify existing schema items,
          including adding new required attributes to objectClasses,
          removing existing required or allowed attributes from
          objectClasses, entirely removing objectClasses, or any other
          change that may result in making perfectly valid entries no
          longer compliant with the modified schema.  The execution of the
          slapschema tool after modifying the schema can point out
          inconsistencies that would otherwise surface only when
          inconsistent entries need to be modified.

          The entry records are checked in database order, not superior
          first order.  The entry records will be checked considering all
          (user and operational) attributes stored in the database.
          Dynamically generated attributes (such as subschemaSubentry) will
          not be considered.


-------------------------------------------------------

::

          -a filter
                 Only check entries matching the asserted filter.  For
                 example

                 slapschema -a \
                     "(!(entryDN:dnSubtreeMatch:=ou=People,dc=example,dc=com))"

                 will check all but the "ou=People,dc=example,dc=com"
                 subtree of the "dc=example,dc=com" database.  Deprecated;
                 use -H ldap:///???(filter) instead.

          -b suffix
                 Use the specified suffix to determine which database to
                 check. By default, the first database that supports the
                 requested operation is used. The -b cannot be used in
                 conjunction with the -n option.

          -c     Enable continue (ignore errors) mode.

          -d debug-level
                 Enable debugging messages as defined by the specified
                 debug-level; see slapd(8) for details.

          -f slapd.conf
                 Specify an alternative slapd.conf(5) file.

          -F confdir
                 specify a config directory.  If both -f and -F are
                 specified, the config file will be read and converted to
                 config directory format and written to the specified
                 directory.  If neither option is specified, an attempt to
                 read the default config directory will be made before
                 trying to use the default config file. If a valid config
                 directory exists then the default config file is ignored.

          -g     disable subordinate gluing.  Only the specified database
                 will be processed, and not its glued subordinates (if
                 any).

          -H  URI
                 use dn, scope and filter from URI to only handle matching
                 entries.

          -l error-file
                 Write errors to specified file instead of standard output.

          -n dbnum
                 Check the dbnum-th database listed in the configuration
                 file. The config database slapd-config(5), is always the
                 first database, so use -n 0

                 The -n cannot be used in conjunction with the -b option.

          -o option[=value]
                 Specify an option with a(n optional) value.  Possible
                 generic options/values are:

                        syslog=<subsystems>  (see `-s' in slapd(8))
                        syslog-level=<level> (see `-S' in slapd(8))
                        syslog-user=<user>   (see `-l' in slapd(8))

          -s subtree-dn
                 Only check entries in the subtree specified by this DN.
                 Implies -b subtree-dn if no -b nor -n option is given.
                 Deprecated; use -H ldap:///subtree-dn instead.

          -v     Enable verbose mode.


---------------------------------------------------------------

::

          For some backend types, your slapd(8) should not be running (at
          least, not in read-write mode) when you do this to ensure
          consistency of the database. It is always safe to run slapschema
          with the slapd-mdb(5), and slapd-null(5) backends.


---------------------------------------------------------

::

          To check the schema compliance of your SLAPD database after
          modifications to the schema, and put any error in a file called
          errors.ldif, give the command:

               SBINDIR/slapschema -l errors.ldif


---------------------------------------------------------

::

          ldap(3), ldif(5), slapd(8)

          "OpenLDAP Administrator's Guide"
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

   OpenLDAP LDVERSION             RELEASEDATE                SLAPSCHEMA(8C)

--------------

Pages that refer to this page: `slapd(8) <../man8/slapd.8.html>`__

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
