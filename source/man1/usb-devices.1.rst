.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

usb-devices(1) — Linux manual page
==================================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `RETURN VALUE <#RETURN_VALUE>`__  |                                   |
| \| `FILES <#FILES>`__ \|          |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `AUTHORS <#AUTHORS>`__ \|         |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   usb-devices(1)             Linux USB Utilities            usb-devices(1)

NAME
-------------------------------------------------

::

          usb-devices - print USB device details


---------------------------------------------------------

::

          usb-devices


---------------------------------------------------------------

::

          usb-devices is a shell script that can be used to display details
          of USB buses in the system and the devices connected to them.

          The output of the script is similar to the usb/devices file
          available either under /proc/bus (if usbfs is mounted), or under
          /sys/kernel/debug (if debugfs is mounted there). The script is
          primarily intended to be used if the file is not available.

          In contrast to the usb/devices file, this script only lists
          active interfaces (those marked with a "*" in the usb/devices
          file) and their endpoints.

          Be advised that there can be differences in the way information
          is sorted, as well as in the format of the output.


-----------------------------------------------------------------

::

          If sysfs is not mounted, a non-zero exit code is returned.


---------------------------------------------------

::

          /sys/bus/usb/devices/usb*
                 The part of the sysfs tree the script walks through to
                 assemble the printed information.

          /proc/bus/usb/devices
                 Location where the usb/devices file can normally be found
                 for Linux kernels before 2.6.31, if usbfs is mounted.

          /sys/kernel/debug/usb/devices
                 Location where the usb/devices file can normally be found
                 for Linux kernel 2.6.31 and later, if debugfs is mounted.


---------------------------------------------------------

::

          lsusb(8), usbview(8).


-------------------------------------------------------

::

          Greg Kroah-Hartman <greg@kroah.com>

          Randy Dunlap <rdunlap@xenotime.net>

          Frans Pop <elendil@planet.nl>

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

   usbutils-013                  23 June 2009                usb-devices(1)

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
