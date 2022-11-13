.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

lsusb(8) — Linux manual page
============================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `OPTIONS <#OPTIONS>`__ \|         |                                   |
| `RETURN VALUE <#RETURN_VALUE>`__  |                                   |
| \| `SEE ALSO <#SEE_ALSO>`__ \|    |                                   |
| `AUTHOR <#AUTHOR>`__ \|           |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   lsusb(8)                   Linux USB Utilities                  lsusb(8)

NAME
-------------------------------------------------

::

          lsusb - list USB devices


---------------------------------------------------------

::

          lsusb [ options ]


---------------------------------------------------------------

::

          lsusb is a utility for displaying information about USB buses in
          the system and the devices connected to them. It uses udev's
          hardware database to associate a full human-readable name to the
          vendor ID and the product ID.


-------------------------------------------------------

::

          -v, --verbose
                 Tells lsusb to be verbose and display detailed information
                 about the devices shown.  This includes configuration
                 descriptors for the device's current speed.  Class
                 descriptors will be shown, when available, for USB device
                 classes including hub, audio, HID, communications, and
                 chipcard. Can be used with the t option.

          -s [[bus]:][devnum]
                 Show only devices in specified bus and/or devnum.  Both
                 IDs are given in decimal and may be omitted.

          -d [vendor]:[product]
                 Show only devices with the specified vendor and product
                 ID.  Both IDs are given in hexadecimal.

          -D device
                 Do not scan the /dev/bus/usb directory, instead display
                 only information about the device whose device file is
                 given.  The device file should be something like
                 /dev/bus/usb/001/001.  This option displays detailed
                 information like the v option; you must be root to do
                 this.

          -t, --tree
                 Tells lsusb to dump the physical USB device hierarchy as a
                 tree. Verbosity can be increased twice with the v option.

          -V, --version
                 Print version information on standard output, then exit
                 successfully.


-----------------------------------------------------------------

::

          If the specified device is not found, a non-zero exit code is
          returned.


---------------------------------------------------------

::

          lspci(8), usbview(8).


-----------------------------------------------------

::

          Thomas Sailer, <sailer@ife.ee.ethz.ch>.

COLOPHON
---------------------------------------------------------

::

          This page is part of the usbutils (USB utilities for Linux)
          project.  Information about the project can be found at 
          ⟨http://www.linux-usb.org/⟩.  If you have a bug report for this
          manual page, send it to linux-usb@vger.kernel.org.  This page was
          obtained from the project's upstream Git repository
          ⟨https://github.com/gregkh/usbutils.git⟩ on 2021-08-27.  (At that
          time, the date of the most recent commit that was found in the
          repository was 2021-08-06.)  If you discover any rendering
          problems in this HTML version of the page, or you believe there
          is a better or more up-to-date source for the page, or you have
          corrections or improvements to the information in this COLOPHON
          (which is not part of the original manual page), send a mail to
          man-pages@man7.org

   usbutils-014                11 February 2019                    lsusb(8)

--------------

Pages that refer to this page:
`usb-devices(1) <../man1/usb-devices.1.html>`__

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
