.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

slapindex(8) — Linux manual page
================================

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

   SLAPINDEX(8C)                                              SLAPINDEX(8C)

NAME
-------------------------------------------------

::

          slapindex - Reindex entries in a SLAPD database


---------------------------------------------------------

::

          SBINDIR/slapindex [-b suffix] [-c] [-d debug-level]
          [-f slapd.conf] [-F confdir] [-g] [-n dbnum] [-o option[=value]]
          [-q] [-t] [-v] [attr[...]]


---------------------------------------------------------------

::

          Slapindex is used to regenerate slapd(8) indices based upon the
          current contents of a database.  It opens the given database
          determined by the database number or suffix and updates the
          indices for all values of all attributes of all entries. If a
          list of specific attributes is provided on the command line, only
          the indices for those attributes will be regenerated.  Databases
          configured as subordinate of this one are also re-indexed, unless
          -g is specified.

          All files eventually created by slapindex will belong to the
          identity slapindex is run as, so make sure you either run
          slapindex with the same identity slapd(8) will be run as (see
          option -u in slapd(8)), or change file ownership before running
          slapd(8).


-------------------------------------------------------

::

          -b suffix
                 Use the specified suffix to determine which database to
                 generate output for. By default, the first database that
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

          -g     disable subordinate gluing.  Only the specified database
                 will be processed, and not its glued subordinates (if
                 any).

          -n dbnum
                 Generate output for the dbnum-th database listed in the
                 configuration file. The config database slapd-config(5),
                 is always the first database, so use -n 0

                 The -n cannot be used in conjunction with the -b option.

          -o option[=value]
                 Specify an option with a(n optional) value.  Possible
                 generic options/values are:

                        syslog=<subsystems>  (see `-s' in slapd(8))
                        syslog-level=<level> (see `-S' in slapd(8))
                        syslog-user=<user>   (see `-l' in slapd(8))

          -q     enable quick (fewer integrity checks) mode. Performs no
                 consistency checks when writing the database. Improves
                 indexing time, however the database will most likely be
                 unusable if any errors or interruptions occur.

          -t     enable truncate mode. Truncates (empties) an index
                 database before indexing any entries. May only be used
                 with back-mdb.

          -v     enable verbose mode.


---------------------------------------------------------------

::

          Your slapd(8) should not be running (at least, not in read-write
          mode) when you do this to ensure consistency of the database.

          This command provides ample opportunity for the user to obtain
          and drink their favorite beverage.


---------------------------------------------------------

::

          To reindex your SLAPD database, give the command:

               SBINDIR/slapindex
          To regenerate the index for only a specific attribute, e.g.
          "uid", give the command:

               SBINDIR/slapindex uid


---------------------------------------------------------

::

          ldap(3), ldif(5), slapadd(8), ldapadd(1), slapd(8)

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

   OpenLDAP LDVERSION             RELEASEDATE                 SLAPINDEX(8C)

--------------

Pages that refer to this page:
`slapd.access(5) <../man5/slapd.access.5.html>`__, 
`slapd.conf(5) <../man5/slapd.conf.5.html>`__, 
`slapd-config(5) <../man5/slapd-config.5.html>`__, 
`slapd-mdb(5) <../man5/slapd-mdb.5.html>`__, 
`slapd.plugin(5) <../man5/slapd.plugin.5.html>`__, 
`slapd-wt(5) <../man5/slapd-wt.5.html>`__, 
`slapadd(8) <../man8/slapadd.8.html>`__, 
`slapd(8) <../man8/slapd.8.html>`__, 
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
