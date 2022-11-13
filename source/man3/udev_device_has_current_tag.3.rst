.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

udev_device_has_tag(3) — Linux manual page
==========================================

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

   UDEV_DEVICE_HAS_TAG(3)     udev_device_has_tag    UDEV_DEVICE_HAS_TAG(3)

NAME
-------------------------------------------------

::

          udev_device_has_tag, udev_device_has_current_tag,
          udev_device_get_devlinks_list_entry,
          udev_device_get_properties_list_entry,
          udev_device_get_tags_list_entry,
          udev_device_get_current_tags_list_entry,
          udev_device_get_sysattr_list_entry,
          udev_device_get_property_value, udev_device_get_sysattr_value,
          udev_device_set_sysattr_value - Retrieve or set device attributes


---------------------------------------------------------

::

          #include <libudev.h>

          int udev_device_has_tag(struct udev_device *udev_device,
                                  const char *tag);

          int udev_device_has_current_tag(struct udev_device *udev_device,
                                          const char *tag);

          struct udev_list_entry
                                                                      *udev_device_get_devlinks_list_entry(struct udev_device *udev_device);

          struct udev_list_entry
                                                                        *udev_device_get_properties_list_entry(struct udev_device *udev_device);

          struct udev_list_entry
                                                                  *udev_device_get_tags_list_entry(struct udev_device *udev_device);

          struct udev_list_entry
                                                                          *udev_device_get_current_tags_list_entry(struct udev_device *udev_device);

          struct udev_list_entry
                                                                     *udev_device_get_sysattr_list_entry(struct udev_device *udev_device);

          const char
                                                     *udev_device_get_property_value(struct udev_device *udev_device,
                                                     const char *key);

          const char
                                                    *udev_device_get_sysattr_value(struct udev_device *udev_device,
                                                    const char *sysattr);

          int
                                            udev_device_set_sysattr_value(struct udev_device *udev_device,
                                            const char *sysattr,
                                            const char *value);


---------------------------------------------------------------

::

          udev_device_has_tag() returns a valuer larger than zero if the
          specified device object has the indicated tag assigned to it, and
          zero otherwise. See udev(7) for details on the tags concept.
          udev_device_has_current_tag() executes a similar check, however
          only determines whether the indicated tag was set as result of
          the most recent event seen for the device. Tags are "sticky",
          i.e. once set for a device they remain on the device until the
          device is unplugged, even if the rules run for later events of
          the same device do not set them anymore. Any tag for which
          udev_device_has_current_tag() returns true will hence also return
          true when passed to udev_device_has_tag(), but the opposite might
          not be true, in case a tag is no longer configured by the rules
          applied to the most recent device even.

          udev_device_get_tags_list_entry() returns a udev_list_entry
          object, encapsulating a list of tags set for the specified
          device. Similar, udev_device_get_current_tags_list_entry()
          returns a list of tags set for the specified device as effect of
          the most recent device event seen (see above for details on the
          difference).


-----------------------------------------------------------------

::

          On success, udev_device_has_tag() and
          udev_device_has_current_tag() return positive or 0, depending on
          whether the device has the given tag or not. On failure, a
          negative error code is returned.

          On success, udev_device_get_devlinks_list_entry(),
          udev_device_get_properties_list_entry(),
          udev_device_get_tags_list_entry(),
          udev_device_get_current_tags_list_entry() and
          udev_device_get_sysattr_list_entry() return a pointer to the
          first entry of the retrieved list. If that list is empty, or if
          an error occurred, NULL is returned.

          On success, udev_device_get_property_value() and
          udev_device_get_sysattr_value() return a pointer to a constant
          string of the requested value. On error, NULL is returned.
          Attributes that may contain NUL bytes should not be retrieved
          with udev_device_get_sysattr_value(); instead, read them directly
          from the files within the device's syspath.

          On success, udev_device_set_sysattr_value() returns an integer
          greater than, or equal to, 0. On failure, a negative error code
          is returned. Values that contain NUL bytes should not be set with
          this function; instead, write them directly to the files within
          the device's syspath.


---------------------------------------------------------

::

          udev(7), udev_new(3), udev_device_new_from_syspath(3),
          udev_device_get_syspath(3), udev_enumerate_new(3),
          udev_monitor_new_from_netlink(3), udev_list_entry(3), systemd(1),

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

   systemd 249                                       UDEV_DEVICE_HAS_TAG(3)

--------------

Pages that refer to this page:
`udev_device_get_syspath(3) <../man3/udev_device_get_syspath.3.html>`__, 
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
