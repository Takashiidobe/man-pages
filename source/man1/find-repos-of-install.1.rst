.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

find-repos-of-install(1) — Linux manual page
============================================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `OPTIONS <#OPTIONS>`__ \|         |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `AUTHORS <#AUTHORS>`__ \|         |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   find-repos-of-install(1)                        find-repos-of-install(1)

NAME
-------------------------------------------------

::

          find-repos-of-install - report which Yum repository a package was
          installed from


---------------------------------------------------------

::

          find-repos-of-install [options] package1 [package2...]


---------------------------------------------------------------

::

          find-repos-of-install is a program which reports the Yum
          repository that a specified package was installed from.


-------------------------------------------------------

::

          --version
                 Report program version and exit.

          -h, --help
                 Display a help message, and then quit.

          --repoid=REPOID
                 Specify repo ids to query, can be specified multiple times
                 (default is all enabled).

          --enablerepo=ENABLEREPOS
                 In addition to the default set, query the given additional
                 repository, even if it is disabled in YUM configuration.
                 Can be used multiple times.

          --disablerepo=DISABLEREPOS
                 Do not query the given repository, even if it is enabled
                 in YUM configuration.  Can be used multiple times.

          --repofrompath=REPOID,PATH/URL
                 Specify a path or url to a repository (same path as in a
                 baseurl) to add to the repositories for this query. This
                 option can be used multiple times. If you want to view
                 only the pkgs from this repository combine this with
                 --repoid. The repoid for the repository is specified by
                 REPOID.

          -C, --cache
                 Tells repoquery to run entirely from YUM cache - does not
                 download any metadata or update the cache. Queries in this
                 mode can fail or give partial/incorrect results if the
                 cache isn't fully populated beforehand with eg "yum
                 makecache".

          --tempcache
                 Use a temp dir for storing/accessing yum-cache.

          --sync2yumdb
                 Sync anything that is found to the yumdb, if available.


---------------------------------------------------------

::

          yum.conf(5)
          http://yum.baseurl.org/


-------------------------------------------------------

::

          See the Authors file included with this program.

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

                                13 January 2013    find-repos-of-install(1)

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
