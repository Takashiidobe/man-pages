.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

iptables-save(8) — Linux manual page
====================================

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

   IPTABLES-SAVE(8)             iptables 1.8.7             IPTABLES-SAVE(8)

NAME
-------------------------------------------------

::

          iptables-save — dump iptables rules

          ip6tables-save — dump iptables rules


---------------------------------------------------------

::

          iptables-save [-M modprobe] [-c] [-t table] [-f filename]

          ip6tables-save [-M modprobe] [-c] [-t table] [-f filename]


---------------------------------------------------------------

::

          iptables-save and ip6tables-save are used to dump the contents of
          IP or IPv6 Table in easily parseable format either to STDOUT or
          to a specified file.

          -M, --modprobe modprobe_program
                 Specify the path to the modprobe program. By default,
                 iptables-save will inspect /proc/sys/kernel/modprobe to
                 determine the executable's path.

          -f, --file filename
                 Specify a filename to log the output to. If not specified,
                 iptables-save will log to STDOUT.

          -c, --counters
                 include the current values of all packet and byte counters
                 in the output

          -t, --table tablename
                 restrict output to only one table. If the kernel is
                 configured with automatic module loading, an attempt will
                 be made to load the appropriate module for that table if
                 it is not already there.
                 If not specified, output includes all available tables.


-------------------------------------------------

::

          None known as of iptables-1.2.1 release


-------------------------------------------------------

::

          Harald Welte <laforge@gnumonks.org>
          Rusty Russell <rusty@rustcorp.com.au>
          Andras Kis-Szabo <kisza@sch.bme.hu> contributed ip6tables-save.


---------------------------------------------------------

::

          iptables-apply(8),iptables-restore(8), iptables(8)

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

   iptables 1.8.7                                          IPTABLES-SAVE(8)

--------------

Pages that refer to this page:
`iptables-xml(1) <../man1/iptables-xml.1.html>`__, 
`iptables(8) <../man8/iptables.8.html>`__, 
`iptables-apply(8) <../man8/iptables-apply.8.html>`__, 
`iptables-restore(8) <../man8/iptables-restore.8.html>`__, 
`xtables-translate(8) <../man8/xtables-translate.8.html>`__

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
