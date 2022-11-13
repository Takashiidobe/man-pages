.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

sd_bus_call(3) — Linux manual page
==================================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `RETURN VALUE <#RETURN_VALUE>`__  |                                   |
| \| `NOTES <#NOTES>`__ \|          |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   SD_BUS_CALL(3)                 sd_bus_call                SD_BUS_CALL(3)

NAME
-------------------------------------------------

::

          sd_bus_call, sd_bus_call_async - Invoke a D-Bus method call


---------------------------------------------------------

::

          #include <systemd/sd-bus.h>

          typedef int (*sd_bus_message_handler_t)(sd_bus_message *m,
                                                  void *userdata,
                                                  sd_bus_error *ret_error);

          int sd_bus_call(sd_bus *bus, sd_bus_message *m, uint64_t usec,
                          sd_bus_error *ret_error, sd_bus_message **reply);

          int sd_bus_call_async(sd_bus *bus, sd_bus_slot **slot,
                                sd_bus_message *m,
                                sd_bus_message_handler_t callback,
                                void *userdata, uint64_t usec);


---------------------------------------------------------------

::

          sd_bus_call() takes a complete bus message object and calls the
          corresponding D-Bus method. On success, the response is stored in
          reply.  usec indicates the timeout in microseconds. If ret_error
          is not NULL and sd_bus_call() fails (either because of an
          internal error or because it received a D-Bus error reply),
          ret_error is initialized to an instance of sd_bus_error
          describing the error.

          sd_bus_call_async() is like sd_bus_call() but works
          asynchronously. The callback indicates the function to call when
          the response arrives. The userdata pointer will be passed to the
          callback function, and may be chosen freely by the caller. If
          slot is not NULL and sd_bus_call_async() succeeds, slot is set to
          a slot object which can be used to cancel the method call at a
          later time using sd_bus_slot_unref(3). If slot is NULL, the
          lifetime of the method call is bound to the lifetime of the bus
          object itself, and it cannot be cancelled independently. See
          sd_bus_slot_set_floating(3) for details.  callback is called when
          a reply arrives with the reply, userdata and an sd_bus_error
          output parameter as its arguments. Unlike sd_bus_call(), the
          sd_bus_error output parameter passed to the callback will be
          empty. To determine whether the method call succeeded, use
          sd_bus_message_is_method_error(3) on the reply message passed to
          the callback instead. If the callback returns zero and the
          sd_bus_error output parameter is still empty when the callback
          finishes, other handlers registered with functions such as
          sd_bus_add_filter(3) or sd_bus_add_match(3) are given a chance to
          process the message. If the callback returns a non-zero value or
          the sd_bus_error output parameter is not empty when the callback
          finishes, no further processing of the message is done.
          Generally, you want to return zero from the callback to give
          other registered handlers a chance to process the reply as well.
          (Note that the sd_bus_error parameter is an output parameter of
          the callback function, not an input parameter; it can be used to
          propagate errors from the callback handler, it will not receive
          any error that was received as method reply.)

          The message m passed to the callback is only borrowed, that is,
          the callback should not call sd_bus_message_unref(3) on it. If
          the callback wants to hold on to the message beyond the lifetime
          of the callback, it needs to call sd_bus_message_ref(3) to create
          a new reference.

          If usec is zero, the default D-Bus method call timeout is used.
          See sd_bus_get_method_call_timeout(3).


-----------------------------------------------------------------

::

          On success, these functions return a non-negative integer. On
          failure, they return a negative errno-style error code.

      Errors
          When sd_bus_call() internally receives a D-Bus error reply, it
          will set ret_error if it is not NULL, and will return a negative
          value mapped from the error reply, see sd_bus_error_get_errno(3).

          Returned errors may indicate the following problems:

          -EINVAL
              The input parameter m is NULL.  The input parameter m is not
              a D-Bus method call. To create a new D-Bus method call, use
              sd_bus_message_new_method_call(3).  The input parameter m has
              the BUS_MESSAGE_NO_REPLY_EXPECTED flag set.  The input
              parameter error is non-NULL but was not set to
              SD_BUS_ERROR_NULL.

          -ECHILD
              The bus connection was allocated in a parent process and is
              being reused in a child process after fork().

          -ENOTCONN
              The input parameter bus is NULL or the bus is not connected.

          -ECONNRESET
              The bus connection was closed while waiting for the response.

          -ETIMEDOUT
              A response was not received within the given timeout.

          -ELOOP
              The message m is addressed to its own client.

          -ENOMEM
              Memory allocation failed.


---------------------------------------------------

::

          These APIs are implemented as a shared library, which can be
          compiled and linked to with the libsystemd pkg-config(1) file.


---------------------------------------------------------

::

          systemd(1), sd-bus(3), sd_bus_call_method(3),
          sd_bus_call_method_async(3), sd_bus_message_new_method_call(3),
          sd_bus_message_append(3), sd_bus_error(3)

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

   systemd 249                                               SD_BUS_CALL(3)

--------------

Pages that refer to this page: `sd-bus(3) <../man3/sd-bus.3.html>`__, 
`sd_bus_call_method(3) <../man3/sd_bus_call_method.3.html>`__, 
`sd_bus_message_new_method_call(3) <../man3/sd_bus_message_new_method_call.3.html>`__, 
`sd_bus_message_seal(3) <../man3/sd_bus_message_seal.3.html>`__, 
`sd_bus_set_method_call_timeout(3) <../man3/sd_bus_set_method_call_timeout.3.html>`__, 
`sd_bus_set_watch_bind(3) <../man3/sd_bus_set_watch_bind.3.html>`__, 
`sd_bus_slot_set_userdata(3) <../man3/sd_bus_slot_set_userdata.3.html>`__, 
`sd_bus_start(3) <../man3/sd_bus_start.3.html>`__

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
