.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

lastlog(8) — Linux manual page
==============================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `OPTIONS <#OPTIONS>`__ \|         |                                   |
| `NOTE <#NOTE>`__ \|               |                                   |
| `                                 |                                   |
| CONFIGURATION <#CONFIGURATION>`__ |                                   |
| \| `FILES <#FILES>`__ \|          |                                   |
| `CAVEATS <#CAVEATS>`__ \|         |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   LASTLOG(8)             System Management Commands             LASTLOG(8)

NAME
-------------------------------------------------

::

          lastlog - reports the most recent login of all users or of a
          given user


---------------------------------------------------------

::

          lastlog [options]


---------------------------------------------------------------

::

          lastlog formats and prints the contents of the last login log
          /var/log/lastlog file. The login-name, port, and last login time
          will be printed. The default (no flags) causes lastlog entries to
          be printed, sorted by their order in /etc/passwd.


-------------------------------------------------------

::

          The options which apply to the lastlog command are:

          -b, --before DAYS
              Print only lastlog records older than DAYS.

          -C, --clear
              Clear lastlog record of a user. This option can be used only
              together with -u (--user)).

          -h, --help
              Display help message and exit.

          -R, --root CHROOT_DIR
              Apply changes in the CHROOT_DIR directory and use the
              configuration files from the CHROOT_DIR directory.

          -S, --set
              Set lastlog record of a user to the current time. This option
              can be used only together with -u (--user)).

          -t, --time DAYS
              Print the lastlog records more recent than DAYS.

          -u, --user LOGIN|RANGE
              Print the lastlog record of the specified user(s).

              The users can be specified by a login name, a numerical user
              ID, or a RANGE of users. This RANGE of users can be specified
              with a min and max values (UID_MIN-UID_MAX), a max value
              (-UID_MAX), or a min value (UID_MIN-).

          If the user has never logged in the message ** Never logged in**
          will be displayed instead of the port and time.

          Only the entries for the current users of the system will be
          displayed. Other entries may exist for users that were deleted
          previously.


-------------------------------------------------

::

          The lastlog file is a database which contains info on the last
          login of each user. You should not rotate it. It is a sparse
          file, so its size on the disk is usually much smaller than the
          one shown by "ls -l" (which can indicate a really big file if you
          have in passwd users with a high UID). You can display its real
          size with "ls -s".


-------------------------------------------------------------------

::

          The following configuration variables in /etc/login.defs change
          the behavior of this tool:

          LASTLOG_UID_MAX (number)
              Highest user ID number for which the lastlog entries should
              be updated. As higher user IDs are usually tracked by remote
              user identity and authentication services there is no need to
              create a huge sparse lastlog file for them.

              No LASTLOG_UID_MAX option present in the configuration means
              that there is no user ID limit for writing lastlog entries.


---------------------------------------------------

::

          /var/log/lastlog
              Database times of previous user logins.


-------------------------------------------------------

::

          Large gaps in UID numbers will cause the lastlog program to run
          longer with no output to the screen (i.e. if in lastlog database
          there is no entries for users with UID between 170 and 800
          lastlog will appear to hang as it processes entries with UIDs
          171-799).

          Having high UIDs can create problems when handling the <term>
          /var/log/lastlog</term> with external tools. Although the actual
          file is sparse and does not use too much space, certain
          applications are not designed to identify sparse files by default
          and may require a specific option to handle them.

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

   shadow-utils 4.8.1             08/27/2021                     LASTLOG(8)

--------------

Pages that refer to this page: `login(1) <../man1/login.1.html>`__, 
`lslogins(1) <../man1/lslogins.1.html>`__

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
