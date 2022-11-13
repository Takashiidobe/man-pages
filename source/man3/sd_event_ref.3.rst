.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

sd_event_new(3) — Linux manual page
===================================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `RETURN VALUE <#RETURN_VALUE>`__  |                                   |
| \| `NOTES <#NOTES>`__ \|          |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `NOTES <#NOTES>`__ \|             |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   SD_EVENT_NEW(3)               sd_event_new               SD_EVENT_NEW(3)

NAME
-------------------------------------------------

::

          sd_event_new, sd_event_default, sd_event_ref, sd_event_unref,
          sd_event_unrefp, sd_event_get_tid, sd_event - Acquire and release
          an event loop object


---------------------------------------------------------

::

          #include <systemd/sd-event.h>

          typedef struct sd_event sd_event;

          int sd_event_new(sd_event **event);

          int sd_event_default(sd_event **event);

          sd_event *sd_event_ref(sd_event *event);

          sd_event *sd_event_unref(sd_event *event);

          void sd_event_unrefp(sd_event **event);

          int sd_event_get_tid(sd_event *event, pid_t *tid);


---------------------------------------------------------------

::

          sd_event_new() allocates a new event loop object. The event loop
          object is returned in the event parameter. After use, drop the
          returned reference with sd_event_unref(). When the last reference
          is dropped, the object is freed.

          sd_event_default() acquires a reference to the default event loop
          object of the calling thread, possibly allocating a new object if
          no default event loop object has been allocated yet for the
          thread. After use, drop the returned reference with
          sd_event_unref(). When the last reference is dropped, the event
          loop is freed. If this function is called while the object
          returned from a previous call from the same thread is still
          referenced, the same object is returned again, but the reference
          is increased by one. It is recommended to use this call instead
          of sd_event_new() in order to share event loop objects between
          various components that are dispatched in the same thread. All
          threads have exactly either zero or one default event loop
          objects associated, but never more.

          After allocating an event loop object, add event sources to it
          with sd_event_add_io(3), sd_event_add_time(3),
          sd_event_add_signal(3), sd_event_add_child(3),
          sd_event_add_inotify(3), sd_event_add_defer(3),
          sd_event_add_post(3) or sd_event_add_exit(3), and then execute
          the event loop using sd_event_loop(3).

          sd_event_ref() increases the reference count of the specified
          event loop object by one.

          sd_event_unref() decreases the reference count of the specified
          event loop object by one. If the count hits zero, the object is
          freed. Note that it is freed regardless of whether it is the
          default event loop object for a thread or not. This means that
          allocating an event loop with sd_event_default(), then releasing
          it, and then acquiring a new one with sd_event_default() will
          result in two distinct objects. Note that, in order to free an
          event loop object, all remaining event sources of the event loop
          also need to be freed as each keeps a reference to it.

          sd_event_unrefp() is similar to sd_event_unref() but takes a
          pointer to a pointer to an sd_event object. This call is useful
          in conjunction with GCC's and LLVM's Clean-up Variable
          Attribute[1]. Note that this function is defined as inline
          function. Use a declaration like the following, in order to
          allocate an event loop object that is freed automatically as the
          code block is left:

              {
                      __attribute__((cleanup(sd_event_unrefp))) sd_event *event = NULL;
                      int r;
                      ...
                      r = sd_event_default(&event);
                      if (r < 0)
                              fprintf(stderr, "Failed to allocate event loop: %s\n", strerror(-r));
                      ...
              }

          sd_event_ref(), sd_event_unref() and sd_event_unrefp() execute no
          operation if the passed in event loop object is NULL.

          sd_event_get_tid() retrieves the thread identifier ("TID") of the
          thread the specified event loop object is associated with. This
          call is only supported for event loops allocated with
          sd_event_default(), and returns the identifier for the thread the
          event loop is the default event loop of. See gettid(2) for more
          information on thread identifiers.


-----------------------------------------------------------------

::

          On success, sd_event_new(), sd_event_default() and
          sd_event_get_tid() return 0 or a positive integer. On failure,
          they return a negative errno-style error code.  sd_event_ref()
          always returns a pointer to the event loop object passed in.
          sd_event_unref() always returns NULL.

      Errors
          Returned errors may indicate the following problems:

          -ENOMEM
              Not enough memory to allocate the object.

          -EMFILE
              The maximum number of event loops has been allocated.

          -ENXIO
              sd_event_get_tid() was invoked on an event loop object that
              was not allocated with sd_event_default().


---------------------------------------------------

::

          These APIs are implemented as a shared library, which can be
          compiled and linked to with the libsystemd pkg-config(1) file.


---------------------------------------------------------

::

          systemd(1), sd-event(3), sd_event_add_io(3),
          sd_event_add_time(3), sd_event_add_signal(3),
          sd_event_add_child(3), sd_event_add_inotify(3),
          sd_event_add_defer(3), sd_event_run(3), gettid(2)

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

   systemd 249                                              SD_EVENT_NEW(3)

--------------

Pages that refer to this page:
`sd-event(3) <../man3/sd-event.3.html>`__, 
`sd_event_add_child(3) <../man3/sd_event_add_child.3.html>`__, 
`sd_event_add_defer(3) <../man3/sd_event_add_defer.3.html>`__, 
`sd_event_add_inotify(3) <../man3/sd_event_add_inotify.3.html>`__, 
`sd_event_add_io(3) <../man3/sd_event_add_io.3.html>`__, 
`sd_event_add_signal(3) <../man3/sd_event_add_signal.3.html>`__, 
`sd_event_add_time(3) <../man3/sd_event_add_time.3.html>`__, 
`sd_event_exit(3) <../man3/sd_event_exit.3.html>`__, 
`sd_event_get_fd(3) <../man3/sd_event_get_fd.3.html>`__, 
`sd_event_now(3) <../man3/sd_event_now.3.html>`__, 
`sd_event_run(3) <../man3/sd_event_run.3.html>`__, 
`sd_event_set_watchdog(3) <../man3/sd_event_set_watchdog.3.html>`__, 
`sd_event_wait(3) <../man3/sd_event_wait.3.html>`__

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
