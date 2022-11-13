.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

mail.lmtp(8) — Linux manual page
================================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `EXIT STATUS <#EXIT_STATUS>`__ \| |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   MAIL.LMTP(8)           BSD System Manager's Manual          MAIL.LMTP(8)

NAME
-------------------------------------------------

::

        mail.lmtp — deliver mail through LMTP


---------------------------------------------------------

::

        mail.lmtp [-d destination] [-f from] [-l lhlo] user ...


---------------------------------------------------------------

::

        mail.lmtp reads the standard input up to an end-of-file and
        delivers it to an LMTP server for each user's address.  The user
        must be a valid user name or email address.

        The options are as follows:

        -d destination
                Specify the destination LMTP address.

        -f from
                Specify the sender's name or email address.

        -l lhlo
                Specify the LHLO argument used in the LMTP session.  By
                default, mail.lmtp will default to "localhost".


---------------------------------------------------------------

::

        The mail.lmtp utility exits 0 on success, and >0 if an error
        occurs.


---------------------------------------------------------

::

        mail(1), smtpd(8)

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

   BSD                         February 14, 2017                        BSD

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
