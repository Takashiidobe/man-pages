.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

lslocks(8) — Linux manual page
==============================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `OPTIONS <#OPTIONS>`__ \|         |                                   |
| `OUTPUT <#OUTPUT>`__ \|           |                                   |
| `NOTES <#NOTES>`__ \|             |                                   |
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

   LSLOCKS(8)                System Administration               LSLOCKS(8)

NAME
-------------------------------------------------

::

          lslocks - list local system locks


---------------------------------------------------------

::

          lslocks [options]


---------------------------------------------------------------

::

          lslocks lists information about all the currently held file locks
          in a Linux system.

          Note that lslocks also lists OFD (Open File Description) locks,
          these locks are not associated with any process (PID is -1). OFD
          locks are associated with the open file description on which they
          are acquired. This lock type is available since Linux 3.15, see
          fcntl(2) for more details.


-------------------------------------------------------

::

          -b, --bytes
              Print the SIZE column in bytes rather than in a
              human-readable format.

          -i, --noinaccessible
              Ignore lock files which are inaccessible for the current
              user.

          -J, --json
              Use JSON output format.

          -n, --noheadings
              Do not print a header line.

          -o, --output list
              Specify which output columns to print. Use --help to get a
              list of all supported columns.

              The default list of columns may be extended if list is
              specified in the format +list (e.g., lslocks -o +BLOCKER).

          --output-all
              Output all available columns.

          -p, --pid pid
              Display only the locks held by the process with this pid.

          -r, --raw
              Use the raw output format.

          -u, --notruncate
              Do not truncate text in columns.

          -V, --version
              Display version information and exit.

          -h, --help
              Display help text and exit.


-----------------------------------------------------

::

          COMMAND
              The command name of the process holding the lock.

          PID
              The process ID of the process which holds the lock or -1 for
              OFDLCK.

          TYPE
              The type of lock; can be FLOCK (created with flock(2)), POSIX
              (created with fcntl(2) and lockf(3)) or OFDLCK (created with
              fcntl(2)).

          SIZE
              Size of the locked file.

          MODE
              The lock’s access permissions (read, write). If the process
              is blocked and waiting for the lock, then the mode is
              postfixed with an '*' (asterisk).

          M
              Whether the lock is mandatory; 0 means no (meaning the lock
              is only advisory), 1 means yes. (See fcntl(2).)

          START
              Relative byte offset of the lock.

          END
              Ending offset of the lock.

          PATH
              Full path of the lock. If none is found, or there are no
              permissions to read the path, it will fall back to the
              device’s mountpoint and "..." is appended to the path. The
              path might be truncated; use --notruncate to get the full
              path.

          BLOCKER
              The PID of the process which blocks the lock.


---------------------------------------------------

::

          The lslocks command is meant to replace the lslk(8) command,
          originally written by Victor A. Abell <abe@purdue.edu> and
          unmaintained since 2001.


-------------------------------------------------------

::

          Davidlohr Bueso <dave@gnu.org>


---------------------------------------------------------

::

          flock(1), fcntl(2), lockf(3)


---------------------------------------------------------------------

::

          For bug reports, use the issue tracker at
          https://github.com/karelzak/util-linux/issues.


-----------------------------------------------------------------

::

          The lslocks command is part of the util-linux package which can
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

   util-linux 2.37.85-637cc       2021-04-02                     LSLOCKS(8)

--------------

Pages that refer to this page: `fcntl(2) <../man2/fcntl.2.html>`__, 
`flock(2) <../man2/flock.2.html>`__,  `proc(5) <../man5/proc.5.html>`__

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
