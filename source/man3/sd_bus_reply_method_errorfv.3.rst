.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

sd_bus_reply_method_error(3) — Linux manual page
================================================

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

   SD_BUS_REPLY_METHOD_ERROR(3)us_reply_method_errorS_REPLY_METHOD_ERROR(3)

NAME
-------------------------------------------------

::

          sd_bus_reply_method_error, sd_bus_reply_method_errorf,
          sd_bus_reply_method_errorfv, sd_bus_reply_method_errno,
          sd_bus_reply_method_errnof, sd_bus_reply_method_errnofv - Reply
          with an error to a D-Bus method call


---------------------------------------------------------

::

          #include <systemd/sd-bus.h>

          int sd_bus_reply_method_error(sd_bus_message *call,
                                        const sd_bus_error *e);

          int sd_bus_reply_method_errorf(sd_bus_message *call,
                                         const char *name,
                                         const char *format, ...);

          int sd_bus_reply_method_errorfv(sd_bus_message *call,
                                          const char *name,
                                          const char *format, va_list ap);

          int sd_bus_reply_method_errno(sd_bus_message *call, int error,
                                        const sd_bus_error *p);

          int sd_bus_reply_method_errnof(sd_bus_message *call, int error,
                                         const char *format, ...);

          int sd_bus_reply_method_errnofv(sd_bus_message *call, int error,
                                          const char *format, va_list ap);


---------------------------------------------------------------

::

          The sd_bus_reply_method_error() function sends an error reply to
          the call message. The error structure e specifies the error to
          send, and is used as described in
          sd_bus_message_new_method_error(3). If no reply is expected to
          call, this function succeeds without sending a reply.

          The sd_bus_reply_method_errorf() is to
          sd_bus_reply_method_error() what
          sd_bus_message_new_method_errorf() is to
          sd_bus_message_new_method_error().

          The sd_bus_reply_method_errno() is to sd_bus_reply_method_error()
          what sd_bus_message_new_method_errno() is to
          sd_bus_message_new_method_error().

          The sd_bus_reply_method_errnof() is to
          sd_bus_reply_method_error() what
          sd_bus_message_new_method_errnof() is to
          sd_bus_message_new_method_error().


-----------------------------------------------------------------

::

          This function returns a non-negative integer if the error reply
          was successfully sent or if call does not expect a reply. On
          failure, it returns a negative errno-style error code.

      Errors
          Returned errors may indicate the following problems:

          -EINVAL
              The input parameter call is NULL.

              Message call is not a method call message.

              Message call is not attached to a bus.

              The error parameter e to sd_bus_reply_method_error() is not
              set, see sd_bus_error_is_set(3).

          -EPERM
              Message call has been sealed.

          -ENOTCONN
              The bus to which message call is attached is not connected.

          -ENOMEM
              Memory allocation failed.

          In addition, any error returned by sd_bus_send(1) may be
          returned.


---------------------------------------------------

::

          These APIs are implemented as a shared library, which can be
          compiled and linked to with the libsystemd pkg-config(1) file.


---------------------------------------------------------

::

          systemd(1), sd-bus(3), sd_bus_message_new_method_error(3)

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

   systemd 249                                 SD_BUS_REPLY_METHOD_ERROR(3)

--------------

Pages that refer to this page: `sd-bus(3) <../man3/sd-bus.3.html>`__, 
`sd_bus_add_object(3) <../man3/sd_bus_add_object.3.html>`__

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
