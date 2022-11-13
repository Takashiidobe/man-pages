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
project <kill.1.html>`__

--------------

kill(1) — Linux manual page
===========================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `OPTIONS <#OPTIONS>`__ \|         |                                   |
| `NOTES <#NOTES>`__ \|             |                                   |
| `EXAMPLES <#EXAMPLES>`__ \|       |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `STANDARDS <#STANDARDS>`__ \|     |                                   |
| `AUTHOR <#AUTHOR>`__ \|           |                                   |
| `RE                               |                                   |
| PORTING BUGS <#REPORTING_BUGS>`__ |                                   |
| \| `COLOPHON <#COLOPHON>`__       |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   KILL(1)                       User Commands                      KILL(1)

NAME
-------------------------------------------------

::

          kill - send a signal to a process


---------------------------------------------------------

::

          kill [options] <pid> [...]


---------------------------------------------------------------

::

          The default signal for kill is TERM.  Use -l or -L to list
          available signals.  Particularly useful signals include HUP, INT,
          KILL, STOP, CONT, and 0.  Alternate signals may be specified in
          three ways: -9, -SIGKILL or -KILL.  Negative PID values may be
          used to choose whole process groups; see the PGID column in ps
          command output.  A PID of -1 is special; it indicates all
          processes except the kill process itself and init.


-------------------------------------------------------

::

          <pid> [...]
                 Send signal to every <pid> listed.

          -<signal>
          -s <signal>
          --signal <signal>
                 Specify the signal to be sent.  The signal can be
                 specified by using name or number.  The behavior of
                 signals is explained in signal(7) manual page.

          -q, --queue value
                 Use sigqueue(3) rather than kill(2) and the value argument
                 is used to specify an integer to be sent with the signal.
                 If the receiving process has installed a handler for this
                 signal using the SA_SIGINFO flag to sigaction(2) , then it
                 can obtain this data via the si_value field of the
                 siginfo_t structure.

          -l, --list [signal]
                 List signal names.  This option has optional argument,
                 which will convert signal number to signal name, or other
                 way round.

          -L, --table
                 List signal names in a nice table.


---------------------------------------------------

::

                 Your shell (command line interpreter) may have a built-in
                 kill command.  You may need to run the command described
                 here as /bin/kill to solve the conflict.


---------------------------------------------------------

::

          kill -9 -1
                 Kill all processes you can kill.

          kill -l 11
                 Translate number 11 into a signal name.

          kill -L
                 List the available signal choices in a nice table.

          kill 123 543 2341 3453
                 Send the default signal, SIGTERM, to all those processes.


---------------------------------------------------------

::

          kill(2), killall(1), nice(1), pkill(1), renice(1), signal(7),
          sigqueue(3), skill(1)


-----------------------------------------------------------

::

          This command meets appropriate standards.  The -L flag is Linux-
          specific.


-----------------------------------------------------

::

          Albert Cahalan ⟨albert@users.sf.net⟩ wrote kill in 1999 to
          replace a bsdutils one that was not standards compliant.  The
          util-linux one might also work correctly.


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

   procps-ng                      2020-04-24                        KILL(1)

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
