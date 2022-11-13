.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

libpfm_mips_74k(3) — Linux manual page
======================================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `ENCODINGS <#ENCODINGS>`__ \|     |                                   |
| `MODIFIERS <#MODIFIERS>`__ \|     |                                   |
| `AUTHORS <#AUTHORS>`__ \|         |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   LIBPFM(3)               Linux Programmer's Manual              LIBPFM(3)

NAME
-------------------------------------------------

::

          libpfm_mips_74k - support for MIPS 74k processors


---------------------------------------------------------

::

          #include <perfmon/pfmlib.h>

          PMU name: mips_74k
          PMU desc: MIPS 74k


---------------------------------------------------------------

::

          The library supports MIPS 74k processors in big or little endian
          modes.


-----------------------------------------------------------

::

          On this processor, what is measured by an event depends on the
          event code and on the counter it is programmed on. Usually the
          meaning of the event code changes between odd and even indexed
          counters. For instance, event code 0x2 means 'PREDICTED_JR31'
          when programmed on even-indexed counters and it means
          'JR_31_MISPREDICTIONS' when programmed on odd-indexed counters.
          To correctly measure an event, one needs both the event encoding
          and a list of possible counters.

          When pfm_get_os_event_encoding() is used with PFM_OS_NONE to
          return the raw PMU encoding, the library returns two values: the
          event encoding as per the architecture manual and a bitmask of
          valid counters to program it on. For instance, for
          'JR_31_MISPREDICTIONS' The library returns codes[0] = 0x4a,
          codes[1]= 0xa (supported on counter 1, 3).

          The encoding for a specific kernel interface may vary and is
          handled internally by the library.


-----------------------------------------------------------

::

          The following modifiers are supported on MIPS 74k.

          u      Measure at user level. This corresponds to PFM_PLM3.  This
                 is a boolean modifier.

          k      Measure at kernel level. This corresponds to PFM_PLM0.
                 This is a boolean modifier.

          e      Measure at exception level. This corresponds to PFM_PLM2.
                 This is a boolean modifier.

          s      Measure at supervisor level. This corresponds to PFM_PLM1.
                 This is a boolean modifier.

                 It should be noted that those modifiers are available for
                 encoding as raw mode with PFM_OS_NONE but they may not all
                 be present with specific kernel interfaces.


-------------------------------------------------------

::

          Stephane Eranian <eranian@gmail.com>

COLOPHON
---------------------------------------------------------

::

          This page is part of the perfmon2 (a performance monitoring
          library) project.  Information about the project can be found at
          ⟨http://perfmon2.sourceforge.net/⟩.  If you have a bug report for
          this manual page, send it to
          perfmon2-devel@lists.sourceforge.net.  This page was obtained
          from the project's upstream Git repository
          ⟨git://git.code.sf.net/p/perfmon2/libpfm4 perfmon2-libpfm4⟩ on
          2021-08-27.  (At that time, the date of the most recent commit
          that was found in the repository was 2021-08-04.)  If you
          discover any rendering problems in this HTML version of the page,
          or you believe there is a better or more up-to-date source for
          the page, or you have corrections or improvements to the
          information in this COLOPHON (which is not part of the original
          manual page), send a mail to man-pages@man7.org

                                September, 2011                   LIBPFM(3)

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
