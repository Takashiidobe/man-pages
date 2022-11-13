.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

`Go to the version of this page provided by the util-linux
project <fsck.8.html>`__

--------------

fsck(8) — Linux manual page
===========================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `OPTIONS <#OPTIONS>`__ \|         |                                   |
| `AUTHOR <#AUTHOR>`__ \|           |                                   |
| `FILES <#FILES>`__ \|             |                                   |
| `ENVIRONMENT VARI                 |                                   |
| ABLES <#ENVIRONMENT_VARIABLES>`__ |                                   |
| \| `SEE ALSO <#SEE_ALSO>`__ \|    |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   FSCK(8)                  System Manager's Manual                 FSCK(8)

NAME
-------------------------------------------------

::

          fsck - check and repair a Linux file system


---------------------------------------------------------

::

          fsck [ -sAVRTMNP ] [ -C [ fd ] ] [ -t fstype ] [filesys ... ]
          [--] [ fs-specific-options ]


---------------------------------------------------------------

::

          fsck is used to check and optionally repair one or more Linux
          file systems.  filesys can be a device name (e.g.  /dev/hdc1,
          /dev/sdb2), a mount point (e.g.  /, /usr, /home), or an ext2
          label or UUID specifier (e.g.
          UUID=8868abf6-88c5-4a83-98b8-bfc24057f7bd or LABEL=root).
          Normally, the fsck program will try to handle file systems on
          different physical disk drives in parallel to reduce the total
          amount of time needed to check all of the file systems.

          If no file systems are specified on the command line, and the -A
          option is not specified, fsck will default to checking file
          systems in /etc/fstab serially.  This is equivalent to the -As
          options.

          The exit code returned by fsck is the sum of the following
          conditions:
               0    - No errors
               1    - File system errors corrected
               2    - System should be rebooted
               4    - File system errors left uncorrected
               8    - Operational error
               16   - Usage or syntax error
               32   - Fsck canceled by user request
               128  - Shared library error
          The exit code returned when multiple file systems are checked is
          the bit-wise OR of the exit codes for each file system that is
          checked.

          In actuality, fsck is simply a front-end for the various file
          system checkers (fsck.fstype) available under Linux.  The file
          system-specific checker is searched for in /sbin first, then in
          /etc/fs and /etc, and finally in the directories listed in the
          PATH environment variable.  Please see the file system-specific
          checker manual pages for further details.


-------------------------------------------------------

::

          -s     Serialize fsck operations.  This is a good idea if you are
                 checking multiple file systems and the checkers are in an
                 interactive mode.  (Note: e2fsck(8) runs in an interactive
                 mode by default.  To make e2fsck(8) run in a non-
                 interactive mode, you must either specify the -p or -a
                 option, if you wish for errors to be corrected
                 automatically, or the -n option if you do not.)

          -t fslist
                 Specifies the type(s) of file system to be checked.  When
                 the -A flag is specified, only file systems that match
                 fslist are checked.  The fslist parameter is a comma-
                 separated list of file systems and options specifiers.
                 All of the file systems in this comma-separated list may
                 be prefixed by a negation operator 'no' or '!', which
                 requests that only those file systems not listed in fslist
                 will be checked.  If all of the file systems in fslist are
                 not prefixed by a negation operator, then only those file
                 systems listed in fslist will be checked.

                 Options specifiers may be included in the comma-separated
                 fslist.  They must have the format opts=fs-option.  If an
                 options specifier is present, then only file systems which
                 contain fs-option in their mount options field of
                 /etc/fstab will be checked.  If the options specifier is
                 prefixed by a negation operator, then only those file
                 systems that do not have fs-option in their mount options
                 field of /etc/fstab will be checked.

                 For example, if opts=ro appears in fslist, then only file
                 systems listed in /etc/fstab with the ro option will be
                 checked.

                 For compatibility with Mandrake distributions whose boot
                 scripts depend upon an unauthorized UI change to the fsck
                 program, if a file system type of loop is found in fslist,
                 it is treated as if opts=loop were specified as an
                 argument to the -t option.

                 Normally, the file system type is deduced by searching for
                 filesys in the /etc/fstab file and using the corresponding
                 entry.  If the type can not be deduced, and there is only
                 a single file system given as an argument to the -t
                 option, fsck will use the specified file system type.  If
                 this type is not available, then the default file system
                 type (currently ext2) is used.

          -A     Walk through the /etc/fstab file and try to check all file
                 systems in one run.  This option is typically used from
                 the /etc/rc system initialization file, instead of
                 multiple commands for checking a single file system.

                 The root file system will be checked first unless the -P
                 option is specified (see below).  After that, file systems
                 will be checked in the order specified by the fs_passno
                 (the sixth) field in the /etc/fstab file.  File Systems
                 with a fs_passno value of 0 are skipped and are not
                 checked at all.  File Systems with a fs_passno value of
                 greater than zero will be checked in order, with file
                 systems with the lowest fs_passno number being checked
                 first.  If there are multiple file systems with the same
                 pass number, fsck will attempt to check them in parallel,
                 although it will avoid running multiple file system checks
                 on the same physical disk.

                 Hence, a very common configuration in /etc/fstab files is
                 to set the root file system to have a fs_passno value of 1
                 and to set all other file systems to have a fs_passno
                 value of 2.  This will allow fsck to automatically run
                 file system checkers in parallel if it is advantageous to
                 do so.  System administrators might choose not to use this
                 configuration if they need to avoid multiple file system
                 checks running in parallel for some reason --- for
                 example, if the machine in question is short on memory so
                 that excessive paging is a concern.

          -C [  fd  ]
                 Display completion/progress bars for those file system
                 checkers (currently only for ext2 and ext3) which support
                 them.   Fsck will manage the file system checkers so that
                 only one of them will display a progress bar at a time.
                 GUI front-ends may specify a file descriptor fd, in which
                 case the progress bar information will be sent to that
                 file descriptor.

          -M     Do not check mounted file systems and return an exit code
                 of 0 for mounted file systems.

          -N     Don't execute, just show what would be done.

          -P     When the -A flag is set, check the root file system in
                 parallel with the other file systems.  This is not the
                 safest thing in the world to do, since if the root file
                 system is in doubt things like the e2fsck(8) executable
                 might be corrupted!  This option is mainly provided for
                 those sysadmins who don't want to repartition the root
                 file system to be small and compact (which is really the
                 right solution).

          -R     When checking all file systems with the -A flag, skip the
                 root file system (in case it's already mounted read-
                 write).

          -T     Don't show the title on startup.

          -V     Produce verbose output, including all file system-specific
                 commands that are executed.

          fs-specific-options
                 Options which are not understood by fsck are passed to the
                 file system-specific checker.  These arguments must not
                 take arguments, as there is no way for fsck to be able to
                 properly guess which arguments take options and which
                 don't.

                 Options and arguments which follow the -- are treated as
                 file system-specific options to be passed to the file
                 system-specific checker.

                 Please note that fsck is not designed to pass arbitrarily
                 complicated options to file system-specific checkers.  If
                 you're doing something complicated, please just execute
                 the file system-specific checker directly.  If you pass
                 fsck some horribly complicated option and arguments, and
                 it doesn't do what you expect, don't bother reporting it
                 as a bug.  You're almost certainly doing something that
                 you shouldn't be doing with fsck.

          Options to different file system-specific fsck's are not
          standardized.  If in doubt, please consult the man pages of the
          file system-specific checker.  Although not guaranteed, the
          following options are supported by most file system checkers:

          -a     Automatically repair the file system without any questions
                 (use this option with caution).  Note that e2fsck(8)
                 supports -a for backwards compatibility only.  This option
                 is mapped to e2fsck's -p option which is safe to use,
                 unlike the -a option that some file system checkers
                 support.

          -n     For some file system-specific checkers, the -n option will
                 cause the fs-specific fsck to avoid attempting to repair
                 any problems, but simply report such problems to stdout.
                 This is however not true for all file system-specific
                 checkers.  In particular, fsck.reiserfs(8) will not report
                 any corruption if given this option.  fsck.minix(8) does
                 not support the -n option at all.

          -r     Interactively repair the file system (ask for
                 confirmations).  Note: It is generally a bad idea to use
                 this option if multiple fsck's are being run in parallel.
                 Also note that this is e2fsck's default behavior; it
                 supports this option for backwards compatibility reasons
                 only.

          -y     For some file system-specific checkers, the -y option will
                 cause the fs-specific fsck to always attempt to fix any
                 detected file system corruption automatically.  Sometimes
                 an expert may be able to do better driving the fsck
                 manually.  Note that not all file system-specific checkers
                 implement this option.  In particular fsck.minix(8) and
                 fsck.cramfs(8) does not support the -y option as of this
                 writing.


-----------------------------------------------------

::

          Theodore Ts'o (tytso@mit.edu)


---------------------------------------------------

::

          /etc/fstab.


-----------------------------------------------------------------------------------

::

          The fsck program's behavior is affected by the following
          environment variables:

          FSCK_FORCE_ALL_PARALLEL
                 If this environment variable is set, fsck will attempt to
                 run all of the specified file systems in parallel,
                 regardless of whether the file systems appear to be on the
                 same device.  (This is useful for RAID systems or high-end
                 storage systems such as those sold by companies such as
                 IBM or EMC.)

          FSCK_MAX_INST
                 This environment variable will limit the maximum number of
                 file system checkers that can be running at one time.
                 This allows configurations which have a large number of
                 disks to avoid fsck starting too many file system checkers
                 at once, which might overload CPU and memory resources
                 available on the system.  If this value is zero, then an
                 unlimited number of processes can be spawned.  This is
                 currently the default, but future versions of fsck may
                 attempt to automatically determine how many file system
                 checks can be run based on gathering accounting data from
                 the operating system.

          PATH   The PATH environment variable is used to find file system
                 checkers.  A set of system directories are searched first:
                 /sbin, /sbin/fs.d, /sbin/fs, /etc/fs, and /etc.  Then the
                 set of directories found in the PATH environment are
                 searched.

          FSTAB_FILE
                 This environment variable allows the system administrator
                 to override the standard location of the /etc/fstab file.
                 It is also useful for developers who are testing fsck.


---------------------------------------------------------

::

          fstab(5), mkfs(8), fsck.ext2(8) or fsck.ext3(8) or e2fsck(8),
          cramfsck(8), fsck.minix(8), fsck.msdos(8), fsck.jfs(8),
          fsck.nfs(8), fsck.vfat(8), fsck.xfs(8), fsck.xiafs(8),
          reiserfsck(8).

COLOPHON
---------------------------------------------------------

::

          This page is part of the e2fsprogs (utilities for ext2/3/4
          filesystems) project.  Information about the project can be found
          at ⟨http://e2fsprogs.sourceforge.net/⟩.  It is not known how to
          report bugs for this man page; if you know, please send a mail to
          man-pages@man7.org.  This page was obtained from the project's
          upstream Git repository
          ⟨git://git.kernel.org/pub/scm/fs/ext2/e2fsprogs.git⟩ on
          2021-08-27.  (At that time, the date of the most recent commit
          that was found in the repository was 2021-08-22.)  If you
          discover any rendering problems in this HTML version of the page,
          or you believe there is a better or more up-to-date source for
          the page, or you have corrections or improvements to the
          information in this COLOPHON (which is not part of the original
          manual page), send a mail to man-pages@man7.org

   E2fsprogs version 1.46.4       August 2021                       FSCK(8)

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
