.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

pgrep(1) — Linux manual page
============================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `OPTIONS <#OPTIONS>`__ \|         |                                   |
| `OPERANDS <#OPERANDS>`__ \|       |                                   |
| `EXAMPLES <#EXAMPLES>`__ \|       |                                   |
| `EXIT STATUS <#EXIT_STATUS>`__ \| |                                   |
| `NOTES <#NOTES>`__ \|             |                                   |
| `BUGS <#BUGS>`__ \|               |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `AUTHOR <#AUTHOR>`__ \|           |                                   |
| `RE                               |                                   |
| PORTING BUGS <#REPORTING_BUGS>`__ |                                   |
| \| `COLOPHON <#COLOPHON>`__       |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   PGREP(1)                      User Commands                     PGREP(1)

NAME
-------------------------------------------------

::

          pgrep, pkill, pidwait - look up, signal, or wait for processes
          based on name and other attributes


---------------------------------------------------------

::

          pgrep [options] pattern
          pkill [options] pattern
          pidwait [options] pattern


---------------------------------------------------------------

::

          pgrep looks through the currently running processes and lists the
          process IDs which match the selection criteria to stdout.  All
          the criteria have to match.  For example,

                 $ pgrep -u root sshd

          will only list the processes called sshd AND owned by root.  On
          the other hand,

                 $ pgrep -u root,daemon

          will list the processes owned by root OR daemon.

          pkill will send the specified signal (by default SIGTERM) to each
          process instead of listing them on stdout.

          pidwait will wait for each process instead of listing them on
          stdout.


-------------------------------------------------------

::

          -signal
          --signal signal
                 Defines the signal to send to each matched process.
                 Either the numeric or the symbolic signal name can be
                 used.  (pkill only.)

          -c, --count
                 Suppress normal output; instead print a count of matching
                 processes.  When count does not match anything, e.g.
                 returns zero, the command will return non-zero value. Note
                 that for pkill and pidwait, the count is the number of
                 matching processes, not the processes that were
                 successfully signaled or waited for.

          -d, --delimiter delimiter
                 Sets the string used to delimit each process ID in the
                 output (by default a newline).  (pgrep only.)

          -e, --echo
                 Display name and PID of the process being killed.  (pkill
                 only.)

          -f, --full
                 The pattern is normally only matched against the process
                 name.  When -f is set, the full command line is used.

          -g, --pgroup pgrp,...
                 Only match processes in the process group IDs listed.
                 Process group 0 is translated into pgrep's, pkill's, or
                 pidwait's own process group.

          -G, --group gid,...
                 Only match processes whose real group ID is listed.
                 Either the numerical or symbolical value may be used.

          -i, --ignore-case
                 Match processes case-insensitively.

          -l, --list-name
                 List the process name as well as the process ID.  (pgrep
                 only.)

          -a, --list-full
                 List the full command line as well as the process ID.
                 (pgrep only.)

          -n, --newest
                 Select only the newest (most recently started) of the
                 matching processes.

          -o, --oldest
                 Select only the oldest (least recently started) of the
                 matching processes.

          -O, --older secs
                 Select processes older than secs.

          -P, --parent ppid,...
                 Only match processes whose parent process ID is listed.

          -s, --session sid,...
                 Only match processes whose process session ID is listed.
                 Session ID 0 is translated into pgrep's, pkill's, or
                 pidwait's own session ID.

          -t, --terminal term,...
                 Only match processes whose controlling terminal is listed.
                 The terminal name should be specified without the "/dev/"
                 prefix.

          -u, --euid euid,...
                 Only match processes whose effective user ID is listed.
                 Either the numerical or symbolical value may be used.

          -U, --uid uid,...
                 Only match processes whose real user ID is listed.  Either
                 the numerical or symbolical value may be used.

          -v, --inverse
                 Negates the matching.  This option is usually used in
                 pgrep's or pidwait's context.  In pkill's context the
                 short option is disabled to avoid accidental usage of the
                 option.

          -w, --lightweight
                 Shows all thread ids instead of pids in pgrep's or
                 pidwait's context.  In pkill's context this option is
                 disabled.

          -x, --exact
                 Only match processes whose names (or command lines if -f
                 is specified) exactly match the pattern.

          -F, --pidfile file
                 Read PIDs from file.  This option is more useful for
                 pkillorpidwait than pgrep.

          -L, --logpidfile
                 Fail if pidfile (see -F) not locked.

          -r, --runstates D,R,S,Z,...
                 Match only processes which match the process state.

          --ns pid
                 Match processes that belong to the same namespaces.
                 Required to run as root to match processes from other
                 users. See --nslist for how to limit which namespaces to
                 match.

          --nslist name,...
                 Match only the provided namespaces. Available namespaces:
                 ipc, mnt, net, pid, user,uts.

          -q, --queue value
                 Use sigqueue(3) rather than kill(2) and the value argument
                 is used to specify an integer to be sent with the signal.
                 If the receiving process has installed a handler for this
                 signal using the SA_SIGINFO flag to sigaction(2) , then it
                 can obtain this data via the si_value field of the
                 siginfo_t structure.

          -V, --version
                 Display version information and exit.

          -h, --help
                 Display help and exit.


---------------------------------------------------------

::

          pattern
                 Specifies an Extended Regular Expression for matching
                 against the process names or command lines.


---------------------------------------------------------

::

          Example 1: Find the process ID of the named daemon:

                 $ pgrep -u root named

          Example 2: Make syslog reread its configuration file:

                 $ pkill -HUP syslogd

          Example 3: Give detailed information on all xterm processes:

                 $ ps -fp $(pgrep -d, -x xterm)

          Example 4: Make all chrome processes run nicer:

                 $ renice +4 $(pgrep chrome)


---------------------------------------------------------------

::

          0      One or more processes matched the criteria. For pkill and
                 pidwait, one or more processes must also have been
                 successfully signalled or waited for.
          1      No processes matched or none of them could be signalled.
          2      Syntax error in the command line.
          3      Fatal error: out of memory etc.


---------------------------------------------------

::

          The process name used for matching is limited to the 15
          characters present in the output of /proc/pid/stat.  Use the -f
          option to match against the complete command line,
          /proc/pid/cmdline.

          The running pgrep, pkill, or pidwait process will never report
          itself as a match.


-------------------------------------------------

::

          The options -n and -o and -v can not be combined.  Let me know if
          you need to do this.

          Defunct processes are reported.


---------------------------------------------------------

::

          ps(1), regex(7), signal(7), sigqueue(3), killall(1), skill(1),
          kill(1), kill(2)


-----------------------------------------------------

::

          Kjetil Torgrim Homme ⟨kjetilho@ifi.uio.no⟩


---------------------------------------------------------------------

::

          Please send bug reports to ⟨procps@freelists.org⟩

COLOPHON
---------------------------------------------------------

::

          This page is part of the procps-ng (/proc filesystem utilities)
          project.  Information about the project can be found at 
          ⟨https://gitlab.com/procps-ng/procps⟩.  If you have a bug report
          for this manual page, see
          ⟨https://gitlab.com/procps-ng/procps/blob/master/Documentation/bugs.md⟩.
          This page was obtained from the project's upstream Git repository
          ⟨https://gitlab.com/procps-ng/procps.git⟩ on 2021-08-27.  (At
          that time, the date of the most recent commit that was found in
          the repository was 2021-08-24.)  If you discover any rendering
          problems in this HTML version of the page, or you believe there
          is a better or more up-to-date source for the page, or you have
          corrections or improvements to the information in this COLOPHON
          (which is not part of the original manual page), send a mail to
          man-pages@man7.org

   procps-ng                      2020-06-04                       PGREP(1)

--------------

Pages that refer to this page: `fuser(1) <../man1/fuser.1.html>`__, 
`kill(1@@procps-ng) <../man1/kill.1@@procps-ng.html>`__, 
`killall(1) <../man1/killall.1.html>`__, 
`pidof(1) <../man1/pidof.1.html>`__, 
`pmap(1) <../man1/pmap.1.html>`__, 
`procps(1) <../man1/procps.1.html>`__,  `ps(1) <../man1/ps.1.html>`__, 
`pslog(1) <../man1/pslog.1.html>`__, 
`pwdx(1) <../man1/pwdx.1.html>`__,  `skill(1) <../man1/skill.1.html>`__

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
