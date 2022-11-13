.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

udev_device_get_syspath(3) — Linux manual page
==============================================

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

   UDEV_DEVICE_GET_SYSPATH(3)dev_device_get_syspathEV_DEVICE_GET_SYSPATH(3)

NAME
-------------------------------------------------

::

          udev_device_get_syspath, udev_device_get_sysname,
          udev_device_get_sysnum, udev_device_get_devpath,
          udev_device_get_devnode, udev_device_get_devnum,
          udev_device_get_devtype, udev_device_get_subsystem,
          udev_device_get_driver, udev_device_get_udev,
          udev_device_get_parent,
          udev_device_get_parent_with_subsystem_devtype,
          udev_device_get_is_initialized, udev_device_get_action - Query
          device properties


---------------------------------------------------------

::

          #include <libudev.h>

          const char
                                              *udev_device_get_syspath(struct udev_device *udev_device);

          const char
                                              *udev_device_get_sysname(struct udev_device *udev_device);

          const char
                                             *udev_device_get_sysnum(struct udev_device *udev_device);

          const char
                                              *udev_device_get_devpath(struct udev_device *udev_device);

          const char
                                              *udev_device_get_devnode(struct udev_device *udev_device);

          dev_t udev_device_get_devnum(struct udev_device *udev_device);

          const char
                                              *udev_device_get_devtype(struct udev_device *udev_device);

          const char
                                                *udev_device_get_subsystem(struct udev_device *udev_device);

          const char
                                             *udev_device_get_driver(struct udev_device *udev_device);

          struct udev
                                            *udev_device_get_udev(struct udev_device *udev_device);

          struct udev_device
                                                     *udev_device_get_parent(struct udev_device *udev_device);

          struct udev_device
                                                                            *udev_device_get_parent_with_subsystem_devtype(struct udev_device *udev_device,
                                                                            const char *subsystem,
                                                                            const char *devtype);

          int
                                             udev_device_get_is_initialized(struct udev_device *udev_device);

          const char
                                             *udev_device_get_action(struct udev_device *udev_device);


-----------------------------------------------------------------

::

          On success, udev_device_get_syspath(), udev_device_get_sysname(),
          udev_device_get_sysnum(), udev_device_get_devpath(),
          udev_device_get_devnode(), udev_device_get_devtype(),
          udev_device_get_subsystem(), udev_device_get_driver() and
          udev_device_get_action() return a pointer to a constant string
          that describes the requested property. The lifetime of this
          string is bound to the device it was requested on. On failure,
          each function may return NULL.

          On success, udev_device_get_devnum() returns the device type of
          the passed device. On failure, a device type with minor and major
          number set to 0 is returned.

          udev_device_get_udev() always returns a valid pointer to the udev
          context that this device belongs to.

          On success, udev_device_get_parent() and
          udev_device_get_parent_with_subsystem_devtype() return a pointer
          to the parent device. No additional reference to this device is
          acquired, but the child device owns a reference to such a parent
          device. On failure, NULL is returned.

          On success, udev_device_get_is_initialized() returns either 1 or
          0, depending on whether the passed device has already been
          initialized by udev or not. On failure, a negative error code is
          returned. Note that devices for which no udev rules are defined
          are never reported initialized.


---------------------------------------------------------

::

          udev_new(3), udev_device_new_from_syspath(3),
          udev_device_has_tag(3), udev_enumerate_new(3),
          udev_monitor_new_from_netlink(3), udev_list_entry(3), systemd(1)

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

   systemd 249                                   UDEV_DEVICE_GET_SYSPATH(3)

--------------

Pages that refer to this page:
`udev_device_has_tag(3) <../man3/udev_device_has_tag.3.html>`__, 
`udev_device_new_from_syspath(3) <../man3/udev_device_new_from_syspath.3.html>`__

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
