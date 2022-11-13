.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

cupsd-helper(8) — Linux manual page
===================================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `FILES <#FILES>`__ \|             |                                   |
| `NOTES <#NOTES>`__ \|             |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `COPYRIGHT <#COPYRIGHT>`__ \|     |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   cupsd-helper(8)                Apple Inc.                cupsd-helper(8)

NAME
-------------------------------------------------

::

          cupsd-helper - cupsd helper programs (deprecated)


---------------------------------------------------------

::

          cups-deviced request-id limit user-id options
          cups-driverd cat ppd-name
          cups-driverd list request_id limit options
          cups-exec sandbox-profile [ -g group-id ] [ -n nice-value ] [ -u
          user-id ] /path/to/program argv0 ...  argvN


---------------------------------------------------------------

::

          The cupsd-helper programs perform long-running operations on
          behalf of the scheduler, cupsd(8).  The cups-deviced helper
          program runs each CUPS backend(7) with no arguments in order to
          discover the available printers.

          The cups-driverd helper program lists all available printer
          drivers, a subset of "matching" printer drivers, or a copy of a
          specific driver PPD file.

          The cups-exec helper program runs backends, filters, and other
          programs. On macOS these programs are run in a secure sandbox.


---------------------------------------------------

::

          The cups-driverd program looks for PPD and driver information
          files in the following directories:

              /Library/Printers
              /opt/share/ppd
              /System/Library/Printers
              /usr/local/share/ppd
              /usr/share/cups/drv
              /usr/share/cups/model
              /usr/share/ppd

          PPD files can be compressed using the gzip(1) program or placed
          in compressed tar(1) archives to further reduce their size.

          Driver information files must conform to the format defined in
          ppdcfile(5).


---------------------------------------------------

::

          CUPS printer drivers, backends, and PPD files are deprecated and
          will no longer be supported in a future feature release of CUPS.
          Printers that do not support IPP can be supported using
          applications such as ippeveprinter(1).


---------------------------------------------------------

::

          backend(7), cups(1), cupsd(8), cupsd.conf(5), filter(7),
          ppdcfile(5), CUPS Online Help (http://localhost:631/help)


-----------------------------------------------------------

::

          Copyright © 2007-2019 by Apple Inc.

COLOPHON
---------------------------------------------------------

::

          This page is part of the CUPS (a standards-based, open source
          printing system) project.  Information about the project can be
          found at ⟨http://www.cups.org/⟩.  If you have a bug report for
          this manual page, see ⟨http://www.cups.org/⟩.  This page was
          obtained from the project's upstream Git repository
          ⟨https://github.com/apple/cups⟩ on 2021-08-27.  (At that time,
          the date of the most recent commit that was found in the
          repository was 2021-08-24.)  If you discover any rendering
          problems in this HTML version of the page, or you believe there
          is a better or more up-to-date source for the page, or you have
          corrections or improvements to the information in this COLOPHON
          (which is not part of the original manual page), send a mail to
          man-pages@man7.org

   26 April 2019                     CUPS                   cupsd-helper(8)

--------------

Pages that refer to this page: `cupsd(8) <../man8/cupsd.8.html>`__

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
