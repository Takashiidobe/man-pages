.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

sendmail(8) — Linux manual page
===============================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `EXIT STATUS <#EXIT_STATUS>`__ \| |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `AUTHORS <#AUTHORS>`__ \|         |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   SENDMAIL(8)            BSD System Manager's Manual           SENDMAIL(8)

NAME
-------------------------------------------------

::

        sendmail — a mail enqueuer for smtpd(8)


---------------------------------------------------------

::

        sendmail [-tv] [-F name] [-f from] to ...


---------------------------------------------------------------

::

        The sendmail utility is a local enqueuer for the smtpd(8) daemon,
        compatible with mailwrapper(8).  The message is read on standard
        input (stdin) until sendmail encounters an end-of-file.  The
        sendmail enqueuer is not intended to be used directly to send mail,
        but rather via a frontend known as a mail user agent.

        Unless the optional -t flag is specified, one or more recipients
        must be specified on the command line.

        The options are as follows:

        -F name
                Set the sender's full name.

        -f from
                Set the sender's address.

        -t      Read the message's To:, Cc:, and Bcc: fields for
                recipients.  The Bcc: field will be deleted before sending.

        -v      Enable verbose output.

        To maintain compatibility with Sendmail, Inc.'s implementation of
        sendmail, various other flags are accepted, but have no effect.


---------------------------------------------------------------

::

        The sendmail utility exits 0 on success, and >0 if an error occurs.


---------------------------------------------------------

::

        smtpctl(8), smtpd(8)


-------------------------------------------------------

::

        OpenSMTPD is primarily developed by Gilles Chehade, Eric Faurot,
        and Charles Longeau, with contributions from various OpenBSD
        hackers.  It is distributed under the ISC license.

        This manpage was written by Ryan Kavanagh ⟨rak@debian.org⟩ for the
        Debian project and is distributed under the ISC license.

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

   BSD                         October 23, 2015                         BSD

--------------

Pages that refer to this page:
`mailaddr(7) <../man7/mailaddr.7.html>`__, 
`cron(8) <../man8/cron.8.html>`__

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
