.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

smtp(1) — Linux manual page
===========================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `HISTORY <#HISTORY>`__ \|         |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   SMTP(1)                BSD General Commands Manual               SMTP(1)

NAME
-------------------------------------------------

::

        smtp — Simple Mail Transfer Protocol client


---------------------------------------------------------

::

        smtp [-Chnv] [-a authfile] [-F from] [-H helo] [-s server]
             [recipient ...]


---------------------------------------------------------------

::

        The smtp utility is a Simple Mail Transfer Protocol (SMTP) client
        which can be used to run an SMTP transaction against an SMTP
        server.

        By default, smtp reads the mail content from the standard input,
        establishes an SMTP session, and runs an SMTP transaction for all
        the specified recipients.  The content is sent unaltered as mail
        data.

        The options are as follows:

        -a authfile
                Perform a login before sending the message.  The username
                and password are read from authfile and need to be on the
                first and second line respectively.  This option requires a
                TLS or STARTTLS server.

        -C      Do not require server certificate to be valid.

        -F from
                Set the return-path (MAIL FROM) for the SMTP transaction.
                Default to the current username.

        -H helo
                Define the hostname to advertise (HELO) when establishing
                the SMTP session.

        -h      Display usage.

        -n      Do not actually execute a transaction, just try to
                establish an SMTP session and quit.  When this option is
                given, no message is read from the standard input.

        -s server
                Specify the server to connect to and connection parameters.
                The format is [proto://[user:pass@]]host[:port].  The
                following protocols are available:

                smtp        Normal SMTP session with opportunistic
                            STARTTLS.
                smtp+tls    Normal SMTP session with mandatory STARTTLS.
                smtp+notls  Plain text SMTP session without TLS.
                lmtp        LMTP session with opportunistic STARTTLS.
                lmtp+tls    LMTP session with mandatory STARTTLS.
                lmtp+notls  Plain text LMTP session without TLS.
                smtps       SMTP session with forced TLS on connection.

                Defaults to “smtp://localhost:25”.

        -v      Be more verbose.  This option can be specified multiple
                times.


---------------------------------------------------------

::

        smtpd(8)


-------------------------------------------------------

::

        The smtp program first appeared in OpenBSD 6.4.

COLOPHON
---------------------------------------------------------

::

        This page is part of the OpenSMTPD (a FREE implementation of the
        server-side SMTP protocol) project.  Information about the project
        can be found at https://www.opensmtpd.org/.  If you have a bug
        report for this manual page, see
        ⟨https://github.com/OpenSMTPD/OpenSMTPD/issues⟩.  This page was
        obtained from the project's upstream Git repository
        ⟨https://github.com/OpenSMTPD/OpenSMTPD.git⟩ on 2021-08-27.  (At
        that time, the date of the most recent commit that was found in the
        repository was 2021-04-28.)  If you discover any rendering problems
        in this HTML version of the page, or you believe there is a better
        or more up-to-date source for the page, or you have corrections or
        improvements to the information in this COLOPHON (which is not part
        of the original manual page), send a mail to man-pages@man7.org

   BSD                         February 13, 2021                        BSD

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
