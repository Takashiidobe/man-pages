.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

yum-changelog(1) — Linux manual page
====================================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `OPTIONS <#OPTIONS>`__ \|         |                                   |
| `COMMANDS <#COMMANDS>`__ \|       |                                   |
| `FILES <#FILES>`__ \|             |                                   |
| `EXAMPLES <#EXAMPLES>`__ \|       |                                   |
| `BUGS <#BUGS>`__ \|               |                                   |
| `AVAILABILITY <#AVAILABILITY>`__  |                                   |
| \| `AUTHORS <#AUTHORS>`__ \|      |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   YUM-CHANGELOG(1)              User Manuals              YUM-CHANGELOG(1)

NAME
-------------------------------------------------

::

          yum-changelog


---------------------------------------------------------

::

          The yum-changelog package


---------------------------------------------------------------

::

          yum-changelog(1) is a Yum plugin for viewing package changelogs
          before/after updating.  yum will invoke yum-changelog(1) plugin
          if the --changelog option or the changelog command is used with
          yum.


-------------------------------------------------------

::

          --changelog
                 Show changelog delta of updated packages


---------------------------------------------------------

::

          changelog
                 Show changelog data of packages listed (same format as the
                 list command).  The first argument is required and is
                 either "all" for all the changelog entries, a date for the
                 changelog entries since a specified point in time or a
                 number for a given number of changelog entries.


---------------------------------------------------

::

          /etc/yum/pluginconf.d/changelog.conf
                 The system wide configuration file. See
                 yum-changelog.conf(5) for more information.


---------------------------------------------------------

::

          # yum changelog 2008-Jan yum\*
          Listing changelogs since: 2008-01-18
          yum-versionlock-1.1.11-1.fc8.noarch      installed
          * Wed Jan 30 17:00:00 2008 Tim Lauridsen
          <timlau@fedoraproject.org>
          - mark as 1.1.11
          changelog stats. 33 pkgs, 12 source pkgs, 1 changelog
          # yum update ktechlab --changelog
          Loading "changelog" plugin
          Setting up Update Process
          Setting up repositories
          [..]
          Resolving Dependencies
          --> Populating transaction set with selected packages. Please
          wait.
          ---> Package ktechlab.i386 0:0.3-6 set to be updated
          --> Running transaction check

          Changes in packages about to be updated:

          ktechlab - 0.3-6.i386
          * Wed Nov 22 23:00:00 2006 Chitlesh Goorah - 0.3-6
          - Rebuilt due to new gpsim-devel release


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

          yum-changelog is available via:
          # yum install yum-changelog


-------------------------------------------------------

::

                 Chitlesh Goorah <chitlesh@fedoraproject.org>
                 Panu Matilainen <pmatilai@laiskiainen.org>
                 James Antill <james@and.org>


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

                               08 February 2007            YUM-CHANGELOG(1)

--------------

Pages that refer to this page:
`yum-changelog(1) <../man1/yum-changelog.1.html>`__, 
`yum-changelog.conf(5) <../man5/yum-changelog.conf.5.html>`__

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
