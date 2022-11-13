.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

vgdb(1) — Linux manual page
===========================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `OPTIONS <#OPTIONS>`__ \|         |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `AUTHOR <#AUTHOR>`__ \|           |                                   |
| `NOTES <#NOTES>`__ \|             |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   VGDB(1)                           vgdb                           VGDB(1)

NAME
-------------------------------------------------

::

          vgdb - intermediary between Valgrind and GDB or a shell


---------------------------------------------------------

::

          vgdb [options]


---------------------------------------------------------------

::

          vgdb ("Valgrind to GDB") is used as an intermediary between
          Valgrind and GDB or a shell. It has two usage modes:

           1. As a standalone utility, it is used from a shell command line
              to send monitor commands to a process running under Valgrind.
              For this usage, the vgdb OPTION(s) must be followed by the
              monitor command to send. To send more than one command,
              separate them with the -c option.

           2. In combination with GDB "target remote |" command, it is used
              as the relay application between GDB and the Valgrind
              gdbserver. For this usage, only OPTION(s) can be given, but
              no COMMAND can be given.


-------------------------------------------------------

::

          --pid=<number>
              Specifies the PID of the process to which vgdb must connect
              to. This option is useful in case more than one Valgrind
              gdbserver can be connected to. If the --pid argument is not
              given and multiple Valgrind gdbserver processes are running,
              vgdb will report the list of such processes and then exit.

          --vgdb-prefix
              Must be given to both Valgrind and vgdb if you want to change
              the default prefix for the FIFOs (named pipes) used for
              communication between the Valgrind gdbserver and vgdb.

          --wait=<number>
              Instructs vgdb to search for available Valgrind gdbservers
              for the specified number of seconds. This makes it possible
              start a vgdb process before starting the Valgrind gdbserver
              with which you intend the vgdb to communicate. This option is
              useful when used in conjunction with a --vgdb-prefix that is
              unique to the process you want to wait for. Also, if you use
              the --wait argument in the GDB "target remote" command, you
              must set the GDB remotetimeout to a value bigger than the
              --wait argument value. See option --max-invoke-ms (just
              below) for an example of setting the remotetimeout value.

          --max-invoke-ms=<number>
              Gives the number of milliseconds after which vgdb will force
              the invocation of gdbserver embedded in Valgrind. The default
              value is 100 milliseconds. A value of 0 disables forced
              invocation. The forced invocation is used when vgdb is
              connected to a Valgrind gdbserver, and the Valgrind process
              has all its threads blocked in a system call.

              If you specify a large value, you might need to increase the
              GDB "remotetimeout" value from its default value of 2
              seconds. You should ensure that the timeout (in seconds) is
              bigger than the --max-invoke-ms value. For example, for
              --max-invoke-ms=5000, the following GDB command is suitable:

                      (gdb) set remotetimeout 6

          --cmd-time-out=<number>
              Instructs a standalone vgdb to exit if the Valgrind gdbserver
              it is connected to does not process a command in the
              specified number of seconds. The default value is to never
              time out.

          --port=<portnr>
              Instructs vgdb to use tcp/ip and listen for GDB on the
              specified port nr rather than to use a pipe to communicate
              with GDB. Using tcp/ip allows to have GDB running on one
              computer and debugging a Valgrind process running on another
              target computer. Example:

                  # On the target computer, start your program under valgrind using
                  valgrind --vgdb-error=0 prog
                  # and then in another shell, run:
                  vgdb --port=1234

              On the computer which hosts GDB, execute the command:

                  gdb prog
                  (gdb) target remote targetip:1234

              where targetip is the ip address or hostname of the target
              computer.

          -c
              To give more than one command to a standalone vgdb, separate
              the commands by an option -c. Example:

                  vgdb v.set log_output -c leak_check any

          -l
              Instructs a standalone vgdb to report the list of the
              Valgrind gdbserver processes running and then exit.

          -T
              Instructs vgdb to add timestamps to vgdb information
              messages.

          -D
              Instructs a standalone vgdb to show the state of the shared
              memory used by the Valgrind gdbserver. vgdb will exit after
              having shown the Valgrind gdbserver shared memory state.

          -d
              Instructs vgdb to produce debugging output. Give multiple -d
              args to increase the verbosity. When giving -d to a relay
              vgdb, you better redirect the standard error (stderr) of vgdb
              to a file to avoid interaction between GDB and vgdb debugging
              output.


---------------------------------------------------------

::

          valgrind(1), $INSTALL/share/doc/valgrind/html/index.html or
          http://www.valgrind.org/docs/manual/index.html,

          Debugging your program using Valgrind's gdbserver and GDB[1]
          vgdb[2], Valgrind monitor commands[3].


-----------------------------------------------------

::

          Philippe Waroquiers.


---------------------------------------------------

::

           1. Debugging your program using Valgrind's gdbserver and GDB
              http://www.valgrind.org/docs/manual/manual-core-adv.html#manual-core-adv.gdbserver

           2. vgdb
              http://www.valgrind.org/docs/manual/manual-core-adv.html#manual-core-adv.vgdb

           3. Valgrind monitor commands
              http://www.valgrind.org/docs/manual/manual-core-adv.html#manual-core-adv.valgrind-monitor-commands

COLOPHON
---------------------------------------------------------

::

          This page is part of the valgrind (a system for debugging and
          profiling Linux programs) project.  Information about the project
          can be found at ⟨http://www.valgrind.org/⟩.  If you have a bug
          report for this manual page, see
          ⟨http://www.valgrind.org/support/bug_reports.html⟩.  This page
          was obtained from the project's upstream Git repository
          ⟨http://sourceware.org/git/valgrind.git⟩ on 2021-08-27.  (At that
          time, the date of the most recent commit that was found in the
          repository was 2021-08-06.)  If you discover any rendering
          problems in this HTML version of the page, or you believe there
          is a better or more up-to-date source for the page, or you have
          corrections or improvements to the information in this COLOPHON
          (which is not part of the original manual page), send a mail to
          man-pages@man7.org

   Release 3.17.0                 08/27/2021                        VGDB(1)

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
