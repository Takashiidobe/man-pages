.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

wavelan(4) — Linux manual page
==============================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   WAVELAN(4)              Linux Programmer's Manual             WAVELAN(4)

NAME
-------------------------------------------------

::

          wavelan - AT&T GIS WaveLAN ISA device driver


---------------------------------------------------------

::

          insmod wavelan_cs.o [io=B,B..] [ irq=I,I..] [name=N,N..]


---------------------------------------------------------------

::

          This driver is obsolete: it was removed from the kernel in
          version 2.6.35.

          wavelan is the low-level device driver for the NCR / AT&T /
          Lucent WaveLAN ISA and Digital (DEC) RoamAbout DS wireless
          ethernet adapter.  This driver is available as a module or might
          be compiled in the kernel.  This driver supports multiple cards
          in both forms (up to 4) and allocates the next available ethernet
          device (eth0..eth#) for each card found, unless a device name is
          explicitly specified (see below).  This device name will be
          reported in the kernel log file with the MAC address, NWID, and
          frequency used by the card.

      Parameters
          This section applies to the module form (parameters passed on the
          insmod(8) command line).  If the driver is included in the
          kernel, use the ether=IRQ,IO,NAME syntax on the kernel command
          line.

          io     Specify the list of base addresses where to search for
                 wavelan cards (setting by dip switch on the card).  If you
                 don't specify any io address, the driver will scan 0x390
                 and 0x3E0 addresses, which might conflict with other
                 hardware...

          irq    Set the list of IRQs that each wavelan card should use
                 (the value is saved in permanent storage for future use).

          name   Set the list of names to be used for each wavelan card
                 device (name used by ifconfig(8)).

      Wireless extensions
          Use iwconfig(8) to manipulate wireless extensions.

      NWID (or domain)
          Set the network ID [0 to FFFF] or disable it [off].  As the NWID
          is stored in the card Permanent Storage Area, it will be reused
          at any further invocation of the driver.

      Frequency & channels
          For the 2.4 GHz 2.00 Hardware, you are able to set the frequency
          by specifying one of the 10 defined channels (2.412, 2.422,
          2.425, 2.4305, 2.432, 2.442, 2.452, 2.460, 2.462 or 2.484) or
          directly as a numeric value.  The frequency is changed
          immediately and permanently.  Frequency availability depends on
          the regulations...

      Statistics spy
          Set a list of MAC addresses in the driver (up to 8) and get the
          last quality of link for each of those (see iwspy(8)).

      /proc/net/wireless
          status is the status reported by the modem.  Link quality reports
          the quality of the modulation on the air (direct sequence spread
          spectrum) [max = 16].  Level and Noise refer to the signal level
          and noise level [max = 64].  The crypt discarded packet and misc
          discarded packet counters are not implemented.

      Private ioctl
          You may use iwpriv(8) to manipulate private ioctls.

      Quality and level threshold
          Enables you to define the quality and level threshold used by the
          modem (packet below that level are discarded).

      Histogram
          This functionality makes it possible to set a number of signal
          level intervals and to count the number of packets received in
          each of those defined intervals.  This distribution might be used
          to calculate the mean value and standard deviation of the signal
          level.

      Specific notes
          This driver fails to detect some non-NCR/AT&T/Lucent Wavelan
          cards.  If this happens for you, you must look in the source code
          on how to add your card to the detection routine.

          Some of the mentioned features are optional.  You may enable to
          disable them by changing flags in the driver header and
          recompile.


---------------------------------------------------------

::

          wavelan_cs(4), ifconfig(8), insmod(8), iwconfig(8), iwpriv(8),
          iwspy(8)

COLOPHON
---------------------------------------------------------

::

          This page is part of release 5.13 of the Linux man-pages project.
          A description of the project, information about reporting bugs,
          and the latest version of this page, can be found at
          https://www.kernel.org/doc/man-pages/.

   Linux                          2021-03-22                     WAVELAN(4)

--------------

`Copyright and license for this manual
page <../man4/wavelan.4.license.html>`__

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
