.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

dnf-transaction-json(5) — Linux manual page
===========================================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `TOP-LE                           |                                   |
| VEL OBJECT <#TOP-LEVEL_OBJECT>`__ |                                   |
| \| `RPM OBJECT <#RPM_OBJECT>`__   |                                   |
| \|                                |                                   |
| `GROUP OBJECT <#GROUP_OBJECT>`__  |                                   |
| \|                                |                                   |
| `ENVIRONMEN                       |                                   |
| T OBJECT <#ENVIRONMENT_OBJECT>`__ |                                   |
| \|                                |                                   |
| `GROUP-PACKAGE                    |                                   |
| OBJECT <#GROUP-PACKAGE_OBJECT>`__ |                                   |
| \|                                |                                   |
| `ENVIRONMENT-GROUP OBJE           |                                   |
| CT <#ENVIRONMENT-GROUP_OBJECT>`__ |                                   |
| \| `AUTHOR <#AUTHOR>`__ \|        |                                   |
| `COPYRIGHT <#COPYRIGHT>`__ \|     |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   DNF-TRANSACTION-JSON(5)            DNF           DNF-TRANSACTION-JSON(5)

NAME
-------------------------------------------------

::

          dnf-transaction-json - DNF Stored Transaction JSON

          The stored transaction format is considered unstable and may
          change in an incompatible way at any time. It will work if the
          same version of dnf is used to store and replay (or between
          versions as long as it stays the same).


-------------------------------------------------------------------------

::

          version
                 Type: string

                 The version of the stored transaction format, in the form
                 MAJOR.MINOR.

                 MAJOR version denotes backwards incompatible changes (old
                 dnf won’t work with new transaction JSON).

                 MINOR version denotes extending the format without
                 breaking backwards compatibility (old dnf can work with
                 new transaction JSON).

          rpms   Type: an array of rpm objects

                 A list of RPM packages in the transaction.

          groups Type: an array of group objects

                 A list of groups in the transaction.

          environments
                 Type: an array of group objects

                 A list of environment groups in the transaction.


-------------------------------------------------------------

::

          action Type: string

                 Possible values: Downgrade, Downgraded, Install,
                 Obsoleted, Reason Change, Reinstall, Reinstalled, Removed,
                 Upgrade, Upgraded

                 The action performed on the package in the transaction.

          nevra  Type: string

                 NEVRA (name-epoch:version-release.arch) of the package.

          reason Type: string

                 Possible values: dependency, clean, group, unknown, user,
                 weak-dependency

                 The reason why the package was pulled into the
                 transaction.

          repo_id
                 Type: string

                 The id of the repository this package is coming from. Note
                 repository ids are defined in the local respository
                 configuration and may differ between systems.


-----------------------------------------------------------------

::

          action Type: string

                 Possible values: Install, Upgrade, Removed

                 The action performed on the group in the transaction.

          id     Type: string

                 The id of the group.

          package_types
                 Type: string

                 Possible values: conditional, default, mandatory, optional

                 The types of packages in the group that will be installed.
                 Valid only for the Install action.

          packages
                 Type: an array of group-package objects

                 The packages belonging to the group in the transaction.


-----------------------------------------------------------------------------

::

          action Type: string

                 Possible values: Install, Upgrade, Removed

                 The action performed on the environment group in the
                 transaction.

          id     Type: string

                 The id of the environment group.

          package_types
                 Type: string

                 Possible values: conditional, default, mandatory, optional

                 The types of packages in the environment group that will
                 be installed.  Valid only for the Install action.

          group  Type: an array of environment-group objects

                 The groups belonging to the environment in the
                 transaction.


---------------------------------------------------------------------------------

::

          installed
                 Type: boolean

                 Whether the package is considered installed as part of the
                 group.

          name   Type: string

                 The name of the package.

          package_type
                 Type: string

                 Possible values: conditional, default, mandatory, optional

                 The type of the package in the group.


-----------------------------------------------------------------------------------------

::

          group_type
                 Type: string

                 Possible values: mandatory, optional

                 The type of the group in the environment.

          id     Type: string

                 The id of the group.

          installed
                 Type: boolean

                 Whether the group is considered installed as part of the
                 environment.


-----------------------------------------------------

::

          See AUTHORS in DNF source distribution.


-----------------------------------------------------------

::

          2012-2020, Red Hat, Licensed under GPLv2+

COLOPHON
---------------------------------------------------------

::

          This page is part of the dnf (DNF Package Manager) project.
          Information about the project can be found at 
          ⟨https://github.com/rpm-software-management/dnf⟩.  It is not known
          how to report bugs for this man page; if you know, please send a
          mail to man-pages@man7.org.  This page was obtained from the
          project's upstream Git repository
          ⟨https://github.com/rpm-software-management/dnf.git⟩ on
          2021-08-27.  (At that time, the date of the most recent commit
          that was found in the repository was 2021-08-19.)  If you
          discover any rendering problems in this HTML version of the page,
          or you believe there is a better or more up-to-date source for
          the page, or you have corrections or improvements to the
          information in this COLOPHON (which is not part of the original
          manual page), send a mail to man-pages@man7.org

   4.8.0                         Aug 27, 2021       DNF-TRANSACTION-JSON(5)

--------------

Pages that refer to this page:
`yum-aliases(1) <../man1/yum-aliases.1.html>`__, 
`dnf(8) <../man8/dnf.8.html>`__,  `yum(8) <../man8/yum.8.html>`__, 
`yum-shell(8) <../man8/yum-shell.8.html>`__

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
