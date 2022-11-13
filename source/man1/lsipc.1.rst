.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

lsipc(1) — Linux manual page
============================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `OPTIONS <#OPTIONS>`__ \|         |                                   |
| `EXIT STATUS <#EXIT_STATUS>`__ \| |                                   |
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

   LSIPC(1)                      User Commands                     LSIPC(1)

NAME
-------------------------------------------------

::

          lsipc - show information on IPC facilities currently employed in
          the system


---------------------------------------------------------

::

          lsipc [options]


---------------------------------------------------------------

::

          lsipc shows information on the System V inter-process
          communication facilities for which the calling process has read
          access.


-------------------------------------------------------

::

          -i, --id id
              Show full details on just the one resource element identified
              by id. This option needs to be combined with one of the three
              resource options: -m, -q or -s. It is possible to override
              the default output format for this option with the --list,
              --raw, --json or --export option.

          -g, --global
              Show system-wide usage and limits of IPC resources. This
              option may be combined with one of the three resource
              options: -m, -q or -s. The default is to show information
              about all resources.

          -h, --help
              Display help text and exit.

          -V, --version
              Display version information and exit.

      Resource options
          -m, --shmems
              Write information about active shared memory segments.

          -q, --queues
              Write information about active message queues.

          -s, --semaphores
              Write information about active semaphore sets.

      Output formatting
          -c, --creator
              Show creator and owner.

          -e, --export
              Produce output in the form of key="value" pairs. All
              potentially unsafe value characters are hex-escaped
              (\x<code>). The key (variable name) will be modified to
              contain only characters allowed for a shell variable
              identifiers, for example, USE_PCT instead of USE%.

          -J, --json
              Use the JSON output format.

          -l, --list
              Use the list output format. This is the default, except when
              --id is used.

          -n, --newline
              Display each piece of information on a separate line.

          --noheadings
              Do not print a header line.

          --notruncate
              Don’t truncate output.

          -o, --output list
              Specify which output columns to print. Use --help to get a
              list of all supported columns.

          -b, --bytes
              Print size in bytes rather than in human readable format.

          -r, --raw
              Raw output (no columnation).

          -t, --time
              Write time information. The time of the last control
              operation that changed the access permissions for all
              facilities, the time of the last msgsnd(2) and msgrcv(2)
              operations on message queues, the time of the last shmat(2)
              and shmdt(2) operations on shared memory, and the time of the
              last semop(2) operation on semaphores.

          --time-format type
              Display dates in short, full or iso format. The default is
              short, this time format is designed to be space efficient and
              human readable.

          -P, --numeric-perms
              Print numeric permissions in PERMS column.


---------------------------------------------------------------

::

          0
              if OK,

          1
              if incorrect arguments specified,

          2
              if a serious error occurs.


-------------------------------------------------------

::

          The lsipc utility is inspired by the ipcs(1) utility.


-------------------------------------------------------

::

          Ondrej Oprala <ooprala@redhat.com>, Karel Zak <kzak@redhat.com>


---------------------------------------------------------

::

          ipcmk(1), ipcrm(1), msgrcv(2), msgsnd(2), semget(2), semop(2),
          shmat(2), shmdt(2), shmget(2), sysvipc(7)


---------------------------------------------------------------------

::

          For bug reports, use the issue tracker at
          https://github.com/karelzak/util-linux/issues.


-----------------------------------------------------------------

::

          The lsipc command is part of the util-linux package which can be
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

   util-linux 2.37.85-637cc       2021-04-02                       LSIPC(1)

--------------

Pages that refer to this page: `sysvipc(7) <../man7/sysvipc.7.html>`__

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
