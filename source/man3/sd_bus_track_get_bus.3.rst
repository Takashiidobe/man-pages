.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

sd_bus_track_new(3) — Linux manual page
=======================================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `RETURN VALUE <#RETURN_VALUE>`__  |                                   |
| \|                                |                                   |
| `REFERENCE OW                     |                                   |
| NERSHIP <#REFERENCE_OWNERSHIP>`__ |                                   |
| \| `NOTES <#NOTES>`__ \|          |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `NOTES <#NOTES>`__ \|             |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   SD_BUS_TRACK_NEW(3)         sd_bus_track_new         SD_BUS_TRACK_NEW(3)

NAME
-------------------------------------------------

::

          sd_bus_track_new, sd_bus_track_ref, sd_bus_track_unref,
          sd_bus_track_unrefp, sd_bus_track_set_recursive,
          sd_bus_track_get_recursive, sd_bus_track_get_bus,
          sd_bus_track_get_userdata, sd_bus_track_set_userdata - Track bus
          peers


---------------------------------------------------------

::

          #include <systemd/sd-bus.h>

          int sd_bus_track_new(sd_bus* bus, sd_bus_track** ret,
                               sd_bus_track_handler_t handler,
                               void* userdata);

          sd_bus_track *sd_bus_track_ref(sd_bus_track *t);

          sd_bus_track *sd_bus_track_unref(sd_bus_track *t);

          void sd_bus_track_unrefp(sd_bus_track **t);

          int sd_bus_track_get_recursive(sd_bus_track *t);

          int sd_bus_track_set_recursive(sd_bus_track *t, int b);

          sd_bus* sd_bus_track_get_bus(sd_bus_track *t);

          void* sd_bus_track_get_userdata(sd_bus_track *t);

          void* sd_bus_track_set_userdata(sd_bus_track *t, void *userdata);


---------------------------------------------------------------

::

          sd_bus_track_new() creates a new bus peer tracking object. The
          object is allocated for the specified bus, and returned in the
          *ret parameter. After use, the object should be freed again by
          dropping the acquired reference with sd_bus_track_unref() (see
          below). A bus peer tracking object may be used to keep track of
          peers on a specific IPC bus, for cases where peers are making use
          of one or more local objects, in order to control the lifecycle
          of the local objects and ensure they stay around as long as the
          peers needing them are around, and unreferenced (and possibly
          destroyed) as soon as all relevant peers have vanished. Each bus
          peer tracking object may be used to track zero, one or more peers
          add a time. References to specific bus peers are added via
          sd_bus_track_add_name(3) or sd_bus_track_add_sender(). They may
          be dropped again via sd_bus_track_remove_name() and
          sd_bus_track_remove_sender(). Alternatively, references on peers
          are removed automatically when they disconnect from the bus. If
          non-NULL the handler may specify a function that is invoked
          whenever the last reference is dropped, regardless whether the
          reference is dropped explicitly via sd_bus_track_remove_name() or
          implicitly because the peer disconnected from the bus. The final
          argument userdata may be used to attach a generic user data
          pointer to the object. This pointer is passed to the handler
          callback when it is invoked.

          sd_bus_track_ref() creates a new reference to a bus peer tracking
          object. This object will not be destroyed until
          sd_bus_track_unref() has been called as many times plus once
          more. Once the reference count has dropped to zero, the specified
          object cannot be used anymore, further calls to
          sd_bus_track_ref() or sd_bus_track_unref() on the same object are
          illegal.

          sd_bus_track_unref() destroys a reference to a bus peer tracking
          object.

          sd_bus_track_unrefp() is similar to sd_bus_track_unref() but
          takes a pointer to a pointer to an sd_bus_track object. This call
          is useful in conjunction with GCC's and LLVM's Clean-up Variable
          Attribute[1]. Note that this function is defined as inline
          function.

          sd_bus_track_ref(), sd_bus_track_unref() and
          sd_bus_track_unrefp() execute no operation if the passed in bus
          peer tracking object is NULL.

          Bus peer tracking objects may exist in two modes: by default they
          operate in non-recursive mode, but may optionally be switched
          into recursive mode. If operating in the default non-recursive
          mode a peer is either tracked or not tracked. In this mode
          invoking sd_bus_track_add_name() multiple times in a row for the
          same peer is fully equivalent to calling it just once, as the
          call adds the peer to the set of tracked peers if necessary, and
          executes no operation if the peer is already being tracked. A
          single invocation of sd_bus_track_remove_name() removes the
          reference on the peer again, regardless how many times
          sd_bus_track_add_name() was called before. If operating in
          recursive mode, the number of times sd_bus_track_add_name() is
          invoked for the same peer name is counted and
          sd_bus_track_remove_name() must be called the same number of
          times before the peer is not tracked anymore, with the exception
          when the tracked peer vanishes from the bus, in which case the
          count is irrelevant and the tracking of the specific peer is
          immediately removed.  sd_bus_track_get_recursive() may be used to
          determine whether the bus peer tracking object is operating in
          recursive mode.  sd_bus_track_set_recursive() may be used to
          enable or disable recursive mode. By default a bus peer tracking
          object operates in non-recursive mode, and
          sd_bus_track_get_recursive() for a newly allocated object hence
          returns a value equal to zero. Use sd_bus_track_set_recursive()
          to enable recursive mode, right after allocation. It takes a
          boolean argument to enable or disable recursive mode. Note that
          tracking objects for which sd_bus_track_add_name() was already
          invoked at least once (and which hence track already one or more
          peers) may not be switched from recursive to non-recursive mode
          anymore.

          sd_bus_track_get_bus() returns the bus object the bus peer
          tracking object belongs to. It returns the bus object initially
          passed to sd_bus_track_new() when the object was allocated.

          sd_bus_track_get_userdata() returns the generic user data pointer
          set on the bus peer tracking object at the time of creation using
          sd_bus_track_new() or at a later time, using
          sd_bus_track_set_userdata().


-----------------------------------------------------------------

::

          On success, sd_bus_track_new() and sd_bus_track_set_recursive()
          return 0 or a positive integer. On failure, they return a
          negative errno-style error code.

          sd_bus_track_ref() always returns the argument.

          sd_bus_track_unref() always returns NULL.

          sd_bus_track_get_recursive() returns 0 if non-recursive mode is
          selected (default), and greater than 0 if recursive mode is
          selected. On failure a negative errno-style error code is
          returned.

          sd_bus_track_get_bus() returns the bus object associated to the
          bus peer tracking object.

          sd_bus_track_get_userdata() returns the generic user data pointer
          associated with the bus peer tracking object.
          sd_bus_track_set_userdata() returns the previous user data
          pointer set.


-------------------------------------------------------------------------------

::

          The sd_bus_track_new() function creates a new object and the
          caller owns the sole reference. When not needed anymore, this
          reference should be destroyed with sd_bus_track_unref().

      Errors
          Returned errors may indicate the following problems:

          -EBUSY
              Bus peers have already been added to the bus peer tracking
              object and sd_bus_track_set_recursive() was called to change
              tracking mode.

          -EINVAL
              Specified parameter is invalid (NULL in case of output
              parameters).

          -ENOMEM
              Memory allocation failed.


---------------------------------------------------

::

          These APIs are implemented as a shared library, which can be
          compiled and linked to with the libsystemd pkg-config(1) file.


---------------------------------------------------------

::

          systemd(1), sd-bus(3) sd_bus_track_add_name(3)

.. _notes-top-1:


---------------------------------------------------

::

           1. Clean-up Variable Attribute
              https://gcc.gnu.org/onlinedocs/gcc/Common-Variable-Attributes.html

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

   systemd 249                                          SD_BUS_TRACK_NEW(3)

--------------

Pages that refer to this page: `sd-bus(3) <../man3/sd-bus.3.html>`__, 
`sd_bus_slot_set_destroy_callback(3) <../man3/sd_bus_slot_set_destroy_callback.3.html>`__, 
`sd_bus_track_add_name(3) <../man3/sd_bus_track_add_name.3.html>`__

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
