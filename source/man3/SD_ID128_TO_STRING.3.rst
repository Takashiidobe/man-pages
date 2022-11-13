.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

sd_id128_to_string(3) — Linux manual page
=========================================

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

   SD_ID128_TO_STRING(3)      sd_id128_to_string      SD_ID128_TO_STRING(3)

NAME
-------------------------------------------------

::

          sd_id128_to_string, SD_ID128_TO_STRING, sd_id128_from_string,
          SD_ID128_STRING_MAX - Format or parse 128-bit IDs as strings


---------------------------------------------------------

::

          #include <systemd/sd-id128.h>

          #define SD_ID128_STRING_MAX 33U

          #define SD_ID128_TO_STRING(id) ...

          char
                                   *sd_id128_to_string(sd_id128_t id, char s[static SD_ID128_STRING_MAX]);

          int sd_id128_from_string(const char *s, sd_id128_t *ret);


---------------------------------------------------------------

::

          sd_id128_to_string() formats a 128-bit ID as a character string.
          It expects the ID and a string array capable of storing 33
          characters (SD_ID128_STRING_MAX). The ID will be formatted as 32
          lowercase hexadecimal digits and be terminated by a NUL byte.

          SD_ID128_TO_STRING() is a macro that wraps sd_id128_to_string()
          and passes an appropriately sized buffer as second argument,
          allocated as C99 compound literal. Each use will thus implicitly
          acquire a suitable buffer on the stack which remains valid until
          the end of the current code block. This is usually the simplest
          way to acquire a string representation of a 128-bit ID in a
          buffer that is valid in the current code block.

          sd_id128_from_string() implements the reverse operation: it takes
          a 33 character string with 32 hexadecimal digits (either
          lowercase or uppercase, terminated by NUL) and parses them back
          into a 128-bit ID returned in ret. Alternatively, this call can
          also parse a 37-character string with a 128-bit ID formatted as
          RFC UUID. If ret is passed as NULL the function will validate the
          passed ID string, but not actually return it in parsed form.

          Note that when parsing 37 character UUIDs this is done strictly
          in Big Endian byte order, i.e. according to RFC4122[1] Variant 1
          rules, even if the UUID encodes a different variant. This matches
          behaviour in various other Linux userspace tools. It's probably
          wise to avoid UUIDs of other variant types.

          For more information about the "sd_id128_t" type see sd-id128(3).
          Note that these calls operate the same way on all architectures,
          i.e. the results do not depend on endianness.

          When formatting a 128-bit ID into a string, it is often easier to
          use a format string for printf(3). This is easily done using the
          SD_ID128_FORMAT_STR and SD_ID128_FORMAT_VAL() macros. For more
          information see sd-id128(3).


-----------------------------------------------------------------

::

          sd_id128_to_string() always succeeds and returns a pointer to the
          string array passed in.  sd_id128_from_string() returns 0 on
          success, in which case ret is filled in, or a negative
          errno-style error code.


---------------------------------------------------

::

          These APIs are implemented as a shared library, which can be
          compiled and linked to with the libsystemd pkg-config(1) file.


---------------------------------------------------------

::

          systemd(1), sd-id128(3), printf(3)

.. _notes-top-1:


---------------------------------------------------

::

           1. RFC4122
              https://tools.ietf.org/html/rfc4122

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

   systemd 249                                        SD_ID128_TO_STRING(3)

--------------

Pages that refer to this page:
`sd_bus_set_address(3) <../man3/sd_bus_set_address.3.html>`__, 
`sd-id128(3) <../man3/sd-id128.3.html>`__

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
