.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

lxc-unshare(1) — Linux manual page
==================================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `OPTIONS <#OPTIONS>`__ \|         |                                   |
| `EXAMPLES <#EXAMPLES>`__ \|       |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `AUTHOR <#AUTHOR>`__ \|           |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   LXC-UNSHARE(1)                                            LXC-UNSHARE(1)

NAME
-------------------------------------------------

::

          lxc-unshare - Run a task in a new set of namespaces.


---------------------------------------------------------

::

          lxc-unshare -s, --namespaces namespaces [ -u, --user user ]  [
          -H, --hostname hostname ]  [ -i, --ifname ifname ]  [ -d,
          --daemon ]  [ -M, --remount ]  command


---------------------------------------------------------------

::

          lxc-unshare can be used to run a task in a cloned set of
          namespaces. This command is mainly provided for testing purposes.
          Despite its name, it always uses clone rather than unshare to
          create the new task with fresh namespaces. Apart from testing
          kernel regressions this should make no difference.


-------------------------------------------------------

::

          -s, --namespaces namespaces
                 Specify the namespaces to attach to, as a pipe-separated
                 list, e.g. NETWORK|IPC. Allowed values are MOUNT, PID,
                 UTSNAME, IPC, USER  and NETWORK. This allows one to change
                 the context of the process to e.g. the network namespace
                 of the container while retaining the other namespaces as
                 those of the host. (The pipe symbol needs to be escaped,
                 e.g.  MOUNT\|PID or quoted, e.g.  "MOUNT|PID".)

          -u, --user user
                 Specify a userid which the new task should become.

          -H, --hostname hostname
                 Set the hostname in the new container. Only allowed if the
                 UTSNAME namespace is set.

          -i, --ifname interfacename
                 Move the named interface into the container. Only allowed
                 if the NETWORK namespace is set. You may specify this
                 argument multiple times to move multiple interfaces into
                 container.

          -d, --daemon
                 Daemonize (do not wait for the container to exit before
                 exiting)

          -M, --remount
                 Mount default filesystems (/proc /dev/shm and /dev/mqueue)
                 in the container. Only allowed if MOUNT namespace is set.


---------------------------------------------------------

::

          To spawn a new shell with its own UTS (hostname) namespace,

                    lxc-unshare -s UTSNAME /bin/bash

          If the hostname is changed in that shell, the change will not be
          reflected on the host.

          To spawn a shell in a new network, pid, and mount namespace,

                    lxc-unshare -s "NETWORK|PID|MOUNT" /bin/bash

          The resulting shell will have pid 1 and will see no network
          interfaces.  After re-mounting /proc in that shell,

                    mount -t proc proc /proc

          ps output will show there are no other processes in the
          namespace.

          To spawn a shell in a new network, pid, mount, and hostname
          namespace.

                    lxc-unshare -s "NETWORK|PID|MOUNT|UTSNAME" -M -H myhostname -i veth1 /bin/bash

          The resulting shell will have pid 1 and will see two network
          interfaces (lo and veth1). The hostname will be "myhostname" and
          /proc will have been remounted. ps output will show there are no
          other processes in the namespace.


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

                                  2021-08-26                 LXC-UNSHARE(1)

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
