.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

slapadd(8) — Linux manual page
==============================

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

   SLAPADD(8C)                                                  SLAPADD(8C)

NAME
-------------------------------------------------

::

          slapadd - Add entries to a SLAPD database


---------------------------------------------------------

::

          SBINDIR/slapadd [-b suffix] [-c] [-d debug-level] [-f slapd.conf]
          [-F confdir] [-g] [-j lineno] [-l ldif-file] [-n dbnum]
          [-o option[=value]] [-q] [-s] [-S SID] [-u] [-v] [-w]


---------------------------------------------------------------

::

          Slapadd is used to add entries specified in LDAP Directory
          Interchange Format (LDIF) to a slapd(8) database.  It opens the
          given database determined by the database number or suffix and
          adds entries corresponding to the provided LDIF to the database.
          Databases configured as subordinate of this one are also updated,
          unless -g is specified.  The LDIF input is read from standard
          input or the specified file.

          All files eventually created by slapadd will belong to the
          identity slapadd is run as, so make sure you either run slapadd
          with the same identity slapd(8) will be run as (see option -u in
          slapd(8)), or change file ownership before running slapd(8).

          Note: slapadd will also perform the relevant indexing whilst
          adding the database if any are configured. For specific details,
          please see slapindex(8).


-------------------------------------------------------

::

          -b suffix
                 Use the specified suffix to determine which database to
                 add entries to. By default, the first database that
                 supports the requested operation is used. The -b cannot be
                 used in conjunction with the -n option.

          -c     enable continue (ignore errors) mode.

          -d debug-level
                 enable debugging messages as defined by the specified
                 debug-level; see slapd(8) for details.

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
                 If dry-run mode is also specified, no conversion will
                 occur.

          -g     disable subordinate gluing.  Only the specified database
                 will be processed, and not its glued subordinates (if
                 any).

          -j lineno
                 Jump to the specified line number in the LDIF file before
                 processing any entries. This allows a load that was
                 aborted due to errors in the input LDIF to be resumed
                 after the errors are corrected.

          -l ldif-file
                 Read LDIF from the specified file instead of standard
                 input.

          -n dbnum
                 Add entries to the dbnum-th database listed in the
                 configuration file.  The -n cannot be used in conjunction
                 with the -b option.  To populate the config database
                 slapd-config(5), use -n 0 as it is always the first
                 database. It must physically exist on the filesystem prior
                 to this, however.

          -o option[=value]
                 Specify an option with a(n optional) value.  Possible
                 generic options/values are:

                        syslog=<subsystems>  (see `-s' in slapd(8))
                        syslog-level=<level> (see `-S' in slapd(8))
                        syslog-user=<user>   (see `-l' in slapd(8))

                        schema-check={yes|no}
                        value-check={yes|no}

                 The schema-check option toggles schema checking (default on);
                 the value-check option toggles value checking (default off).
                 The latter is incompatible with -q.

          -q     enable quick (fewer integrity checks) mode.  Does fewer consistency checks
                 on the input data, and no consistency checks when writing the database.
                 Improves the load time but if any errors or interruptions occur the resulting
                 database will be unusable.

          -s     disable schema checking.  This option is intended to be used when loading
                 databases containing special objects, such as fractional objects on a
                 partial consumer.  Loading normal objects which do not conform to
                 schema may result in unexpected and ill behavior.

          -S SID Server ID to use in generated entryCSN.  Also used for contextCSN
                 if -w is set as well.  Defaults to 0.

          -u     enable dry-run (don't write to backend) mode.

          -v     enable verbose mode.

          -w     write syncrepl context information.
                 After all entries are added, the contextCSN
                 will be updated with the greatest CSN in the database.


---------------------------------------------------------------

::

          Your slapd(8) should not be running when you do this to ensure
          consistency of the database.

          slapadd may not provide naming or schema checks.  It is advisable
          to use ldapadd(1) when adding new entries into an existing
          directory.


---------------------------------------------------------

::

          To import the entries specified in file ldif into your slapd(8)
          database give the command:

               SBINDIR/slapadd -l ldif


---------------------------------------------------------

::

          ldap(3), ldif(5), slapcat(8), slapindex(8), slapmodify(8),
          ldapadd(1), slapd(8)

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

   OpenLDAP LDVERSION             RELEASEDATE                   SLAPADD(8C)

--------------

Pages that refer to this page: `ldif(5) <../man5/ldif.5.html>`__, 
`slapd.access(5) <../man5/slapd.access.5.html>`__, 
`slapd.conf(5) <../man5/slapd.conf.5.html>`__, 
`slapd-config(5) <../man5/slapd-config.5.html>`__, 
`slapd-mdb(5) <../man5/slapd-mdb.5.html>`__, 
`slapd-null(5) <../man5/slapd-null.5.html>`__, 
`slapd.plugin(5) <../man5/slapd.plugin.5.html>`__, 
`slapd-wt(5) <../man5/slapd-wt.5.html>`__, 
`slapcat(8) <../man8/slapcat.8.html>`__, 
`slapd(8) <../man8/slapd.8.html>`__, 
`slapindex(8) <../man8/slapindex.8.html>`__, 
`slapmodify(8) <../man8/slapmodify.8.html>`__

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
