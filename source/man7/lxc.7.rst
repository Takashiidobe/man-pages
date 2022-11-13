.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

lxc(7) — Linux manual page
==========================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `OVERVIEW <#OVERVIEW>`__ \|       |                                   |
| `REQUIREMENTS <#REQUIREMENTS>`__  |                                   |
| \|                                |                                   |
| `FUNCTIONAL SPECIFICATI           |                                   |
| ON <#FUNCTIONAL_SPECIFICATION>`__ |                                   |
| \| `SEE ALSO <#SEE_ALSO>`__ \|    |                                   |
| `AUTHOR <#AUTHOR>`__ \|           |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   LXC(7)                                                            LXC(7)

NAME
-------------------------------------------------

::

          lxc - linux containers


---------------------------------------------------------

::

          The container technology is actively being pushed into the
          mainstream Linux kernel. It provides resource management through
          control groups and resource isolation via namespaces.

          lxc, aims to use these new functionalities to provide a userspace
          container object which provides full resource isolation and
          resource control for an applications or a full system.

          lxc is small enough to easily manage a container with simple
          command lines and complete enough to be used for other purposes.


-----------------------------------------------------------------

::

          The kernel version >= 3.10 shipped with the distros, will work
          with lxc, this one will have less functionalities but enough to
          be interesting.

          lxc relies on a set of functionalities provided by the kernel.
          The helper script lxc-checkconfig will give you information about
          your kernel configuration, required, and missing features.


-----------------------------------------------------------------------------------------

::

          A container is an object isolating some resources of the host,
          for the application or system running in it.

          The application / system will be launched inside a container
          specified by a configuration that is either initially created or
          passed as a parameter of the commands.

          How to run an application in a container

          Before running an application, you should know what are the
          resources you want to isolate. The default configuration is to
          isolate PIDs, the sysv IPC and mount points. If you want to run a
          simple shell inside a container, a basic configuration is needed,
          especially if you want to share the rootfs. If you want to run an
          application like sshd, you should provide a new network stack and
          a new hostname. If you want to avoid conflicts with some files
          eg.  /var/run/httpd.pid, you should remount /var/run with an
          empty directory. If you want to avoid the conflicts in all the
          cases, you can specify a rootfs for the container. The rootfs can
          be a directory tree, previously bind mounted with the initial
          rootfs, so you can still use your distro but with your own /etc
          and /home

          Here is an example of directory tree for sshd:

          [root@lxc sshd]$ tree -d rootfs

          rootfs
          |-- bin
          |-- dev
          |   |-- pts
          |   `-- shm
          |       `-- network
          |-- etc
          |   `-- ssh
          |-- lib
          |-- proc
          |-- root
          |-- sbin
          |-- sys
          |-- usr
          `-- var
              |-- empty
              |   `-- sshd
              |-- lib
              |   `-- empty
              |       `-- sshd
              `-- run
                  `-- sshd

          and the mount points file associated with it:

               [root@lxc sshd]$ cat fstab

               /lib /home/root/sshd/rootfs/lib none ro,bind 0 0
               /bin /home/root/sshd/rootfs/bin none ro,bind 0 0
               /usr /home/root/sshd/rootfs/usr none ro,bind 0 0
               /sbin /home/root/sshd/rootfs/sbin none ro,bind 0 0

          How to run a system in a container

          Running a system inside a container is paradoxically easier than
          running an application. Why? Because you don't have to care about
          the resources to be isolated, everything needs to be isolated,
          the other resources are specified as being isolated but without
          configuration because the container will set them up. eg. the
          ipv4 address will be setup by the system container init scripts.
          Here is an example of the mount points file:

               [root@lxc debian]$ cat fstab

               /dev /home/root/debian/rootfs/dev none bind 0 0
               /dev/pts /home/root/debian/rootfs/dev/pts  none bind 0 0

      CONTAINER LIFE CYCLE
          When the container is created, it contains the configuration
          information. When a process is launched, the container will be
          starting and running. When the last process running inside the
          container exits, the container is stopped.

          In case of failure when the container is initialized, it will
          pass through the aborting state.

             ---------
            | STOPPED |<---------------
             ---------                 |
                 |                     |
               start                   |
                 |                     |
                 V                     |
             ----------                |
            | STARTING |--error-       |
             ----------         |      |
                 |              |      |
                 V              V      |
             ---------    ----------   |
            | RUNNING |  | ABORTING |  |
             ---------    ----------   |
                 |              |      |
            no process          |      |
                 |              |      |
                 V              |      |
             ----------         |      |
            | STOPPING |<-------       |
             ----------                |
                 |                     |
                  ---------------------

      CONFIGURATION
          The container is configured through a configuration file, the
          format of the configuration file is described in lxc.conf(5)

      CREATING / DESTROYING CONTAINERS
          A persistent container object can be created via the lxc-create
          command. It takes a container name as parameter and optional
          configuration file and template. The name is used by the
          different commands to refer to this container. The lxc-destroy
          command will destroy the container object.

                 lxc-create -n foo
                 lxc-destroy -n foo

      VOLATILE CONTAINER
          It is not mandatory to create a container object before starting
          it.  The container can be directly started with a configuration
          file as parameter.

      STARTING / STOPPING CONTAINER
          When the container has been created, it is ready to run an
          application / system. This is the purpose of the lxc-execute and
          lxc-start commands. If the container was not created before
          starting the application, the container will use the
          configuration file passed as parameter to the command, and if
          there is no such parameter either, then it will use a default
          isolation. If the application ended, the container will be
          stopped, but if needed the lxc-stop command can be used to stop
          the container.

          Running an application inside a container is not exactly the same
          thing as running a system. For this reason, there are two
          different commands to run an application into a container:

                 lxc-execute -n foo [-f config] /bin/bash
                 lxc-start -n foo [-f config] [/bin/bash]

          The lxc-execute command will run the specified command into a
          container via an intermediate process, lxc-init.  This lxc-init
          after launching the specified command, will wait for its end and
          all other reparented processes. (to support daemons in the
          container). In other words, in the container, lxc-init has PID 1
          and the first process of the application has PID 2.

          The lxc-start command will directly run the specified command in
          the container. The PID of the first process is 1. If no command
          is specified lxc-start will run the command defined in
          lxc.init.cmd or if not set, /sbin/init.

          To summarize, lxc-execute is for running an application and lxc-
          start is better suited for running a system.

          If the application is no longer responding, is inaccessible or is
          not able to finish by itself, a wild lxc-stop command will kill
          all the processes in the container without pity.

                 lxc-stop -n foo -k

      CONNECT TO AN AVAILABLE TTY
          If the container is configured with ttys, it is possible to
          access it through them. It is up to the container to provide a
          set of available ttys to be used by the following command. When
          the tty is lost, it is possible to reconnect to it without login
          again.

                 lxc-console -n foo -t 3

      FREEZE / UNFREEZE CONTAINER
          Sometime, it is useful to stop all the processes belonging to a
          container, eg. for job scheduling. The commands:

                 lxc-freeze -n foo

          will put all the processes in an uninteruptible state and

                 lxc-unfreeze -n foo

          will resume them.

          This feature is enabled if the freezer cgroup v1 controller is
          enabled in the kernel.

      GETTING INFORMATION ABOUT CONTAINER
          When there are a lot of containers, it is hard to follow what has
          been created or destroyed, what is running or what are the PIDs
          running in a specific container. For this reason, the following
          commands may be useful:

                 lxc-ls -f
                 lxc-info -n foo

          lxc-ls lists containers.

          lxc-info gives information for a specific container.

          Here is an example on how the combination of these commands
          allows one to list all the containers and retrieve their state.

                 for i in $(lxc-ls -1); do
                   lxc-info -n $i
                 done

      MONITORING CONTAINER
          It is sometime useful to track the states of a container, for
          example to monitor it or just to wait for a specific state in a
          script.

          lxc-monitor command will monitor one or several containers. The
          parameter of this command accepts a regular expression for
          example:

                 lxc-monitor -n "foo|bar"

          will monitor the states of containers named 'foo' and 'bar', and:

                 lxc-monitor -n ".*"

          will monitor all the containers.

          For a container 'foo' starting, doing some work and exiting, the
          output will be in the form:

          'foo' changed state to [STARTING]
          'foo' changed state to [RUNNING]
          'foo' changed state to [STOPPING]
          'foo' changed state to [STOPPED]

          lxc-wait command will wait for a specific state change and exit.
          This is useful for scripting to synchronize the launch of a
          container or the end. The parameter is an ORed combination of
          different states. The following example shows how to wait for a
          container if it successfully started as a daemon.

                 # launch lxc-wait in background
                 lxc-wait -n foo -s STOPPED &
                 LXC_WAIT_PID=$!

                 # this command goes in background
                 lxc-execute -n foo mydaemon &

                 # block until the lxc-wait exits
                 # and lxc-wait exits when the container
                 # is STOPPED
                 wait $LXC_WAIT_PID
                 echo "'foo' is finished"

      CGROUP SETTINGS FOR CONTAINERS
          The container is tied with the control groups, when a container
          is started a control group is created and associated with it. The
          control group properties can be read and modified when the
          container is running by using the lxc-cgroup command.

          lxc-cgroup command is used to set or get a control group
          subsystem which is associated with a container. The subsystem
          name is handled by the user, the command won't do any syntax
          checking on the subsystem name, if the subsystem name does not
          exists, the command will fail.

                 lxc-cgroup -n foo cpuset.cpus

          will display the content of this subsystem.

                 lxc-cgroup -n foo cpu.shares 512

          will set the subsystem to the specified value.


---------------------------------------------------------

::

          lxc(7), lxc-create(1), lxc-copy(1), lxc-destroy(1), lxc-start(1),
          lxc-stop(1), lxc-execute(1), lxc-console(1), lxc-monitor(1),
          lxc-wait(1), lxc-cgroup(1), lxc-ls(1), lxc-info(1),
          lxc-freeze(1), lxc-unfreeze(1), lxc-attach(1), lxc.conf(5)


-----------------------------------------------------

::

          Daniel Lezcano <daniel.lezcano@free.fr>

          Christian Brauner <christian.brauner@ubuntu.com>

          Serge Hallyn <serge@hallyn.com>

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

   Version 4.0.0-devel            2021-08-26                         LXC(7)

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
