.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

coredumpctl(1) — Linux manual page
==================================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `COMMANDS <#COMMANDS>`__ \|       |                                   |
| `OPTIONS <#OPTIONS>`__ \|         |                                   |
| `MATCHING <#MATCHING>`__ \|       |                                   |
| `EXIT STATUS <#EXIT_STATUS>`__ \| |                                   |
| `ENVIRONMENT <#ENVIRONMENT>`__ \| |                                   |
| `EXAMPLES <#EXAMPLES>`__ \|       |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   COREDUMPCTL(1)                 coredumpctl                COREDUMPCTL(1)

NAME
-------------------------------------------------

::

          coredumpctl - Retrieve and process saved core dumps and metadata


---------------------------------------------------------

::

          coredumpctl [OPTIONS...] {COMMAND} [PID|COMM|EXE|MATCH...]


---------------------------------------------------------------

::

          coredumpctl is a tool that can be used to retrieve and process
          core dumps and metadata which were saved by systemd-coredump(8).


---------------------------------------------------------

::

          The following commands are understood:

          list
              List core dumps captured in the journal matching specified
              characteristics. If no command is specified, this is the
              implied default.

              The output is designed to be human readable and contains a
              table with the following columns:

              TIME
                  The timestamp of the crash, as reported by the kernel.

              PID
                  The identifier of the process that crashed.

              UID, GID
                  The user and group identifiers of the process that
                  crashed.

              SIGNAL
                  The signal that caused the process to crash, when
                  applicable.

              COREFILE
                  Information whether the coredump was stored, and whether
                  it is still accessible: "none" means the core was not
                  stored, "-" means that it was not available (for example
                  because the process was not terminated by a signal),
                  "present" means that the core file is accessible by the
                  current user, "journal" means that the core was stored in
                  the "journal", "truncated" is the same as one of the
                  previous two, but the core was too large and was not
                  stored in its entirety, "error" means that the core file
                  cannot be accessed, most likely because of insufficient
                  permissions, and "missing" means that the core was stored
                  in a file, but this file has since been removed.

              EXE
                  The full path to the executable. For backtraces of
                  scripts this is the name of the interpreter.

              It's worth noting that different restrictions apply to data
              saved in the journal and core dump files saved in
              /var/lib/systemd/coredump, see overview in
              systemd-coredump(8). Thus it may very well happen that a
              particular core dump is still listed in the journal while its
              corresponding core dump file has already been removed.

          info
              Show detailed information about the last core dump or core
              dumps matching specified characteristics captured in the
              journal.

          dump
              Extract the last core dump matching specified
              characteristics. The core dump will be written on standard
              output, unless an output file is specified with --output=.

          debug
              Invoke a debugger on the last core dump matching specified
              characteristics. By default, gdb(1) will be used. This may be
              changed using the --debugger= option or the $SYSTEMD_DEBUGGER
              environment variable. Use the --debugger-arguments= option to
              pass extra command line arguments to the debugger.


-------------------------------------------------------

::

          The following options are understood:

          -h, --help
              Print a short help text and exit.

          --version
              Print a short version string and exit.

          --no-pager
              Do not pipe output into a pager.

          --no-legend
              Do not print the legend, i.e. column headers and the footer
              with hints.

          --json=MODE
              Shows output formatted as JSON. Expects one of "short" (for
              the shortest possible output without any redundant whitespace
              or line breaks), "pretty" (for a pretty version of the same,
              with indentation and line breaks) or "off" (to turn off JSON
              output, the default).

          -1
              Show information of the most recent core dump only, instead
              of listing all known core dumps. Equivalent to --reverse -n
              1.

          -n INT
              Show at most the specified number of entries. The specified
              parameter must be an integer greater or equal to 1.

          -S, --since
              Only print entries which are since the specified date.

          -U, --until
              Only print entries which are until the specified date.

          -r, --reverse
              Reverse output so that the newest entries are displayed
              first.

          -F FIELD, --field=FIELD
              Print all possible data values the specified field takes in
              matching core dump entries of the journal.

          -o FILE, --output=FILE
              Write the core to FILE.

          --debugger=DEBUGGER
              Use the given debugger for the debug command. If not given
              and $SYSTEMD_DEBUGGER is unset, then gdb(1) will be used.

          -A ARGS, --debugger-arguments=ARGS
              Pass the given ARGS as extra command line arguments to the
              debugger. Quote as appropriate when ARGS contain whitespace.
              (See Examples.)

          --file=GLOB
              Takes a file glob as an argument. If specified, coredumpctl
              will operate on the specified journal files matching GLOB
              instead of the default runtime and system journal paths. May
              be specified multiple times, in which case files will be
              suitably interleaved.

          -D DIR, --directory=DIR
              Use the journal files in the specified DIR.

          -q, --quiet
              Suppresses informational messages about lack of access to
              journal files and possible in-flight coredumps.


---------------------------------------------------------

::

          A match can be:

          PID
              Process ID of the process that dumped core. An integer.

          COMM
              Name of the executable (matches COREDUMP_COMM=). Must not
              contain slashes.

          EXE
              Path to the executable (matches COREDUMP_EXE=). Must contain
              at least one slash.

          MATCH
              General journalctl match filter, must contain an equals sign
              ("="). See journalctl(1).


---------------------------------------------------------------

::

          On success, 0 is returned; otherwise, a non-zero failure code is
          returned. Not finding any matching core dumps is treated as
          failure.


---------------------------------------------------------------

::

          $SYSTEMD_DEBUGGER
              Use the given debugger for the debug command. See the
              --debugger= option.


---------------------------------------------------------

::

          Example 1. List all the core dumps of a program

              $ coredumpctl list /usr/lib64/firefox/firefox
              TIME     PID  UID  GID SIG     COREFILE EXE                         SIZE
              Tue ...   8018 1000 1000 SIGSEGV missing  /usr/lib64/firefox/firefox   n/a
              Wed ... 251609 1000 1000 SIGTRAP missing  /usr/lib64/firefox/firefox   n/a
              Fri ... 552351 1000 1000 SIGSEGV present  /usr/lib64/firefox/firefox 28.7M

          The journal has three entries pertaining to
          /usr/lib64/firefox/firefox, and only the last entry still has an
          available core file (in external storage on disk).

          Note that coredumpctl needs access to the journal files to
          retrieve the relevant entries from the journal. Thus, an
          unprivileged user will normally only see information about
          crashing programs of this user.

          Example 2. Invoke gdb on the last core dump

              $ coredumpctl debug

          Example 3. Use gdb to display full register info from the last
          core dump

              $ coredumpctl debug --debugger-arguments="-batch -ex 'info all-registers'"

          Example 4. Show information about a core dump matched by PID

              $ coredumpctl info 6654
                         PID: 6654 (bash)
                         UID: 1000 (user)
                         GID: 1000 (user)
                      Signal: 11 (SEGV)
                   Timestamp: Mon 2021-01-01 00:00:01 CET (20s ago)
                Command Line: bash -c $'kill -SEGV $$'
                  Executable: /usr/bin/bash
               Control Group: /user.slice/user-1000.slice/...
                        Unit: user@1000.service
                   User Unit: vte-spawn-....scope
                       Slice: user-1000.slice
                   Owner UID: 1000 (user)
                     Boot ID: ...
                  Machine ID: ...
                    Hostname: ...
                     Storage: /var/lib/systemd/coredump/core.bash.1000.....zst (present)
                   Disk Size: 51.7K
                     Message: Process 130414 (bash) of user 1000 dumped core.

                              Stack trace of thread 130414:
                              #0  0x00007f398142358b kill (libc.so.6 + 0x3d58b)
                              #1  0x0000558c2c7fda09 kill_builtin (bash + 0xb1a09)
                              #2  0x0000558c2c79dc59 execute_builtin.lto_priv.0 (bash + 0x51c59)
                              #3  0x0000558c2c79709c execute_simple_command (bash + 0x4b09c)
                              #4  0x0000558c2c798408 execute_command_internal (bash + 0x4c408)
                              #5  0x0000558c2c7f6bdc parse_and_execute (bash + 0xaabdc)
                              #6  0x0000558c2c85415c run_one_command.isra.0 (bash + 0x10815c)
                              #7  0x0000558c2c77d040 main (bash + 0x31040)
                              #8  0x00007f398140db75 __libc_start_main (libc.so.6 + 0x27b75)
                              #9  0x0000558c2c77dd1e _start (bash + 0x31d1e)

          Example 5. Extract the last core dump of /usr/bin/bar to a file
          named bar.coredump

              $ coredumpctl -o bar.coredump dump /usr/bin/bar


---------------------------------------------------------

::

          systemd-coredump(8), coredump.conf(5),
          systemd-journald.service(8), gdb(1)

COLOPHON
---------------------------------------------------------

::

          This page is part of the systemd (systemd system and service
          manager) project.  Information about the project can be found at
          ⟨http://www.freedesktop.org/wiki/Software/systemd⟩.  If you have
          a bug report for this manual page, see
          ⟨http://www.freedesktop.org/wiki/Software/systemd/#bugreports⟩.
          This page was obtained from the project's upstream Git repository
          ⟨https://github.com/systemd/systemd.git⟩ on 2021-08-27.  (At that
          time, the date of the most recent commit that was found in the
          repository was 2021-08-27.)  If you discover any rendering
          problems in this HTML version of the page, or you believe there
          is a better or more up-to-date source for the page, or you have
          corrections or improvements to the information in this COLOPHON
          (which is not part of the original manual page), send a mail to
          man-pages@man7.org

   systemd 249                                               COREDUMPCTL(1)

--------------

Pages that refer to this page:
`journalctl(1) <../man1/journalctl.1.html>`__, 
`core(5) <../man5/core.5.html>`__, 
`coredump.conf(5) <../man5/coredump.conf.5.html>`__, 
`systemd.journal-fields(7) <../man7/systemd.journal-fields.7.html>`__, 
`systemd-coredump(8) <../man8/systemd-coredump.8.html>`__

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
