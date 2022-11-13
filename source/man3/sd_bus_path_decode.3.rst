.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

sd_bus_path_encode(3) — Linux manual page
=========================================

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

   SD_BUS_PATH_ENCODE(3)      sd_bus_path_encode      SD_BUS_PATH_ENCODE(3)

NAME
-------------------------------------------------

::

          sd_bus_path_encode, sd_bus_path_encode_many, sd_bus_path_decode,
          sd_bus_path_decode_many - Convert an external identifier into an
          object path and back


---------------------------------------------------------

::

          #include <systemd/sd-bus.h>

          int sd_bus_path_encode(const char *prefix,
                                 const char *external_id, char **ret_path);

          int sd_bus_path_encode_many(char **out,
                                      const char *path_template, ...);

          int sd_bus_path_decode(const char *path, const char *prefix,
                                 char **ret_external_id);

          int sd_bus_path_decode_many(const char *path,
                                      const char *path_template, ...);


---------------------------------------------------------------

::

          sd_bus_path_encode() and sd_bus_path_decode() convert external
          identifier strings into object paths and back. These functions
          are useful to map application-specific string identifiers of any
          kind into bus object paths in a simple, reversible and safe way.

          sd_bus_path_encode() takes a bus path prefix and an external
          identifier string as arguments, plus a place to store the
          returned bus path string. The bus path prefix must be a valid bus
          path, starting with a slash "/", and not ending in one. The
          external identifier string may be in any format, may be the empty
          string, and has no restrictions on the charset — however, it must
          always be NUL-terminated. The returned string will be the
          concatenation of the bus path prefix plus an escaped version of
          the external identifier string. This operation may be reversed
          with sd_bus_path_decode(). It is recommended to only use external
          identifiers that generally require little escaping to be turned
          into valid bus path identifiers (for example, by sticking to a
          7-bit ASCII character set), in order to ensure the resulting bus
          path is still short and easily processed.

          sd_bus_path_decode() reverses the operation of
          sd_bus_path_encode() and thus regenerates an external identifier
          string from a bus path. It takes a bus path and a prefix string,
          plus a place to store the returned external identifier string. If
          the bus path does not start with the specified prefix, 0 is
          returned and the returned string is set to NULL. Otherwise, the
          string following the prefix is unescaped and returned in the
          external identifier string.

          The escaping used will replace all characters which are invalid
          in a bus object path by "_", followed by a hexadecimal value. As
          a special case, the empty string will be replaced by a lone "_".

          sd_bus_path_encode_many() works like its counterpart
          sd_bus_path_encode(), but takes a path template as argument and
          encodes multiple labels according to its embedded directives. For
          each "%" character found in the template, the caller must provide
          a string via varargs, which will be encoded and embedded at the
          position of the "%" character. Any other character in the
          template is copied verbatim into the encoded path.

          sd_bus_path_decode_many() does the reverse of
          sd_bus_path_encode_many(). It decodes the passed object path
          according to the given path template. For each "%" character in
          the template, the caller must provide an output storage ("char
          **") via varargs. The decoded label will be stored there. Each
          "%" character will only match the current label. It will never
          match across labels. Furthermore, only a single directive is
          allowed per label. If NULL is passed as output storage, the label
          is verified but not returned to the caller.


-----------------------------------------------------------------

::

          On success, sd_bus_path_encode() returns positive or 0, and a
          valid bus path in the return argument. On success,
          sd_bus_path_decode() returns a positive value if the prefixed
          matched, or 0 if it did not. If the prefix matched, the external
          identifier is returned in the return parameter. If it did not
          match, NULL is returned in the return parameter. On failure, a
          negative errno-style error number is returned by either function.
          The returned strings must be free(3)'d by the caller.


---------------------------------------------------

::

          These APIs are implemented as a shared library, which can be
          compiled and linked to with the libsystemd pkg-config(1) file.


---------------------------------------------------------

::

          systemd(1), sd-bus(3), free(3)

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

   systemd 249                                        SD_BUS_PATH_ENCODE(3)

--------------

Pages that refer to this page: `sd-bus(3) <../man3/sd-bus.3.html>`__, 
`sd_bus_message_new_method_call(3) <../man3/sd_bus_message_new_method_call.3.html>`__

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
