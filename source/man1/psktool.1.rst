.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

psktool(1) — Linux manual page
==============================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `OPTIONS <#OPTIONS>`__ \|         |                                   |
| `EXAMPLES <#EXAMPLES>`__ \|       |                                   |
| `EXIT STATUS <#EXIT_STATUS>`__ \| |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `AUTHORS <#AUTHORS>`__ \|         |                                   |
| `COPYRIGHT <#COPYRIGHT>`__ \|     |                                   |
| `BUGS <#BUGS>`__ \|               |                                   |
| `NOTES <#NOTES>`__ \|             |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   psktool(1)                    User Commands                   psktool(1)

NAME
-------------------------------------------------

::

          psktool - GnuTLS PSK tool


---------------------------------------------------------

::

          psktool [-flags] [-flag [value]] [--option-name[[=| ]value]]

          All arguments must be options.


---------------------------------------------------------------

::

          Program  that generates random keys for use with TLS-PSK. The
          keys are stored in hexadecimal format in a key file.


-------------------------------------------------------

::

          -d number, --debug=number
                 Enable debugging.  This option takes an integer number as
                 its argument.  The value of number is constrained to
                 being:
                     in the range  0 through 9999

                 Specifies the debug level.

          -s number, --keysize=number
                 Specify the key size in bytes (default is 32-bytes or
                 256-bits).  This option takes an integer number as its
                 argument.  The value of number is constrained to being:
                     in the range  0 through 512

          -u string, --username=string
                 Specify the username to use.

          -p string, --pskfile=string
                 Specify a pre-shared key file.

                 This option will specify the pre-shared key file to store
                 the generated keys.

          --passwd
                 This is an alias for the --pskfile option.

                 NOTE: THIS OPTION IS DEPRECATED

          -h, --help
                 Display usage information and exit.

          -!, --more-help
                 Pass the extended usage information through a pager.

          -v [{v|c|n --version [{v|c|n}]}]
                 Output version of program and exit.  The default mode is
                 `v', a simple version.  The `c' mode will print copyright
                 information and `n' will print the full copyright notice.


---------------------------------------------------------

::

          To add a user 'psk_identity' in keys.psk for use with GnuTLS run:
              $ ./psktool -u psk_identity -p keys.psk
              Generating a random key for user 'psk_identity'
              Key stored to keys.psk
              $ cat keys.psk
              psk_identity:88f3824b3e5659f52d00e959bacab954b6540344
              $

          This command will create keys.psk if it does not exist and will
          add user 'psk_identity'.


---------------------------------------------------------------

::

          One of the following exit values will be returned:

          0  (EXIT_SUCCESS)
                 Successful program execution.

          1  (EXIT_FAILURE)
                 The operation failed or the command syntax was not valid.

          70  (EX_SOFTWARE)
                 libopts had an internal operational error.  Please report
                 it to autogen-users@lists.sourceforge.net.  Thank you.


---------------------------------------------------------

::

              gnutls-cli-debug (1), gnutls-serv (1), srptool (1), certtool
          (1)


-------------------------------------------------------

::

          Nikos Mavrogiannopoulos, Simon Josefsson and others; see
          /usr/share/doc/gnutls/AUTHORS for a complete list.


-----------------------------------------------------------

::

          Copyright (C) 2000-2020 Free Software Foundation, and others all
          rights reserved.  This program is released under the terms of the
          GNU General Public License, version 3 or later.


-------------------------------------------------

::

          Please send bug reports to: bugs@gnutls.org


---------------------------------------------------

::

          This manual page was AutoGen-erated from the psktool option
          definitions.

COLOPHON
---------------------------------------------------------

::

          This page is part of the GnuTLS (GnuTLS Transport Layer Security
          Library) project.  Information about the project can be found at
          ⟨http://www.gnutls.org/⟩.  If you have a bug report for this
          manual page, send it to bugs@gnutls.org.  This page was obtained
          from the tarball gnutls-3.7.2.tar.xz fetched from
          ⟨http://www.gnutls.org/download.html⟩ on 2021-08-27.  If you
          discover any rendering problems in this HTML version of the page,
          or you believe there is a better or more up-to-date source for
          the page, or you have corrections or improvements to the
          information in this COLOPHON (which is not part of the original
          manual page), send a mail to man-pages@man7.org

   3.7.2                          29 May 2021                    psktool(1)

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
