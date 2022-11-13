.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

repodiff(1) — Linux manual page
===============================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `GENE                             |                                   |
| RAL OPTIONS <#GENERAL_OPTIONS>`__ |                                   |
| \| `EXAMPLES <#EXAMPLES>`__ \|    |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `AUTHORS <#AUTHORS>`__ \|         |                                   |
| `BUGS <#BUGS>`__ \|               |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   repodiff(1)                                                  repodiff(1)

NAME
-------------------------------------------------

::

          repodiff - list differences between two or more Yum repositories


---------------------------------------------------------

::

          repodiff --old=old_repo_baseurl --new=new_repo_baseurl


---------------------------------------------------------------

::

          repodiff is a program which will list differences between two
          sets of repositories.  Note that by default only source packages
          are compared.


-----------------------------------------------------------------------

::

          --old, -o
                 Add a repo. as an old repo. Note that if you prefix the
                 url with "mirror:" then the following url is treated as a
                 mirror and not a baseurl.

          --new, -n
                 Add a repo. as an new repo. Note that if you prefix the
                 url with "mirror:" then the following url is treated as a
                 mirror and not a baseurl.

          --archlist, -a
                 Add architectures to change the default from just
                 comparing source packages.  Note that if you want the same
                 as a native "x86_64" architecture machine you just need to
                 pass "x86_64" (this is different from earlier versions
                 where you needed to specify
                 "x86_64,athlon,i686,i586,i486,i386,noarch" and you still
                 got "src").

          --size, -s
                 Output additional data about the size of the changes.

          --compare-arch
                 Normally packages are just compared based on their name,
                 this flag makes the comparison also use the arch. So
                 foo.i386 and foo.x86_64 are different.

          --simple
                 Output a simple one line message for modified packages.

          --downgrade
                 Split the data for modified packages between upgraded and
                 downgraded packages.


---------------------------------------------------------

::

          Compare source pkgs in two local repos:
                 repodiff --old=/tmp/repo-old --new=/tmp/repo-new

          Compare x86_64 compat. binary pkgs in two remote repos, and two
          local one:
                 repodiff -a x86_64 --old=http://example.com/repo1-old
                 --old=/tmp/repo-old --new=http://example.com/repo1-new
                 --new=/tmp/repo-new

          Compare x86_64 compat. binary pkgs, but also compare arch:
                 repodiff -a x86_64 --compare-arch
                 --old=http://example.com/repo1-old --old=/tmp/repo-old
                 --new=http://example.com/repo1-new --new=/tmp/repo-new

          Compare two releases of Fedora (15 => 16):
                 repodiff
                 --old='mirror:https://mirrors.fedoraproject.org/metalink?repo=fedora-
                 source-15&arch=i386'
                 --new='mirror:https://mirrors.fedoraproject.org/metalink?repo=fedora-
                 source-16&arch=i386' --size --simple --downgrade


---------------------------------------------------------

::

          yum.conf(5)
          http://yum.baseurl.org/


-------------------------------------------------------

::

          See the Authors file included with this program.


-------------------------------------------------

::

          There are of course no bugs, but should you find any, you should
          first consult the FAQ section on http://yum.baseurl.org/wiki/Faq
          and if unsuccessful in finding a resolution contact the mailing
          list: yum-devel@lists.baseurl.org.  To file a bug use
          http://bugzilla.redhat.com for Fedora/RHEL/Centos related bugs
          and http://yum.baseurl.org/report for all other bugs.

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

   James Antill                 21 October 2008                 repodiff(1)

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
