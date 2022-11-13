.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

slattach(8) — Linux manual page
===============================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `OPTIONS <#OPTIONS>`__ \|         |                                   |
| `FILES <#FILES>`__ \|             |                                   |
| `BUGS <#BUGS>`__ \|               |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `AUTHORS <#AUTHORS>`__ \|         |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   SLATTACH(8)        Linux System Administrator's Manual       SLATTACH(8)

NAME
-------------------------------------------------

::

          slattach - attach a network interface to a serial line


---------------------------------------------------------

::

          slattach [-dehlLmnqv] [-c command] [-p proto] [-s speed] [tty]


---------------------------------------------------------------

::

          Slattach is a tiny little program that can be used to put a
          normal terminal ("serial") line into one of several "network"
          modes, thus allowing you to use it for point-to-point links to
          other computers.


-------------------------------------------------------

::

          tty    Path to a serial device like /dev/ttyS*, /dev/cua* or
                 /dev/ptmx to spawn a new pseudo tty.

          [-c command]
                 Execute command when the line is hung up. This can be used
                 to run scripts or re-establish connections when a link
                 goes down.

          [-d]   Enable debugging output.  Useful when determining why a
                 given setup doesn't work.

          [-h]   Exit when the carrier is lost. This works on both /dev/tty
                 and /dev/cua devices by directly monitoring the carrier
                 status every 15 seconds.

          [-v]   Enable verbose output.  Useful in shell scripts.

          [-q]   Operate in quiet mode - no messages at all.

          [-l]   Create an UUCP-style lockfile for the device in /var/lock.

          [-n]   Equivalent to the "mesg n" command.

          [-m]   Do not initialize the line into 8 bits raw mode.

          [-e]   Exit right after initializing device, instead of waiting
                 for the line to hang up.

          [-L]   Enable 3 wire operation. The terminal is moved into CLOCAL
                 mode, carrier watching is disabled.

          [-p proto]
                 Set a specific kind of protocol to use on the line.  The
                 default is set to cslip, i.e. compressed SLIP.  Other
                 possible values are slip (normal SLIP), adaptive (adaptive
                 CSLIP/SLIP), ppp (Point-to-Point Protocol) and kiss (a
                 protocol used for communicating with AX.25 packet radio
                 terminal node controllers).  The special argument tty can
                 be used to put the device back into normal serial
                 operation.  Using 'ppp' mode is not normally useful as ppp
                 requires an additional ppp daemon pppd to be active on the
                 line. For kiss connections the kissattach program should
                 be used.

          [-s speed]
                 Set a specific line speed, other than the default.

          If no arguments are given, the current terminal line (usually:
          the login device) is used.  Otherwise, an attempt is made to
          claim the indicated terminal port, lock it, and open it.


---------------------------------------------------

::

          /dev/cua* /var/lock/LCK.* /dev/ttyS* /dev/ptmx


-------------------------------------------------

::

          None known.


---------------------------------------------------------

::

          kissattach(8), dip(8), pppd(8), sliplogin(8)


-------------------------------------------------------

::

          Fred N. van Kempen, <waltje@uwalt.nl.mugnet.org>
          Alan Cox, <Alan.Cox@linux.org>
          Miquel van Smoorenburg, <miquels@drinkel.ow.org>
          George Shearer, <gshearer@one.net>
          Yossi Gottlieb, <yogo@math.tau.ac.il>

COLOPHON
---------------------------------------------------------

::

          This page is part of the net-tools (networking utilities)
          project.  Information about the project can be found at 
          ⟨http://net-tools.sourceforge.net/⟩.  If you have a bug report for
          this manual page, see ⟨http://net-tools.sourceforge.net/⟩.  This
          page was obtained from the project's upstream Git repository
          ⟨git://git.code.sf.net/p/net-tools/code⟩ on 2021-08-27.  (At that
          time, the date of the most recent commit that was found in the
          repository was 2021-04-22.)  If you discover any rendering
          problems in this HTML version of the page, or you believe there
          is a better or more up-to-date source for the page, or you have
          corrections or improvements to the information in this COLOPHON
          (which is not part of the original manual page), send a mail to
          man-pages@man7.org

   net-tools                      2011-12-31                    SLATTACH(8)

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
