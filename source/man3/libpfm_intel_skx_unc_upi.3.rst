.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

libpfm_intel_skx_unc_upi(3) — Linux manual page
===============================================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `MODIFIERS <#MODIFIERS>`__ \|     |                                   |
| `BASIC_HDR_MATCH ev               |                                   |
| ents <#BASIC_HDR_MATCH_events>`__ |                                   |
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

          libpfm_intel_skx_unc_upi - support for Intel Skylake X Server UPI
          uncore PMU


---------------------------------------------------------

::

          #include <perfmon/pfmlib.h>

          PMU name: skx_unc_upi[0-2]
          PMU desc: Intel Skylake X Server UPI uncore PMU


---------------------------------------------------------------

::

          The library supports the Intel Skylake X Server UPI uncore PMU.


-----------------------------------------------------------

::

          The following modifiers are supported on Intel Skylake X server
          UPI uncore PMU:

          e      Enable edge detection, i.e., count only when there is a
                 state transition from no occurrence of the event to at
                 least one occurrence. This modifier must be combined with
                 a threshold modifier (t) with a value greater or equal to
                 one.  This is a boolean modifier.

          t      Set the threshold value. When set to a non-zero value, the
                 counter counts the number of QPI cycles in which the
                 number of occurrences of the event is greater or equal to
                 the threshold.  This is an integer modifier with values in
                 the range [0:255].

          i      Invert the meaning of the threshold or edge filter. If
                 set, the event counts when strictly less than N
                 occurrences occur per cycle if threshold is set to N. When
                 invert is set, then threshold must be set to non-zero
                 value. If set, the event counts when the event transitions
                 from occurring to not occurring (falling edge) when edge
                 detection is set. This is a boolean modifier


-------------------------------------------------------------------------------------

::

          The library also supports the special RXL_BASIC_HDR_MATCH and
          TXL_BASIC_HDR_MATCH opcode matcher events. These events have a
          lot more filters available in the form of either a modifier
          (listed below) or specific umasks.  The following modifiers are
          available in additional to the standard listed above:

          rcsnid Specify a RCS Node identifier as an integer in the range
                 [0-15]. Default: 0

          dnid   Specify a destination Node identifier as an integer in the
                 range [0-15]. Default: 0


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
