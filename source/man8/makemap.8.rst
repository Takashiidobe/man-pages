.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

makemap(8) — Linux manual page
==============================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `PRIM                             |                                   |
| ARY DOMAINS <#PRIMARY_DOMAINS>`__ |                                   |
| \|                                |                                   |
| `VIRT                             |                                   |
| UAL DOMAINS <#VIRTUAL_DOMAINS>`__ |                                   |
| \| `FILES <#FILES>`__ \|          |                                   |
| `EXIT STATUS <#EXIT_STATUS>`__ \| |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `HISTORY <#HISTORY>`__ \|         |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   MAKEMAP(8)             BSD System Manager's Manual            MAKEMAP(8)

NAME
-------------------------------------------------

::

        makemap — create database maps for smtpd


---------------------------------------------------------

::

        makemap [-U] [-d dbtype] [-o dbfile] [-t type] file


---------------------------------------------------------------

::

        Maps provide a generic interface for associating a textual key to a
        value.  Such associations may be accessed through a plaintext file,
        database, or DNS.  The format of these file types is described
        below.  makemap itself creates the database maps used by keyed map
        lookups specified in smtpd.conf(5).

        makemap reads input from file and writes data to a file which is
        named by adding a “.db” suffix to file.  The current line can be
        extended over multiple lines using a backslash (‘\’).  Comments can
        be put anywhere in the file using a hash mark (‘#’), and extend to
        the end of the current line.  Care should be taken when commenting
        out multi-line text: the comment is effective until the end of the
        entire block.  In all cases, makemap reads lines consisting of
        words separated by whitespace.  The first word of a line is the
        database key; the remainder represents the mapped value.  The
        database key and value may optionally be separated by the colon
        character.

        The options are as follows:

        -d dbtype
                Specify the format of the database.  Available formats are
                hash and btree.  The default value is hash.

        -o dbfile
                Write the generated database to dbfile.

        -t type
                Specify the format of the resulting map file.  The default
                map format is suitable for storing simple, unstructured,
                key-to-value string associations.  However, if the mapped
                value has special meaning, as in the case of a virtual
                domains file, a suitable type must be provided.  The
                available output types are:

                aliases  The mapped value is a comma-separated list of mail
                         destinations.  This format can be used for
                         building user aliases and user mappings for
                         virtual domain files.

                set      There is no mapped value – a map of this type will
                         only allow for the lookup of keys.  This format
                         can be used for building primary domain maps.

        -U      Instead of generating a database map from text input, dump
                the contents of a database map as text with the key and
                value separated with a tab.


-----------------------------------------------------------------------

::

        Primary domains can be kept in tables.  To create a primary domain
        table, add each primary domain on a single line by itself.

        In addition to adding an entry to the primary domain map, one must
        add a filter rule that accepts mail for the domain map, for
        example:

              table domains db:/etc/mail/domains.db

              action "local" mbox

              match for domain <domains> action "local"


-----------------------------------------------------------------------

::

        Virtual domains may also be kept in tables.  To create a virtual
        domain table, add each virtual domain on a single line by itself.

        Virtual domains expect a mapping of virtual users to real users in
        order to determine if a recipient is accepted or not.  The mapping
        format is an extension to aliases(5), which allows the use of
        “user@domain.tld” to accept user only on the specified domain,
        “user” to accept the user for any of the virtual domains,
        “@domain.tld” to provide a catch-all for the specified domain and
        “@” to provide a global catch-all for all domains.  smtpd(8) will
        perform the lookups in that specific order.

        To create a single virtual address, add “user@example.com user” to
        the users map.  To handle all mail destined to any user at
        example.com, add “@example.com user” to the virtual map.

        In addition to adding an entry to the virtual map, one must add a
        filter rule that accepts mail for virtual domains, for example:

              table vdomains db:/etc/mail/vdomains.db
              table vusers db:/etc/mail/users.db

              action "local" mbox virtual <vusers>

              match for domain <vdomains> action "local"
              match for domain "example.org" action "local"


---------------------------------------------------

::

        /etc/mail/aliases     List of user mail aliases.
        /etc/mail/secrets     List of remote host credentials.


---------------------------------------------------------------

::

        The makemap utility exits 0 on success, and >0 if an error occurs.


---------------------------------------------------------

::

        aliases(5), smtpd.conf(5), table(5), newaliases(8), smtpd(8)


-------------------------------------------------------

::

        The makemap command first appeared in OpenBSD 4.6 as a replacement
        for the equivalent command shipped with sendmail.

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
