.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

sd_hwdb_get(3) — Linux manual page
==================================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `RETURN VALUE <#RETURN_VALUE>`__  |                                   |
| \| `NOTES <#NOTES>`__ \|          |                                   |
| `EXAMPLES <#EXAMPLES>`__ \|       |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   SD_HWDB_GET(3)                 sd_hwdb_get                SD_HWDB_GET(3)

NAME
-------------------------------------------------

::

          sd_hwdb_get, sd_hwdb_seek, sd_hwdb_enumerate,
          SD_HWDB_FOREACH_PROPERTY - Seek to a location in hwdb or access
          entries


---------------------------------------------------------

::

          #include <systemd/sd-hwdb.h>

          int sd_hwdb_get(sd_hwdb *hwdb, const char *modalias,
                          const char *key, const char **value);

          int sd_hwdb_seek(sd_hwdb *hwdb, const char *modalias);

          int sd_hwdb_enumerate(sd_hwdb *hwdb, const char **key,
                                const char **value);

          SD_HWDB_FOREACH_PROPERTY(hwdb, modalias, key, value);


---------------------------------------------------------------

::

          sd_hwdb_get() queries the hwdb object created earlier with
          sd_hwdb_new(3) for entries matching the specified string
          modalias, and returns the value corresponding to the key key. The
          value is returned as a NUL-terminated string in value. It must
          not be modified by the caller and is valid as long as a reference
          to hwdb is kept. When multiple patterns in the database match
          modalias, the one with the highest priority is used. See hwdb(7)
          for details.

          sd_hwdb_seek() selects entries matching the specified string
          modalias. Subsequent queries with sd_hwdb_enumerate() will access
          the key-value pairs for that string.

          sd_hwdb_enumerate() returns (in turn) all the key-value pairs
          defined for the string used with sd_hwdb_seek(). Each pair is
          returned as NUL-terminated strings in key and value. The strings
          must not be modified by the caller and are valid as long as a
          reference to hwdb is kept. When multiple patterns in the database
          match modalias, the combination of all matching key-value pairs
          is used. See hwdb(7) for details.

          The SD_HWDB_FOREACH_PROPERTY() macro combines sd_hwdb_seek() and
          sd_hwdb_enumerate(). No error handling is performed and iteration
          simply stops on error. See the example below.


-----------------------------------------------------------------

::

          On success, sd_hwdb_get() and sd_hwdb_seek() return a
          non-negative integer. On failure, they return a negative
          errno-style error code.

          sd_hwdb_enumerate() returns a positive integer if another
          key-value pair was found or zero if all entries have already been
          enumerated. On failure, it returns a negative errno-style error
          code.

      Errors
          Returned errors may indicate the following problems:

          -EINVAL
              A parameter is NULL.

          -ENOENT
              An entry for the specified modalias was not found.

          -EAGAIN
              sd_hwdb_seek() was not called before sd_hwdb_enumerate().


---------------------------------------------------

::

          These APIs are implemented as a shared library, which can be
          compiled and linked to with the libsystemd pkg-config(1) file.


---------------------------------------------------------

::

          Example 1. Look up hwdb entries for a USB device

              #include <stdio.h>
              #include <stdint.h>
              #include <sd-hwdb.h>

              int print_usb_properties(uint16_t vid, uint16_t pid) {
                char match[STRLEN("usb:vp") + DECIMAL_STR_MAX(uint16_t) * 2];
                sd_hwdb *hwdb;
                const char *key, *value;
                int r;

                /* Match this USB vendor and product ID combination */
                xsprintf(match, "usb:v%04Xp%04X", vid, pid);

                r = sd_hwdb_new(&hwdb);
                if (r < 0)
                  return r;

                SD_HWDB_FOREACH_PROPERTY(hwdb, match, key, value)
                  printf("%s: \"%s\" → \"%s\"\n", match, key, value);

                sd_hwdb_unref(hwdb);
                return 0;
              }

              int main(int argc, char **argv) {
                print_usb_properties(0x046D, 0xC534);
                return 0;
              }

          The effect is similar to calling systemd-hwdb query
          usb:v046DpC534.


---------------------------------------------------------

::

          systemd(1), systemd-udevd.service(8), sd-hwdb(3), systemd-hwdb(8)

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

   systemd 249                                               SD_HWDB_GET(3)

--------------

Pages that refer to this page: `sd-hwdb(3) <../man3/sd-hwdb.3.html>`__, 
`sd_hwdb_new(3) <../man3/sd_hwdb_new.3.html>`__

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
