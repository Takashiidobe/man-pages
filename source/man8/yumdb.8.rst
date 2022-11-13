.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

yumdb(8) — Linux manual page
============================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `EXAMPLES <#EXAMPLES>`__ \|       |                                   |
| `WELL                             |                                   |
|  KNOWN KEYS <#WELL_KNOWN_KEYS>`__ |                                   |
| \| `SEE ALSO <#SEE_ALSO>`__ \|    |                                   |
| `AUTHORS <#AUTHORS>`__ \|         |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   yumdb(8)                                                        yumdb(8)

NAME
-------------------------------------------------

::

          yumdb - query and alter the Yum database


---------------------------------------------------------

::

          yumdb [command] [packages ...]


---------------------------------------------------------------

::

          This command is used to query and alter the yum database, which
          is a simple key value store used in conjunction with the rpm
          database. Any installed package can have arbitrary data in the
          yum database, however the main use case is to store extra data
          about packages as they are installed.

          yumdb commands are:

          yumdb get <key> [pkg-wildcard]...

          This command will get the value for the given key, limiting to
          any specified packages.

          yumdb set <key> <value> [pkg-wildcard]...

          This command will set the value for the given key, to the given
          value, limiting to any specified packages.

          yumdb del <key> [pkg-wildcard]...

          This command will delete the given key, limiting to any specified
          packages.

          yumdb rename <old-key> <new-key> [pkg-wildcard]...

          This command will rename the given old-key, to the given new-key,
          limiting to any specified packages. If the old-key does not
          exist, nothing happens.

          yumdb rename-force <old-key> <new-key> [pkg-wildcard]...

          This command will rename the given old-key, to the given new-key,
          limiting to any specified packages. If the old-key does not
          exist, new-key is deleted.

          yumdb copy <old-key> <new-key> [pkg-wildcard]...

          This command will copy the given old-key, to the given new-key,
          limiting to any specified packages. If the old-key does not
          exist, nothing happens.

          yumdb copy-force <old-key> <new-key> [pkg-wildcard]...

          This command will copy the given old-key, to the given new-key,
          limiting to any specified packages. If the old-key does not
          exist, new-key is deleted.

          yumdb search <key> <wildcard>...

          This command will search all packages for the given key, against
          any of the given wildcard values.

          yumdb exist <key> [pkg-wildcard]...

          This command will print any packages which have the given key,
          limiting to any specified packages.

          yumdb unset <key> [pkg-wildcard]...

          This command will print any packages which do not have the given
          key, limiting to any specified packages.

          yumdb info [pkg-wildcard]...

          This command will display all the data stored in the yumdb,
          limiting to any specified packages.

          yumdb sync [pkg-wildcard]...

          This command will add any missing data to the yumdb from the
          repositories, limiting to any specified packages. This is useful
          to run if you have had any aborted transactions (and thus.
          missing yumdb data).  Note that "yumdb sync" cannot know all the
          information that would have been put into the yumdb at the time.

          yumdb sync-force [pkg-wildcard]...

          This command will replace any data in the yumdb from the
          repositories, limiting to any specified packages.


---------------------------------------------------------

::

          List all the packages which don't have a from_repo key/value:

                 yumdb unset from_repo

          List all the packages which were installed as dependencies:

                 yumdb search reason dep


-----------------------------------------------------------------------

::

          Note that there is no limit to the number of keys that can be
          created or what they may contain (for installed packages only).
          However this is a list of well known keys, and what they store.

          checksum_data

          checksum_type

          These keys store the createrepo checksum, and it's type, of the available
          package yum installed. Note that these are used by "yum version" to calculate
          the rpmdb version.

          command_line

          This key stores the entire command line, of the yum command (if it was called).

          from_repo

          from_repo_revision

          from_repo_timestamp

          These keys take values from the available package yum installed, and store the
          repo id, it's revision and timestamp.

          reason

          This key stores either "user" or "dep", currently. To mark if the user requested
          the package to be installed, or if it was brought in automatically as a
          dependency. Note that this is kept over updates.

          releasever

          This key stores the value of releasever, when the package was installed.

          installonly

          If this attribute has the value "keep" then this package will not be
          removed automatically by the installonly process (and does not count towards
          the installonly_limit).


---------------------------------------------------------

::

          yum(8)
          rpm(8)


-------------------------------------------------------

::

          James Antill <james.antill@redhat.com>.

COLOPHON
---------------------------------------------------------

::

          This page is part of the yum-utils (Yum Package Manager
          utilities) project.  Information about the project can be found
          at ⟨https://github.com/rpm-software-management/yum⟩.  It is not
          known how to report bugs for this man page; if you know, please
          send a mail to man-pages@man7.org.  This page was obtained from
          the project's upstream Git repository
          ⟨https://github.com/rpm-software-management/yum-utils.git⟩ on
          2021-08-27.  (At that time, the date of the most recent commit
          that was found in the repository was 2020-03-11.)  If you
          discover any rendering problems in this HTML version of the page,
          or you believe there is a better or more up-to-date source for
          the page, or you have corrections or improvements to the
          information in this COLOPHON (which is not part of the original
          manual page), send a mail to man-pages@man7.org

   James Antill                  8 April 2010                      yumdb(8)

--------------

Pages that refer to this page:
`yum-utils(1) <../man1/yum-utils.1.html>`__

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
