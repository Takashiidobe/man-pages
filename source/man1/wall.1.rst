.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

wall(1) — Linux manual page
===========================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `OPTIONS <#OPTIONS>`__ \|         |                                   |
| `NOTES <#NOTES>`__ \|             |                                   |
| `HISTORY <#HISTORY>`__ \|         |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `RE                               |                                   |
| PORTING BUGS <#REPORTING_BUGS>`__ |                                   |
| \|                                |                                   |
| `AVAILABILITY <#AVAILABILITY>`__  |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   WALL(1)                       User Commands                      WALL(1)

NAME
-------------------------------------------------

::

          wall - write a message to all users


---------------------------------------------------------

::

          wall [-n] [-t timeout] [-g group] [message | file]


---------------------------------------------------------------

::

          wall displays a message, or the contents of a file, or otherwise
          its standard input, on the terminals of all currently logged in
          users. The command will wrap lines that are longer than 79
          characters. Short lines are whitespace padded to have 79
          characters. The command will always put a carriage return and new
          line at the end of each line.

          Only the superuser can write on the terminals of users who have
          chosen to deny messages or are using a program which
          automatically denies messages.

          Reading from a file is refused when the invoker is not superuser
          and the program is set-user-ID or set-group-ID.


-------------------------------------------------------

::

          -n, --nobanner
              Suppress the banner.

          -t, --timeout timeout
              Abandon the write attempt to the terminals after timeout
              seconds. This timeout must be a positive integer. The default
              value is 300 seconds, which is a legacy from the time when
              people ran terminals over modem lines.

          -g, --group group
              Limit printing message to members of group defined as a group
              argument. The argument can be group name or GID.

          -V, --version
              Display version information and exit.

          -h, --help
              Display help text and exit.


---------------------------------------------------

::

          Some sessions, such as wdm(1x), that have in the beginning of
          utmp(5) ut_type data a ':' character will not get the message
          from wall. This is done to avoid write errors.


-------------------------------------------------------

::

          A wall command appeared in Version 7 AT&T UNIX.


---------------------------------------------------------

::

          mesg(1), talk(1), write(1), shutdown(8)


---------------------------------------------------------------------

::

          For bug reports, use the issue tracker at
          https://github.com/karelzak/util-linux/issues.


-----------------------------------------------------------------

::

          The wall command is part of the util-linux package which can be
          downloaded from Linux Kernel Archive
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

   util-linux 2.37.85-637cc       2021-04-02                        WALL(1)

--------------

Pages that refer to this page: `mesg(1) <../man1/mesg.1.html>`__, 
`systemctl(1) <../man1/systemctl.1.html>`__, 
`systemd-ask-password(1) <../man1/systemd-ask-password.1.html>`__, 
`systemd-tty-ask-password-agent(1) <../man1/systemd-tty-ask-password-agent.1.html>`__, 
`halt(8) <../man8/halt.8.html>`__, 
`shutdown(8) <../man8/shutdown.8.html>`__, 
`systemd-ask-password-console.service(8) <../man8/systemd-ask-password-console.service.8.html>`__, 
`telinit(8) <../man8/telinit.8.html>`__

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
