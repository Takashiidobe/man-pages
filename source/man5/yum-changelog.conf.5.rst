.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

yum-changelog.conf(5) — Linux manual page
=========================================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `FILES <#FILES>`__ \|             |                                   |
| `FILE FORMAT <#FILE_FORMAT>`__ \| |                                   |
| `OPTION <#OPTION>`__ \|           |                                   |
| `VALUE <#VALUE>`__ \|             |                                   |
| `OPTION <#OPTION>`__ \|           |                                   |
| `VALUE <#VALUE>`__ \|             |                                   |
| `OPTION <#OPTION>`__ \|           |                                   |
| `VALUE <#VALUE>`__ \|             |                                   |
| `OPTION <#OPTION>`__ \|           |                                   |
| `VALUE <#VALUE>`__ \|             |                                   |
| `AUTHOR <#AUTHOR>`__ \|           |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   YUM-CHANGELOG.CONF(5)         File Formats         YUM-CHANGELOG.CONF(5)

NAME
-------------------------------------------------

::

          yum-changelog.conf(5)


---------------------------------------------------------

::

          yum-changelog.conf(5) is the configuration file for
          yum-changelog(1) Yum plugin for viewing package changelogs
          before/after updating.  By default, this plugin will show the
          changelogs before the updates.


---------------------------------------------------

::

          /etc/yum/pluginconf.d/changelog.conf


---------------------------------------------------------------

::

          yum-changelog.conf(5) utilizes configuration options in the form
          of

          OPTION=VALUE


-----------------------------------------------------

::

          when   This option reflects when yum-changelog(1) will allow
                 changelog viewing during yum updates.


---------------------------------------------------

::

          pre    To make yum-changelog(5) show the changelog before the yum
                 updates

          post   To make yum-changelog(5) show the changelog after the yum
                 updates.

.. _option-top-1:


-----------------------------------------------------

::

          always This option reflects specifies if the changelog should
                 always be shown.

.. _value-top-1:


---------------------------------------------------

::

          true   The changelog is always displayed.

          false  A command line option is required for the changelog to be
                 displayed.

.. _option-top-2:


-----------------------------------------------------

::

          updateinfo
                 This option specifies that the "changelog" from the repo.
                 updateinfo should be shown.

.. _value-top-2:


---------------------------------------------------

::

          true   The updateinfo is displayed.

          false  The updateinfo is never displayed.

.. _option-top-3:


-----------------------------------------------------

::

          updateinfo_always
                 This option reflects specifies if the "changelog" from the
                 repo. should always be shown (note that if updateinfo is
                 false then this option has no meaning).

.. _value-top-3:


---------------------------------------------------

::

          true   The updateinfo is always displayed.

          false  A command line option is required for the updateinfo to be
                 displayed.


-----------------------------------------------------

::

                 Chitlesh Goorah <chitlesh@fedoraproject.org>


---------------------------------------------------------

::

          yum-changelog(1)

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

                               08 FEBRUARY 2007       YUM-CHANGELOG.CONF(5)

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
