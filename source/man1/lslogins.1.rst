.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

lslogins(1) — Linux manual page
===============================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `OPTIONS <#OPTIONS>`__ \|         |                                   |
| `EXIT STATUS <#EXIT_STATUS>`__ \| |                                   |
| `NOTES <#NOTES>`__ \|             |                                   |
| `HISTORY <#HISTORY>`__ \|         |                                   |
| `AUTHORS <#AUTHORS>`__ \|         |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `RE                               |                                   |
| PORTING BUGS <#REPORTING_BUGS>`__ |                                   |
| \|                                |                                   |
| `AVAILABILITY <#AVAILABILITY>`__  |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   LSLOGINS(1)                   User Commands                  LSLOGINS(1)

NAME
-------------------------------------------------

::

          lslogins - display information about known users in the system


---------------------------------------------------------

::

          lslogins [options] [-s|-u[=UID]] [-g groups] [-l logins]
          [username]


---------------------------------------------------------------

::

          Examine the wtmp and btmp logs, /etc/shadow (if necessary) and
          /passwd and output the desired data.

          The optional argument username forces lslogins to print all
          available details about the specified user only. In this case the
          output format is different than in case of -l or -g and unknown
          is username reported as an error.

          The default action is to list info about all the users in the
          system.


-------------------------------------------------------

::

          Mandatory arguments to long options are mandatory for short
          options too.

          -a, --acc-expiration
              Display data about the date of last password change and the
              account expiration date (see shadow(5) for more info).
              (Requires root privileges.)

          --btmp-file path
              Alternate path for btmp.

          -c, --colon-separate
              Separate info about each user with a colon instead of a
              newline.

          -e, --export
              Output data in the format of NAME=VALUE.

          -f, --failed
              Display data about the users' last failed login attempts.

          -G, --supp-groups
              Show information about supplementary groups.

          -g, --groups=groups
              Only show data of users belonging to groups. More than one
              group may be specified; the list has to be comma-separated.
              Unknown group names are ignored.

              Note that relation between user and group may be invisible
              for primary group if the user is not explicitly specify as
              group member (e.g., in /etc/group). If the command lslogins
              scans for groups than it uses groups database only, and user
              database with primary GID is not used at all.

          -h, --help
              Display help information and exit.

          -L, --last
              Display data containing information about the users' last
              login sessions.

          -l, --logins=logins
              Only show data of users with a login specified in logins
              (user names or user IDS). More than one login may be
              specified; the list has to be comma-separated. Unknown login
              names are ignored.

          -n, --newline
              Display each piece of information on a separate line.

          --noheadings
              Do not print a header line.

          --notruncate
              Don’t truncate output.

          -o, --output list
              Specify which output columns to print. The default list of
              columns may be extended if list is specified in the format
              +list.

          --output-all
              Output all available columns. --help to get a list of all
              supported columns.

          -p, --pwd
              Display information related to login by password (see also
              -afL).

          -r, --raw
              Raw output (no columnation).

          -s, --system-accs
              Show system accounts. These are by default all accounts with
              a UID between 101 and 999 (inclusive), with the exception of
              either nobody or nfsnobody (UID 65534). This hardcoded
              default may be overwritten by parameters SYS_UID_MIN and
              SYS_UID_MAX in the file /etc/login.defs.

          --time-format type
              Display dates in short, full or iso format. The default is
              short, this time format is designed to be space efficient and
              human readable.

          -u, --user-accs
              Show user accounts. These are by default all accounts with
              UID above 1000 (inclusive), with the exception of either
              nobody or nfsnobody (UID 65534). This hardcoded default maybe
              overwritten by parameters UID_MIN and UID_MAX in the file
              /etc/login.defs.

          -V, --version
              Display version information and exit.

          --wtmp-file path
              Alternate path for wtmp.

          --lastlog path
              Alternate path for lastlog(8).

          -Z, --context
              Display the users' security context.

          -z, --print0
              Delimit user entries with a nul character, instead of a
              newline.


---------------------------------------------------------------

::

          0
              if OK,

          1
              if incorrect arguments specified,

          2
              if a serious error occurs (e.g., a corrupt log).


---------------------------------------------------

::

          The default UID thresholds are read from /etc/login.defs.


-------------------------------------------------------

::

          The lslogins utility is inspired by the logins utility, which
          first appeared in FreeBSD 4.10.


-------------------------------------------------------

::

          Ondrej Oprala <ooprala@redhat.com>, Karel Zak <kzak@redhat.com>


---------------------------------------------------------

::

          group(5), passwd(5), shadow(5), utmp(5)


---------------------------------------------------------------------

::

          For bug reports, use the issue tracker at
          https://github.com/karelzak/util-linux/issues.


-----------------------------------------------------------------

::

          The lslogins command is part of the util-linux package which can
          be downloaded from Linux Kernel Archive
          <https://www.kernel.org/pub/linux/utils/util-linux/>. This page
          is part of the util-linux (a random collection of Linux
          utilities) project. Information about the project can be found at
          ⟨https://www.kernel.org/pub/linux/utils/util-linux/⟩. If you have
          a bug report for this manual page, send it to
          util-linux@vger.kernel.org. This page was obtained from the
          project's upstream Git repository
          ⟨git://git.kernel.org/pub/scm/utils/util-linux/util-linux.git⟩ on
          2021-08-27. (At that time, the date of the most recent commit
          that was found in the repository was 2021-08-24.) If you discover
          any rendering problems in this HTML version of the page, or you
          believe there is a better or more up-to-date source for the page,
          or you have corrections or improvements to the information in
          this COLOPHON (which is not part of the original manual page),
          send a mail to man-pages@man7.org

   util-linux 2.37.85-637cc       2021-04-02                    LSLOGINS(1)

--------------

Pages that refer to this page: `utmp(5) <../man5/utmp.5.html>`__

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
