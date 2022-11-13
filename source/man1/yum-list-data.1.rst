.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

yum-list-data(1) — Linux manual page
====================================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `EXAMPLES <#EXAMPLES>`__ \|       |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `AUTHORS <#AUTHORS>`__ \|         |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   yum-list-data(1)                                        yum-list-data(1)

NAME
-------------------------------------------------

::

          yum list data plugin


---------------------------------------------------------

::

          yum [options] [command] [package ...]


---------------------------------------------------------------

::

          This plugin extends yum for some commands that give aggregate
          package data based on lists of packages

          added yum commands are:
           * list-vendors
           * info-vendors
           * list-rpm-groups
           * info-rpm-groups
           * list-packagers
           * info-packagers
           * list-licenses
           * info-licenses
           * list-arches
           * info-arches
           * list-committers
           * info-committers
           * list-buildhosts
           * info-buildhosts
           * list-baseurls
           * info-baseurls
           * list-package-sizes
           * info-package-sizes
           * list-archive-sizes
           * info-archive-sizes
           * list-installed-sizes
           * info-installed-sizes
           * list-groups
           * info-groups

          all of which take the same arguments as the list and info yum
          commands. The difference between the list and info varieties is
          that the info versions lists all the packages under each
          aggregation.

          list-vendors, info-vendors
                 Is used to list the aggregate of the vendor attribute on
                 the packages, examples are "Fedora Project" and "Red Hat,
                 Inc.".

          list-rpm-groups, info-rpm-groups
                 Is used to list the aggregate of the group attribute on
                 the packages, examples are "Applications/System",
                 "Development/Tools" and "System Environment/Base"

          list-packagers, info-packagers
                 Is used to list the aggregate of the packager attribute on
                 the packages, examples are "Fedora Project" and "Red Hat,
                 Inc.".

          list-licenses, info-licenses
                 Is used to list the aggregate of the license attribute on
                 the packages, examples are "GPL" and "MIT"

          list-arches, info-arches
                 Is used to list the aggregate of the arch attribute on the
                 packages, examples are "i386" and "x86_64"

          list-committers, info-committers
                 Is used to list the aggregate of the committer attribute
                 on the packages, this is taken from the most recent
                 changelog entry of the package.

          list-buildhosts, info-buildhosts
                 Is used to list the aggregate of the buildhost attribute
                 on the packages, examples are "mybuilder.example.com" and
                 "xenbuilder1.fedora.redhat.com"

          list-baseurls, info-baseurls
                 Is used to list the aggregate of the url attribute on the
                 packages after discarding the path of the URL, examples
                 are "http://yum.baseurl.org/" and "http://www.and.org/"

          list-package-sizes, info-package-sizes
                 Is used to list the aggregate of specified ranges the
                 packagesize attribute on the packages, examples are "[
                 1B -  10KB ]" and "[ 750KB -   1MB ]".

          list-archive-sizes, info-archive-sizes
                 Is used to list the aggregate of specified ranges the
                 archivesize attribute on the packages, examples are "[
                 1B -  10KB ]" and "[ 750KB -   1MB ]".

          list-installed-sizes, info-installed-sizes
                 Is used to list the aggregate of specified ranges the
                 installedsize attribute on the packages, examples are "[
                 1B -  10KB ]" and "[ 750KB -   1MB ]".

          list-groups, info-groups
                 Is used to list the aggregate of the yum groups that the
                 packages are in, examples are in "yum grouplist". Note
                 that in yum groups a package can be in more than one group
                 at a time.

          It is worth noting that some of the above data can be "unknown",
          to yum, at which point a separate aggregation called "-- Unknown
          --" is listed.


---------------------------------------------------------

::

          To list all the groups that have an update, along with the number
          of packages in each group, use:

                 yum list-rpm-groups updates

          To list all the committers to packages that have yum in their
          name, use:

                 yum list-committers 'yum*'

          To list ranges of the sizes of packages installed or available,
          use:

                 yum list-package-sizes

          To list yum groups that have an update, use:

                 yum list-groups


---------------------------------------------------------

::

          yum-filter-data(1)
          yum(8)
          yum.conf(5)


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

   James Antill                04 February 2008            yum-list-data(1)

--------------

Pages that refer to this page:
`yum-filter-data(1) <../man1/yum-filter-data.1.html>`__

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
