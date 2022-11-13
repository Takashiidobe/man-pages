.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

yum-cron(8) — Linux manual page
===============================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `FILES <#FILES>`__ \|             |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `AUTHORS <#AUTHORS>`__ \|         |                                   |
| `BUGS <#BUGS>`__ \|               |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   yum-cron(8)                                                  yum-cron(8)

NAME
-------------------------------------------------

::

          yum-cron - an interface to conveniently call yum from cron


---------------------------------------------------------

::

          yum-cron [config-file]


---------------------------------------------------------------

::

          yum-cron is an alternate interface to yum that is optimised to be
          convenient to call from cron.  It provides methods to keep
          repository metadata up to date, and to check for, download, and
          apply updates.  Rather than accepting many different command line
          arguments, the different functions of yum-cron can be accessed
          through config files.

          config-file is used to optionally specify the path to the
          configuration file to use.  If it is not given, the default
          configuration file will be used.  It is useful to be able to
          specify different configuration files for different use cases.
          For example, one configuration file might be set to update the
          repository metadata, and a line could be added to the crontab to
          run yum-cron frequently using this file.  Then, another
          configuration file might be set to install updates, and yum-cron
          could be run from cron using this file just once each day.


---------------------------------------------------

::

          /etc/yum/yum-cron.conf
          /etc/yum/yum-cron-hourly.conf
          /etc/yum/yum-cron-security.conf


---------------------------------------------------------

::

          yum(8)


-------------------------------------------------------

::

          See the Authors file included with this program.


-------------------------------------------------

::

          There of course aren't any bugs, but if you find any, you should
          email
           the mailing list, yum@lists.baseurl.org, or consult bugzilla.

COLOPHON
---------------------------------------------------------

::

          This page is part of the yum (Yum Package Manager) project.
          Information about the project can be found at 
          ⟨https://github.com/rpm-software-management/yum⟩.  It is not known
          how to report bugs for this man page; if you know, please send a
          mail to man-pages@man7.org.  This page was obtained from the
          project's upstream Git repository
          ⟨https://github.com/rpm-software-management/yum.git⟩ on
          2021-08-27.  (At that time, the date of the most recent commit
          that was found in the repository was 2021-04-02.)  If you
          discover any rendering problems in this HTML version of the page,
          or you believe there is a better or more up-to-date source for
          the page, or you have corrections or improvements to the
          information in this COLOPHON (which is not part of the original
          manual page), send a mail to man-pages@man7.org

   Nick Jacek                                                   yum-cron(8)

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
