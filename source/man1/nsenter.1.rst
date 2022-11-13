.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

nsenter(1) — Linux manual page
==============================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `OPTIONS <#OPTIONS>`__ \|         |                                   |
| `AUTHORS <#AUTHORS>`__ \|         |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `RE                               |                                   |
| PORTING BUGS <#REPORTING_BUGS>`__ |                                   |
| \|                                |                                   |
| `AVAILABILITY <#AVAILABILITY>`__  |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   NSENTER(1)                    User Commands                   NSENTER(1)

NAME
-------------------------------------------------

::

          nsenter - run program in different namespaces


---------------------------------------------------------

::

          nsenter [options] [program [arguments]]


---------------------------------------------------------------

::

          The nsenter command executes program in the namespace(s) that are
          specified in the command-line options (described below). If
          program is not given, then "${SHELL}" is run (default: /bin/sh).

          Enterable namespaces are:

          mount namespace
              Mounting and unmounting filesystems will not affect the rest
              of the system, except for filesystems which are explicitly
              marked as shared (with mount --make-shared; see
              /proc/self/mountinfo for the shared flag). For further
              details, see mount_namespaces(7) and the discussion of the
              CLONE_NEWNS flag in clone(2).

          UTS namespace
              Setting hostname or domainname will not affect the rest of
              the system. For further details, see uts_namespaces(7).

          IPC namespace
              The process will have an independent namespace for POSIX
              message queues as well as System V message queues, semaphore
              sets and shared memory segments. For further details, see
              ipc_namespaces(7).

          network namespace
              The process will have independent IPv4 and IPv6 stacks, IP
              routing tables, firewall rules, the /proc/net and
              /sys/class/net directory trees, sockets, etc. For further
              details, see network_namespaces(7).

          PID namespace
              Children will have a set of PID to process mappings separate
              from the nsenter process. nsenter will fork by default if
              changing the PID namespace, so that the new program and its
              children share the same PID namespace and are visible to each
              other. If --no-fork is used, the new program will be exec’ed
              without forking. For further details, see pid_namespaces(7).

          user namespace
              The process will have a distinct set of UIDs, GIDs and
              capabilities. For further details, see user_namespaces(7).

          cgroup namespace
              The process will have a virtualized view of
              /proc/self/cgroup, and new cgroup mounts will be rooted at
              the namespace cgroup root. For further details, see
              cgroup_namespaces(7).

          time namespace
              The process can have a distinct view of CLOCK_MONOTONIC
              and/or CLOCK_BOOTTIME which can be changed using
              /proc/self/timens_offsets. For further details, see
              time_namespaces(7).


-------------------------------------------------------

::

          Various of the options below that relate to namespaces take an
          optional file argument. This should be one of the
          /proc/[pid]/ns/* files described in namespaces(7), or the
          pathname of a bind mount that was created on one of those files.

          -a, --all
              Enter all namespaces of the target process by the default
              /proc/[pid]/ns/* namespace paths. The default paths to the
              target process namespaces may be overwritten by namespace
              specific options (e.g., --all --mount=[path]).

              The user namespace will be ignored if the same as the
              caller’s current user namespace. It prevents a caller that
              has dropped capabilities from regaining those capabilities
              via a call to setns(). See setns(2) for more details.

          -t, --target PID
              Specify a target process to get contexts from. The paths to
              the contexts specified by pid are:

              /proc/pid/ns/mnt
                  the mount namespace

              /proc/pid/ns/uts
                  the UTS namespace

              /proc/pid/ns/ipc
                  the IPC namespace

              /proc/pid/ns/net
                  the network namespace

              /proc/pid/ns/pid
                  the PID namespace

              /proc/pid/ns/user
                  the user namespace

              /proc/pid/ns/cgroup
                  the cgroup namespace

              /proc/pid/ns/time
                  the time namespace

              /proc/pid/root
                  the root directory

              /proc/pid/cwd
                  the working directory respectively

          -m, --mount[=file]
              Enter the mount namespace. If no file is specified, enter the
              mount namespace of the target process. If file is specified,
              enter the mount namespace specified by file.

          -u, --uts[=file]
              Enter the UTS namespace. If no file is specified, enter the
              UTS namespace of the target process. If file is specified,
              enter the UTS namespace specified by file.

          -i, --ipc[=file]
              Enter the IPC namespace. If no file is specified, enter the
              IPC namespace of the target process. If file is specified,
              enter the IPC namespace specified by file.

          -n, --net[=file]
              Enter the network namespace. If no file is specified, enter
              the network namespace of the target process. If file is
              specified, enter the network namespace specified by file.

          -p, --pid[=file]
              Enter the PID namespace. If no file is specified, enter the
              PID namespace of the target process. If file is specified,
              enter the PID namespace specified by file.

          -U, --user[=file]
              Enter the user namespace. If no file is specified, enter the
              user namespace of the target process. If file is specified,
              enter the user namespace specified by file. See also the
              --setuid and --setgid options.

          -C, --cgroup[=file]
              Enter the cgroup namespace. If no file is specified, enter
              the cgroup namespace of the target process. If file is
              specified, enter the cgroup namespace specified by file.

          -T, --time[=file]
              Enter the time namespace. If no file is specified, enter the
              time namespace of the target process. If file is specified,
              enter the time namespace specified by file.

          -G, --setgid gid
              Set the group ID which will be used in the entered namespace
              and drop supplementary groups. nsenter always sets GID for
              user namespaces, the default is 0.

          -S, --setuid uid
              Set the user ID which will be used in the entered namespace.
              nsenter always sets UID for user namespaces, the default is
              0.

          --preserve-credentials
              Don’t modify UID and GID when enter user namespace. The
              default is to drops supplementary groups and sets GID and UID
              to 0.

          -r, --root[=directory]
              Set the root directory. If no directory is specified, set the
              root directory to the root directory of the target process.
              If directory is specified, set the root directory to the
              specified directory.

          -w, --wd[=directory]
              Set the working directory. If no directory is specified, set
              the working directory to the working directory of the target
              process. If directory is specified, set the working directory
              to the specified directory.

          -F, --no-fork
              Do not fork before exec’ing the specified program. By
              default, when entering a PID namespace, nsenter calls fork
              before calling exec so that any children will also be in the
              newly entered PID namespace.

          -Z, --follow-context
              Set the SELinux security context used for executing a new
              process according to already running process specified by
              --target PID. (The util-linux has to be compiled with SELinux
              support otherwise the option is unavailable.)

          -V, --version
              Display version information and exit.

          -h, --help
              Display help text and exit.


-------------------------------------------------------

::

          Eric Biederman <biederm@xmission.com>, Karel Zak
          <kzak@redhat.com>


---------------------------------------------------------

::

          clone(2), setns(2), namespaces(7)


---------------------------------------------------------------------

::

          For bug reports, use the issue tracker at
          https://github.com/karelzak/util-linux/issues.


-----------------------------------------------------------------

::

          The nsenter command is part of the util-linux package which can
          be downloaded from Linux Kernel Archive
          <https://www.kernel.org/pub/linux/utils/util-linux/>. This page
          is part of the util-linux (a random collection of Linux
          utilities) project. Information about the project can be found at
          ⟨https://www.kernel.org/pub/linux/utils/util-linux/⟩. If you have
          a bug report for this manual page, send it to
          util-linux@vger.kernel.org. This page was obtained from the
          project's upstream Git repository
          ⟨git://git.kernel.org/pub/scm/utils/util-linux/util-linux.git⟩ on
          2021-08-27. (At that time, the date of the most recent commit
          that was found in the repository was 2021-08-24.) If you discover
          any rendering problems in this HTML version of the page, or you
          believe there is a better or more up-to-date source for the page,
          or you have corrections or improvements to the information in
          this COLOPHON (which is not part of the original manual page),
          send a mail to man-pages@man7.org

   util-linux 2.37.85-637cc       2021-04-02                     NSENTER(1)

--------------

Pages that refer to this page: `unshare(1) <../man1/unshare.1.html>`__, 
`setns(2) <../man2/setns.2.html>`__, 
`ipc_namespaces(7) <../man7/ipc_namespaces.7.html>`__, 
`mount_namespaces(7) <../man7/mount_namespaces.7.html>`__, 
`namespaces(7) <../man7/namespaces.7.html>`__, 
`network_namespaces(7) <../man7/network_namespaces.7.html>`__, 
`time_namespaces(7) <../man7/time_namespaces.7.html>`__, 
`uts_namespaces(7) <../man7/uts_namespaces.7.html>`__, 
`lsns(8) <../man8/lsns.8.html>`__

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
