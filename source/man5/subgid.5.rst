.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

subgid(5) — Linux manual page
=============================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `LOCAL SUBORDINATE DELEGATION <   |                                   |
| #LOCAL_SUBORDINATE_DELEGATION>`__ |                                   |
| \| `FILES <#FILES>`__ \|          |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   SUBGID(5)             File Formats and Conversions             SUBGID(5)

NAME
-------------------------------------------------

::

          subgid - the configuration for subordinate group ids


---------------------------------------------------------------

::

          Subgid authorizes a group id to map ranges of group ids from its
          namespace into child namespaces.

          The delegation of the subordinate gids can be configured via the
          subid field in /etc/nsswitch.conf file. Only one value can be set
          as the delegation source. Setting this field to files configures
          the delegation of gids to /etc/subgid. Setting any other value
          treats the delegation as a plugin following with a name of the
          form libsubid_$value.so. If the value or plugin is missing, then
          the subordinate gid delegation falls back to files.

          Note, that groupadd will only create entries in /etc/subgid if
          subid delegation is managed via subid files.


-------------------------------------------------------------------------------------------------

::

          Each line in /etc/subgid contains a user name and a range of
          subordinate group ids that user is allowed to use. This is
          specified with three fields delimited by colons (“:”). These
          fields are:

          •   login name or UID

          •   numerical subordinate group ID

          •   numerical subordinate group ID count

          This file specifies the group IDs that ordinary users can use,
          with the newgidmap command, to configure gid mapping in a user
          namespace.

          Multiple ranges may be specified per user.

          When large number of entries (10000-100000 or more) are defined
          in /etc/subgid, parsing performance penalty will become
          noticeable. In this case it is recommended to use UIDs instead of
          login names. Benchmarks have shown speed-ups up to 20x.


---------------------------------------------------

::

          /etc/subgid
              Per user subordinate group IDs.

          /etc/subgid-
              Backup file for /etc/subgid.


---------------------------------------------------------

::

          login.defs(5), newgidmap(1), newuidmap(1), newusers(8),
          subuid(5), useradd(8), userdel(8), usermod(8),
          user_namespaces(7).

COLOPHON
---------------------------------------------------------

::

          This page is part of the shadow-utils (utilities for managing
          accounts and shadow password files) project.  Information about
          the project can be found at 
          ⟨https://github.com/shadow-maint/shadow⟩.  If you have a bug
          report for this manual page, send it to
          pkg-shadow-devel@alioth-lists.debian.net.  This page was obtained
          from the project's upstream Git repository
          ⟨https://github.com/shadow-maint/shadow⟩ on 2021-08-27.  (At that
          time, the date of the most recent commit that was found in the
          repository was 2021-08-14.)  If you discover any rendering
          problems in this HTML version of the page, or you believe there
          is a better or more up-to-date source for the page, or you have
          corrections or improvements to the information in this COLOPHON
          (which is not part of the original manual page), send a mail to
          man-pages@man7.org

   shadow-utils 4.8.1             08/27/2021                      SUBGID(5)

--------------

Pages that refer to this page:
`newgidmap(1) <../man1/newgidmap.1.html>`__, 
`subuid(5) <../man5/subuid.5.html>`__, 
`user_namespaces(7) <../man7/user_namespaces.7.html>`__, 
`newusers(8) <../man8/newusers.8.html>`__, 
`useradd(8) <../man8/useradd.8.html>`__, 
`userdel(8) <../man8/userdel.8.html>`__, 
`usermod(8) <../man8/usermod.8.html>`__

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
