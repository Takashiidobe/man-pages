.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

nfsdclddb(8) — Linux manual page
================================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `OPTIONS <#OPTIONS>`__ \|         |                                   |
| `NOTES <#NOTES>`__ \|             |                                   |
| `FILES <#FILES>`__ \|             |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `AUTHOR <#AUTHOR>`__ \|           |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   nfsdclddb(8)             System Manager's Manual            nfsdclddb(8)

NAME
-------------------------------------------------

::

          nfsdclddb - Tool for manipulating the nfsdcld sqlite database


---------------------------------------------------------

::

          nfsdclddb [-h|--help]

          nfsdclddb [-p|--path dbpath] fix-table-names [-h|--help]

          nfsdclddb [-p|--path dbpath] downgrade-schema [-h|--help]
          [-v|--version to-version]

          nfsdclddb [-p|--path dbpath] print [-h|--help] [-s|--summary]


---------------------------------------------------------------

::

          The nfsdclddb command is provided to perform some manipulation of
          the nfsdcld sqlite database schema and to print the contents of
          the database.

      Sub-commands
          Valid nfsdclddb subcommands are:

          fix-table-names
                 A previous version of nfsdcld(8) contained a bug that
                 corrupted the reboot epoch table names.  This sub-command
                 will fix those table names.

          downgrade-schema
                 Downgrade the database schema.  Currently the schema can
                 only to downgraded from version 4 to version 3.

          print  Display the contents of the database.  Prints the schema
                 version and the values of the current and recovery epochs.
                 If the -s|--summary option is not given, also prints the
                 clients in the reboot epoch tables.


-------------------------------------------------------

::

      Options valid for all sub-commands
          -h, --help
                 Show the help message and exit

          -p dbpath, --path dbpath
                 Open the sqlite database located at dbpath instead of
                 /var/lib/nfs/nfsdcld/main.sqlite.  This is mainly for
                 testing purposes.

      Options specific to the downgrade-schema sub-command
          -v to-version, --version to-version
                 The schema version to downgrade to.  Currently the schema
                 can only be downgraded to version 3.

      Options specific to the print sub-command
          -s, --summary
                 Do not list the clients in the reboot epoch tables in the
                 output.


---------------------------------------------------

::

          The nfsdclddb command will not allow the fix-table-names or
          downgrade-schema subcommands to be used if nfsdcld(8) is running.


---------------------------------------------------

::

          /var/lib/nfs/nfsdcld/main.sqlite


---------------------------------------------------------

::

          nfsdcld(8)


-----------------------------------------------------

::

          Scott Mayhew <smayhew@redhat.com>

COLOPHON
---------------------------------------------------------

::

          This page is part of the nfs-utils (NFS utilities) project.
          Information about the project can be found at 
          ⟨http://linux-nfs.org/wiki/index.php/Main_Page⟩.  If you have a
          bug report for this manual page, see
          ⟨http://linux-nfs.org/wiki/index.php/Main_Page⟩.  This page was
          obtained from the project's upstream Git repository
          ⟨http://git.linux-nfs.org/?p=steved/nfs-utils.git;a=summary⟩ on
          2021-08-27.  (At that time, the date of the most recent commit
          that was found in the repository was 2021-08-21.)  If you
          discover any rendering problems in this HTML version of the page,
          or you believe there is a better or more up-to-date source for
          the page, or you have corrections or improvements to the
          information in this COLOPHON (which is not part of the original
          manual page), send a mail to man-pages@man7.org

                                  07 Aug 2019                  nfsdclddb(8)

--------------

Pages that refer to this page: `nfsdcld(8) <../man8/nfsdcld.8.html>`__

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
