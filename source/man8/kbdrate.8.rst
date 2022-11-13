.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

kbdrate(8) — Linux manual page
==============================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `OPTIONS <#OPTIONS>`__ \|         |                                   |
| `BUGS <#BUGS>`__ \|               |                                   |
| `FILES <#FILES>`__ \|             |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   KBDRATE(8)               System Manager's Manual              KBDRATE(8)

NAME
-------------------------------------------------

::

          kbdrate - reset the keyboard repeat rate and delay time


---------------------------------------------------------

::

          kbdrate [options...]


---------------------------------------------------------------

::

          kbdrate is used to change the keyboard repeat rate and delay
          time. The delay is the amount of time that a key must be
          depressed before it will start to repeat.

          Using kbdrate without any options will reset the repeat rate to
          10.9 characters per second (cps) and the delay to 250
          milliseconds (ms) for Intel- and M68K-based systems.  These are
          the IBM defaults. On SPARC-based systems it will reset the repeat
          rate to 5 cps and the delay to 200 ms.


-------------------------------------------------------

::

          -r, --rate=NUMBER
                 Change the keyboard repeat rate to NUMBER cps. For Intel-
                 based systems, the allowable range is from 2.0 to 30.0
                 cps.  Only certain, specific values are possible, and the
                 program will select the nearest possible value to the one
                 specified. The possible values are given, in characters
                 per second, as follows: 2.0, 2.1, 2.3, 2.5, 2.7, 3.0, 3.3,
                 3.7, 4.0, 4.3, 4.6, 5.0, 5.5, 6.0, 6.7, 7.5, 8.0, 8.6,
                 9.2, 10.0, 10.9, 12.0, 13.3, 15.0, 16.0, 17.1, 18.5, 20.0,
                 21.8, 24.0, 26.7, 30.0.  For SPARC-based systems, the
                 allowable range is from 0 (no repeat) to 50 cps.

          -d, --delay=NUMBER
                 Change the delay to NUMBER milliseconds.  For Intel-based
                 systems, the allowable range is from 250 to 1000 ms, in
                 250 ms steps. For SPARC systems, possible values are
                 between 10 ms and 1440 ms, in 10 ms steps.

          -s, --silent
                 Silent. No messages are printed.

          -h, --help
                 Display a help text.

          -V, --version
                 Display a version number and exit.


-------------------------------------------------

::

          Not all keyboards support all rates.

          Not all keyboards have the rates mapped in the same way.

          Setting the repeat rate on the Gateway AnyKey keyboard does not
          work.  If someone with a Gateway figures out how to program the
          keyboard, please send mail to util-linux@math.uio.no.

          All this is very architecture dependent.  Nowadays kbdrate first
          tries the KDKBDREP and KIOCSRATE ioctls.  (The former usually
          works on an m68k/i386 machine, the latter for SPARC.)  When these
          ioctls fail an ioport interface.


---------------------------------------------------

::

          /etc/rc.local
          /dev/port

COLOPHON
---------------------------------------------------------

::

          This page is part of the kbd (Linux keyboard tools) project.
          Information about the project can be found at 
          ⟨http://www.kbd-project.org/⟩.  If you have a bug report for this
          manual page, send it to kbd@lists.altlinux.org.  This page was
          obtained from the project's upstream Git repository
          ⟨https://github.com/legionus/kbd.git⟩ on 2021-08-27.  (At that
          time, the date of the most recent commit that was found in the
          repository was 2021-07-04.)  If you discover any rendering
          problems in this HTML version of the page, or you believe there
          is a better or more up-to-date source for the page, or you have
          corrections or improvements to the information in this COLOPHON
          (which is not part of the original manual page), send a mail to
          man-pages@man7.org

   kbd                           22 June 1994                    KBDRATE(8)

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
