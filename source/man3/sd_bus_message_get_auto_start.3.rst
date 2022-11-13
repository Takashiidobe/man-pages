.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

sd_bus_message_set_expect_reply(3) — Linux manual page
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

   SD_BUS_MESSAGE_SET_EXPECT_REPLY(3)e_set_expect_reply_SET_EXPECT_REPLY(3)

NAME
-------------------------------------------------

::

          sd_bus_message_set_expect_reply, sd_bus_message_get_expect_reply,
          sd_bus_message_set_auto_start, sd_bus_message_get_auto_start,
          sd_bus_message_set_allow_interactive_authorization,
          sd_bus_message_get_allow_interactive_authorization - Set and
          query bus message metadata


---------------------------------------------------------

::

          #include <systemd/sd-bus.h>

          int sd_bus_message_set_expect_reply(sd_bus_message *message,
                                              int b);

          int sd_bus_message_get_expect_reply(sd_bus_message *message);

          int sd_bus_message_set_auto_start(sd_bus_message *message,
                                            int b);

          int sd_bus_message_get_auto_start(sd_bus_message *message);

          int
                                                                 sd_bus_message_set_allow_interactive_authorization(sd_bus_message *message,
                                                                 int b);

          int
                                                                 sd_bus_message_get_allow_interactive_authorization(sd_bus_message *message);


---------------------------------------------------------------

::

          sd_bus_message_set_expect_reply() sets or clears the
          NO_REPLY_EXPECTED flag on the message m. This flag matters only
          for method call messages and is used to specify that no method
          return or error reply is expected. It is ignored for other types.
          Thus, for a method call message, calling

              sd_bus_message_set_expect_reply(..., 0)

          sets the flag and suppresses the reply.

          sd_bus_message_get_expect_reply() checks if the NO_REPLY_EXPECTED
          flag is set on the message m. It will return positive if it is
          not set, and zero if it is.

          sd_bus_message_set_auto_start() sets or clears the NO_AUTO_START
          flag on the message m. When the flag is set, the bus must not
          launch an owner for the destination name in response to this
          message. Calling

              sd_bus_message_set_auto_start(..., 0)

          sets the flag.

          sd_bus_message_get_auto_start() checks if the NO_AUTO_START flag
          is set on the message m. It will return positive if it is not
          set, and zero if it is.

          sd_bus_message_set_allow_interactive_authorization() sets or
          clears the ALLOW_INTERACTIVE_AUTHORIZATION flag on the message m.
          Setting this flag informs the receiver that the caller is
          prepared to wait for interactive authorization via polkit or a
          similar framework. Note that setting this flag does not guarantee
          that the receiver will actually perform interactive
          authorization. Also, make sure to set a suitable message timeout
          when using this flag since interactive authorization could
          potentially take a long time as it depends on user input. If b is
          non-zero, the flag is set.

          sd_bus_message_get_allow_interactive_authorization() checks if
          the ALLOW_INTERACTIVE_AUTHORIZATION flag is set on the message m.
          It will return a positive integer if the flag is set. Otherwise,
          it returns zero.


-----------------------------------------------------------------

::

          On success, these functions return a non-negative integer. On
          failure, they return a negative errno-style error code.

      Errors
          Returned errors may indicate the following problems:

          -EINVAL
              The message parameter is NULL.

          -EPERM
              The message message is sealed when trying to set a flag.

              The message message has wrong type.


---------------------------------------------------

::

          These APIs are implemented as a shared library, which can be
          compiled and linked to with the libsystemd pkg-config(1) file.


---------------------------------------------------------

::

          systemd(1), sd-bus(3), sd_bus_set_description(3)

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

   systemd 249                           SD_BUS_MESSAGE_SET_EXPECT_REPLY(3)

--------------

Pages that refer to this page: `sd-bus(3) <../man3/sd-bus.3.html>`__, 
`sd-bus-errors(3) <../man3/sd-bus-errors.3.html>`__, 
`sd_bus_message_new(3) <../man3/sd_bus_message_new.3.html>`__

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
