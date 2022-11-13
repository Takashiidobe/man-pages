.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

firemon(1) — Linux manual page
==============================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `OPTIONS <#OPTIONS>`__ \|         |                                   |
| `LICENSE <#LICENSE>`__ \|         |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   FIREMON(1)                  firemon man page                  FIREMON(1)

NAME
-------------------------------------------------

::

          Firemon - Monitoring program for processes started in a Firejail
          sandbox.


---------------------------------------------------------

::

          firemon [OPTIONS] [PID]


---------------------------------------------------------------

::

          Firemon monitors programs started in a Firejail sandbox.  Without
          a PID specified, all processes started by Firejail are monitored.
          Descendants of these processes are also being monitored. On
          Grsecurity systems only root user can run this program.


-------------------------------------------------------

::

          --apparmor
                 Print AppArmor confinement status for each sandbox.

          --arp  Print ARP table for each sandbox.

          --caps Print capabilities configuration for each sandbox.

          --cgroup
                 Print control group information for each sandbox.

          --cpu  Print CPU affinity for each sandbox.

          --debug
                 Print debug messages

          -?, --help
                 Print options end exit.

          --interface
                 Print network interface information for each sandbox.

          --list List all sandboxes.

          --name=name
                 Print information only about named sandbox.

          --netstats
                 Monitor network statistics for sandboxes creating a new
                 network namespace.

          --route
                 Print route table for each sandbox.

          --seccomp
                 Print seccomp configuration for each sandbox.

          --top  Monitor the most CPU-intensive sandboxes. This command  is
                 similar to the regular UNIX top command, however it
                 applies only to sandboxes.

          --tree Print a tree of all sandboxed processes.

          --version
                 Print program version and exit.

          --wrap Enable line wrapping in terminals. By default the lines
                 are trimmed.

          --x11  Print X11 display number.

          The format for each listed sandbox entry is as follows:

               PID:USER:Sandbox Name:Command

          Listed below are the available fields (columns) in various
          firemon commands in alphabetical order:

          Command
                 Command used to start the sandbox.

          CPU%   CPU usage, the sandbox share of the elapsed CPU time since
                 the last screen update

          PID    Unique process ID for the task controlling the sandbox.

          Prcs   Number of processes running in sandbox, including the
                 controlling process.

          RES    Resident Memory Size (KiB), sandbox non-swapped physical
                 memory.  It is a sum of the RES values for all processes
                 running in the sandbox.

          Sandbox Name
                 The name of the sandbox, if any.

          SHR    Shared Memory Size (KiB), it reflects memory shared with
                 other processes. It is a sum of the SHR values for all
                 processes running in the sandbox, including the
                 controlling process.

          Uptime Sandbox running time in hours:minutes:seconds format.

          USER   The owner of the sandbox.


-------------------------------------------------------

::

          This program is free software; you can redistribute it and/or
          modify it under the terms of the GNU General Public License as
          published by the Free Software Foundation; either version 2 of
          the License, or (at your option) any later version.

          Homepage: https://firejail.wordpress.com


---------------------------------------------------------

::

          firejail(1), firecfg(1), firejail-profile(5), firejail-login(5),
          firejail-users(5), jailcheck(1)

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

   0.9.67                          Aug 2021                      FIREMON(1)

--------------

Pages that refer to this page: `firecfg(1) <../man1/firecfg.1.html>`__, 
`firejail(1) <../man1/firejail.1.html>`__, 
`jailcheck(1) <../man1/jailcheck.1.html>`__, 
`firejail-login(5) <../man5/firejail-login.5.html>`__, 
`firejail-profile(5) <../man5/firejail-profile.5.html>`__, 
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
