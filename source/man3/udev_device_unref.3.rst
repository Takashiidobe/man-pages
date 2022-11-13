.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

udev_device_new_from_syspath(3) — Linux manual page
===================================================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `RETURN VALUE <#RETURN_VALUE>`__  |                                   |
| \| `SEE ALSO <#SEE_ALSO>`__ \|    |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   UDEV_DEVICE_NEW_FROM_SYSPATH(3)ce_new_from_syspathCE_NEW_FROM_SYSPATH(3)

NAME
-------------------------------------------------

::

          udev_device_new_from_syspath, udev_device_new_from_devnum,
          udev_device_new_from_subsystem_sysname,
          udev_device_new_from_device_id, udev_device_new_from_environment,
          udev_device_ref, udev_device_unref - Create, acquire and release
          a udev device object


---------------------------------------------------------

::

          #include <libudev.h>

          struct udev_device
                                                           *udev_device_new_from_syspath(struct udev *udev,
                                                           const char *syspath);

          struct udev_device
                                                          *udev_device_new_from_devnum(struct udev *udev,
                                                          char type,
                                                          dev_t devnum);

          struct udev_device
                                                                     *udev_device_new_from_subsystem_sysname(struct udev *udev,
                                                                     const char *subsystem,
                                                                     const char *sysname);

          struct udev_device
                                                             *udev_device_new_from_device_id(struct udev *udev,
                                                             const char *id);

          struct udev_device
                                                               *udev_device_new_from_environment(struct udev *udev);

          struct udev_device
                                              *udev_device_ref(struct udev_device *udev_device);

          struct udev_device
                                                *udev_device_unref(struct udev_device *udev_device);


---------------------------------------------------------------

::

          udev_device_new_from_syspath(), udev_device_new_from_devnum(),
          udev_device_new_from_subsystem_sysname(),
          udev_device_new_from_device_id(), and
          udev_device_new_from_environment() allocate a new udev device
          object and returns a pointer to it. This object is opaque and
          must not be accessed by the caller via different means than
          functions provided by libudev. Initially, the reference count of
          the device is 1. You can acquire further references, and drop
          gained references via udev_device_ref() and udev_device_unref().
          Once the reference count hits 0, the device object is destroyed
          and freed.

          udev_device_new_from_syspath(), udev_device_new_from_devnum(),
          udev_device_new_from_subsystem_sysname(), and
          udev_device_new_from_device_id() create the device object based
          on information found in /sys/, annotated with properties from the
          udev-internal device database. A syspath is any subdirectory of
          /sys/, with the restriction that a subdirectory of /sys/devices
          (or a symlink to one) represents a real device and as such must
          contain a uevent file.  udev_device_new_from_devnum() takes a
          device type, which can be b for block devices or c for character
          devices, as well as a devnum (see makedev(3)).
          udev_device_new_from_subsystem_sysname() looks up devices based
          on the provided subsystem and sysname (see
          udev_device_get_subsystem(3) and udev_device_get_sysname(3)) and
          udev_device_new_from_device_id() looks up devices based on the
          provided device ID, which is a special string in one of the
          following four forms:

          Table 1. Device ID strings
          ┌──────────────┬──────────────────────────┐
          │Example       │ Explanation              │
          ├──────────────┼──────────────────────────┤
          │b8:2          │ block device major:minor │
          ├──────────────┼──────────────────────────┤
          │c128:1        │ char device major:minor  │
          ├──────────────┼──────────────────────────┤
          │n3            │ network device ifindex   │
          ├──────────────┼──────────────────────────┤
          │+sound:card29 │ kernel driver core       │
          │              │ subsystem:device name    │
          └──────────────┴──────────────────────────┘

          udev_device_new_from_environment() creates a device from the
          current environment (see environ(7)). Each key-value pair is
          interpreted in the same way as if it was received in an uevent
          (see udev_monitor_receive_device(3)). The keys DEVPATH,
          SUBSYSTEM, ACTION, and SEQNUM are mandatory.


-----------------------------------------------------------------

::

          On success, udev_device_new_from_syspath(),
          udev_device_new_from_devnum(),
          udev_device_new_from_subsystem_sysname(),
          udev_device_new_from_device_id() and
          udev_device_new_from_environment() return a pointer to the
          allocated udev device. On failure, NULL is returned, and errno is
          set appropriately.  udev_device_ref() returns the argument that
          it was passed, unmodified.  udev_device_unref() always returns
          NULL.


---------------------------------------------------------

::

          udev_new(3), udev_device_get_syspath(3), udev_device_has_tag(3),
          udev_enumerate_new(3), udev_monitor_new_from_netlink(3),
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

   systemd 249                              UDEV_DEVICE_NEW_FROM_SYSPATH(3)

--------------

Pages that refer to this page: `libudev(3) <../man3/libudev.3.html>`__, 
`udev_device_get_syspath(3) <../man3/udev_device_get_syspath.3.html>`__, 
`udev_device_has_tag(3) <../man3/udev_device_has_tag.3.html>`__, 
`udev_enumerate_add_match_subsystem(3) <../man3/udev_enumerate_add_match_subsystem.3.html>`__, 
`udev_enumerate_new(3) <../man3/udev_enumerate_new.3.html>`__, 
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
