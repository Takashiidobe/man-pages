.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

dnf.modularity(7) — Linux manual page
=====================================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `DEFINITIONS <#DEFINITIONS>`__ \| |                                   |
| `PACKAGE                          |                                   |
| FILTERING <#PACKAGE_FILTERING>`__ |                                   |
| \|                                |                                   |
| `HOTFIX REPOS                     |                                   |
| ITORIES <#HOTFIX_REPOSITORIES>`__ |                                   |
| \|                                |                                   |
| `FAIL-SAFE MECH                   |                                   |
| ANISMS <#FAIL-SAFE_MECHANISMS>`__ |                                   |
| \| `AUTHOR <#AUTHOR>`__ \|        |                                   |
| `COPYRIGHT <#COPYRIGHT>`__ \|     |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   DNF.MODULARITY(7)                  DNF                 DNF.MODULARITY(7)

NAME
-------------------------------------------------

::

          dnf.modularity - Modularity in DNF

          Modularity is new way of building, organizing and delivering
          packages.  For more details see:
          https://docs.pagure.org/modularity/ 


---------------------------------------------------------------

::

          modulemd
                 Every repository can contain modules metadata with
                 modulemd documents.  These documents hold metadata about
                 modules such as Name, Stream or list of packages.

          (non-modular) package
                 Package that doesn’t belong to a module.

          modular package
                 Package that belongs to a module. It is listed in modulemd
                 under the artifacts section.  Modular packages can be also
                 identified by having %{modularitylabel} RPM header set.

          (module) stream
                 Stream is a collection of packages, a virtual repository.
                 It is identified with Name and Stream from modulemd
                 separated with colon, for example “postgresql:9.6”.

                 Module streams can be active or inactive. active means the
                 RPM packages from this stream are included in the set of
                 available packages.  Packages from inactive streams are
                 filtered out.  Streams are active either if marked as
                 default or if they are explicitly enabled by a user
                 action. Streams that satisfy dependencies of default or
                 enabled streams are also considered active.  Only one
                 stream of a particular module can be active at a given
                 point in time.


---------------------------------------------------------------------------

::

          Without modules, packages with the highest version are used by
          default.

          Module streams can distribute packages with lower versions than
          available in the repositories available to the operating system.
          To make such packages available for installs and upgrades, the
          non-modular packages are filtered out when their name or provide
          matches against a modular package name from any enabled, default,
          or dependent stream. Modular source packages will not cause
          non-modular binary packages to be filtered out.


-------------------------------------------------------------------------------

::

          In special cases, a user wants to cherry-pick individual packages
          provided outside module streams and make them available on along
          with packages from the active streams.  Under normal
          circumstances, such packages are filtered out or rejected from
          getting on the system by Fail-safe mechanisms.  To make the
          system use packages from a repository regardless of their
          modularity, specify module_hotfixes=true in the .repo file. This
          protects the repository from package filtering.

          Please note the hotfix packages do not override module packages,
          they only become part of available package set. It’s the package
          Epoch, Version and Release what determines if the package is the
          latest.


---------------------------------------------------------------------------------

::

      Repositories with module metadata are unavailable
          When a repository with module metadata is unavailable, package
          filtering must keep working.  Non-modular RPMs must remain
          unavailable and must never get on the system.

          This happens when:

          • user disables a repository via --disablerepo or uses --repoid

          • user removes a .repo file from disk

          • repository is not available and has skip_if_unavailable=true

          DNF keeps copies of the latest modulemd for every active stream
          and uses them if there’s no modulemd available for the stream.
          This keeps package filtering working correctly.

          The copies are made any time a transaction is resolved and
          started.  That includes RPM transactions as well as any dnf
          module <enable|disable|reset> operations.

          When the fail-safe data is used, dnf show such modules as part of
          @modulefailsafe repository.

      Orphaned modular packages
          All packages that are built as a part of a module have
          %{modularitylabel} RPM header set.  If such package becomes part
          of RPM transaction and cannot be associated with any available
          modulemd, DNF prevents from getting it on the system (package is
          available, but cannot be installed, upgraded, etc.). Packages
          from Hotfix repositories or Commandline repository are not
          affected by Fail-safe mechanisms.


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

   4.8.0                         Aug 27, 2021             DNF.MODULARITY(7)

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
