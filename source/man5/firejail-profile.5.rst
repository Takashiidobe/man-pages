.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

firejail-profile(5) — Linux manual page
=======================================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `Templates <#Templates>`__ \|     |                                   |
| `Scripting <#Scripting>`__ \|     |                                   |
| `Filesystem <#Filesystem>`__ \|   |                                   |
| `Securi                           |                                   |
| ty filters <#Security_filters>`__ |                                   |
| \|                                |                                   |
| `DB                               |                                   |
| us filtering <#DBus_filtering>`__ |                                   |
| \|                                |                                   |
| `Resource limits, CPU affinity,   |                                   |
| Control Groups <#Resource_limits, |                                   |
| _CPU_affinity,_Control_Groups>`__ |                                   |
| \|                                |                                   |
| `User E                           |                                   |
| nvironment <#User_Environment>`__ |                                   |
| \| `Networking <#Networking>`__   |                                   |
| \| `Other <#Other>`__ \|          |                                   |
| `FILES <#FILES>`__ \|             |                                   |
| `LICENSE <#LICENSE>`__ \|         |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   FIREJAIL-PROFILE(5)    firejail profiles man page    FIREJAIL-PROFILE(5)

NAME
-------------------------------------------------

::

          profile - Security profile file syntax, and information about
          building new application profiles.


---------------------------------------------------------

::

          Using a specific profile:

                 firejail --profile=filename.profile

                        Example:
                        $ firejail --profile=/etc/firejail/kdenlive.profile
                        --appimage kdenlive.appimage

                 firejail --profile=profile_name

                        Example:
                        $ firejail --profile=kdenlive --appimage
                        kdenlive.appimage

          Building a profile manually:

                 Start with the template in
                 /usr/share/doc/firejail/profile.template and modify it in
                 a text editor.  To integrate the program in your desktop
                 environment copy the profile file in ~/.config/firejail
                 directory and run "sudo firecfg".

          Aliases and redirections:

                 In some cases the same profile can be used for several
                 applications.  One such example is LibreOffice.  Build a
                 regular profile for the main application, and for the rest
                 use /usr/share/doc/firejail/redirect_alias-
                 profile.template.

          Running the profile builder:

                 firejail --build=appname.profile appname

                        Example:
                        $ firejail --build=blobby.profile blobby

                        Run the program in "firejail --build" and try to
                        exercise as many program features as possible.  The
                        profile is extracted and saved in the current
                        directory. Open it in a text editor and add or
                        remove sandboxing options as necessary. Test again
                        after modifying the profile. To integrate the
                        program in your desktop environment copy the
                        profile file in ~/.config/firejail directory and
                        run "sudo firecfg".


---------------------------------------------------------------

::

          Several command line options can be passed to the program using
          profile files. Firejail chooses the profile file as follows:

          1. If a profile file is provided by the user with --profile
          option, the profile file is loaded. If a profile name is given,
          it is searched for first in the ~/.config/firejail directory and
          if not found then in  /etc/firejail directory. Profile names do
          not include the .profile suffix.  Example:

                 $ firejail --profile=/home/netblue/icecat.profile icecat
                 Reading profile /home/netblue/icecat.profile
                 [...]

                 $ firejail --profile=icecat icecat-wrapper.sh
                 Reading profile /etc/firejail/icecat.profile
                 [...]

          2. If a profile file with the same name as the application is
          present in ~/.config/firejail directory or in /etc/firejail, the
          profile is loaded. ~/.config/firejail takes precedence over
          /etc/firejail. Example:

                 $ firejail icecat
                 Command name #icecat#
                 Found icecat profile in /home/netblue/.config/firejail
                 directory
                 Reading profile
                 /home/netblue/.config/firejail/icecat.profile
                 [...]

          3. Use a default.profile file if the sandbox is started by a
          regular user, or a server.profile file if the sandbox is started
          by root. Firejail looks for these files in ~/.config/firejail
          directory, followed by /etc/firejail directory.  To disable
          default profile loading, use --noprofile command option. Example:

                 $ firejail
                 Reading profile /etc/firejail/default.profile
                 Parent pid 8553, child pid 8554
                 Child process initialized
                 [...]

                 $ firejail --noprofile
                 Parent pid 8553, child pid 8554
                 Child process initialized
                 [...]


-----------------------------------------------------------

::

          In /usr/share/doc/firejail there are two templates to write new
          profiles.
                 profile.template - for regular profiles
                 redirect_alias-profile.template - for aliasing/redirecting
                 profiles


-----------------------------------------------------------

::

          Scripting commands:

          File and directory names
                 File and directory names containing spaces are supported.
                 The space character ' ' should not be escaped.

                 Example: "deny ~/My Virtual Machines"

          # this is a comment
                 Example:

                 # disable networking
                 net none # this command creates an empty network namespace

          ?CONDITIONAL: profile line
                 Conditionally add profile line.

                 Example: "?HAS_APPIMAGE: allow
                 ${HOME}/special/appimage/dir"

                 This example will load the profile line only if the
                 --appimage option has been specified on the command line.

                 Currently the only conditionals supported this way are
                 HAS_APPIMAGE, HAS_NET, HAS_NODBUS, HAS_NOSOUND,
                 HAS_PRIVATE and HAS_X11. The conditionals
                 BROWSER_DISABLE_U2F and BROWSER_ALLOW_DRM can be enabled
                 or disabled globally in Firejail's configuration file.

                 The profile line may be any profile line that you would
                 normally use in a profile except for "quiet" and "include"
                 lines.

          include other.profile
                 Include other.profile file.

                 Example: "include /etc/firejail/disable-common.inc"

                 The file name can be prefixed with a macro such as ${HOME}
                 or ${CFG}.  ${HOME} is expanded as user home directory,
                 and ${CFG} is expanded as Firejail system configuration
                 directory - in most cases /etc/firejail or
                 /usr/local/etc/firejail.

                 Example: "include ${HOME}/myprofiles/profile1" will load
                 "~/myprofiles/profile1" file.

                 Example: "include ${CFG}/firefox.profile" will load
                 "/etc/firejail/firefox.profile" file.

                 The file name may also be just the name without the
                 leading directory components.  In this case, first the
                 user config directory (${HOME}/.config/firejail) is
                 searched for the file name and if not found then the
                 system configuration directory is search for the file
                 name.  Note: Unlike the --profile option which takes a
                 profile name without the '.profile' suffix, include must
                 be given the full file name.

                 Example: "include firefox.profile" will load
                 "${HOME}/.config/firejail/firefox.profile" file and if it
                 does not exist "${CFG}/firefox.profile" will be loaded.

                 System configuration files in ${CFG} are overwritten
                 during software installation.  Persistent configuration at
                 system level is handled in ".local" files. For every
                 profile file in ${CFG} directory, the user can create a
                 corresponding .local file storing modifications to the
                 persistent configuration. Persistent .local files are
                 included at the start of regular profile files.

          noallow file_name
                 If the file name matches file_name, the file will not be
                 allowed in any allow commands that follow.

                 Example: "nowhitelist ~/.config"

          nodeny file_name
                 If the file name matches file_name, the file will not be
                 denied any deny commands that follow.

                 Example: "nodeny ${HOME}/.mozilla"

          ignore Ignore command.

                 Example: "ignore seccomp"
                 Example: "ignore net eth0"

          quiet  Disable Firejail's output. This should be the first
                 uncommented command in the profile file.

                 Example: "quiet"


-------------------------------------------------------------

::

          These profile entries define a chroot filesystem built on top of
          the existing host filesystem. Each line describes a
          file/directory that is inaccessible (blacklist), a read-only file
          or directory (read-only), a tmpfs mounted on top of an existing
          directory (tmpfs), or mount-bind a directory or file on top of
          another directory or file (bind).  Use private to set private
          mode.  File globbing is supported, and PATH and HOME directories
          are searched, see the firejail FILE GLOBBING section for more
          details.  Examples:

          allow file_or_directory
                 Allow directory or file. A temporary file system is
                 mounted on the top directory, and the allowed files are
                 mount-binded inside. Modifications to allowd files are
                 persistent, everything else is discarded when the sandbox
                 is closed. The top directory can be all directories in /
                 (except /proc and /sys), /sys/module, /run/user/$UID,
                 $HOME and all directories in /usr.

                 Symbolic link handling: with the exception of user home,
                 both the link and the real file should be in the same top
                 directory. For user home, both the link and the real file
                 should be owned by the user.

          blacklist-nolog file_or_directory
                 When --tracelog flag is set, blacklisting generates syslog
                 messages if the sandbox tries to access the file or
                 directory.  blacklist-nolog command disables syslog
                 messages for this particular file or directory. Examples:

                 blacklist-nolog /usr/bin
                 blacklist-nolog /usr/bin/gcc*

          bind directory1,directory2
                 Mount-bind directory1 on top of directory2. This option is
                 only available when running as root.

          bind file1,file2
                 Mount-bind file1 on top of file2. This option is only
                 available when running as root.

          deny file_or_directory
                 Deny access to directory or file. Examples:

                 deny /usr/bin
                 deny /usr/bin/gcc*
                 deny ${PATH}/ifconfig
                 deny ${HOME}/.ssh

          disable-mnt
                 Disable /mnt, /media, /run/mount and /run/media access.

          keep-config-pulse
                 Disable automatic ~/.config/pulse init, for complex setups
                 such as remote pulse servers or non-standard socket paths.

          keep-dev-shm
                 /dev/shm directory is untouched (even with private-dev).

          keep-var-tmp
                 /var/tmp directory is untouched.

          mkdir directory
                 Create a directory in user home, under /tmp, or under
                 /run/user/<UID> before the sandbox is started.  The
                 directory is created if it doesn't already exist.

                 Use this command for allowed directories you need to
                 preserve when the sandbox is closed. Without it, the
                 application will create the directory, and the directory
                 will be deleted when the sandbox is closed. Subdirectories
                 are recursively created. Example from firefox profile:

                 mkdir ~/.mozilla
                 whitelist ~/.mozilla
                 mkdir ~/.cache/mozilla/firefox
                 allow ~/.cache/mozilla/firefox

                 For files in /run/user/<PID> use ${RUNUSER} macro:

                 mkdir ${RUNUSER}/firejail-testing

          mkfile file
                 Similar to mkdir, this command creates an empty file in
                 user home, or /tmp, or under /run/user/<UID> before the
                 sandbox is started. The file is created if it doesn't
                 already exist.

          noexec file_or_directory
                 Remount the file or the directory noexec, nodev and
                 nosuid.

          private
                 Mount new /root and /home/user directories in temporary
                 filesystems. All modifications are discarded when the
                 sandbox is closed.

          private directory
                 Use directory as user home.

          private-bin file,file
                 Build a new /bin in a temporary filesystem, and copy the
                 programs in the list.  The files in the list must be
                 expressed as relative to the /bin, /sbin, /usr/bin,
                 /usr/sbin, or /usr/local/bin directories.  The same
                 directory is also bind-mounted over /sbin, /usr/bin and
                 /usr/sbin.

          private-cache
                 Mount an empty temporary filesystem on top of the .cache
                 directory in user home. All modifications are discarded
                 when the sandbox is closed.

          private-cwd
                 Set working directory inside jail to the home directory,
                 and failing that, the root directory.

          private-cwd directory
                 Set working directory inside the jail.

          private-dev
                 Create a new /dev directory. Only disc, dri, dvb, hidraw,
                 null, full, zero, tty, pts, ptmx, random, snd, urandom,
                 video, log, shm and usb devices are available.  Use the
                 options no3d, nodvd, nosound, notv, nou2f and novideo for
                 additional restrictions.

          private-etc file,directory
                 Build a new /etc in a temporary filesystem, and copy the
                 files and directories in the list.  The files and
                 directories in the list must be expressed as relative to
                 the /etc directory, and must not contain the / character
                 (e.g., /etc/foo must be expressed as foo, but /etc/foo/bar
                 -- expressed as foo/bar -- is disallowed).  All
                 modifications are discarded when the sandbox is closed.

          private-home file,directory
                 Build a new user home in a temporary filesystem, and copy
                 the files and directories in the list in the new home.
                 The files and directories in the list must be expressed as
                 relative to the current user's home directory.  All
                 modifications are discarded when the sandbox is closed.

          private-lib file,directory
                 Build a new /lib directory and bring in the libraries
                 required by the application to run.  The files and
                 directories in the list must be expressed as relative to
                 the /lib directory.  This feature is still under
                 development, see man 1 firejail for some examples.

          private-opt file,directory
                 Build a new /opt in a temporary filesystem, and copy the
                 files and directories in the list.  The files and
                 directories in the list must be expressed as relative to
                 the /opt directory, and must not contain the / character
                 (e.g., /opt/foo must be expressed as foo, but /opt/foo/bar
                 -- expressed as foo/bar -- is disallowed).  All
                 modifications are discarded when the sandbox is closed.

          private-srv file,directory
                 Build a new /srv in a temporary filesystem, and copy the
                 files and directories in the list.  The files and
                 directories in the list must be expressed as relative to
                 the /srv directory, and must not contain the / character
                 (e.g., /srv/foo must be expressed as foo, but /srv/foo/bar
                 -- expressed as foo/bar -- is disallowed).  All
                 modifications are discarded when the sandbox is closed.

          private-tmp
                 Mount an empty temporary filesystem on top of /tmp
                 directory allowing /tmp/.X11-unix.

          read-only file_or_directory
                 Make directory or file read-only.

          read-write file_or_directory
                 Make directory or file read-write.

          tmpfs directory
                 Mount an empty tmpfs filesystem on top of directory.
                 Directories outside user home or not owned by the user are
                 not allowed. Sandboxes running as root are exempt from
                 these restrictions.

          tracelog
                 File system deny violations logged to syslog.

          writable-etc
                 Mount /etc directory read-write.

          writable-run-user
                 Disable the default denying of run/user/$UID/systemd and
                 /run/user/$UID/gnupg.

          writable-var
                 Mount /var directory read-write.

          writable-var-log
                 Use the real /var/log directory, not a clone. By default,
                 a tmpfs is mounted on top of /var/log directory, and a
                 skeleton filesystem is created based on the original
                 /var/log.


-------------------------------------------------------------------------

::

          The following security filters are currently implemented:

          allow-debuggers
                 Allow tools such as strace and gdb inside the sandbox by
                 allowing system calls ptrace and process_vm_readv.

          caps   Enable default Linux capabilities filter.

          caps.drop capability,capability,capability
                 Deny given Linux capabilities.

          caps.drop all
                 Deny all Linux capabilities.

          caps.keep capability,capability,capability
                 Allow given Linux capabilities.

          memory-deny-write-execute
                 Install a seccomp filter to block attempts to create
                 memory mappings that are both writable and executable, to
                 change mappings to be executable or to create executable
                 shared memory.

          nonewprivs
                 Sets the NO_NEW_PRIVS prctl.  This ensures that child
                 processes cannot acquire new privileges using execve(2);
                 in particular, this means that calling a suid binary (or
                 one with file capabilities) does not result in an increase
                 of privilege.

          noroot Use this command  to enable an user namespace. The
                 namespace has only one user, the current user.  There is
                 no root account (uid 0) defined in the namespace.

          protocol protocol1,protocol2,protocol3
                 Enable protocol filter. The filter is based on seccomp and
                 checks the first argument to socket system call.
                 Recognized values: unix, inet, inet6, netlink, packet and
                 bluetooth.

          seccomp
                 Enable seccomp filter and deny the syscalls in the default
                 list. See man 1 firejail for more details.

          seccomp.32
                 Enable seccomp filter and deny the syscalls in the default
                 list for 32 bit system calls on a 64 bit architecture
                 system.

          seccomp syscall,syscall,syscall
                 Enable seccomp filter and deny the system calls in the
                 list on top of default seccomp filter.

          seccomp.32 syscall,syscall,syscall
                 Enable seccomp filter and deny the system calls in the
                 list on top of default seccomp filter for 32 bit system
                 calls on a 64 bit architecture system.

          seccomp.block-secondary
                 Enable seccomp filter and filter system call architectures
                 so that only the native architecture is allowed.

          seccomp.drop syscall,syscall,syscall
                 Enable seccomp filter and deny the system calls in the
                 list.

          seccomp.32.drop syscall,syscall,syscall
                 Enable seccomp filter and deny the system calls in the
                 list for 32 bit system calls on a 64 bit architecture
                 system.

          seccomp.keep syscall,syscall,syscall
                 Enable seccomp filter and allow the system calls in the
                 list.

          seccomp.32.keep syscall,syscall,syscall
                 Enable seccomp filter and allow the system calls in the
                 list for 32 bit system calls on a 64 bit architecture
                 system.

          seccomp-error-action kill | log | ERRNO
                 Return a different error instead of EPERM to the process,
                 kill it when an attempt is made to call a blocked system
                 call, or allow but log the attempt.

          x11    Enable X11 sandboxing.

          x11 none
                 Deny access to /tmp/.X11-unix directory,
                 ${HOME}/.Xauthority and file specified in ${XAUTHORITY}
                 environment variable.  Remove DISPLAY and XAUTHORITY
                 environment variables.  Stop with error message if X11
                 abstract socket will be accessible in jail.

          x11 xephyr
                 Enable X11 sandboxing with Xephyr server.

          x11 xorg
                 Enable X11 sandboxing with X11 security extension.

          x11 xpra
                 Enable X11 sandboxing with Xpra server.

          x11 xvfb
                 Enable X11 sandboxing with Xvfb server.

          xephyr-screen WIDTHxHEIGHT
                 Set screen size for x11 xephyr. This command should be
                 included in the profile file before x11 xephyr command.

                 Example:

                 xephyr-screen 640x480
                 x11 xephyr


---------------------------------------------------------------------

::

          Access to the session and system DBus UNIX sockets can be
          allowed, filtered or disabled. To disable the abstract sockets
          (and force applications to use the filtered UNIX socket) you
          would need to request a new network namespace using --net
          command. Another option is to remove unix from the --protocol
          set.

          Filtering requires installing the xdg-dbus-proxy utility. Filter
          rules can be specified for well-known DBus names, but they are
          also propagated to the owning unique name, too. The permissions
          are "sticky" and are kept even if the corresponding well-known
          name is released (however, applications rarely release well-known
          names in practice). Names may have a .* suffix to match all names
          underneath them, including themselves (e.g. "foo.bar.*" matches
          "foo.bar", "foo.bar.baz" and "foo.bar.baz.quux", but not
          "foobar"). For more information, see xdg-dbus-proxy(1).

          Examples:

          dbus-system filter
                 Enable filtered access to the system DBus. Filters can be
                 specified with the dbus-system.talk and dbus-system.own
                 commands.

          dbus-system none
                 Disable access to the system DBus. Once access is
                 disabled, it cannot be relaxed to filtering.

          dbus-system.own org.gnome.ghex.*
                 Allow the application to own the name org.gnome.ghex and
                 all names underneath in on the system DBus.

          dbus-system.talk org.freedesktop.Notifications
                 Allow the application to talk to the name
                 org.freedesktop.Notifications on the system DBus.

          dbus-system.see org.freedesktop.Notifications
                 Allow the application to see but not talk to the name
                 org.freedesktop.Notifications on the system DBus.

          dbus-system.call
          org.freedesktop.Notifications=org.freedesktop.Notifications.*@/org/freedesktop/Notifications
                 Allow the application to call methods of the interface
                 org.freedesktop.Notifications of the object exposed at the
                 path /org/freedesktop/Notifications by the client owning
                 the bus name org.freedesktop.Notifications on the system
                 DBus.

          dbus-system.broadcast
          org.freedesktop.Notifications=org.freedesktop.Notifications.*@/org/freedesktop/Notifications
                 Allow the application to receive broadcast signals from
                 the the interface org.freedesktop.Notifications of the
                 object exposed at the path /org/freedesktop/Notifications
                 by the client owning the bus name
                 org.freedesktop.Notifications on the system DBus.

          dbus-user filter
                 Enable filtered access to the session DBus. Filters can be
                 specified with the dbus-user.talk and dbus-user.own
                 commands.

          dbus-user none
                 Disable access to the session DBus. Once access is
                 disabled, it cannot be relaxed to filtering.

          dbus-user.own org.gnome.ghex.*
                 Allow the application to own the name org.gnome.ghex and
                 all names underneath in on the session DBus.

          dbus-user.talk org.freedesktop.Notifications
                 Allow the application to talk to the name
                 org.freedesktop.Notifications on the session DBus.

          dbus-user.see org.freedesktop.Notifications
                 Allow the application to see but not talk to the name
                 org.freedesktop.Notifications on the session DBus.

          dbus-user.call
          org.freedesktop.Notifications=org.freedesktop.Notifications.*@/org/freedesktop/Notifications
                 Allow the application to call methods of the interface
                 org.freedesktop.Notifications of the object exposed at the
                 path /org/freedesktop/Notifications by the client owning
                 the bus name org.freedesktop.Notifications on the session
                 DBus.

          dbus-user.broadcast
          org.freedesktop.Notifications=org.freedesktop.Notifications.*@/org/freedesktop/Notifications
                 Allow the application to receive broadcast signals from
                 the the interface org.freedesktop.Notifications of the
                 object exposed at the path /org/freedesktop/Notifications
                 by the client owning the bus name
                 org.freedesktop.Notifications on the session DBus.

          nodbus (deprecated)
                 Disable D-Bus access (both system and session buses).
                 Equivalent to dbus-system none and dbus-user none.

          Individual filters can be overridden via the --ignore command.
          Supposing a profile has
                 [...]
                 dbus-user filter
                 dbus-user.own org.mozilla.firefox.*
                 dbus-user.talk org.freedesktop.Notifications
                 dbus-system none
                 [...]

                 and the user wants to disable notifications, this can be
                 achieved by putting the below in a local override file:
                 [...]
                 ignore dbus-user.talk org.freedesktop.Notifications
                 [...]


-----------------------------------------------------------------------------------------------------------------------------------

::

          These profile entries define the limits on system resources
          (rlimits) for the processes inside the sandbox.  The limits can
          be modified inside the sandbox using the regular ulimit command.
          cpu command configures the CPU cores available, and cgroup
          command place the sandbox in an existing control group.

          Examples:

          cgroup /sys/fs/cgroup/g1/tasks
                 The sandbox is placed in g1 control group.

          cpu 0,1,2
                 Use only CPU cores 0, 1 and 2.

          nice -5
                 Set a nice value of -5 to all processes running inside the
                 sandbox.

          rlimit-as 123456789012
                 Set the maximum size of the process's virtual memory to
                 123456789012 bytes.

          rlimit-cpu 123
                 Set the maximum CPU time in seconds.

          rlimit-fsize 1024
                 Set the maximum file size that can be created by a process
                 to 1024 bytes.

          rlimit-nproc 1000
                 Set the maximum number of processes that can be created
                 for the real user ID of the calling process to 1000.

          rlimit-nofile 500
                 Set the maximum number of files that can be opened by a
                 process to 500.

          rlimit-sigpending 200
                 Set the maximum number of processes that can be created
                 for the real user ID of the calling process to 200.

          timeout hh:mm:ss
                 Kill the sandbox automatically after the time has elapsed.
                 The time is specified in hours/minutes/seconds format.


-------------------------------------------------------------------------

::

          allusers
                 All user home directories are visible inside the sandbox.
                 By default, only current user home directory is visible.

          env name=value
                 Set environment variable. Examples:

                 env LD_LIBRARY_PATH=/opt/test/lib
                 env CFLAGS="-W -Wall -Werror"

          ipc-namespace
                 Enable IPC namespace.

          name sandboxname
                 Set sandbox name. Example:

                 name browser

          no3d   Disable 3D hardware acceleration.

          noautopulse (deprecated)
                 See keep-config-pulse.

          nodvd  Disable DVD and audio CD devices.

          nogroups
                 Disable supplementary user groups

          noinput
                 Disable input devices.

          nosound
                 Disable sound system.

          notv   Disable DVB (Digital Video Broadcasting) TV devices.

          nou2f  Disable U2F devices.

          novideo
                 Disable video capture devices.

          machine-id
                 Spoof id number in /etc/machine-id file - a new random id
                 is generated inside the sandbox.

          shell none
                 Run the program directly, without a shell.


-------------------------------------------------------------

::

          Networking features available in profile files.

          defaultgw address
                 Use this address as default gateway in the new network
                 namespace.

          dns address
                 Set a DNS server for the sandbox. Up to three DNS servers
                 can be defined.

          hostname name
                 Set a hostname for the sandbox.

          hosts-file file
                 Use file as /etc/hosts.

          ip address
                 Assign IP addresses to the last network interface defined
                 by a net command. A default gateway is assigned by
                 default.

                 Example:
                 net eth0
                 ip 10.10.20.56

          ip none
                 No IP address and no default gateway are configured for
                 the last interface defined by a net command. Use this
                 option in case you intend to start an external DHCP client
                 in the sandbox.

                 Example:
                 net eth0
                 ip none

          ip dhcp
                 Acquire an IP address and default gateway for the last
                 interface defined by a net command, as well as set the DNS
                 servers according to the DHCP response.  This command
                 requires the ISC dhclient DHCP client to be installed and
                 will start it automatically inside the sandbox.

                 Example:
                 net br0
                 ip dhcp

                 This command should not be used in conjunction with the
                 dns command if the DHCP server is set to configure DNS
                 servers for the clients, because the manually specified
                 DNS servers will be overwritten.

                 The DHCP client will NOT release the DHCP lease when the
                 sandbox terminates.  If your DHCP server requires leases
                 to be explicitly released, consider running a DHCP client
                 and releasing the lease manually in conjunction with the
                 net none command.

          ip6 address
                 Assign IPv6 addresses to the last network interface
                 defined by a net command.

                 Example:
                 net eth0
                 ip6 2001:0db8:0:f101::1/64

          ip6 dhcp
                 Acquire an IPv6 address and default gateway for the last
                 interface defined by a net command, as well as set the DNS
                 servers according to the DHCP response.  This command
                 requires the ISC dhclient DHCP client to be installed and
                 will start it automatically inside the sandbox.

                 Example:
                 net br0
                 ip6 dhcp

                 This command should not be used in conjunction with the
                 dns command if the DHCP server is set to configure DNS
                 servers for the clients, because the manually specified
                 DNS servers will be overwritten.

                 The DHCP client will NOT release the DHCP lease when the
                 sandbox terminates.  If your DHCP server requires leases
                 to be explicitly released, consider running a DHCP client
                 and releasing the lease manually.

          iprange address,address
                 Assign  an  IP address in the provided range to the last
                 network interface defined by  a  net command.  A  default
                 gateway  is assigned by default.

                 Example:

                 net eth0
                 iprange 192.168.1.150,192.168.1.160

          mac address
                 Assign MAC addresses to the last network interface defined
                 by a net command.

          mtu number
                 Assign a MTU value to the last network interface defined
                 by a net command.

          net bridge_interface
                 Enable a new network namespace and connect it to this
                 bridge interface.  Unless specified with option --ip and
                 --defaultgw, an IP address and a default gateway will be
                 assigned automatically to the sandbox. The IP address is
                 verified using ARP before assignment. The address
                 configured as default gateway is the bridge device IP
                 address. Up to four --net bridge devices can be defined.
                 Mixing bridge and macvlan devices is allowed.

          net ethernet_interface|wireless_interface
                 Enable a new network namespace and connect it to this
                 ethernet interface using the standard Linux macvlan or
                 ipvlan driver. Unless specified with option --ip and
                 --defaultgw, an IP address and a default gateway will be
                 assigned automatically to the sandbox. The IP address is
                 verified using ARP before assignment. The address
                 configured as default gateway is the default gateway of
                 the host. Up to four --net devices can be defined. Mixing
                 bridge and macvlan devices is allowed.

          net none
                 Enable a new, unconnected network namespace. The only
                 interface available in the new namespace is a new loopback
                 interface (lo).  Use this option to deny network access to
                 programs that don't really need network access.

          net tap_interface
                 Enable a new network namespace and connect it to this
                 ethernet tap interface using the standard Linux macvlan
                 driver.  If the tap interface is not configured, the
                 sandbox will not try to configure the interface inside the
                 sandbox.  Please use ip, netmask and defaultgw to specify
                 the configuration.

          netfilter
                 If a new network namespace is created, enabled default
                 network filter.

          netfilter filename
                 If a new network namespace is created, enabled the network
                 filter in filename.

          netmask address
                 Use this option when you want to assign an IP address in a
                 new namespace and the parent interface specified by --net
                 is not configured. An IP address and a default gateway
                 address also have to be added.

          netns namespace
                 Run the program in a named, persistent network namespace.
                 These can be created and configured using "ip netns".

          veth-name name
                 Use this name for the interface connected to the bridge
                 for --net=bridge_interface commands, instead of the
                 default one.


---------------------------------------------------

::

          deterministic-exit-code
                 Always exit firejail with the first child's exit status.
                 The default behavior is to use the exit status of the
                 final child to exit, which can be nondeterministic.

          join-or-start sandboxname
                 Join the sandbox identified by name or start a new one.
                 Same as "firejail --join=sandboxname" command if sandbox
                 with specified name exists, otherwise same as "name
                 sandboxname".


---------------------------------------------------

::

          /etc/firejail/appname.profile
                 Global Firejail configuration consisting mainly of
                 profiles for each application supported by default.

          $HOME/.config/firejail/appname.profile
                 User application profiles, will take precedence over the
                 global profiles.

          /usr/share/doc/firejail/profile.template
                 Template for building new profiles.

          /usr/share/doc/firejail/redirect_alias-profile.template
                 Template for aliasing/redirecting profiles.


-------------------------------------------------------

::

          Firejail is free software; you can redistribute it and/or modify
          it under the terms of the GNU General Public License as published
          by the Free Software Foundation; either version 2 of the License,
          or (at your option) any later version.

          Homepage: https://firejail.wordpress.com


---------------------------------------------------------

::

          firejail(1), firemon(1), firecfg(1), firejail-login(5),
          firejail-users(5), jailcheck(1)

          ⟨https://github.com/netblue30/firejail/wiki/Creating-Profiles⟩

COLOPHON
---------------------------------------------------------

::

          This page is part of the Firejail (Firejail security sandbox)
          project.  Information about the project can be found at 
          ⟨https://firejail.wordpress.com⟩.  If you have a bug report for
          this manual page, see ⟨https://firejail.wordpress.com/support/⟩.
          This page was obtained from the project's upstream Git repository
          ⟨https://github.com/netblue30/firejail.git⟩ on 2021-08-27.  (At
          that time, the date of the most recent commit that was found in
          the repository was 2021-08-16.)  If you discover any rendering
          problems in this HTML version of the page, or you believe there
          is a better or more up-to-date source for the page, or you have
          corrections or improvements to the information in this COLOPHON
          (which is not part of the original manual page), send a mail to
          man-pages@man7.org

   0.9.67                          Aug 2021             FIREJAIL-PROFILE(5)

--------------

Pages that refer to this page: `firecfg(1) <../man1/firecfg.1.html>`__, 
`firejail(1) <../man1/firejail.1.html>`__, 
`firemon(1) <../man1/firemon.1.html>`__, 
`jailcheck(1) <../man1/jailcheck.1.html>`__, 
`tput(1) <../man1/tput.1.html>`__, 
`firejail-login(5) <../man5/firejail-login.5.html>`__, 
`firejail-users(5) <../man5/firejail-users.5.html>`__, 
`jailtest(5) <../man5/jailtest.5.html>`__

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
