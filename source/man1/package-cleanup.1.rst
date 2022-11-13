.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

package-cleanup(1) — Linux manual page
======================================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `GENE                             |                                   |
| RAL OPTIONS <#GENERAL_OPTIONS>`__ |                                   |
| \|                                |                                   |
| `LE                               |                                   |
| AVES OPTIONS <#LEAVES_OPTIONS>`__ |                                   |
| \|                                |                                   |
| `OLDKERNELS                       |                                   |
|  OPTIONS <#OLDKERNELS_OPTIONS>`__ |                                   |
| \| `EXAMPLES <#EXAMPLES>`__ \|    |                                   |
| `FILES <#FILES>`__ \|             |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `AUTHORS <#AUTHORS>`__ \|         |                                   |
| `BUGS <#BUGS>`__ \|               |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   package-cleanup(1)                                    package-cleanup(1)

NAME
-------------------------------------------------

::

          package-cleanup - clean up locally installed, duplicate, or
          orphaned packages


---------------------------------------------------------

::

          package-cleanup [options] <item ...>


---------------------------------------------------------------

::

          package-cleanup is a program for cleaning up the locally-
          installed RPMs.


-----------------------------------------------------------------------

::

          -c <config file>
                 Use alternative config file (default is /etc/yum.conf).

          -h, --help
                 Help; display a help message and then quit.

          -q, --quiet
                 Print out nothing unnecessary.

          -v, --version
                 Report program version and exit.

          -y     Agree to anything asked.

          --leaves
                 List leaf nodes in the local RPM database.  Leaf nodes are
                 RPMs that are not relied upon by any other RPM.

          --orphans
                 List installed packages which are not available from
                 currently configured repositories. This is identical to
                 "yum list extras", which may provide better output.

          --oldkernels
                 Remove old kernel and kernel-devel packages.

          --problems
                 List dependency problems in the local RPM database. If any
                 problems are found it will exit with an exit code of 1.

          --dupes
                 Scan for duplicates in the local RPM database.

          --cleandupes
                 Scan for duplicates in the local RPM database and clean
                 out the older versions.

          --removenewestdupes
                 Remove the newest dupes instead of the oldest dupes when
                 cleaning duplicates.

          --noscripts
                 Disable rpm scriptlets from running when cleaning
                 duplicates.

          --count <COUNT>
                 Number of duplicate/kernel packages to keep on the system
                 (default 2)


---------------------------------------------------------------------

::

          --all  When listing leaf nodes also list leaf nodes that are not
                 libraries.

          --leaf-regex
                 A package name that matches this regular expression will
                 be considered a leaf.

          --exclude-devel
                 When listing leaf nodes do not list development packages.

          --exclude-bin
                 When listing leaf nodes do not list packages with files in
                 bin directories.


-----------------------------------------------------------------------------

::

          --keepdevel
                 Do not remove kernel-devel packages when removing kernels


---------------------------------------------------------

::

          List all dependency problems:
                 package-cleanup --problems

          List all packages that are not in any Yum repository:
                 package-cleanup --orphans

          Remove old kernels keeping 3 and leaving old kernel-devel
          packages installed:
                 package-cleanup --oldkernels --count=3 --keepdevel

          List all leaf packages with no files in a bin directory whose
          name begins with either 'perl' or 'python':
                 package-cleanup --leaves --exclude-bin
                 --leaf-regex="^(perl)|(python)"


---------------------------------------------------

::

          As package-cleanup uses YUM libraries for retrieving all the
          information, it relies on YUM configuration for its default
          values like which repositories to use. Consult YUM documentation
          for details:

          /etc/yum.conf
          /etc/yum/repos.d/
          /var/cache/yum/


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

   Gijs Hollestelle            03 November 2005          package-cleanup(1)

--------------

Pages that refer to this page:
`yum-utils(1) <../man1/yum-utils.1.html>`__, 
`yum(8@@yum) <../man8/yum.8@@yum.html>`__

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
