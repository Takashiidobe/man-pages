.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

udev_enumerate_new(3) — Linux manual page
=========================================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `RETURN VALUE <#RETURN_VALUE>`__  |                                   |
| \| `SEE ALSO <#SEE_ALSO>`__ \|    |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   UDEV_ENUMERATE_NEW(3)      udev_enumerate_new      UDEV_ENUMERATE_NEW(3)

NAME
-------------------------------------------------

::

          udev_enumerate_new, udev_enumerate_ref, udev_enumerate_unref -
          Create, acquire and release a udev enumerate object


---------------------------------------------------------

::

          #include <libudev.h>

          struct udev_enumerate *udev_enumerate_new(struct udev *udev);

          struct udev_enumerate
                                                    *udev_enumerate_ref(struct udev_enumerate *udev_enumerate);

          struct udev_enumerate
                                                      *udev_enumerate_unref(struct udev_enumerate *udev_enumerate);


-----------------------------------------------------------------

::

          On success, udev_enumerate_new() returns a pointer to the
          allocated udev monitor. On failure, NULL is returned.
          udev_enumerate_ref() returns the argument that it was passed,
          unmodified.  udev_enumerate_unref() always returns NULL.


---------------------------------------------------------

::

          udev_new(3), udev_device_new_from_syspath(3),
          udev_enumerate_add_match_subsystem(3),
          udev_enumerate_scan_devices(3), udev_monitor_new_from_netlink(3),
          udev_list_entry(3), systemd(1),

COLOPHON
---------------------------------------------------------

::

          This page is part of the systemd (systemd system and service
          manager) project.  Information about the project can be found at
          ⟨http://www.freedesktop.org/wiki/Software/systemd⟩.  If you have
          a bug report for this manual page, see
          ⟨http://www.freedesktop.org/wiki/Software/systemd/#bugreports⟩.
          This page was obtained from the project's upstream Git repository
          ⟨https://github.com/systemd/systemd.git⟩ on 2021-08-27.  (At that
          time, the date of the most recent commit that was found in the
          repository was 2021-08-27.)  If you discover any rendering
          problems in this HTML version of the page, or you believe there
          is a better or more up-to-date source for the page, or you have
          corrections or improvements to the information in this COLOPHON
          (which is not part of the original manual page), send a mail to
          man-pages@man7.org

   systemd 249                                        UDEV_ENUMERATE_NEW(3)

--------------

Pages that refer to this page: `libudev(3) <../man3/libudev.3.html>`__, 
`udev_device_get_syspath(3) <../man3/udev_device_get_syspath.3.html>`__, 
`udev_device_has_tag(3) <../man3/udev_device_has_tag.3.html>`__, 
`udev_device_new_from_syspath(3) <../man3/udev_device_new_from_syspath.3.html>`__, 
`udev_enumerate_add_match_subsystem(3) <../man3/udev_enumerate_add_match_subsystem.3.html>`__, 
`udev_enumerate_scan_devices(3) <../man3/udev_enumerate_scan_devices.3.html>`__, 
`udev_list_entry(3) <../man3/udev_list_entry.3.html>`__, 
`udev_monitor_filter_update(3) <../man3/udev_monitor_filter_update.3.html>`__, 
`udev_monitor_new_from_netlink(3) <../man3/udev_monitor_new_from_netlink.3.html>`__, 
`udev_monitor_receive_device(3) <../man3/udev_monitor_receive_device.3.html>`__

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
