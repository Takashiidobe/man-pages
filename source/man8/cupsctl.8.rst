.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

cupsctl(8) — Linux manual page
==============================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `OPTIONS <#OPTIONS>`__ \|         |                                   |
| `EXAMPLES <#EXAMPLES>`__ \|       |                                   |
| `KNOWN ISSUES <#KNOWN_ISSUES>`__  |                                   |
| \| `SEE ALSO <#SEE_ALSO>`__ \|    |                                   |
| `COPYRIGHT <#COPYRIGHT>`__ \|     |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   cupsctl(8)                     Apple Inc.                     cupsctl(8)

NAME
-------------------------------------------------

::

          cupsctl - configure cupsd.conf options


---------------------------------------------------------

::

          cupsctl [ -E ] [ -U username ] [ -h server[:port] ] [
          --[no-]debug-logging ] [ --[no-]remote-admin ] [
          --[no-]remote-any ] [ --[no-]share-printers ] [
          --[no-]user-cancel-any ] [ name=value ]


---------------------------------------------------------------

::

          cupsctl updates or queries the cupsd.conf file for a server. When
          no changes are requested, the current configuration values are
          written to the standard output in the format "name=value", one
          per line.


-------------------------------------------------------

::

          The following options are recognized:

          -E   Enables encryption on the connection to the scheduler.

          -U username
               Specifies an alternate username to use when authenticating
               with the scheduler.

          -h server[:port]
               Specifies the server address.

          --[no-]debug-logging
               Enables (disables) debug logging to the error_log file.

          --[no-]remote-admin
               Enables (disables) remote administration.

          --[no-]remote-any
               Enables (disables) printing from any address, e.g., the
               Internet.

          --[no-]share-printers
               Enables (disables) sharing of local printers with other
               computers.

          --[no-]user-cancel-any
               Allows (prevents) users to cancel jobs owned by others.


---------------------------------------------------------

::

          Display the current settings:

              cupsctl

          Enable debug logging:

              cupsctl --debug-logging

          Get the current debug logging state:

              cupsctl | grep '^_debug_logging' | awk -F= '{print $2}'

          Disable printer sharing:

              cupsctl --no-share-printers


-----------------------------------------------------------------

::

          You cannot set the Listen or Port directives using cupsctl.


---------------------------------------------------------

::

          cupsd.conf(5), cupsd(8),
          CUPS Online Help (http://localhost:631/help)


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

   26 April 2019                     CUPS                        cupsctl(8)

--------------

Pages that refer to this page: `cups(1) <../man1/cups.1.html>`__

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
