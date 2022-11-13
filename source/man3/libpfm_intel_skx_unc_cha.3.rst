.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

libpfm_intel_skx_unc_cha(3) — Linux manual page
===============================================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `MODIFIERS <#MODIFIERS>`__ \|     |                                   |
| `Opcode                           |                                   |
|  filtering <#Opcode_filtering>`__ |                                   |
| \| `AUTHORS <#AUTHORS>`__ \|      |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   LIBPFM(3)               Linux Programmer's Manual              LIBPFM(3)

NAME
-------------------------------------------------

::

          libpfm_intel_skx_unc_cha - support for Intel Skylake X Server
          CHA-Box uncore PMU


---------------------------------------------------------

::

          #include <perfmon/pfmlib.h>

          PMU name: skx_unc_cha[0-27]
          PMU desc: Intel Skylake X CHA uncore PMU


---------------------------------------------------------------

::

          The library supports the Intel Skylake X CHA-Box (coherency and
          home agent engine) uncore PMU.  There is one CHA-box PMU per
          physical core. Therefore there are up to twenty-eight identical
          CHA-Box PMU instances numbered from 0 up to possibly 27. On dual-
          socket systems, the number refers to the CHA-Box PMU on the
          socket where the program runs. For instance, if running on CPU18,
          then skx_unc_cha0 refers to the CHA-Box for physical core 0 on
          socket 1. Conversely, if running on CPU0, then the same
          skx_unc_cha0 refers to the CHA-Box for physical core 0 but on
          socket 0.

          Each CHA-Box PMU implements 4 generic counters and two filter
          registers used only with certain events and umasks. The filters
          are either accessed via modifiers (see below) or umasks, such as
          the opcode or cache state filter.


-----------------------------------------------------------

::

          The following modifiers are supported on Intel Skylake CHA-Box
          uncore PMU:

          e      Enable edge detection, i.e., count only when there is a
                 state transition from no occurrence of the event to at
                 least one occurrence. This modifier must be combined with
                 a threshold modifier (t) with a value greater or equal to
                 one.  This is a boolean modifier.

          t      Set the threshold value. When set to a non-zero value, the
                 counter counts the number of C-Box cycles in which the
                 number of occurrences of the event is greater or equal to
                 the threshold.  This is an integer modifier with values in
                 the range [0:255].

          i      Invert the meaning of the event. The counter will now
                 count cycles in which the event is not occurring. This is
                 a boolean modifier.

          loc    Match on local node target. This filter is only supported
                 on UNC_C_TOR_INSERTS and UNC_C_TOR_OCCUPANCY.  This is a
                 boolean filter.

          rem    Match on remote node target. This filter is only supported
                 on UNC_C_TOR_INSERTS and UNC_C_TOR_OCCUPANCY.  This is a
                 boolean filter.

          lmem   Match near memory cacheable. This filter is only supported
                 on UNC_C_TOR_INSERTS and UNC_C_TOR_OCCUPANCY.  This is a
                 boolean filter.

          rmem   Match not near memory cacheable. This filter is only
                 supported on UNC_C_TOR_INSERTS and UNC_C_TOR_OCCUPANCY.
                 This is a boolean filter.

          nc     Match non-coherent requests. This filter is only supported
                 on UNC_C_TOR_INSERTS and UNC_C_TOR_OCCUPANCY.  This is a
                 boolean filter.

          isoc   Match isochronous requests. This filter is only supported
                 on UNC_C_TOR_INSERTS and UNC_C_TOR_OCCUPANCY.  This is a
                 boolean filter.


-------------------------------------------------------------------------

::

          Events UNC_C_TOR_INSERTS and UNC_C_TOR_OCCUPANCY support opcode
          matching. The processor implements two opcode filters. Both are
          used at the same time. The OPC0 umasks correspond to the first
          opcode matcher and OPC1 to the second opcode matcher. If only one
          opcode must be tracked then the unused filter will be set to 0.
          The opcode umasks must be used in combination with a specific
          queue umask otherwise the library will reject the event. The
          umask description shows which queue umask is required for each
          opcode. For instance, OPC0_RFO/OPC1_RFO require the IRQ queue and
          thus the IRQ umask.

          The opcode match umasks can be combined with other modifiers.


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

                                 January, 2018                    LIBPFM(3)

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
