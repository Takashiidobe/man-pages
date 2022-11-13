.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

sd_bus_message_open_container(3) — Linux manual page
====================================================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `RETURN VALUE <#RETURN_VALUE>`__  |                                   |
| \| `NOTES <#NOTES>`__ \|          |                                   |
| `EXAMPLES <#EXAMPLES>`__ \|       |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `NOTES <#NOTES>`__ \|             |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   SD_BUS_MESSAGE_OPEN_CONTAINER(3)sage_open_containerAGE_OPEN_CONTAINER(3)

NAME
-------------------------------------------------

::

          sd_bus_message_open_container, sd_bus_message_close_container,
          sd_bus_message_enter_container, sd_bus_message_exit_container -
          Create and move between containers in D-Bus messages


---------------------------------------------------------

::

          #include <systemd/sd-bus.h>

          int sd_bus_message_open_container(sd_bus_message *m, char type,
                                            const char *contents);

          int sd_bus_message_close_container(sd_bus_message *m);

          int sd_bus_message_enter_container(sd_bus_message *m, char type,
                                             const char *contents);

          int sd_bus_message_exit_container(sd_bus_message *m);


---------------------------------------------------------------

::

          sd_bus_message_open_container() appends a new container to the
          message m. After opening a new container, it can be filled with
          content using sd_bus_message_append(3) and similar functions.
          Containers behave like a stack. To nest containers inside each
          other, call sd_bus_message_open_container() multiple times
          without calling sd_bus_message_close_container() in between. Each
          container will be nested inside the previous container.  type
          represents the container type and should be one of "r", "a", "v"
          or "e" as described in sd_bus_message_append(3). Instead of
          literals, the corresponding constants SD_BUS_TYPE_STRUCT,
          SD_BUS_TYPE_ARRAY, SD_BUS_TYPE_VARIANT or SD_BUS_TYPE_DICT_ENTRY
          can also be used.  contents describes the type of the container's
          elements and should be a D-Bus type string following the rules
          described in sd_bus_message_append(3).

          sd_bus_message_close_container() closes the last container opened
          with sd_bus_message_open_container(). On success, the write
          pointer of the message m is positioned after the closed container
          in its parent container or in m itself if there is no parent
          container.

          sd_bus_message_enter_container() enters the next container of the
          message m for reading. It behaves mostly the same as
          sd_bus_message_open_container(). Entering a container allows
          reading its contents with sd_bus_message_read(3) and similar
          functions.  type and contents are the same as in
          sd_bus_message_open_container().

          sd_bus_message_exit_container() exits the scope of the last
          container entered with sd_bus_message_enter_container(). It
          behaves mostly the same as sd_bus_message_close_container(). Note
          that sd_bus_message_exit_container() may only be called after
          iterating through all members of the container, i.e. reading or
          skipping them. Use sd_bus_message_skip(3) to skip over felds of a
          container in order to be able to exit the container with
          sd_bus_message_exit_container() without reading all members.


-----------------------------------------------------------------

::

          On success, these functions return a non-negative integer.
          sd_bus_message_open_container() and
          sd_bus_message_close_container() return 0.
          sd_bus_message_enter_container() returns 1 if it successfully
          opened a new container, and 0 if that was not possible because
          the end of the currently open container or message was reached.
          sd_bus_message_exit_container() returns 1 on success. On failure,
          all of these functions return a negative errno-style error code.

      Errors
          Returned errors may indicate the following problems:

          -EINVAL
              m or contents are NULL or type is invalid.

          -EPERM
              The message m is already sealed.

          -ESTALE
              The message m is in an invalid state.

          -ENOMEM
              Memory allocation failed.

          -EBUSY
              sd_bus_message_exit_container() was called but there are
              unread members left in the container.


---------------------------------------------------

::

          These APIs are implemented as a shared library, which can be
          compiled and linked to with the libsystemd pkg-config(1) file.


---------------------------------------------------------

::

          Example 1. Append an array of strings to a message

              #include <systemd/sd-bus.h>

              int append_strings_to_message(sd_bus_message *m, const char *const *arr) {
                int r;

                r = sd_bus_message_open_container(m, 'a', "s");
                if (r < 0)
                  return r;

                for (const char *s = *arr; *s; s++) {
                  r = sd_bus_message_append(m, "s", s);
                  if (r < 0)
                    return r;
                }

                return sd_bus_message_close_container(m);
              }

          Example 2. Read an array of strings from a message

              #include <stdio.h>

              #include <systemd/sd-bus.h>

              int read_strings_from_message(sd_bus_message *m) {
                int r;

                r = sd_bus_message_enter_container(m, 'a', "s");
                if (r < 0)
                  return r;

                for (;;) {
                  const char *s;

                  r = sd_bus_message_read(m, "s", &s);
                  if (r < 0)
                    return r;
                  if (r == 0)
                    break;

                  printf("%s\n", s);
                }

                return sd_bus_message_exit_container(m);
              }


---------------------------------------------------------

::

          systemd(1), sd-bus(3), sd_bus_message_append(3),
          sd_bus_message_read(3), sd_bus_message_skip(3), The D-Bus
          specification[1]

.. _notes-top-1:


---------------------------------------------------

::

           1. The D-Bus specification
              https://dbus.freedesktop.org/doc/dbus-specification.html

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

   systemd 249                             SD_BUS_MESSAGE_OPEN_CONTAINER(3)

--------------

Pages that refer to this page: `sd-bus(3) <../man3/sd-bus.3.html>`__, 
`sd_bus_message_append(3) <../man3/sd_bus_message_append.3.html>`__, 
`sd_bus_message_read(3) <../man3/sd_bus_message_read.3.html>`__

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
