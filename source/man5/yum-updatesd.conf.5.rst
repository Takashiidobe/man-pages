.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

yum-updatesd.conf(5) — Linux manual page
========================================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `PARAMETERS <#PARAMETERS>`__ \|   |                                   |
| `[main]                           |                                   |
|  OPTIONS <#%5Bmain%5D_OPTIONS>`__ |                                   |
| \|                                |                                   |
| `MAIL OPTIONS <#MAIL_OPTIONS>`__  |                                   |
| \|                                |                                   |
| `SY                               |                                   |
| SLOG OPTIONS <#SYSLOG_OPTIONS>`__ |                                   |
| \| `FILES <#FILES>`__ \|          |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   yum-updatesd.conf(5) yum-updatesd configuration fileyum-updatesd.conf(5)

NAME
-------------------------------------------------

::

          yum-updatesd.conf - Configuration file for yum-updatesd(8).


---------------------------------------------------------------

::

          yum-updatesd uses a configuration file at /etc/yum/yum-
          updatesd.conf.

          Additional configuration information is read from the main
          yum.conf (5) configuration file.


-------------------------------------------------------------

::

          There is one section in the yum-updatesd configuration file,
          main, which defines all of the global configuration options.


-------------------------------------------------------------------------

::

          The [main] section must exist for yum-updatesd to do anything. It
          consists of the following options:

          run_interval
                 Number of seconds to wait between checks for available
                 updates.

          updaterefresh
                 Minimum number of seconds between update information
                 refreshes to avoid hitting the server too often.

          emit_via
                 List of ways to emit update notification.  Valid values
                 are `email', `dbus' and `syslog'.

          do_update
                 Boolean option to decide whether or not updates should be
                 automatically applied.  Defaults to False.

          do_download_deps
                 Boolean option to decide whether or not updates should be
                 automatically downloaded.  Defaults to False.

          do_download_deps
                 Boolean option to automatically download dependencies of
                 packages which need updating as well.  Defaults to False.


-----------------------------------------------------------------

::

          email_to
                 List of email addresses to send update notification to.
                 Defaults to `root@localhost'.

          email_from
                 Email address for update notifications to be from.
                 Defaults to `yum-updatesd@localhost'.


---------------------------------------------------------------------

::

          syslog_facility
                 What syslog facility should be used.  Defaults to
                 `DAEMON'.

          syslog_level
                 Level of syslog messages.  Defaults to `WARN'.


---------------------------------------------------

::

          /etc/yum/yum-updatesd.conf


---------------------------------------------------------

::

          yum-updatesd(8) yum.conf(5)

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

   Jeremy Katz                                         yum-updatesd.conf(5)

--------------

Pages that refer to this page:
`yum-updatesd(8) <../man8/yum-updatesd.8.html>`__

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
