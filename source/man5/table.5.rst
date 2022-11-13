.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

table(5) — Linux manual page
============================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `TABLE TYPES <#TABLE_TYPES>`__ \| |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   TABLE(5)                 BSD File Formats Manual                TABLE(5)

NAME
-------------------------------------------------

::

        table — format description for smtpd tables


---------------------------------------------------------------

::

        This manual page documents the file format for the various tables
        used in the smtpd(8) mail daemon.

        The format described here applies to tables as defined in
        smtpd.conf(5).


---------------------------------------------------------------

::

        There are two types of tables: lists and mappings.  A list consists
        of a series of values, while a mapping consists of a series of keys
        and their associated values.  The following illustrates how to
        declare them as static tables:

              table mylist { value1, value2, value3 }
              table mymapping { key1 = value1, key2 = value2, key3 = value3 }

        When using a ‘file’ table, a list will be written with each value
        on a line by itself.  Comments can be put anywhere in the file
        using a hash mark (‘#’), and extend to the end of the current line.

              value1
              value2
              value3

        A mapping will be written with each key and value on a line,
        whitespaces separating both columns:

              key1    value1
              key2    value2
              key3    value3

        A file table can be converted to a Berkeley database using the
        makemap(8) utility with no syntax change.

        Tables using a ‘file’ or Berkeley DB backend will be referenced as
        follows:

              table name file:/path/to/file
              table name db:/path/to/file.db

      Aliasing tables
        Aliasing tables are mappings that associate a recipient to one or
        many destinations.  They can be used in two contexts: primary
        domain aliases and virtual domain mapping.

              action name method alias <table>
              action name method virtual <table>

        In a primary domain context, the key is the user part of the
        recipient address, whilst the value is one or many recipients as
        described in aliases(5):

              user1   otheruser
              user2   otheruser1,otheruser2
              user3   otheruser@example.com

        In a virtual domain context, the key is either a user part, a full
        email address or a catch-all, following selection rules described
        in smtpd.conf(5), and the value is one or many recipients as
        described in aliases(5):

              user1                   otheruser
              user2@example.org       otheruser1,otheruser2
              @example.org            otheruser@example.com
              @                       catchall@example.com

        The following directive shares the same table format, but with a
        different meaning.  Here, the user is allowed to send mail from the
        listed addresses:

              listen on interface auth [...] senders <table>

      Domain tables
        Domain tables are simple lists of domains or hosts.

              match for domain <table> action name
              match helo <table> [...] action name

        In that context, the list of domains will be matched against the
        recipient domain or against the HELO name advertised by the sending
        host, respectively.  For ‘static’, ‘file’ and dbopen(3) backends, a
        wildcard may be used so the domain table may contain:

              example.org
              *.example.org

      Credentials tables
        Credentials tables are mappings of credentials.  They can be used
        in two contexts:

              listen on interface tls [...] auth <table>
              action name relay host relay-url auth <table>

        In a listener context, the credentials are a mapping of username
        and encrypted passwords:

              user1   $2b$10$hIJ4QfMcp.90nJwKqGbKM.MybArjHOTpEtoTV.DgLYAiThuoYmTSe
              user2   $2b$10$bwSmUOBGcZGamIfRuXGTvuTo3VLbPG9k5yeKNMBtULBhksV5KdGsK

        The passwords are to be encrypted using the smtpctl(8) encrypt
        subcommand.

        In a relay context, the credentials are a mapping of labels and
        username:password pairs:

              label1  user:password

        The label must be unique and is used as a selector for the proper
        credentials when multiple credentials are valid for a single
        destination.  The password is not encrypted as it must be provided
        to the remote host.

      Netaddr tables
        Netaddr tables are lists of IPv4 and IPv6 network addresses.  They
        can only be used in the following context:

              match from src <table> action name

        When used as a "from source", the address of a client is compared
        to the list of addresses in the table until a match is found.

        A netaddr table can contain exact addresses or netmasks, and looks
        as follow:

              192.168.1.1
              ::1
              ipv6:::1
              192.168.1.0/24

      Userinfo tables
        Userinfo tables are used in rule context to specify an alternate
        userbase, mapping virtual users to local system users by UID, GID
        and home directory.

              action name method userbase <table>

        A userinfo table looks as follows:

              joe     1000:100:/home/virtual/joe
              jack    1000:100:/home/virtual/jack

        In this example, both joe and jack are virtual users mapped to the
        local system user with UID 1000 and GID 100, but different home
        directories.  These directories may contain a forward(5) file.
        This can be used in conjunction with an alias table that maps an
        email address or the domain part to the desired virtual username.
        For example:

              joe@example.org     joe
              jack@example.com    jack

      Source tables
        Source tables are lists of IPv4 and IPv6 addresses.  They can only
        be used in the following context:

              action name relay src <table>

        Successive queries to the source table will return the elements one
        by one.

        A source table looks as follow:

              192.168.1.2
              192.168.1.3
              ::1
              ::2
              ipv6:::3
              ipv6:::4

      Mailaddr tables
        Mailaddr tables are lists of email addresses.  They can be used in
        the following contexts:

              match mail-from <table> action name
              match rcpt-to <table> action name

        A mailaddr entry is used to match an email address against a
        username, a domain or a full email address.  A "*" wildcard may be
        used in part of the domain name.

        A mailaddr table looks as follow:

              user
              @domain
              user@domain
              user@*.domain

      Addrname tables
        Addrname tables are used to map IP addresses to hostnames.  They
        can be used in both listen context and relay context:

              listen on interface hostnames <table>
              action name relay helo-src <table>

        In listen context, the table is used to look up the server name to
        advertise depending on the local address of the socket on which a
        connection is accepted.  In relay context, the table is used to
        determine the hostname for the HELO sequence of the SMTP protocol,
        depending on the local address used for the outgoing connection.

        The format is a mapping from inet4 or inet6 addresses to hostnames:

              ::1             localhost
              127.0.0.1       localhost
              88.190.23.165   www.opensmtpd.org


---------------------------------------------------------

::

        smtpd.conf(5), makemap(8), smtpd(8)

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
