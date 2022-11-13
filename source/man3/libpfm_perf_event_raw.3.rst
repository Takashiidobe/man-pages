.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

libpfm_perf_event_raw(3) — Linux manual page
============================================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
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

          libpfm_perf_event_raw - support for perf_events raw events syntax


---------------------------------------------------------

::

          #include <perfmon/pfmlib.h>

          PMU name: perf_raw
          PMU desc: Raw perf_events event syntax


---------------------------------------------------------------

::

          The library supports a pseudo PMU model to allow raw encodings of
          PMU events for the Linux perf_events kernel interface.

          With this PMU, it is possible to provide the raw hexadecimal
          encoding of any hardware event for any PMU models. The raw
          encoding is passed as is to the kernel. All events are encoded as
          PERF_TYPE_RAW. As such, perf_events generic events, such as
          cycles, instructions, cannot be encoded by this PMU.

          The syntax is very simple: rX. X is the hexadecimal 64-bit value
          for the event.  It may include event filters on some PMU models.
          The hexadecimal number is passed without the 0x prefix, e.g.,
          r01c4.

          The library's standard perf_events attributes are supported by
          this PMU model.  They are separated with colons as is customary
          with the library.


-----------------------------------------------------------

::

          The following modifiers are supported by this PMU model:

          u      Measure at user level which includes privilege levels 1,
                 2, 3. This corresponds to PFM_PLM3.  This is a boolean
                 modifier.

          k      Measure at kernel level which includes privilege level 0.
                 This corresponds to PFM_PLM0.  This is a boolean modifier.

          h      Measure at the hypervisor level. This corresponds to
                 PFM_PLMH.  This is a boolean modifier

          mg     Measure guest execution only. This is a boolean modifier

          mh     Measure host execution only. This is a boolean modifier

          period Specify the the sampling period value. Value can be
                 expressed in decimal or hexadecimal.  Value is 64-bit
                 wide. This option is mutually exclusive with freq. The
                 period is expressed in the unit of the event. There is no
                 default value.

          freq   Specify the the sampling frequency value. Value can be
                 expressed in decimal or hexadecimal.  Value is 64-bit
                 wide. This options is mutually exclusive with period. The
                 value is expressed in Hertz. For instance, freq=100, means
                 that the event should be sampled 100 times per second on
                 average. There is no default value.

          excl   The associated event is the only event measured on the
                 PMU. This applies only to hardware events. This attribute
                 requires admin privileges. Default is off.

          precise
                 Enables precise sampling mode. This option is only valid
                 when sampling on events. The options takes an integer
                 argument. It can have the following values: 1=enable
                 precise sampling, 2=enable precise sampling and eliminate
                 skid, 3=enable precise sampling, eliminate skid and bias.
                 Not all events necessarily support precise mode at all
                 levels, this is dependent on the underlying PMU.
                 Eliminating skid is a best effort feature. It may not work
                 for all samples. This option is mutually exclusive with
                 hw_smpl. This options implies using the hardware assist
                 sampling mechanism.

          hw_smpl
                 Enables hardware assist sampling. This is a boolean
                 option. It is false by default. On some processors, it is
                 possible to have the hardware record samples in a buffer
                 and then notify the kernel when it is full.  Such feature
                 may not be available for all events. Using a hardware
                 buffer does not necessarily eliminate skid and bias, it
                 usually lowers the overhead of interrupt-based sampling by
                 amortizing the interrupt over multiple samples. This
                 option is usually implicit with precise sampling events.

          cpu    This integer option is used with system-wide events, i.e.,
                 events attached to a CPU instead of a thread. The value
                 designate the CPU to attach the event to. It is up to the
                 caller of the library to use the cpu field in the library
                 event encoding argument to create the event. No
                 verification on the validity of the CPU number is made by
                 the library. Default value is -1 for this field.

          pinned This boolean option is used with system-wide events, i.e.,
                 events attached to a CPU instead of a thread. If set, then
                 the event is marked as pinned. That means it needs to
                 remain on the counters at all time, i.e., it cannot be
                 multiplexed. There can only be as many pinned events as
                 there are counters, yet the library does not check for
                 that, the perf_event subsystem does. The default value for
                 this field is false, i.e., the event is not pinned.


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

                                February, 2014                    LIBPFM(3)

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
