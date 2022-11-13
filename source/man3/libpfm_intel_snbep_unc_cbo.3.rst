.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

libpfm_intel_snbep_unc_cbo(3) — Linux manual page
=================================================

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

          libpfm_intel_snbep_unc_cbo - support for Intel Sandy Bridge-EP C-
          Box uncore PMU


---------------------------------------------------------

::

          #include <perfmon/pfmlib.h>

          PMU name: snbep_unc_cbo[0-7]
          PMU desc: Intel Sandy Bridge-EP C-Box uncore PMU


---------------------------------------------------------------

::

          The library supports the Intel Sandy Bridge C-Box (coherency
          engine) uncore PMU.  This PMU model only exists on Sandy Bridge
          model 45. There is one C-box PMU per physical core. Therefore
          there are eight identical C-Box PMU instances numbered frmo 0 to
          7. On dual-socket systems, the number refers to the C-Box PMU on
          the socket where the program runs. For instance, if running on
          CPU8, then snbep_unc_cbo0 refers to the C-Box for physical core 0
          on socket 1. Conversely, if running on CPU0, then the same
          snbep_unc_cbo0 refers to the C-Box for physical core 0 but on
          socket 0.

          Each C-Box PMU implements 4 generic counters and a filter
          register used only with certain events and umasks.


-----------------------------------------------------------

::

          The following modifiers are supported on Intel Sandy Bridge C-Box
          uncore PMU:

          i      Invert the meaning of the event. The counter will now
                 count C-Box cycles in which the event is not occurring.
                 This is a boolean modifier

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

          nf     Node filter. Certain events, such as UNC_C_LLC_LOOKUP,
                 UNC_C_LLC_VICTIMS, provide a NID umask.  Sometimes the NID
                 is combined with other filtering capabilities, such as
                 opcodes.  The node filter is an 8-bit max bitmask. A node
                 corresponds to a processor socket. The legal values
                 therefore depend on the underlying hardware configuration.
                 For dual-socket systems, the bitmask has two valid bits
                 [0:1].

          cf     Core Filter. This is a 3-bit filter which is used to
                 filter based on physical core origin of the C-Box request.
                 Possible values are 0-7. If the filter is not specified,
                 then no filtering takes place.

          tf     Thread Filter. This is a 1-bit filter which is used to
                 filter C-Box requests based on logical processor (hyper-
                 thread) identification. Possibles values are 0-1. If the
                 filter is not specified, then no filtering takes place.


-------------------------------------------------------------------------

::

          Certain events, such as UNC_C_TOR_INSERTS supports opcode
          matching on the C-BOX transaction type. To use this feature,
          first an opcode matching umask must be selected, e.g.,
          MISS_OPCODE.  Second, the opcode to match on must be selected via
          a second umask among the OPC_* umasks.  For instance,
          UNC_C_TOR_INSERTS:OPCODE:OPC_RFO, counts the number of TOR
          insertions for RFO transactions.

          Opcode matching may be combined with node filtering with certain
          umasks. In general the filtering support is encoded into the
          umask name, e.g., NID_OPCODE supports both node and opcode
          filtering. For instance,
          UNC_C_TOR_INSERTS:NID_OPCODE:OPC_RFO:nf=1.


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
