.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

reposync(1) — Linux manual page
===============================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `OPTIONS <#OPTIONS>`__ \|         |                                   |
| `EXAMPLES <#EXAMPLES>`__ \|       |                                   |
| `FILES <#FILES>`__ \|             |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `AUTHORS <#AUTHORS>`__ \|         |                                   |
| `BUGS <#BUGS>`__ \|               |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   reposync(1)                                                  reposync(1)

NAME
-------------------------------------------------

::

          reposync - synchronize yum repositories to a local directory


---------------------------------------------------------

::

          reposync [options]


---------------------------------------------------------------

::

          reposync is used to synchronize a remote yum repository to a
          local directory, using yum to retrieve the packages.


-------------------------------------------------------

::

          -h, --help
                 Display a help message, and then quit.

          -c CONFIG, --config=CONFIG
                 Config file to use (defaults to /etc/yum.conf).

          -a ARCH, --arch=ARCH
                 Act as if running the specified arch (default: current
                 arch, note: does not override $releasever. x86_64 is a
                 superset for i*86.).

          --source
                 Also download .src.rpm files.

          -r REPOID, --repoid=REPOID
                 Specify repo ids to query, can be specified multiple times
                 (default is all enabled).

          -e CACHEDIR, --cachedir CACHEDIR
                 Directory in which to store metadata.

          -t, --tempcache
                 Use a temp dir for storing/accessing yum-cache.

          -d, --delete
                 Delete local packages no longer present in repository.

          -p DESTDIR, --download_path=DESTDIR
                 Path to download packages to: defaults to current
                 directory.

          --norepopath
                 Don't add the reponame to the download path.  Can only be
                 used when syncing a single repository (default is to add
                 the reponame).

          -g, --gpgcheck
                 Remove packages that fail GPG signature checking after
                 downloading.  exit status is '1' if at least one package
                 was removed.

          -u, --urls
                 Just list urls of what would be downloaded, don't
                 download.

          -l, --plugins
                 Enable yum plugin support.

          -m, --downloadcomps
                 Also download comps.xml.

          --download-metadata
                 Download all the non-default metadata

          -n, --newest-only
                 Download only newest packages per-repo.

          -q, --quiet
                 Output as little information as possible.

          --allow-path-traversal
                 Allow packages stored outside their repo directory to be
                 synced.  These are packages that are referenced in
                 metadata by using absolute paths or up-level ".." symbols,
                 and are normally skipped by reposync for security reasons.

                 CAUTION: Using this option has potential security
                 implications since, by providing malicious repodata, an
                 attacker could make reposync write to arbitrary locations
                 on the file system that are accessible by the user running
                 it.


---------------------------------------------------------

::

          Sync all packages from the 'updates' repo to the current
          directory:
                  reposync --repoid=updates

          Sync only the newest packages from the 'updates' repo to the
          current directory:
                  reposync -n --repoid=updates

          Sync packages from the 'updates' and 'extras' repos to the
          current directory:
                  reposync --repoid=updates --repoid=extras

          Sync all packages from the 'updates' repo to the repos directory:
                  reposync -p repos --repoid=updates

          Sync all packages from the 'updates' repo to the repos directory
          excluding x86_64 arch. Edit /etc/yum.conf adding option
          exclude=*.x86_64. Then:
                 reposync -p repos --repoid=updates


---------------------------------------------------

::

          reposync uses the yum libraries for retrieving information and
          packages. If no configuration file is specified, the default yum
          configuration will be used.

          /etc/yum.conf
          /etc/yum/repos.d/


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

                                 27 April 2007                  reposync(1)

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
