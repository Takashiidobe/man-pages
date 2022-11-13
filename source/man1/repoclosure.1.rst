.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

repoclosure(1) — Linux manual page
==================================

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

   repoclosure(1)                                            repoclosure(1)

NAME
-------------------------------------------------

::

          repoclosure - display a list of unresolved dependencies for a yum
          repository


---------------------------------------------------------

::

          repoclosure [options]


---------------------------------------------------------------

::

          repoclosure is a program that reads package metadata from one or
          more yum repositories, checks all dependencies, and displays a
          list of packages with unresolved dependencies.


-------------------------------------------------------

::

          -h, --help
                 Display a help message, and then quit.

          -c CONFIG, --config=CONFIG
                 Config file to use (defaults to /etc/yum.conf).

          -a ARCH, --arch=ARCH
                 Check packages of the given archs, can be specified
                 multiple times (default: current arch).

          --basearch=BASEARCH
                 Set the basearch for yum to run as.

          -b, --builddeps
                 Check build dependencies only (needs source repos
                 enabled).

          -l LOOKASIDE, --lookaside=LOOKASIDE
                 Specify a lookaside repo id to query, can be specified
                 multiple times.

          -r REPOID, --repoid=REPOID
                 Specify repo ids to query, can be specified multiple times
                 (default is all enabled).

          -t, --tempcache
                 Use a temp dir for storing/accessing yum-cache.

          -q, --quiet
                 Run quietly: no warnings printed to stderr.

          -n, --newest
                 Check only the newest packages in the repos.

          --repofrompath=REPOID,PATH/URL
                 Specify a path or url to a repository (same path as in a
                 baseurl) to add to the repositories for this query. This
                 option can be used multiple times. If you want to view
                 only the pkgs from this repository combine this with
                 --repoid. The repoid for the repository is specified by
                 REPOID.

          -p PKG, --pkg=PKG
                 Check closure for this package only

          -g GROUP, --group=GROUP
                 Check closure for packages in this group only


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

                                13 January 2013              repoclosure(1)

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
