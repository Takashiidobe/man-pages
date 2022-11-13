.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

lxc.conf(5) — Linux manual page
===============================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `AUTHOR <#AUTHOR>`__ \|           |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   LXC.CONF(5)                                                  LXC.CONF(5)

NAME
-------------------------------------------------

::

          lxc.conf - Configuration files for LXC.


---------------------------------------------------------------

::

          LXC configuration is split in two parts. Container configuration
          and system configuration.

      CONTAINER CONFIGURATION
          The container configuration is held in the config stored in the
          container's directory.

          A basic configuration is generated at container creation time
          with the default's recommended for the chosen template as well as
          extra default keys coming from the default.conf file.

          That default.conf file is either located at
          /usr/local/etc/lxc/default.conf or for unprivileged containers at
          ~/.config/lxc/default.conf.

          Details about the syntax of this file can be found in:
          lxc.container.conf(5)

      SYSTEM CONFIGURATION
          The system configuration is located at
          /usr/local/etc/lxc/lxc.conf or ~/.config/lxc/lxc.conf for
          unprivileged containers.

          This configuration file is used to set values such as default
          lookup paths and storage backend settings for LXC.

          Details about the syntax of this file can be found in:
          lxc.system.conf(5)


---------------------------------------------------------

::

          lxc(1), lxc.container.conf(5), lxc.system.conf(5), lxc-usernet(5)


-----------------------------------------------------

::

          Stéphane Graber <stgraber@ubuntu.com>

COLOPHON
---------------------------------------------------------

::

          This page is part of the lxc (Linux containers) project.
          Information about the project can be found at 
          ⟨http://linuxcontainers.org/⟩.  If you have a bug report for this
          manual page, send it to lxc-devel@lists.linuxcontainers.org.
          This page was obtained from the project's upstream Git repository
          ⟨git://github.com/lxc/lxc⟩ on 2021-08-27.  (At that time, the
          date of the most recent commit that was found in the repository
          was 2021-08-26.)  If you discover any rendering problems in this
          HTML version of the page, or you believe there is a better or
          more up-to-date source for the page, or you have corrections or
          improvements to the information in this COLOPHON (which is not
          part of the original manual page), send a mail to
          man-pages@man7.org

                                  2021-08-26                    LXC.CONF(5)

--------------

Pages that refer to this page:
`lxc-attach(1) <../man1/lxc-attach.1.html>`__, 
`lxc-autostart(1) <../man1/lxc-autostart.1.html>`__, 
`lxc-cgroup(1) <../man1/lxc-cgroup.1.html>`__, 
`lxc-checkconfig(1) <../man1/lxc-checkconfig.1.html>`__, 
`lxc-checkpoint(1) <../man1/lxc-checkpoint.1.html>`__, 
`lxc-config(1) <../man1/lxc-config.1.html>`__, 
`lxc-console(1) <../man1/lxc-console.1.html>`__, 
`lxc-copy(1) <../man1/lxc-copy.1.html>`__, 
`lxc-create(1) <../man1/lxc-create.1.html>`__, 
`lxc-destroy(1) <../man1/lxc-destroy.1.html>`__, 
`lxc-device(1) <../man1/lxc-device.1.html>`__, 
`lxc-execute(1) <../man1/lxc-execute.1.html>`__, 
`lxc-freeze(1) <../man1/lxc-freeze.1.html>`__, 
`lxc-info(1) <../man1/lxc-info.1.html>`__, 
`lxc-ls(1) <../man1/lxc-ls.1.html>`__, 
`lxc-monitor(1) <../man1/lxc-monitor.1.html>`__, 
`lxc-snapshot(1) <../man1/lxc-snapshot.1.html>`__, 
`lxc-start(1) <../man1/lxc-start.1.html>`__, 
`lxc-stop(1) <../man1/lxc-stop.1.html>`__, 
`lxc-top(1) <../man1/lxc-top.1.html>`__, 
`lxc-unfreeze(1) <../man1/lxc-unfreeze.1.html>`__, 
`lxc-unshare(1) <../man1/lxc-unshare.1.html>`__, 
`lxc-update-config(1) <../man1/lxc-update-config.1.html>`__, 
`lxc-usernsexec(1) <../man1/lxc-usernsexec.1.html>`__, 
`lxc-wait(1) <../man1/lxc-wait.1.html>`__, 
`lxc.container.conf(5) <../man5/lxc.container.conf.5.html>`__, 
`lxc.system.conf(5) <../man5/lxc.system.conf.5.html>`__, 
`lxc(7) <../man7/lxc.7.html>`__

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
