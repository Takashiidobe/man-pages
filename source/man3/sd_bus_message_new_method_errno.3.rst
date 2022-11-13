.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

sd_bus_message_new_method_error(3) — Linux manual page
======================================================

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

   SD_BUS_MESSAGE_NEW_METHOD_ERROR(3)e_new_method_error_NEW_METHOD_ERROR(3)

NAME
-------------------------------------------------

::

          sd_bus_message_new_method_error,
          sd_bus_message_new_method_errorf,
          sd_bus_message_new_method_errno, sd_bus_message_new_method_errnof
          - Create an error reply for a method call


---------------------------------------------------------

::

          #include <systemd/sd-bus.h>

          int sd_bus_message_new_method_error(sd_bus_message *call,
                                              sd_bus_message **m,
                                              const sd_bus_error *e);

          int sd_bus_message_new_method_errorf(sd_bus_message *call,
                                               sd_bus_message **m,
                                               const char *name,
                                               const char *format, ...);

          int sd_bus_message_new_method_errno(sd_bus_message *call,
                                              sd_bus_message **m,
                                              int error,
                                              const sd_bus_error *p);

          int sd_bus_message_new_method_errnof(sd_bus_message *call,
                                               sd_bus_message **m,
                                               int error,
                                               const char *format, ...);


---------------------------------------------------------------

::

          The sd_bus_message_new_method_error() function creates a new bus
          message object that is an error reply to the call message, and
          returns it in the m output parameter. The error information from
          error e is appended: the name field of e is used as the error
          identifier in the reply header (for example an error name such as
          "org.freedesktop.DBus.Error.NotSupported" or the equivalent
          symbolic SD_BUS_ERROR_NOT_SUPPORTED), and the message field is
          set as the human readable error message string if present. The
          error e must have the name field set, see sd_bus_error_is_set(3).

          The sd_bus_message_new_method_errorf() function creates an error
          reply similarly to sd_bus_message_new_method_error(), but instead
          of a ready error structure, it takes an error identifier string
          name, plus a printf(3) format string format and corresponding
          arguments. An error reply is sent with the error identifier name
          and the formatted string as the message.  name and format must
          not be NULL.

          The sd_bus_message_new_method_errno() function creates an error
          reply similarly to sd_bus_message_new_method_error(), but in
          addition to the error structure p, it takes an errno(3) error
          value in parameter error. If the error p is set (see
          sd_bus_error_is_set(3)), it is used in the reply. Otherwise,
          error is translated to an error identifier and used to create a
          new error structure using sd_bus_error_set_errno(3) and that is
          used in the reply. (If error is zero, no error is actually set,
          and an error reply with no information is created.)

          The sd_bus_message_new_method_errnof() function creates an error
          reply similarly to sd_bus_message_new_method_error(). It takes an
          errno(3) error value in parameter error, plus a printf(3) format
          string format and corresponding arguments.  "%m" may be used in
          the format string to refer to the error string corresponding to
          the specified errno code. The error message is initialized using
          the error identifier generated from error and the formatted
          string. (If error is zero, no error is actually set, and an error
          reply with no information is created.)


-----------------------------------------------------------------

::

          These functions return 0 if the error reply was successfully
          created, and a negative errno-style error code otherwise.

      Errors
          Returned errors may indicate the following problems:

          -EINVAL
              The call message call or the output parameter m are NULL.

              Message call is not a method call message.

              The error e parameter to sd_bus_message_new_method_error() is
              not set, see sd_bus_error_is_set(3).

          -EPERM
              Message call has been sealed.

          -ENOTCONN
              The bus to which message call is attached is not connected.

          -ENOMEM
              Memory allocation failed.


---------------------------------------------------

::

          These APIs are implemented as a shared library, which can be
          compiled and linked to with the libsystemd pkg-config(1) file.


---------------------------------------------------------

::

          systemd(1), sd-bus(3)

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

   systemd 249                           SD_BUS_MESSAGE_NEW_METHOD_ERROR(3)

--------------

Pages that refer to this page: `sd-bus(3) <../man3/sd-bus.3.html>`__, 
`sd_bus_message_get_type(3) <../man3/sd_bus_message_get_type.3.html>`__, 
`sd_bus_message_new(3) <../man3/sd_bus_message_new.3.html>`__, 
`sd_bus_reply_method_error(3) <../man3/sd_bus_reply_method_error.3.html>`__

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
