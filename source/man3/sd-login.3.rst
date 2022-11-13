.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

sd-login(3) — Linux manual page
===============================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `DEFINITION O                     |                                   |
| F TERMS <#DEFINITION_OF_TERMS>`__ |                                   |
| \| `UDEV RULES <#UDEV_RULES>`__   |                                   |
| \| `NOTES <#NOTES>`__ \|          |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `NOTES <#NOTES>`__ \|             |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   SD-LOGIN(3)                     sd-login                     SD-LOGIN(3)

NAME
-------------------------------------------------

::

          sd-login - APIs for tracking logins


---------------------------------------------------------

::

          #include <systemd/sd-login.h>

          pkg-config --cflags --libs libsystemd


---------------------------------------------------------------

::

          sd-login.h provides APIs to introspect and monitor seat, login
          session and user status information on the local system.

          Note that these APIs only allow purely passive access and
          monitoring of seats, sessions and users. To actively make changes
          to the seat configuration, terminate login sessions, or switch
          session on a seat you need to utilize the D-Bus API of
          systemd-logind, instead.

          These functions synchronously access data in /proc/,
          /sys/fs/cgroup/ and /run/. All of these are virtual file systems,
          hence the runtime cost of the accesses is relatively cheap.

          It is possible (and often a very good choice) to mix calls to the
          synchronous interface of sd-login.h with the asynchronous D-Bus
          interface of systemd-logind. However, if this is done you need to
          think a bit about possible races since the stream of events from
          D-Bus and from sd-login.h interfaces such as the login monitor
          are asynchronous and not ordered against each other.

          If the functions return string arrays, these are generally NULL
          terminated and need to be freed by the caller with the libc
          free(3) call after use, including the strings referenced therein.
          Similarly, individual strings returned need to be freed, as well.

          As a special exception, instead of an empty string array NULL may
          be returned, which should be treated equivalent to an empty
          string array.

          See sd_pid_get_session(3), sd_uid_get_state(3),
          sd_session_is_active(3), sd_seat_get_active(3), sd_get_seats(3),
          sd_login_monitor_new(3) for more information about the functions
          implemented.


-------------------------------------------------------------------------------

::

          seat
              A seat consists of all hardware devices assigned to a
              specific workplace. It consists of at least one graphics
              device, and usually also includes keyboard, mouse. It can
              also include video cameras, sound cards and more. Seats are
              identified by seat names, which are strings (<= 255
              characters), that start with the four characters "seat"
              followed by at least one character from the range
              [a-zA-Z0-9], "_" and "-". They are suitable for use as file
              names. Seat names may or may not be stable and may be reused
              if a seat becomes available again.

          session
              A session is defined by the time a user is logged in until
              they log out. A session is bound to one or no seats (the
              latter for 'virtual' ssh logins). Multiple sessions can be
              attached to the same seat, but only one of them can be
              active, the others are in the background. A session is
              identified by a short string.

              systemd(1) ensures that audit sessions are identical to
              systemd sessions, and uses the audit session ID as session ID
              in systemd (if auditing is enabled). In general the session
              identifier is a short string consisting only of [a-zA-Z0-9],
              "_" and "-", suitable for use as a file name. Session IDs are
              unique on the local machine and are never reused as long as
              the machine is online. A user (the way we know it on UNIX)
              corresponds to the person using a computer. A single user can
              have multiple sessions open at the same time. A user is
              identified by a numeric user id (UID) or a user name (a
              string). A multi-session system allows multiple user sessions
              on the same seat at the same time. A multi-seat system allows
              multiple independent seats that can be individually and
              simultaneously used by different users.

          All hardware devices that are eligible to being assigned to a
          seat, are assigned to one. A device can be assigned to only one
          seat at a time. If a device is not assigned to any particular
          other seat it is implicitly assigned to the special default seat
          called "seat0".

          Note that hardware like printers, hard disks or network cards is
          generally not assigned to a specific seat. They are available to
          all seats equally. (Well, with one exception: USB sticks can be
          assigned to a seat.)

          "seat0" always exists.


-------------------------------------------------------------

::

          Assignment of hardware devices to seats is managed inside the
          udev database, via settings on the devices:

          Tag "seat"
              When set, a device is eligible to be assigned to a seat. This
              tag is set for graphics devices, mice, keyboards, video
              cards, sound cards and more. Note that some devices like
              sound cards consist of multiple subdevices (i.e. a PCM for
              input and another one for output). This tag will be set only
              for the originating device, not for the individual
              subdevices. A UI for configuring assignment of devices to
              seats should enumerate and subscribe to all devices with this
              tag set and show them in the UI. Note that USB hubs can be
              assigned to a seat as well, in which case all (current and
              future) devices plugged into it will also be assigned to the
              same seat (unless they are explicitly assigned to another
              seat).

          Tag "master-of-seat"
              When set, this device is enough for a seat to be considered
              existent. This tag is usually set for the framebuffer device
              of graphics cards. A seat hence consists of an arbitrary
              number of devices marked with the "seat" tag, but (at least)
              one of these devices needs to be tagged with "master-of-seat"
              before the seat is actually considered to be around.

          Property ID_SEAT
              This property specifies the name of the seat a specific
              device is assigned to. If not set the device is assigned to
              "seat0". Also, to speed up enumeration of hardware belonging
              to a specific seat, the seat is also set as tag on the
              device. I.e. if the property ID_SEAT=seat-waldo is set for a
              device, the tag "seat-waldo" will be set as well. Note that
              if a device is assigned to "seat0", it will usually not carry
              such a tag and you need to enumerate all devices and check
              the ID_SEAT property manually. Again, if a device is assigned
              to seat0 this is visible on the device in two ways: with a
              property ID_SEAT=seat0 and with no property ID_SEAT set for
              it at all.

          Property ID_AUTOSEAT
              When set to "1", this device automatically generates a new
              and independent seat, which is named after the path of the
              device. This is set for specialized USB hubs like the
              Pluggable devices, which when plugged in should create a
              hotplug seat without further configuration.

          Property ID_FOR_SEAT
              When creating additional (manual) seats starting from a
              graphics device this is a good choice to name the seat after.
              It is created from the path of the device. This is useful in
              UIs for configuring seats: as soon as you create a new seat
              from a graphics device, read this property and prefix it with
              "seat-" and use it as name for the seat.

          A seat exists only and exclusively because a properly tagged
          device with the right ID_SEAT property exists. Besides udev rules
          there is no persistent data about seats stored on disk.

          Note that systemd-logind(8) manages ACLs on a number of device
          classes, to allow user code to access the device nodes attached
          to a seat as long as the user has an active session on it. This
          is mostly transparent to applications. As mentioned above, for
          certain user software it might be a good idea to watch whether
          they can access device nodes instead of thinking about seats.


---------------------------------------------------

::

          These APIs are implemented as a shared library, which can be
          compiled and linked to with the libsystemd pkg-config(1) file.


---------------------------------------------------------

::

          systemd(1), sd_pid_get_session(3), sd_uid_get_state(3),
          sd_session_is_active(3), sd_seat_get_active(3), sd_get_seats(3),
          sd_login_monitor_new(3), sd-daemon(3), pkg-config(1)

          Multi-Seat on Linux[1] may also be of historical interest.

.. _notes-top-1:


---------------------------------------------------

::

           1. Multi-Seat on Linux
              https://www.freedesktop.org/wiki/Software/systemd/multiseat

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

   systemd 249                                                  SD-LOGIN(3)

--------------

Pages that refer to this page:
`sd_get_seats(3) <../man3/sd_get_seats.3.html>`__, 
`sd_login_monitor_new(3) <../man3/sd_login_monitor_new.3.html>`__, 
`sd_machine_get_class(3) <../man3/sd_machine_get_class.3.html>`__, 
`sd_pid_get_owner_uid(3) <../man3/sd_pid_get_owner_uid.3.html>`__, 
`sd_seat_get_active(3) <../man3/sd_seat_get_active.3.html>`__, 
`sd_session_is_active(3) <../man3/sd_session_is_active.3.html>`__, 
`sd_uid_get_state(3) <../man3/sd_uid_get_state.3.html>`__, 
`org.freedesktop.login1(5) <../man5/org.freedesktop.login1.5.html>`__, 
`systemd-logind.service(8) <../man8/systemd-logind.service.8.html>`__, 
`systemd-machined.service(8) <../man8/systemd-machined.service.8.html>`__

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
