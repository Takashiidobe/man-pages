.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

sd_bus_message_read_array(3) — Linux manual page
================================================

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

   SD_BUS_MESSAGE_READ_ARRAY(3)us_message_read_arrayS_MESSAGE_READ_ARRAY(3)

NAME
-------------------------------------------------

::

          sd_bus_message_read_array - Access an array of elements in a
          message


---------------------------------------------------------

::

          #include <systemd/sd-bus.h>

          int sd_bus_message_read_array(sd_bus_message *m, char type,
                                        const void **ptr, size_t *size);


---------------------------------------------------------------

::

          sd_bus_message_read_array() provides access to an array elements
          in the bus message m. The "read pointer" in the message must be
          right before an array of type type. As a special case, type may
          be NUL, in which case any trivial type is acceptable. A pointer
          to the array data is returned in the parameter ptr and the size
          of array data (in bytes) is returned in the parameter size. If
          the returned size parameter is 0, a valid non-null pointer will
          be returned as ptr, but it may not be dereferenced. The data is
          aligned as appropriate for the data type. The data is part of the
          message — it may not be modified and is valid only as long as the
          message is referenced. After this function returns, the "read
          pointer" points at the next element after the array.

          Note that this function only supports arrays of trivial types,
          i.e. arrays of booleans, the various integer types, as well as
          floating point numbers. In particular it may not be used for
          arrays of strings, structures or similar.


-----------------------------------------------------------------

::

          On success and when an array was read,
          sd_bus_message_read_array() returns an integer greater than zero.
          If invoked while inside a container element (such as an array,
          e.g. when operating on an array of arrays) and the final element
          of the outer container has been read already and the read pointer
          is thus behind the last element of the outer container this call
          returns 0 (and the returned pointer will be NULL and the size
          will be 0). On failure, it returns a negative errno-style error
          code.

      Errors
          Returned errors may indicate the following problems:

          -EINVAL
              Specified type is invalid or not a trivial type (see above),
              or the message parameter or one of the output parameters are
              NULL.

          -EOPNOTSUPP
              The byte order in the message is different than native byte
              order.

          -EPERM
              The message is not sealed.

          -EBADMSG
              The message cannot be parsed.


---------------------------------------------------------

::

          systemd(1), sd-bus(3), sd_bus_message_read(3),
          sd_bus_message_read_strv(3)

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

   systemd 249                                 SD_BUS_MESSAGE_READ_ARRAY(3)

--------------

Pages that refer to this page: `sd-bus(3) <../man3/sd-bus.3.html>`__

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
