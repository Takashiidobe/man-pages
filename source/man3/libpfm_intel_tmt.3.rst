.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

libpfm_intel_tmt(3) — Linux manual page
=======================================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `MODIFIERS <#MODIFIERS>`__ \|     |                                   |
| `OFFCORE_RESPONSE eve             |                                   |
| nts <#OFFCORE_RESPONSE_events>`__ |                                   |
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

          libpfm_intel_tmt - support for Intel Tremont core PMU


---------------------------------------------------------

::

          #include <perfmon/pfmlib.h>

          PMU name: tmt
          PMU desc: Intel Tremont


---------------------------------------------------------------

::

          The library supports the Intel Tremont core PMU.


-----------------------------------------------------------

::

          The following modifiers are supported on Intel Tremont
          processors:

          u      Measure at user level which includes privilege levels 1,
                 2, 3. This corresponds to PFM_PLM3.  This is a boolean
                 modifier.

          k      Measure at kernel level which includes privilege level 0.
                 This corresponds to PFM_PLM0.  This is a boolean modifier.

          i      Invert the meaning of the event. The counter will now
                 count cycles in which the event is not occurring. This is
                 a boolean modifier

          e      Enable edge detection, i.e., count only when there is a
                 state transition from no occurrence of the event to at
                 least one occurrence. This modifier must be combined with
                 a counter mask modifier (m) with a value greater or equal
                 to one.  This is a boolean modifier.

          c      Set the counter mask value. The mask acts as a threshold.
                 The counter will count the number of cycles in which the
                 number of occurrences of the event is greater or equal to
                 the threshold. This is an integer modifier with values in
                 the range [0:255].


---------------------------------------------------------------------------------------

::

          Intel Tremont provides two offcore_response events:
          OFFCORE_RESPONSE_0 and OFFCORE_RESPONSE_1. The  OCR event is
          aliased to OFFCORE_RESPONSE_0.

          Those events need special treatment in the performance monitoring
          infrastructure because each event uses an extra register to store
          some settings. Thus, in case multiple offcore_response events are
          monitored simultaneously, the kernel needs to manage the sharing
          of that extra register.

          The offcore_response event is exposed as a normal event by the
          library. The extra settings are exposed as regular umasks. The
          library takes care of encoding the events according for the
          underlying kernel interface.

          On Intel Tremont, it is not possible to combine the request,
          supplier, snoop, fields anymore to avoid invalid combinations. As
          such, the umasks provided by the library are the only ones
          supported and validated.


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

                                  March, 2020                     LIBPFM(3)

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
