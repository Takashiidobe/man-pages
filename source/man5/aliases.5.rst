.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

aliases(5) — Linux manual page
==============================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `FILES <#FILES>`__ \|             |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `HISTORY <#HISTORY>`__ \|         |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   ALIASES(5)               BSD File Formats Manual              ALIASES(5)

NAME
-------------------------------------------------

::

        aliases — aliases file for smtpd


---------------------------------------------------------------

::

        This manual page describes the format of the aliases file, as used
        by smtpd(8).  An alias, in its simplest form, is used to assign an
        arbitrary name to an email address or a group of email addresses.
        This provides a convenient way to send mail.  For example an alias
        could refer to all users of a group: email to that alias would be
        sent to all members of the group.  Much more complex aliases can be
        defined however: an alias can refer to other aliases, be used to
        send mail to a file instead of another person, or to execute
        various commands.

        Within the file, ‘#’ is a comment delimiter; anything placed after
        it is discarded.  The file consists of key/value mappings of the
        form:

              key: value1, value2, value3, ...

        key is always folded to lowercase before alias lookups to ensure
        that there can be no ambiguity.  The key is expanded to the
        corresponding values, which consist of one or more of the
        following:

        user    A user on the host machine.  The user must have a valid
                entry in the passwd(5) database file.

        /path/to/file
                Append messages to file, specified by its absolute
                pathname.

        |command
                Pipe the message to command on its standard input.  The
                command is run under the privileges of the daemon's
                unprivileged account.

        :include:/path/to/file
                Include any definitions in file as alias entries.  The
                format of the file is identical to this one.

        user-part@domain-part
                An email address in RFC 5322 format.  If an address
                extension is appended to the user-part, it is first
                compared for an exact match.  It is then stripped so that
                an address such as user+ext@example.com will only use the
                part that precedes ‘+’ as a key.

        error:code message
                A status code and message to return.  The code must be 3
                digits, starting 4XX (TempFail) or 5XX (PermFail).  The
                message must be present and can be freely chosen.


---------------------------------------------------

::

        /etc/mail/aliases     Default aliases file.


---------------------------------------------------------

::

        smtpd.conf(5), makemap(8), newaliases(8), smtpd(8)


-------------------------------------------------------

::

        The aliases file format appeared in 4.0BSD.

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

Pages that refer to this page:
`setaliasent(3) <../man3/setaliasent.3.html>`__, 
`mailaddr(7) <../man7/mailaddr.7.html>`__

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
