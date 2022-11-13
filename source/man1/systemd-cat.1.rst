.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

systemd-cat(1) — Linux manual page
==================================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `OPTIONS <#OPTIONS>`__ \|         |                                   |
| `EXIT STATUS <#EXIT_STATUS>`__ \| |                                   |
| `EXAMPLES <#EXAMPLES>`__ \|       |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   SYSTEMD-CAT(1)                 systemd-cat                SYSTEMD-CAT(1)

NAME
-------------------------------------------------

::

          systemd-cat - Connect a pipeline or program's output with the
          journal


---------------------------------------------------------

::

          systemd-cat [OPTIONS...] [COMMAND] [ARGUMENTS...]

          systemd-cat [OPTIONS...]


---------------------------------------------------------------

::

          systemd-cat may be used to connect the standard input and output
          of a process to the journal, or as a filter tool in a shell
          pipeline to pass the output the previous pipeline element
          generates to the journal.

          If no parameter is passed, systemd-cat will write everything it
          reads from standard input (stdin) to the journal.

          If parameters are passed, they are executed as command line with
          standard output (stdout) and standard error output (stderr)
          connected to the journal, so that all it writes is stored in the
          journal.


-------------------------------------------------------

::

          The following options are understood:

          -h, --help
              Print a short help text and exit.

          --version
              Print a short version string and exit.

          -t, --identifier=
              Specify a short string that is used to identify the logging
              tool. If not specified, no identification string is written
              to the journal.

          -p, --priority=
              Specify the default priority level for the logged messages.
              Pass one of "emerg", "alert", "crit", "err", "warning",
              "notice", "info", "debug", or a value between 0 and 7
              (corresponding to the same named levels). These priority
              values are the same as defined by syslog(3). Defaults to
              "info". Note that this simply controls the default,
              individual lines may be logged with different levels if they
              are prefixed accordingly. For details, see --level-prefix=
              below.

          --stderr-priority=
              Specifies the default priority level for messages from the
              process's standard error output (stderr). Usage of this
              option is the same as the --priority= option, above, and both
              can be used at once. When both are used, --priority= will
              specify the default priority for standard output (stdout).

              If --stderr-priority= is not specified, messages from stderr
              will still be logged, with the same default priority level as
              stdout.

              Also, note that when stdout and stderr use the same default
              priority, the messages will be strictly ordered, because one
              channel is used for both. When the default priority differs,
              two channels are used, and so stdout messages will not be
              strictly ordered with respect to stderr messages - though
              they will tend to be approximately ordered.

          --level-prefix=
              Controls whether lines read are parsed for syslog priority
              level prefixes. If enabled (the default), a line prefixed
              with a priority prefix such as "<5>" is logged at priority 5
              ("notice"), and similar for the other priority levels. Takes
              a boolean argument.


---------------------------------------------------------------

::

          On success, 0 is returned, a non-zero failure code otherwise.


---------------------------------------------------------

::

          Example 1. Invoke a program

          This calls /bin/ls with standard output and error connected to
          the journal:

              # systemd-cat ls

          Example 2. Usage in a shell pipeline

          This builds a shell pipeline also invoking /bin/ls and writes the
          output it generates to the journal:

              # ls | systemd-cat

          Even though the two examples have very similar effects the first
          is preferable since only one process is running at a time, and
          both stdout and stderr are captured while in the second example,
          only stdout is captured.


---------------------------------------------------------

::

          systemd(1), systemctl(1), logger(1)

COLOPHON
---------------------------------------------------------

::

          This page is part of the systemd (systemd system and service
          manager) project.  Information about the project can be found at
          ⟨http://www.freedesktop.org/wiki/Software/systemd⟩.  If you have
          a bug report for this manual page, see
          ⟨http://www.freedesktop.org/wiki/Software/systemd/#bugreports⟩.
          This page was obtained from the project's upstream Git repository
          ⟨https://github.com/systemd/systemd.git⟩ on 2021-08-27.  (At that
          time, the date of the most recent commit that was found in the
          repository was 2021-08-27.)  If you discover any rendering
          problems in this HTML version of the page, or you believe there
          is a better or more up-to-date source for the page, or you have
          corrections or improvements to the information in this COLOPHON
          (which is not part of the original manual page), send a mail to
          man-pages@man7.org

   systemd 249                                               SYSTEMD-CAT(1)

--------------

Pages that refer to this page:
`sd-journal(3) <../man3/sd-journal.3.html>`__, 
`systemd-journald.service(8) <../man8/systemd-journald.service.8.html>`__

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
