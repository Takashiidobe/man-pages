.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

rpm-plugins(8) — Linux manual page
==================================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `Description <#Description>`__ \| |                                   |
| `                                 |                                   |
| Configuration <#Configuration>`__ |                                   |
| \| `SEE ALSO <#SEE_ALSO>`__ \|    |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   RPM-PLUGINS(8)                                            RPM-PLUGINS(8)

NAME
-------------------------------------------------

::

          rpm-plugins - Plugins for the RPM Package Manager


---------------------------------------------------------------

::

          RPM plugins provide functionality that is not suited to be used
          everywhere.  They may not be built or shipped on some platforms
          or may not be installed or be disabled on some systems.

          This allows plugins to interface with systems that may not
          acceptable as a dependency for RPM and to provide functionality
          that may be unwanted under some circumstances.

          For now the plugin API is internal only.  So there is a limited
          number of plugins in the RPM sources.


-------------------------------------------------------------------

::

          Some plugins can be configured by specific macros or influenced
          by command line parameters.  But most can only be turned on or
          off.  See the plugin's man page for details.

          Plugins are controlled by a macro %__transaction_NAME which is
          set to the location of the plugin file.  Undefining the macro or
          setting it to %{nil} will prevent the plugin from being run.

          This can be done on the RPM command line e.g. with
          --undefine=__transaction_syslog.  To disable a plugin
          permantently drop a file in /etc/rpm/ that contains

          __transaction_NAME %{nil}

          Another option is to remove the plugin from the system if it is
          packaged in its own sub package.

          For some operations it may be desirable to disable all plugins at
          once.  This can be done by passing --noplugins to rpm at the
          command line.


---------------------------------------------------------

::

          rpm(8) rpm-plugin-audit(8) rpm-plugin-ima(8) rpm-plugin-
          prioreset(8) rpm-plugin-selinux(8) rpm-plugin-syslog(8) rpm-
          plugin-systemd-inhibit(8)

COLOPHON
---------------------------------------------------------

::

          This page is part of the rpm (RPM Package Manager) project.
          Information about the project can be found at 
          ⟨https://github.com/rpm-software-management/rpm⟩.  It is not known
          how to report bugs for this man page; if you know, please send a
          mail to man-pages@man7.org.  This page was obtained from the
          project's upstream Git repository
          ⟨https://github.com/rpm-software-management/rpm.git⟩ on
          2021-08-27.  (At that time, the date of the most recent commit
          that was found in the repository was 2021-08-25.)  If you
          discover any rendering problems in this HTML version of the page,
          or you believe there is a better or more up-to-date source for
          the page, or you have corrections or improvements to the
          information in this COLOPHON (which is not part of the original
          manual page), send a mail to man-pages@man7.org

                                  29 Jan 2020                RPM-PLUGINS(8)

--------------

Pages that refer to this page:
`rpm-plugin-audit(8) <../man8/rpm-plugin-audit.8.html>`__, 
`rpm-plugin-dbus-announce(8) <../man8/rpm-plugin-dbus-announce.8.html>`__, 
`rpm-plugin-ima(8) <../man8/rpm-plugin-ima.8.html>`__, 
`rpm-plugin-prioreset(8) <../man8/rpm-plugin-prioreset.8.html>`__, 
`rpm-plugin-syslog(8) <../man8/rpm-plugin-syslog.8.html>`__, 
`rpm-plugin-systemd-inhibit(8) <../man8/rpm-plugin-systemd-inhibit.8.html>`__

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
