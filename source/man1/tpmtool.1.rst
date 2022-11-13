.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

tpmtool(1) — Linux manual page
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

   tpmtool(1)                    User Commands                   tpmtool(1)

NAME
-------------------------------------------------

::

          tpmtool - GnuTLS TPM tool


---------------------------------------------------------

::

          tpmtool [-flags] [-flag [value]] [--option-name[[=| ]value]]

          All arguments must be options.


---------------------------------------------------------------

::

          Program that allows handling cryptographic data from the TPM
          chip.


-------------------------------------------------------

::

          -d number, --debug=number
                 Enable debugging.  This option takes an integer number as
                 its argument.  The value of number is constrained to
                 being:
                     in the range  0 through 9999

                 Specifies the debug level.

          --infile=file
                 Input file.

          --outfile=string
                 Output file.

          --generate-rsa
                 Generate an RSA private-public key pair.

                 Generates an RSA private-public key pair in the TPM chip.
                 The key may be stored in file system and protected by a
                 PIN, or stored (registered) in the TPM chip flash.

          --register
                 Any generated key will be registered in the TPM.  This
                 option must appear in combination with the following
                 options: generate-rsa.

          --signing
                 Any generated key will be a signing key.  This option must
                 appear in combination with the following options:
                 generate-rsa.  This option must not appear in combination
                 with any of the following options: legacy.

          --legacy
                 Any generated key will be a legacy key.  This option must
                 appear in combination with the following options:
                 generate-rsa.  This option must not appear in combination
                 with any of the following options: signing.

          --user Any registered key will be a user key.  This option must
                 appear in combination with the following options:
                 register.  This option must not appear in combination with
                 any of the following options: system.

                 The generated key will be stored in a user specific
                 persistent storage.

          --system
                 Any registered key will be a system key.  This option must
                 appear in combination with the following options:
                 register.  This option must not appear in combination with
                 any of the following options: user.

                 The generated key will be stored in system persistent
                 storage.

          --pubkey=url
                 Prints the public key of the provided key.

          --list Lists all stored keys in the TPM.

          --delete=url
                 Delete the key identified by the given URL (UUID)..

          --test-sign=url
                 Tests the signature operation of the provided object.

                 It can be used to test the correct operation of the
                 signature operation.  This operation will sign and verify
                 the signed data.

          --sec-param=security parameter
                 Specify the security level [low, legacy, medium, high,
                 ultra]..

                 This is alternative to the bits option. Note however that
                 the values allowed by the TPM chip are quantized and given
                 values may be rounded up.

          --bits=number
                 Specify the number of bits for key generate.  This option
                 takes an integer number as its argument.

          --inder, --no-inder
                 Use the DER format for keys..  The no-inder form will
                 disable the option.

                 The input files will be assumed to be in the portable DER
                 format of TPM. The default format is a custom format used
                 by various TPM tools

          --outder, --no-outder
                 Use DER format for output keys.  The no-outder form will
                 disable the option.

                 The output will be in the TPM portable DER format.

          --srk-well-known
                 SRK has well known password (20 bytes of zeros).

                 This option has not been fully documented.

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

          To generate a key that is to be stored in file system use:
              $ tpmtool --generate-rsa --bits 2048 --outfile tpmkey.pem

          To generate a key that is to be stored in TPM's flash use:
              $ tpmtool --generate-rsa --bits 2048 --register --user

          To get the public key of a TPM key use:
              $ tpmtool --pubkey tpmkey:uuid=58ad734b-bde6-45c7-89d8-756a55ad1891;storage=user           --outfile pubkey.pem

          or if the key is stored in the file system:
              $ tpmtool --pubkey tpmkey:file=tmpkey.pem --outfile pubkey.pem

          To list all keys stored in TPM use:
              $ tpmtool --list


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

              p11tool (1), certtool (1)


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

          This manual page was AutoGen-erated from the tpmtool option
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

   3.7.2                          29 May 2021                    tpmtool(1)

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
