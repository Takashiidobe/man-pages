.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

udev_monitor_receive_device(3) — Linux manual page
==================================================

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

   UDEV_MONITOR_RECEIVE_DEVICE(3)nitor_receive_deviceITOR_RECEIVE_DEVICE(3)

NAME
-------------------------------------------------

::

          udev_monitor_receive_device, udev_monitor_enable_receiving,
          udev_monitor_set_receive_buffer_size, udev_monitor_get_fd,
          udev_monitor_get_udev - Query and modify device monitor


---------------------------------------------------------

::

          #include <libudev.h>

          struct udev_device
                                                          *udev_monitor_receive_device(struct udev_monitor *udev_monitor);

          int
                                            udev_monitor_enable_receiving(struct udev_monitor *udev_monitor);

          int
                                                   udev_monitor_set_receive_buffer_size(struct udev_monitor *udev_monitor,
                                                   int size);

          int udev_monitor_get_fd(struct udev_monitor *udev_monitor);

          struct udev
                                             *udev_monitor_get_udev(struct udev_monitor *udev_monitor);


-----------------------------------------------------------------

::

          On success, udev_monitor_receive_device() returns a pointer to a
          newly referenced device that was received via the monitor. The
          caller is responsible to drop this reference when done. On
          failure, NULL is returned.

          On success, udev_monitor_enable_receiving() and
          udev_monitor_set_receive_buffer_size() return an integer greater
          than, or equal to, 0. On failure, a negative error code is
          returned.

          On success, udev_monitor_get_fd() returns the file descriptor
          used by this monitor. On failure, a negative error code is
          returned.

          udev_monitor_get_udev() always returns a pointer to the udev
          context that this monitor is associated with.


---------------------------------------------------------

::

          udev_new(3), udev_device_new_from_syspath(3),
          udev_enumerate_new(3), udev_monitor_new_from_netlink(3),
          udev_monitor_filter_update(3), udev_list_entry(3), systemd(1),

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

   systemd 249                               UDEV_MONITOR_RECEIVE_DEVICE(3)

--------------

Pages that refer to this page:
`udev_device_new_from_syspath(3) <../man3/udev_device_new_from_syspath.3.html>`__, 
`udev_monitor_filter_update(3) <../man3/udev_monitor_filter_update.3.html>`__, 
`udev_monitor_new_from_netlink(3) <../man3/udev_monitor_new_from_netlink.3.html>`__

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
