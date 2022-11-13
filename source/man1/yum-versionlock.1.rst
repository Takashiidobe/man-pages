.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

yum-versionlock(1) — Linux manual page
======================================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `FILES <#FILES>`__ \|             |                                   |
| `BUGS <#BUGS>`__ \|               |                                   |
| `AVAILABILITY <#AVAILABILITY>`__  |                                   |
| \| `AUTHORS <#AUTHORS>`__ \|      |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   YUM-VERSIONLOCK(1)            User Manuals            YUM-VERSIONLOCK(1)

NAME
-------------------------------------------------

::

          yum-versionlock - Version lock rpm packages


---------------------------------------------------------

::

          yum-versionlock [ package-name [ package-name]] ...


---------------------------------------------------------------

::

          yum-versionlock(1) is a Yum plugin that takes a set of
          name/versions for packages and excludes all other versions of
          those packages (including optionally following obsoletes).  This
          allows you to protect packages from being updated by newer
          versions.

          The plugin provides a command "versionlock" which allows you to
          view and edit the list of locked packages easily.

          yum versionlock add <package-wildcard>...
                 Add a versionlock for all of the packages in the rpmdb
                 matching the given wildcards.

          yum versionlock exclude <package-wildcard>...
                 Opposite; disallow currently available versions of the
                 packages matching the given wildcards.

          yum versionlock list
                 List the current versionlock entries.

          yum versionlock status
                 List any available updates that are currently blocked by
                 versionlock.  That is, for each entry in the lock list,
                 print the newest package available in the repos unless it
                 is the particular locked/excluded version.

          yum versionlock delete <entry-wildcard>...
                 Remove any matching versionlock entries.

          yum versionlock clear
                 Remove all versionlock entries.


---------------------------------------------------

::

          /etc/yum/pluginconf.d/versionlock.conf
                 The system wide configuration file. See
                 yum-versionlock.conf(5) for more information.
          /etc/yum/pluginconf.d/versionlock.list
                 The default place to put package version lock information
                 (one package and version per. line). The file takes
                 entries in the following format EPOCH:NAME-VERSION-
                 RELEASE.ARCH See rpm(8) for more information on custom
                 query formats. If the package does not have an EPOCH the
                 number will default to 0.


-------------------------------------------------

::

          There are of course no bugs, but should you find any, you should
          first consult the FAQ section on http://yum.baseurl.org/wiki/Faq
          and if unsuccessful in finding a resolution contact the mailing
          list: yum-devel@lists.baseurl.org.  To file a bug use
          http://bugzilla.redhat.com for Fedora/RHEL/Centos related bugs
          and http://yum.baseurl.org/report for all other bugs.


-----------------------------------------------------------------

::

          yum-versionlock is available via:
          # yum install yum-versionlock


-------------------------------------------------------

::

          Panu Matilainen <pmatilai@laiskiainen.org>
          James Antill <james@and.org>
          Documentation modified by:
          Gerhardus Geldenhuis <gerhardus.geldenhuis@gmail.com>


---------------------------------------------------------

::

          yum(1)

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

                               28 December 2009          YUM-VERSIONLOCK(1)

--------------

Pages that refer to this page:
`yum-versionlock(1) <../man1/yum-versionlock.1.html>`__, 
`yum-versionlock.conf(5) <../man5/yum-versionlock.conf.5.html>`__

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
