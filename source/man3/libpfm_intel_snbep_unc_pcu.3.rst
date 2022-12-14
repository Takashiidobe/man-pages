.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

libpfm_intel_snbep_unc_pcu(3) — Linux manual page
=================================================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `MODIFIERS <#MODIFIERS>`__ \|     |                                   |
| `Frequency band filteri           |                                   |
| ng <#Frequency_band_filtering>`__ |                                   |
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

          libpfm_intel_snbep_unc_pcu - support for Intel Sandy Bridge-EP
          Power Controller Unit (PCU) uncore PMU


---------------------------------------------------------

::

          #include <perfmon/pfmlib.h>

          PMU name: snbep_unc_pcu
          PMU desc: Intel Sandy Bridge-EP PCU uncore PMU


---------------------------------------------------------------

::

          The library supports the Intel Sandy Bridge Power Controller Unit
          uncore PMU.  This PMU model only exists on Sandy Bridge model 45.
          There is only one PCU PMU per processor socket.


-----------------------------------------------------------

::

          The following modifiers are supported on Intel Sandy Bridge C-Box
          uncore PMU:

          i      Invert the meaning of the event. The counter will now
                 count HA cycles in which the event is not occurring. This
                 is a boolean modifier

          e      Enable edge detection, i.e., count only when there is a
                 state transition from no occurrence of the event to at
                 least one occurrence. This modifier must be combined with
                 a threshold modifier (t) with a value greater or equal to
                 one.  This is a boolean modifier.

          t      Set the threshold value. When set to a non-zero value, the
                 counter counts the number of HA cycles in which the number
                 of occurrences of the event is greater or equal to the
                 threshold.  This is an integer modifier with values in the
                 range [0:15].

          ff     Enable frequency band filtering. This modifier applies
                 only to the UNC_P_FREQ_BANDx_CYCLES events, where x is
                 [0-3].  The modifiers expects an integer in the range
                 [0-255]. The value is interpreted as a frequency value to
                 be multiplied by 100Mhz. Thus if the value is 32, then all
                 cycles where the processor is running at 3.2GHz and more
                 are counted.


-----------------------------------------------------------------------------------------

::

          There are 3 events which support frequency band filtering,
          namely, UNC_P_FREQ_BAND0_CYCLES, UNC_P_FREQ_BAND1_CYCLES,
          UNC_P_FREQ_BAND2_CYCLES, UNC_P_FREQ_BAND3_CYCLES. The frequency
          filter (available via the ff modifier) is stored into a PMU
          shared register which hold all 4 possible frequency bands, one
          per event. However, the library generate the encoding for each
          event individually because it processes events one at a time. The
          caller or the underlying kernel interface may have to merge the
          band filter settings to program the filter register properly.


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

                                 August, 2012                     LIBPFM(3)

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
