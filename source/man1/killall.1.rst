.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

killall(1) — Linux manual page
==============================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `OPTIONS <#OPTIONS>`__ \|         |                                   |
| `FILES <#FILES>`__ \|             |                                   |
| `KNOWN BUGS <#KNOWN_BUGS>`__ \|   |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   KILLALL(1)                    User Commands                   KILLALL(1)

NAME
-------------------------------------------------

::

          killall - kill processes by name


---------------------------------------------------------

::

          killall [-Z, --context pattern] [-e, --exact]
          [-g, --process-group] [-i, --interactive] [-n, --ns PID]
          [-o, --older-than TIME] [-q, --quiet] [-r, --regexp]
          [-s, --signal SIGNAL, -SIGNAL] [-u, --user user] [-v, --verbose]
          [-w, --wait] [-y, --younger-than TIME] [-I, --ignore-case]
          [-V, --version] [--] name ...
          killall -l
          killall -V, --version


---------------------------------------------------------------

::

          killall sends a signal to all processes running any of the
          specified commands.  If no signal name is specified, SIGTERM is
          sent.

          Signals can be specified either by name (e.g.  -HUP or -SIGHUP)
          or by number (e.g.  -1) or by option -s.

          If the command name is not regular expression (option -r) and
          contains a slash (/), processes executing that particular file
          will be selected for killing, independent of their name.

          killall returns a zero return code if at least one process has
          been killed for each listed command, or no commands were listed
          and at least one process matched the -u and -Z search criteria.
          killall returns non-zero otherwise.

          A killall process never kills itself (but may kill other killall
          processes).


-------------------------------------------------------

::

          -e, --exact
                 Require an exact match for very long names.  If a command
                 name is longer than 15 characters, the full name may be
                 unavailable (i.e.  it is swapped out).  In this case,
                 killall will kill everything that matches within the first
                 15 characters.  With -e, such entries are skipped.
                 killall prints a message for each skipped entry if -v is
                 specified in addition to -e.

          -I, --ignore-case
                 Do case insensitive process name match.

          -g, --process-group
                 Kill the process group to which the process belongs.  The
                 kill signal is only sent once per group, even if multiple
                 processes belonging to the same process group were found.

          -i, --interactive
                 Interactively ask for confirmation before killing.

          -l, --list
                 List all known signal names.

          -n, --ns
                 Match against the PID namespace of the given PID. The
                 default is to match against all namespaces.

          -o, --older-than
                 Match only processes that are older (started before) the
                 time specified.  The time is specified as a float then a
                 unit.  The units are s,m,h,d,w,M,y for seconds, minutes,
                 hours, days, weeks, months and years respectively.

          -q, --quiet
                 Do not complain if no processes were killed.

          -r, --regexp
                 Interpret process name pattern as a POSIX extended regular
                 expression, per regex(3).

          -s, --signal, -SIGNAL
                 Send this signal instead of SIGTERM.

          -u, --user
                 Kill only processes the specified user owns.  Command
                 names are optional.

          -v, --verbose
                 Report if the signal was successfully sent.

          -V, --version
                 Display version information.

          -w, --wait
                 Wait for all killed processes to die.  killall checks once
                 per second if any of the killed processes still exist and
                 only returns if none are left.  Note that killall may wait
                 forever if the signal was ignored, had no effect, or if
                 the process stays in zombie state.

          -y, --younger-than
                 Match only processes that are younger (started after) the
                 time specified.  The time is specified as a float then a
                 unit.  The units are s,m,h,d,w,M,y for seconds, minutes,
                 hours, days, weeks, Months and years respectively.

          -Z, --context
                 Specify security context: kill only processes having
                 security context that match with given extended regular
                 expression pattern.  Must precede other arguments on the
                 command line.  Command names are optional.


---------------------------------------------------

::

          /proc  location of the proc file system


-------------------------------------------------------------

::

          Killing by file only works for executables that are kept open
          during execution, i.e. impure executables can't be killed this
          way.

          Be warned that typing killall name may not have the desired
          effect on non-Linux systems, especially when done by a privileged
          user.

          killall -w doesn't detect if a process disappears and is replaced
          by a new process with the same PID between scans.

          If processes change their name, killall may not be able to match
          them correctly.

          killall has a limit of names that can be specified on the command
          line.  This figure is the size of an unsigned long integer
          multiplied by 8.  For most 32 bit systems the limit is 32 and
          similarly for a 64 bit system the limit is usually 64.


---------------------------------------------------------

::

          kill(1), fuser(1), pgrep(1), pidof(1), pkill(1), ps(1), kill(2),
          regex(3).

COLOPHON
---------------------------------------------------------

::

          This page is part of the psmisc (Small utilities that use the
          /proc filesystem) project.  Information about the project can be
          found at ⟨https://gitlab.com/psmisc/psmisc⟩.  If you have a bug
          report for this manual page, see
          ⟨https://gitlab.com/psmisc/psmisc/issues⟩.  This page was
          obtained from the project's upstream Git repository
          ⟨https://gitlab.com/psmisc/psmisc.git⟩ on 2021-08-27.  (At that
          time, the date of the most recent commit that was found in the
          repository was 2021-06-21.)  If you discover any rendering
          problems in this HTML version of the page, or you believe there
          is a better or more up-to-date source for the page, or you have
          corrections or improvements to the information in this COLOPHON
          (which is not part of the original manual page), send a mail to
          man-pages@man7.org

   psmisc                         2021-01-11                     KILLALL(1)

--------------

Pages that refer to this page: `fuser(1) <../man1/fuser.1.html>`__, 
`kill(1@@procps-ng) <../man1/kill.1@@procps-ng.html>`__, 
`pgrep(1) <../man1/pgrep.1.html>`__, 
`pmsignal(1) <../man1/pmsignal.1.html>`__, 
`skill(1) <../man1/skill.1.html>`__, 
`start-stop-daemon(8) <../man8/start-stop-daemon.8.html>`__

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
