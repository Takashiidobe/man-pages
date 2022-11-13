.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

lxc-wait(1) — Linux manual page
===============================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `OPTIONS <#OPTIONS>`__ \|         |                                   |
| `CO                               |                                   |
| MMON OPTIONS <#COMMON_OPTIONS>`__ |                                   |
| \| `EXAMPLES <#EXAMPLES>`__ \|    |                                   |
| `DIAGNOSTIC <#DIAGNOSTIC>`__ \|   |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `AUTHOR <#AUTHOR>`__ \|           |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   LXC-WAIT(1)                                                  LXC-WAIT(1)

NAME
-------------------------------------------------

::

          lxc-wait - wait for a specific container state


---------------------------------------------------------

::

          lxc-wait -n name -s states


---------------------------------------------------------------

::

          lxc-wait waits for a specific container state before exiting,
          this is useful for scripting.


-------------------------------------------------------

::

          -s, --state states
                 Specify the container state(s) to wait for. The container
                 states can be ORed to specify several states.

          -t, --timeout timeout
                 Wait timeout seconds for desired state to be reached.


---------------------------------------------------------------------

::

          These options are common to most of lxc commands.

          -?, -h, --help
                 Print a longer usage message than normal.

          --usage
                 Give the usage message

          -q, --quiet
                 mute on

          -P, --lxcpath=PATH
                 Use an alternate container path. The default is
                 /usr/local/var/lib/lxc.

          -o, --logfile=FILE
                 Output to an alternate log FILE. The default is no log.

          -l, --logpriority=LEVEL
                 Set log priority to LEVEL. The default log priority is
                 ERROR. Possible values are : FATAL, ALERT, CRIT, WARN,
                 ERROR, NOTICE, INFO, DEBUG, TRACE.

                 Note that this option is setting the priority of the
                 events log in the alternate log file. It do not have
                 effect on the ERROR events log on stderr.

          -n, --name=NAME
                 Use container identifier NAME.  The container identifier
                 format is an alphanumeric string.

          --rcfile=FILE
                 Specify the configuration file to configure the
                 virtualization and isolation functionalities for the
                 container.

                 This configuration file if present will be used even if
                 there is already a configuration file present in the
                 previously created container (via lxc-create).

          --version
                 Show the version number.


---------------------------------------------------------

::

          lxc-wait -n foo -s RUNNING
                 exits when 'RUNNING' is reached.

          lxc-wait -n foo -s 'RUNNING|STOPPED'
                 exits when 'RUNNING' or 'STOPPED' state is reached.


-------------------------------------------------------------

::

          The container was not found
                 The specified container was not created before with the
                 lxc-create command.


---------------------------------------------------------

::

          lxc(7), lxc-create(1), lxc-copy(1), lxc-destroy(1), lxc-start(1),
          lxc-stop(1), lxc-execute(1), lxc-console(1), lxc-monitor(1),
          lxc-wait(1), lxc-cgroup(1), lxc-ls(1), lxc-info(1),
          lxc-freeze(1), lxc-unfreeze(1), lxc-attach(1), lxc.conf(5)


-----------------------------------------------------

::

          Daniel Lezcano <daniel.lezcano@free.fr>

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

                                  2021-08-26                    LXC-WAIT(1)

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
