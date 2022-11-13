.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

mk-ca-bundle(1) — Linux manual page
===================================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `OPTIONS <#OPTIONS>`__ \|         |                                   |
| `EXIT STATUS <#EXIT_STATUS>`__ \| |                                   |
| `CERT                             |                                   |
| DATA FORMAT <#CERTDATA_FORMAT>`__ |                                   |
| \| `SEE ALSO <#SEE_ALSO>`__ \|    |                                   |
| `HISTORY <#HISTORY>`__ \|         |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   mk-ca-bundle(1)            mk-ca-bundle manual           mk-ca-bundle(1)

NAME
-------------------------------------------------

::

          mk-ca-bundle - convert mozilla's certdata.txt to PEM format


---------------------------------------------------------

::

          mk-ca-bundle [options] [outputfile]


---------------------------------------------------------------

::

          The mk-ca-bundle tool downloads the certdata.txt file from
          Mozilla's source tree over HTTPS, then parses certdata.txt and
          extracts certificates into PEM format. By default, only CA root
          certificates trusted to issue SSL server authentication
          certificates are extracted. These are then processed with the
          OpenSSL commandline tool to produce the final ca-bundle file.

          The default outputfile name is ca-bundle.crt. By setting it to
          '-' (a single dash) you will get the output sent to STDOUT
          instead of a file.

          The PEM format this scripts uses for output makes the result
          readily available for use by just about all OpenSSL or GnuTLS
          powered applications, such as curl, wget and more.


-------------------------------------------------------

::

          The following options are supported:

          -b     backup an existing version of outputfilename

          -d [name]
                 specify which Mozilla tree to pull certdata.txt from (or a
                 custom URL). Valid names are: aurora, beta, central,
                 mozilla, nss, release (default). They are shortcuts for
                 which source tree to get the cert data from.

          -f     force rebuild even if certdata.txt is current (Added in
                 version 1.17)

          -i     print version info about used modules

          -k     Allow insecure data transfer. By default (since 1.27) this
                 command will fail if the HTTPS transfer fails. This
                 overrides that decision (and opens for man-in-the-middle
                 attacks).

          -l     print license info about certdata.txt

          -m     (Added in 1.26) Include meta data comments in the output.
                 The meta data is specific information about each
                 certificate that is stored in the original file as
                 comments and using this option will make those comments
                 get passed on to the output file. The meta data is not
                 parsed in any way by mk-ca-bundle.

          -n     no download of certdata.txt (to use existing)

          -p [purposes]:[levels]
                 list of Mozilla trust purposes and levels for certificates
                 to include in output.  Takes the form of a comma separated
                 list of purposes, a colon, and a comma separated list of
                 levels. The default is to include all certificates trusted
                 to issue SSL Server certificates
                 (SERVER_AUTH:TRUSTED_DELEGATOR).

                 (Added in version 1.21, Perl only)

                 Valid purposes are:
                 ALL, DIGITAL_SIGNATURE, NON_REPUDIATION, KEY_ENCIPHERMENT,
                 DATA_ENCIPHERMENT, KEY_AGREEMENT, KEY_CERT_SIGN, CRL_SIGN,
                 SERVER_AUTH (default), CLIENT_AUTH, CODE_SIGNING,
                 EMAIL_PROTECTION, IPSEC_END_SYSTEM, IPSEC_TUNNEL,
                 IPSEC_USER, TIME_STAMPING, STEP_UP_APPROVED

                 Valid trust levels are:
                 ALL, TRUSTED_DELEGATOR (default), NOT_TRUSTED,
                 MUST_VERIFY_TRUST, TRUSTED

          -q     be really quiet (no progress output at all)

          -t     include plain text listing of certificates

          -s [algorithms]
                 comma separated list of signature algorithms with which to
                 hash/fingerprint each certificate and output when run in
                 plain text mode.

                 (Added in version 1.21, Perl only)

                 Valid algorithms are:
                 ALL, NONE, MD5 (default), SHA1, SHA256, SHA384, SHA512

          -u     unlink (remove) certdata.txt after processing

          -v     be verbose and print out processed CAs


---------------------------------------------------------------

::

          Returns 0 on success. Returns 1 if it fails to download data.


-----------------------------------------------------------------------

::

          The file format used by Mozilla for this trust information seems
          to be documented here:
          https://p11-glue.freedesktop.org/doc/storing-trust-policy/storing-trust-existing.html


---------------------------------------------------------

::

          curl(1)


-------------------------------------------------------

::

          mk-ca-bundle is a command line tool that is shipped as part of
          every curl and libcurl release (see https://curl.se/). It was
          originally based on the parse-certs script written by Roland
          Krikava and was later much improved by Guenter Knauf.  This
          manual page was initially written by Jan Schaumann
          <jschauma@netmeister.org>.

COLOPHON
---------------------------------------------------------

::

          This page is part of the curl (Command line tool and library for
          transferring data with URLs) project.  Information about the
          project can be found at ⟨https://curl.haxx.se/⟩.  If you have a
          bug report for this manual page, see
          ⟨https://curl.haxx.se/docs/bugs.html⟩.  This page was obtained
          from the project's upstream Git repository
          ⟨https://github.com/curl/curl.git⟩ on 2021-08-27.  (At that time,
          the date of the most recent commit that was found in the
          repository was 2021-08-26.)  If you discover any rendering
          problems in this HTML version of the page, or you believe there
          is a better or more up-to-date source for the page, or you have
          corrections or improvements to the information in this COLOPHON
          (which is not part of the original manual page), send a mail to
          man-pages@man7.org

   version 1.27                   24 Oct 2016               mk-ca-bundle(1)

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
