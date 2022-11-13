.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

repoquery(1) — Linux manual page
================================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `GENE                             |                                   |
| RAL OPTIONS <#GENERAL_OPTIONS>`__ |                                   |
| \|                                |                                   |
| `PACKAGE QUERY OP                 |                                   |
| TIONS <#PACKAGE_QUERY_OPTIONS>`__ |                                   |
| \|                                |                                   |
| `PACKAGE SELECTION OPTION         |                                   |
| S <#PACKAGE_SELECTION_OPTIONS>`__ |                                   |
| \|                                |                                   |
| `GROUP QUERY                      |                                   |
| OPTIONS <#GROUP_QUERY_OPTIONS>`__ |                                   |
| \|                                |                                   |
| `GROUP SELECTION OPTI             |                                   |
| ONS <#GROUP_SELECTION_OPTIONS>`__ |                                   |
| \| `EXAMPLES <#EXAMPLES>`__ \|    |                                   |
| `MISC <#MISC>`__ \|               |                                   |
| `FILES <#FILES>`__ \|             |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `AUTHORS <#AUTHORS>`__ \|         |                                   |
| `BUGS <#BUGS>`__ \|               |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   repoquery(1)                                                repoquery(1)

NAME
-------------------------------------------------

::

          repoquery - query information from Yum repositories


---------------------------------------------------------

::

          repoquery [options] <item ...>
          repoquery -a [options]


---------------------------------------------------------------

::

          repoquery is a program for querying information from YUM
          repositories similarly to rpm queries.


-----------------------------------------------------------------------

::

          --querytags
                 List valid queryformat tags and exit.

          --version
                 Report program version and exit.

          --repoid=<repo>
                 Specify which repository to query. Using this option
                 disables all repositories not explicitly enabled with
                 --repoid option (can be used multiple times). By default
                 repoquery uses whatever repositories are enabled in YUM
                 configuration.

          --enablerepo=<repo>
                 In addition to the default set, query the given additional
                 repository, even if it is disabled in YUM configuration.
                 Can be used multiple times.

          --disablerepo=<repo>
                 Do not query the given repository, even if it is enabled
                 in YUM configuration.  Can be used multiple times.

          --repofrompath=<repoid>,<path/url>
                 Specify a path or url to a repository (same path as in a
                 baseurl) to add to the repositories for this query. This
                 option can be used multiple times. If you want to view
                 only the pkgs from this repository combine this with
                 --repoid. The repoid for the repository is specified by
                 <repoid>.

          --plugins
                 Enable YUM plugin support.

          -q, --query
                 For rpmquery compatibility, doesn't do anything.

          -h, --help
                 Help; display a help message and then quit.

          --quiet
                 Run quietly: no warnings printed to stderr.

          --verbose
                 Produce verbose output.

          -C, --cache
                 Tells repoquery to run entirely from YUM cache - does not
                 download any metadata or update the cache. Queries in this
                 mode can fail or give partial/incorrect results if the
                 cache isn't fully populated beforehand with eg "yum
                 makecache".

          --nolock
                 Disable locking the yum cache. This is needed as any yum
                 API caller can alter the repo. metadata cache, unless it
                 is locked. This automatically enables the --cache and
                 --tempcache options, to try to lower the riskiness.

          --tempcache
                 Create and use a private cache instead of the main YUM
                 cache. This is used by default when run as non-root user.

          -c <config file>, --config=<config file>
                 Use alternative config file (default is /etc/yum.conf).

          --releasever=version
                 Pretend the current release version is the given string.
                 This is very useful when combined with --installroot. You
                 can also use --releasever=/ to take the releasever
                 information from outside the installroot.  Note that with
                 the default upstream cachedir, of /var/cache/yum, using
                 this option will corrupt your cache (and you can use
                 $releasever in your cachedir configuration to stop this).

          --installroot=root
                 Specifies an alternative installroot, relative to which
                 all packages will be installed. Think of this like doing
                 "chroot <root> yum" except using --installroot allows yum
                 to work before the chroot is created.  Note: You may also
                 want to use the option --releasever=/ when creating the
                 installroot as otherwise the $releasever value is taken
                 from the rpmdb within the installroot (and thus. will be
                 empty, before creation).

          --setopt=option=value
                 Set any config option in yum config or repo files. For
                 options in the global config just use:
                 --setopt=option=value for repo options use:
                 --setopt=repoid.option=value


-----------------------------------------------------------------------------------

::

          -i, --info
                 Show general information about package similarly to "rpm
                 -qi"

          -l, --list
                 List files in package.

          -R, --requires
                 List package dependencies.

          -R, --weak-requires
                 List package weak dependencies.

          -R, --info-requires
                 List package informational dependencies.

          -R, --weak-reverse-requires
                 List package weak reverse dependencies.

          -R, --info-reverse-requires
                 List package informational reverse dependencies.

          --resolve
                 When used with --requires/--weak-requires/etc, resolve
                 capabilities to originating packages.

          --provides
                 List capabilities package provides.

          --obsoletes
                 List capabilities obsoleted by package.

          --conflicts
                 List capabilities conflicting with package.

          --changelog
                 List package changelog.

          --location
                 Show a location where the package could be downloaded
                 from.  For example: wget `repoquery --location yum`

          -s, --source
                 Show package source RPM name.

          --srpm Operate on corresponding source RPM.

          --groupmember PACKAGE
                 List the repodata groups (yumgroups.xml) belongs to (if
                 any).

          --nvr  Use name-version-release output format (rpm query default)

          --nevra
                 Use name-epoch:version-release.architecture output format
                 (default)

          --envra
                 Use epoch:name-version-release.architecture output format
                 (easier to parse than nevra)

          --qf=FORMAT, --queryformat=FORMAT
                 Specify custom output format for queries. You can add
                 ":date", ":day" and ":isodate" to all the tags that are a
                 time, and you can add ":k", ":m", ":g", ":t" and ":h" to
                 sizes. You can also specify field width as in sprintf (Eg.
                 %-20{name})

          --output [text|ascii-tree|ascii-tree+|dot-tree|dot-tree+]
                 Output format which can be used with --requires/--weak-
                 requires/--whatrequires/--obsoletes/--conflicts. The
                 variants with a + suffix are used for weak dependencies
                 and will merge the stronger variants into the output.
                 Default output is 'text'.

          --level [all|any int]
                 In combination with --output ascii-tree|dot-tree|ascii-
                 tree+|dot-tree+ this option specifies the number of level
                 to print on the tree.
                  Default level is 'all'.


-------------------------------------------------------------------------------------------

::

          -a, --all
                 Query all available packages (for rpmquery compatibility /
                 shorthand for repoquery '*')

          --show-duplicates
                 Query all versions of packages.

          -f, --file FILE
                 Query package owning FILE.

          --whatobsoletes CAPABILITY
                 Query all packages that obsolete CAPABILITY.

          --whatconflicts CAPABILITY
                 Query all packages that conflict with CAPABILITY.

          --whatprovides CAPABILITY
                 Query all packages that provide CAPABILITY.

          --whatrequires CAPABILITY
                 Query all packages that require CAPABILITY.

          --alldeps
                 When used with --whatrequires, look for non-explicit
                 dependencies in addition to explicit ones (e.g. files and
                 Provides in addition to package names).  This is the
                 default.

          --exactdeps
                 When used with --whatrequires, search for dependencies
                 only exactly as given.  This is effectively the opposite
                 of --alldeps.

          --recursive
                 When used with --whatrequires, and --requires --resolve,
                 query packages recursively.

          --archlist=ARCH1[,ARCH2...]
                 Limit the query to packages of given architecture(s).
                 Valid values are all architectures known to rpm/yum such
                 as 'i386' and 'src' for source RPMS. Note that repoquery
                 will now change yum's "arch" to the first value in the
                 archlist. So "--archlist=i386,i686" will change yum's
                 canonical arch to i386, but allow packages of i386 and
                 i686.

          --pkgnarrow=WHAT
                 Limit what packages are considered for the query. Valid
                 values for WHAT are: installed, available, recent,
                 updates, extras, all and repository (default).

          --installed
                 Restrict query ONLY to installed pkgs - disables all repos
                 and only acts on rpmdb.


-------------------------------------------------------------------------------

::

          -i, --info
                 Show general information about group.

          -l, --list
                 List packages belonging to (required by) group.

          --grouppkgs=WHAT
                 Specify what type of packages are queried from groups.
                 Valid values for WHAT are all, mandatory, default,
                 optional.

          --requires
                 List groups required by group.


---------------------------------------------------------------------------------------

::

          -a     Query all available groups.

          -g, --group
                 Query groups instead of packages.


---------------------------------------------------------

::

          List all packages whose name contains 'perl':
                 repoquery '*perl*'

          List all packages depending on openssl:
                 repoquery --whatrequires openssl

          List all package names and the repository they come from, nicely
          formatted:
                 repoquery -a --qf "%-20{repoid} %{name}"

          List name and summary of all available updates (if any), nicely
          formatted:
                 repoquery -a --pkgnarrow=updates --qf
                 "%{name}:\n%{summary}\n"

          List optional packages in base group:
                 repoquery -g --grouppkgs=optional -l base

          List build requirements from 'anaconda' source rpm:
                 repoquery --requires anaconda.src

          List packages which BuildRequire gail-devel
                 repoquery --archlist=src --whatrequires gail-devel
                   NB: This command will only work if you have repositories
                 enabled which include srpms.


-------------------------------------------------

::

          Specifying package names
                 A package can be referred to in all queries with any of
                 the following:

                 name
                 name.arch
                 name-ver
                 name-ver-rel
                 name-ver-rel.arch
                 name-epoch:ver-rel.arch
                 epoch:name-ver-rel.arch

                 For example: repoquery -l kernel-2.4.1-10.i686
                 Additionally wildcards (shell-style globs) can be used.


---------------------------------------------------

::

          As repoquery uses YUM libraries for retrieving all the
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

   Panu Matilainen              17 October 2005                repoquery(1)

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
