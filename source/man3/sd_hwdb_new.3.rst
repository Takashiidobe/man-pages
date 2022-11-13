.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

sd_hwdb_new(3) — Linux manual page
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

   SD_HWDB_NEW(3)                 sd_hwdb_new                SD_HWDB_NEW(3)

NAME
-------------------------------------------------

::

          sd_hwdb_new, sd_hwdb_ref, sd_hwdb_unref - Create a new hwdb
          object and create or destroy references to it


---------------------------------------------------------

::

          #include <systemd/sd-hwdb.h>

          int sd_hwdb_new(sd_hwdb **hwdb);

          sd_hwdb* sd_hwdb_ref(sd_hwdb *hwdb);

          sd_hwdb* sd_hwdb_unref(sd_hwdb *hwdb);


---------------------------------------------------------------

::

          sd_hwdb_new() creates a new hwdb object to access the binary hwdb
          database. Upon initialization, the file containing the binary
          representation of the hardware database is located and opened.
          The new object is returned in hwdb.

          The hwdb object is reference counted.  sd_hwdb_ref() and
          sd_hwdb_unref() may be used to get a new reference or destroy an
          existing reference to an object. The caller must dispose of the
          reference acquired with sd_hwdb_new() by calling sd_hwdb_unref()
          when done with the object.

          Use sd_hwdb_seek(3), sd_hwdb_get(3), and sd_hwdb_enumerate(3) to
          access entries.


-----------------------------------------------------------------

::

          On success, sd_hwdb_new() returns a non-negative integer. On
          failure, it returns a negative errno-style error code.

          sd_hwdb_ref() always returns the argument.

          sd_hwdb_unref() always returns NULL.

      Errors
          Returned errors may indicate the following problems:

          -ENOENT
              The binary hardware database file could not be located. See
              systemd-hwdb(8) for more information.

          -EINVAL
              The located binary hardware database file is in an
              incompatible format.

          -ENOMEM
              Memory allocation failed.


---------------------------------------------------

::

          These APIs are implemented as a shared library, which can be
          compiled and linked to with the libsystemd pkg-config(1) file.


---------------------------------------------------------

::

          systemd(1), systemd-udevd.service(8), sd-hwdb(3), systemd-hwdb(3)

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

   systemd 249                                               SD_HWDB_NEW(3)

--------------

Pages that refer to this page: `sd-hwdb(3) <../man3/sd-hwdb.3.html>`__, 
`sd_hwdb_get(3) <../man3/sd_hwdb_get.3.html>`__

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
