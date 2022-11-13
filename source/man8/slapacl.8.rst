.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

slapacl(8) — Linux manual page
==============================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `OPTIONS <#OPTIONS>`__ \|         |                                   |
| `EXAMPLES <#EXAMPLES>`__ \|       |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `ACKNOW                           |                                   |
| LEDGEMENTS <#ACKNOWLEDGEMENTS>`__ |                                   |
| \| `COLOPHON <#COLOPHON>`__       |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   SLAPACL(8C)                                                  SLAPACL(8C)

NAME
-------------------------------------------------

::

          slapacl - Check access to a list of attributes.


---------------------------------------------------------

::

          SBINDIR/slapacl -b DN [-d debug-level] [-D authcDN | -U authcID]
          [-f slapd.conf] [-F confdir] [-o option[=value]] [-u] [-v]
          [-X authzID | -o  authzDN=DN] [attr[/access][:value]] [...]


---------------------------------------------------------------

::

          slapacl is used to check the behavior of slapd(8) by verifying
          access to directory data according to the access control list
          directives defined in its configuration.  It opens the
          slapd.conf(5) configuration file or the slapd-config(5) backend,
          reads in the access/olcAccess directives, and then parses the
          attr list given on the command-line; if none is given, access to
          the entry pseudo-attribute is tested.


-------------------------------------------------------

::

          -b DN  specify the DN which access is requested to; the
                 corresponding entry is fetched from the database, and thus
                 it must exist.  The DN is also used to determine what
                 rules apply; thus, it must be in the naming context of a
                 configured database. By default, the first database that
                 supports the requested operation is used.  See also -u.

          -d debug-level
                 enable debugging messages as defined by the specified
                 debug-level; see slapd(8) for details.

          -D authcDN
                 specify a DN to be used as identity through the test
                 session when selecting appropriate <by> clauses in access
                 lists.

          -f slapd.conf
                 specify an alternative slapd.conf(5) file.

          -F confdir
                 specify a config directory.  If both -f and -F are
                 specified, the config file will be read and converted to
                 config directory format and written to the specified
                 directory.  If neither option is specified, an attempt to
                 read the default config directory will be made before
                 trying to use the default config file. If a valid config
                 directory exists then the default config file is ignored.

          -o option[=value]
                 Specify an option with a(n optional) value.  Possible
                 generic options/values are:

                        syslog=<subsystems>  (see `-s' in slapd(8))
                        syslog-level=<level> (see `-S' in slapd(8))
                        syslog-user=<user>   (see `-l' in slapd(8))

                 Possible options/values specific to slapacl are:

                        authzDN
                        domain
                        peername
                        sasl_ssf
                        sockname
                        sockurl
                        ssf
                        tls_ssf
                        transport_ssf

                 See the related fields in slapd.access(5) for details.

          -u     do not fetch the entry from the database.  In this case,
                 if the entry does not exist, a fake entry with the DN
                 given with the -b option is used, with no attributes.  As
                 a consequence, those rules that depend on the contents of
                 the target object will not behave as with the real object.
                 The DN given with the -b option is still used to select
                 what rules apply; thus, it must be in the naming context
                 of a configured database.  See also -b.

          -U authcID
                 specify an ID to be mapped to a DN as by means of
                 authz-regexp or authz-rewrite rules (see slapd.conf(5) for
                 details); mutually exclusive with -D.

          -v     enable verbose mode.

          -X authzID
                 specify an authorization ID to be mapped to a DN as by
                 means of authz-regexp or authz-rewrite rules (see
                 slapd.conf(5) for details); mutually exclusive with -o
                 authzDN=DN.


---------------------------------------------------------

::

          The command

               SBINDIR/slapacl -f ETCDIR/slapd.conf -v \
                      -U bjorn -b "o=University of Michigan,c=US" \
                   "o/read:University of Michigan"

          tests whether the user bjorn can access the attribute o of the
          entry o=University of Michigan,c=US at read level.


---------------------------------------------------------

::

          ldap(3), slapd(8), slaptest(8), slapauth(8)

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

   OpenLDAP LDVERSION             RELEASEDATE                   SLAPACL(8C)

--------------

Pages that refer to this page:
`slapd.access(5) <../man5/slapd.access.5.html>`__, 
`slapd.conf(5) <../man5/slapd.conf.5.html>`__, 
`slapd-config(5) <../man5/slapd-config.5.html>`__, 
`slapd(8) <../man8/slapd.8.html>`__

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
