.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

cups-config(1) — Linux manual page
==================================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `OPTIONS <#OPTIONS>`__ \|         |                                   |
| `EXAMPLES <#EXAMPLES>`__ \|       |                                   |
| `DEPRECATED                       |                                   |
|  OPTIONS <#DEPRECATED_OPTIONS>`__ |                                   |
| \| `SEE ALSO <#SEE_ALSO>`__ \|    |                                   |
| `COPYRIGHT <#COPYRIGHT>`__ \|     |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   cups-config(1)                 Apple Inc.                 cups-config(1)

NAME
-------------------------------------------------

::

          cups-config - get cups api, compiler, directory, and link
          information.


---------------------------------------------------------

::

          cups-config --api-version
          cups-config --build
          cups-config --cflags
          cups-config --datadir
          cups-config --help
          cups-config --ldflags
          cups-config [ --image ] [ --static ] --libs
          cups-config --serverbin
          cups-config --serverroot
          cups-config --version


---------------------------------------------------------------

::

          The cups-config command allows application developers to
          determine the necessary command-line options for the compiler and
          linker, as well as the installation directories for filters,
          configuration files, and drivers.  All values are reported to the
          standard output.


-------------------------------------------------------

::

          The cups-config command accepts the following command-line
          options:

          --api-version
               Reports the current API version (major.minor).

          --build
               Reports a system-specific build number.

          --cflags
               Reports the necessary compiler options.

          --datadir
               Reports the default CUPS data directory.

          --help
               Reports the program usage message.

          --ldflags
               Reports the necessary linker options.

          --libs
               Reports the necessary libraries to link to.

          --serverbin
               Reports the default CUPS binary directory, where filters and
               backends are stored.

          --serverroot
               Reports the default CUPS configuration file directory.

          --static
               When used with --libs, reports the static libraries instead
               of the default (shared) libraries.

          --version
               Reports the full version number of the CUPS installation
               (major.minor.patch).


---------------------------------------------------------

::

          Show the currently installed version of CUPS:

              cups-config --version

          Compile a simple one-file CUPS filter:

              cc `cups-config --cflags --ldflags` -o filter filter.c \
                  `cups-config --libs`


-----------------------------------------------------------------------------

::

          The following options are deprecated but continue to work for
          backwards compatibility:

          --image
               Formerly used to add the CUPS imaging library to the list of
               libraries.


---------------------------------------------------------

::

          cups(1), CUPS Online Help (http://localhost:631/help)


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

   26 April 2019                     CUPS                    cups-config(1)

--------------

Pages that refer to this page:
`ippeveprinter(1) <../man1/ippeveprinter.1.html>`__

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
