.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

flock(1) — Linux manual page
============================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `OPTIONS <#OPTIONS>`__ \|         |                                   |
| `EXIT STATUS <#EXIT_STATUS>`__ \| |                                   |
| `EXAMPLES <#EXAMPLES>`__ \|       |                                   |
| `AUTHORS <#AUTHORS>`__ \|         |                                   |
| `COPYRIGHT <#COPYRIGHT>`__ \|     |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `RE                               |                                   |
| PORTING BUGS <#REPORTING_BUGS>`__ |                                   |
| \|                                |                                   |
| `AVAILABILITY <#AVAILABILITY>`__  |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   FLOCK(1)                      User Commands                     FLOCK(1)

NAME
-------------------------------------------------

::

          flock - manage locks from shell scripts


---------------------------------------------------------

::

          flock [options] file|directory command [arguments]

          flock [options] file|directory -c command

          flock [options] number


---------------------------------------------------------------

::

          This utility manages flock(2) locks from within shell scripts or
          from the command line.

          The first and second of the above forms wrap the lock around the
          execution of a command, in a manner similar to su(1) or
          newgrp(1). They lock a specified file or directory, which is
          created (assuming appropriate permissions) if it does not already
          exist. By default, if the lock cannot be immediately acquired,
          flock waits until the lock is available.

          The third form uses an open file by its file descriptor number.
          See the examples below for how that can be used.


-------------------------------------------------------

::

          -c, --command command
              Pass a single command, without arguments, to the shell with
              -c.

          -E, --conflict-exit-code number
              The exit status used when the -n option is in use, and the
              conflicting lock exists, or the -w option is in use, and the
              timeout is reached. The default value is 1. The number has to
              be in the range of 0 to 255.

          -F, --no-fork
              Do not fork before executing command. Upon execution the
              flock process is replaced by command which continues to hold
              the lock. This option is incompatible with --close as there
              would otherwise be nothing left to hold the lock.

          -e, -x, --exclusive
              Obtain an exclusive lock, sometimes called a write lock. This
              is the default.

          -n, --nb, --nonblock
              Fail rather than wait if the lock cannot be immediately
              acquired. See the -E option for the exit status used.

          -o, --close
              Close the file descriptor on which the lock is held before
              executing command. This is useful if command spawns a child
              process which should not be holding the lock.

          -s, --shared
              Obtain a shared lock, sometimes called a read lock.

          -u, --unlock
              Drop a lock. This is usually not required, since a lock is
              automatically dropped when the file is closed. However, it
              may be required in special cases, for example if the enclosed
              command group may have forked a background process which
              should not be holding the lock.

          -w, --wait, --timeout seconds
              Fail if the lock cannot be acquired within seconds. Decimal
              fractional values are allowed. See the -E option for the exit
              status used. The zero number of seconds is interpreted as
              --nonblock.

          --verbose
              Report how long it took to acquire the lock, or why the lock
              could not be obtained.

          -V, --version
              Display version information and exit.

          -h, --help
              Display help text and exit.


---------------------------------------------------------------

::

          The command uses <sysexits.h> exit status values for everything,
          except when using either of the options -n or -w which report a
          failure to acquire the lock with an exit status given by the -E
          option, or 1 by default. The exit status given by -E has to be in
          the range of 0 to 255.

          When using the command variant, and executing the child worked,
          then the exit status is that of the child command.


---------------------------------------------------------

::

          Note that "shell> " in examples is a command line prompt.

          shell1> flock /tmp -c cat; shell2> flock -w .007 /tmp -c echo;
          /bin/echo $?
              Set exclusive lock to directory /tmp and the second command
              will fail.

          shell1> flock -s /tmp -c cat; shell2> flock -s -w .007 /tmp -c
          echo; /bin/echo $?
              Set shared lock to directory /tmp and the second command will
              not fail. Notice that attempting to get exclusive lock with
              second command would fail.

          shell> flock -x local-lock-file echo 'a b c'
              Grab the exclusive lock "local-lock-file" before running echo
              with 'a b c'.

          (; flock -n 9 || exit 1; # ... commands executed under lock ...;
          ) 9>/var/lock/mylockfile
              The form is convenient inside shell scripts. The mode used to
              open the file doesn’t matter to flock; using > or >> allows
              the lockfile to be created if it does not already exist,
              however, write permission is required. Using < requires that
              the file already exists but only read permission is required.

              [ ${FLOCKER} != $0 ] && exec env FLOCKER="$0 flock -en $0 $0
              $@ ||
                  This is useful boilerplate code for shell scripts. Put it
                  at the top of the shell script you want to lock and it’ll
                  automatically lock itself on the first run. If the env
                  var $FLOCKER is not set to the shell script that is being
                  run, then execute flock and grab an exclusive
                  non-blocking lock (using the script itself as the lock
                  file) before re-execing itself with the right arguments.
                  It also sets the FLOCKER env var to the right value so it
                  doesn’t run again.

          shell> exec 4<>/var/lock/mylockfile; shell> flock -n 4
              This form is convenient for locking a file without spawning a
              subprocess. The shell opens the lock file for reading and
              writing as file descriptor 4, then flock is used to lock the
              descriptor.


-------------------------------------------------------

::

          H. Peter Anvin <hpa@zytor.com>


-----------------------------------------------------------

::

          Copyright © 2003-2006 H. Peter Anvin. This is free software; see
          the source for copying conditions. There is NO warranty; not even
          for MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.


---------------------------------------------------------

::

          flock(2)


---------------------------------------------------------------------

::

          For bug reports, use the issue tracker at
          https://github.com/karelzak/util-linux/issues.


-----------------------------------------------------------------

::

          The flock command is part of the util-linux package which can be
          downloaded from Linux Kernel Archive
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

   util-linux 2.37.85-637cc       2021-04-02                       FLOCK(1)

--------------

Pages that refer to this page: `flock(2) <../man2/flock.2.html>`__, 
`lslocks(8) <../man8/lslocks.8.html>`__

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
