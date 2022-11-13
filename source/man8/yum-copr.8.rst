.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

yum-copr(8) — Linux manual page
===============================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `ARGUME                           |                                   |
| NTS (COPR) <#ARGUMENTS_(COPR)>`__ |                                   |
| \|                                |                                   |
| `ARGUMENTS (PLAYGRO               |                                   |
| UND) <#ARGUMENTS_(PLAYGROUND)>`__ |                                   |
| \| `EXAMPLES <#EXAMPLES>`__ \|    |                                   |
| `AUTHOR <#AUTHOR>`__ \|           |                                   |
| `COPYRIGHT <#COPYRIGHT>`__ \|     |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   YUM-COPR(8)                  yum-plugin-copr                 YUM-COPR(8)

NAME
-------------------------------------------------

::

          yum-plugin-copr - YUM copr Plugin

          Work with Copr & Playground repositories on the local system.

          • The copr command is used to add or remove Copr repositories to
            the local system

          • The playground is used to enable or disable the Playground
            repository


---------------------------------------------------------

::

          yum copr [enable|disable|list|search] <parameters>

          yum playground [enable|disable|upgrade]


-------------------------------------------------------------------------

::

          enable name/project [chroot]
                 Enable the name/project Copr repository with the optional
                 chroot.

          disable name/project
                 Disable the name/project Copr repository.

          list name
                 List available Copr repositories for a given name.

          search project
                 Search for a given project.


-------------------------------------------------------------------------------------

::

          enable Enable the Playground repository.

          disable
                 Disable the Playground repository.

          upgrade
                 Upgrade the Playground repository settings (same as
                 disable and then enable).


---------------------------------------------------------

::

          copr enable rhscl/perl516 epel-6-x86_64
                 Enable the rhscl/perl516 Copr repository, using the
                 epel-6-x86_64 chroot.

          copr disable rhscl/perl516
                 Disable the rhscl/perl516 Copr repository

          copr list rita
                 List available Copr projects for user rita.

          copr search tests
                 Search for Copr projects named tests.


-----------------------------------------------------

::

          See AUTHORS in the Core DNF Plugins distribution


-----------------------------------------------------------

::

          2014, Red Hat, Licensed under GPLv2+

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

   0.1.1                         July 29, 2014                  YUM-COPR(8)

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
