.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

rsync-ssl(1) — Linux manual page
================================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `OPTIONS <#OPTIONS>`__ \|         |                                   |
| `ENVIRONMENT VARI                 |                                   |
| ABLES <#ENVIRONMENT_VARIABLES>`__ |                                   |
| \| `EXAMPLES <#EXAMPLES>`__ \|    |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `CAVEATS <#CAVEATS>`__ \|         |                                   |
| `BUGS <#BUGS>`__ \|               |                                   |
| `VERSION <#VERSION>`__ \|         |                                   |
| `CREDITS <#CREDITS>`__ \|         |                                   |
| `AUTHOR <#AUTHOR>`__ \|           |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   rsync-ssl(1)                  User Commands                 rsync-ssl(1)

NAME
-------------------------------------------------

::

          rsync-ssl - a helper script for connecting to an ssl rsync daemon


---------------------------------------------------------

::

          rsync-ssl [--type=SSL_TYPE] RSYNC_ARGS


---------------------------------------------------------------

::

          The rsync-ssl script helps you to run an rsync copy to/from an
          rsync daemon that requires ssl connections.

          The script requires that you specify an rsync-daemon arg in the
          style of either hostname:: (with 2 colons) or rsync://hostname/.
          The default port used for connecting is 874 (one higher than the
          normal 873) unless overridden in the environment.  You can
          specify an overriding port via --port or by including it in the
          normal spot in the URL format, though both of those require your
          rsync version to be at least 3.2.0.


-------------------------------------------------------

::

          If the first arg is a --type=SSL_TYPE option, the script will
          only use that particular program to open an ssl connection
          instead of trying to find an openssl or stunnel executable via a
          simple heuristic (assuming that the RSYNC_SSL_TYPE environment
          variable is not set as well -- see below).  This option must
          specify one of openssl or stunnel.  The equal sign is required
          for this particular option.

          All the other options are passed through to the rsync command, so
          consult the rsync(1) manpage for more information on how it
          works.


-----------------------------------------------------------------------------------

::

          The ssl helper scripts are affected by the following environment
          variables:

          RSYNC_SSL_TYPE
                 Specifies the program type that should be used to open the
                 ssl connection.  It must be one of openssl or stunnel.
                 The --type=SSL_TYPE option overrides this, when specified.

          RSYNC_SSL_PORT
                 If specified, the value is the port number that is used as
                 the default when the user does not specify a port in their
                 rsync command.  When not specified, the default port
                 number is 874.  (Note that older rsync versions (prior to
                 3.2.0) did not communicate an overriding port number value
                 to the helper script.)

          RSYNC_SSL_CERT
                 If specified, the value is a filename that contains a
                 certificate to use for the connection.

          RSYNC_SSL_CA_CERT
                 If specified, the value is a filename that contains a
                 certificate authority certificate that is used to validate
                 the connection.

          RSYNC_SSL_OPENSSL
                 Specifies the openssl executable to run when the
                 connection type is set to openssl.  If unspecified, the
                 $PATH is searched for "openssl".

          RSYNC_SSL_GNUTLS
                 Specifies the gnutls-cli executable to run when the
                 connection type is set to gnutls.  If unspecified, the
                 $PATH is searched for "gnutls-cli".

          RSYNC_SSL_STUNNEL
                 Specifies the stunnel executable to run when the
                 connection type is set to stunnel.  If unspecified, the
                 $PATH is searched first for "stunnel4" and then for
                 "stunnel".


---------------------------------------------------------

::

              rsync-ssl -aiv example.com::mod/ dest

              rsync-ssl --type=openssl -aiv example.com::mod/ dest

              rsync-ssl -aiv --port 9874 example.com::mod/ dest

              rsync-ssl -aiv rsync://example.com:9874/mod/ dest


---------------------------------------------------------

::

          rsync(1), rsyncd.conf(5)


-------------------------------------------------------

::

          Note that using an stunnel connection requires at least version 4
          of stunnel, which should be the case on modern systems.  Also, it
          does not verify a connection against the CA certificate
          collection, so it only encrypts the connection without any cert
          validation unless you have specified the certificate environment
          options.

          This script also supports a --type=gnutls option, but at the time
          of this release the gnutls-cli command was dropping output,
          making it unusable.  If that bug has been fixed in your version,
          feel free to put gnutls into an exported RSYNC_SSL_TYPE
          environment variable to make its use the default.


-------------------------------------------------

::

          Please report bugs! See the web site at https://rsync.samba.org/.


-------------------------------------------------------

::

          This man page is current for version 3.2.3 of rsync.


-------------------------------------------------------

::

          rsync is distributed under the GNU General Public License.  See
          the file COPYING for details.

          A web site is available at https://rsync.samba.org/.  The site
          includes an FAQ-O-Matic which may cover questions unanswered by
          this manual page.


-----------------------------------------------------

::

          This manpage was written by Wayne Davison.

          Mailing lists for support and development are available at
          https://lists.samba.org/.

COLOPHON
---------------------------------------------------------

::

          This page is part of the rsync (a fast, versatile, remote (and
          local) file-copying tool) project.  Information about the project
          can be found at ⟨https://rsync.samba.org/⟩.  If you have a bug
          report for this manual page, see
          ⟨https://rsync.samba.org/bugzilla.html⟩.  This page was obtained
          from the tarball fetched from
          ⟨https://download.samba.org/pub/rsync/⟩ on 2021-08-27.  If you
          discover any rendering problems in this HTML version of the page,
          or you believe there is a better or more up-to-date source for
          the page, or you have corrections or improvements to the
          information in this COLOPHON (which is not part of the original
          manual page), send a mail to man-pages@man7.org

   rsync-ssl 3.2.3                06 Aug 2020                  rsync-ssl(1)

--------------

Pages that refer to this page: `rsync(1) <../man1/rsync.1.html>`__, 
`rsyncd.conf(5) <../man5/rsyncd.conf.5.html>`__

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
