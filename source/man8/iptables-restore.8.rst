.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

iptables-restore(8) — Linux manual page
=======================================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `BUGS <#BUGS>`__ \|               |                                   |
| `AUTHORS <#AUTHORS>`__ \|         |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   IPTABLES-RESTORE(8)          iptables 1.8.7          IPTABLES-RESTORE(8)

NAME
-------------------------------------------------

::

          iptables-restore — Restore IP Tables

          ip6tables-restore — Restore IPv6 Tables


---------------------------------------------------------

::

          iptables-restore [-chntvV] [-w secs] [-W usecs] [-M modprobe] [-T
          name] [file]

          ip6tables-restore [-chntvV] [-w secs] [-W usecs] [-M modprobe]
          [-T name] [file]


---------------------------------------------------------------

::

          iptables-restore and ip6tables-restore are used to restore IP and
          IPv6 Tables from data specified on STDIN or in file. Use I/O
          redirection provided by your shell to read from a file or specify
          file as an argument.

          -c, --counters
                 restore the values of all packet and byte counters

          -h, --help
                 Print a short option summary.

          -n, --noflush
                 don't flush the previous contents of the table. If not
                 specified, both commands flush (delete) all previous
                 contents of the respective table.

          -t, --test
                 Only parse and construct the ruleset, but do not commit
                 it.

          -v, --verbose
                 Print additional debug info during ruleset processing.

          -V, --version
                 Print the program version number.

          -w, --wait [seconds]
                 Wait for the xtables lock.  To prevent multiple instances
                 of the program from running concurrently, an attempt will
                 be made to obtain an exclusive lock at launch.  By
                 default, the program will exit if the lock cannot be
                 obtained.  This option will make the program wait
                 (indefinitely or for optional seconds) until the exclusive
                 lock can be obtained.

          -W, --wait-interval microseconds
                 Interval to wait per each iteration.  When running latency
                 sensitive applications, waiting for the xtables lock for
                 extended durations may not be acceptable. This option will
                 make each iteration take the amount of time specified. The
                 default interval is 1 second. This option only works with
                 -w.

          -M, --modprobe modprobe_program
                 Specify the path to the modprobe program. By default,
                 iptables-restore will inspect /proc/sys/kernel/modprobe to
                 determine the executable's path.

          -T, --table name
                 Restore only the named table even if the input stream
                 contains other ones.


-------------------------------------------------

::

          None known as of iptables-1.2.1 release


-------------------------------------------------------

::

          Harald Welte <laforge@gnumonks.org> wrote iptables-restore based
          on code from Rusty Russell.
          Andras Kis-Szabo <kisza@sch.bme.hu> contributed ip6tables-
          restore.


---------------------------------------------------------

::

          iptables-apply(8),iptables-save(8), iptables(8)

          The iptables-HOWTO, which details more iptables usage, the NAT-
          HOWTO, which details NAT, and the netfilter-hacking-HOWTO which
          details the internals.

COLOPHON
---------------------------------------------------------

::

          This page is part of the iptables (administer and maintain packet
          filter rules) project.  Information about the project can be
          found at ⟨http://www.netfilter.org/⟩.  If you have a bug report
          for this manual page, see ⟨http://bugzilla.netfilter.org/⟩.  This
          page was obtained from the project's upstream Git repository
          ⟨git://git.netfilter.org/iptables⟩ on 2021-08-27.  (At that time,
          the date of the most recent commit that was found in the
          repository was 2021-08-11.)  If you discover any rendering
          problems in this HTML version of the page, or you believe there
          is a better or more up-to-date source for the page, or you have
          corrections or improvements to the information in this COLOPHON
          (which is not part of the original manual page), send a mail to
          man-pages@man7.org

   iptables 1.8.7                                       IPTABLES-RESTORE(8)

--------------

Pages that refer to this page:
`iptables-xml(1) <../man1/iptables-xml.1.html>`__, 
`iptables(8) <../man8/iptables.8.html>`__, 
`iptables-apply(8) <../man8/iptables-apply.8.html>`__, 
`iptables-save(8) <../man8/iptables-save.8.html>`__

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
