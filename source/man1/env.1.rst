.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

env(1) — Linux manual page
==========================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `OPTIONS <#OPTIONS>`__ \|         |                                   |
| `NOTES <#NOTES>`__ \|             |                                   |
| `AUTHOR <#AUTHOR>`__ \|           |                                   |
| `RE                               |                                   |
| PORTING BUGS <#REPORTING_BUGS>`__ |                                   |
| \| `COPYRIGHT <#COPYRIGHT>`__ \|  |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   ENV(1)                        User Commands                       ENV(1)

NAME
-------------------------------------------------

::

          env - run a program in a modified environment


---------------------------------------------------------

::

          env [OPTION]... [-] [NAME=VALUE]... [COMMAND [ARG]...]


---------------------------------------------------------------

::

          Set each NAME to VALUE in the environment and run COMMAND.

          Mandatory arguments to long options are mandatory for short
          options too.

          -i, --ignore-environment
                 start with an empty environment

          -0, --null
                 end each output line with NUL, not newline

          -u, --unset=NAME
                 remove variable from the environment

          -C, --chdir=DIR
                 change working directory to DIR

          -S, --split-string=S
                 process and split S into separate arguments; used to pass
                 multiple arguments on shebang lines

          --block-signal[=SIG]
                 block delivery of SIG signal(s) to COMMAND

          --default-signal[=SIG]
                 reset handling of SIG signal(s) to the default

          --ignore-signal[=SIG]
                 set handling of SIG signals(s) to do nothing

          --list-signal-handling
                 list non default signal handling to stderr

          -v, --debug
                 print verbose information for each processing step

          --help display this help and exit

          --version
                 output version information and exit

          A mere - implies -i.  If no COMMAND, print the resulting
          environment.

          SIG may be a signal name like 'PIPE', or a signal number like
          '13'.  Without SIG, all known signals are included.  Multiple
          signals can be comma-separated.


-------------------------------------------------------

::

      -S/--split-string usage in scripts
          The -S option allows specifying multiple parameters in a script.
          Running a script named 1.pl containing the following first line:

                 #!/usr/bin/env -S perl -w -T
                 ...

          Will execute perl -w -T 1.pl .

          Without the '-S' parameter the script will likely fail with:

                 /usr/bin/env: 'perl -w -T': No such file or directory

          See the full documentation for more details.

      --default-signal[=SIG] usage
          This option allows setting a signal handler to its default
          action, which is not possible using the traditional shell trap
          command.  The following example ensures that seq will be
          terminated by SIGPIPE no matter how this signal is being handled
          in the process invoking the command.

                 sh -c 'env --default-signal=PIPE seq inf | head -n1'


---------------------------------------------------

::

          POSIX's exec(2) pages says:
                 "many existing applications wrongly assume that they start
                 with certain signals set to the default action and/or
                 unblocked.... Therefore, it is best not to block or ignore
                 signals across execs without explicit reason to do so, and
                 especially not to block signals across execs of arbitrary
                 (not closely cooperating) programs."


-----------------------------------------------------

::

          Written by Richard Mlynarik, David MacKenzie, and Assaf Gordon.


---------------------------------------------------------------------

::

          GNU coreutils online help:
          <https://www.gnu.org/software/coreutils/>
          Report any translation bugs to
          <https://translationproject.org/team/>


-----------------------------------------------------------

::

          Copyright © 2020 Free Software Foundation, Inc.  License GPLv3+:
          GNU GPL version 3 or later <https://gnu.org/licenses/gpl.html>.
          This is free software: you are free to change and redistribute
          it.  There is NO WARRANTY, to the extent permitted by law.


---------------------------------------------------------

::

          sigaction(2), sigprocmask(2), signal(7)

          Full documentation <https://www.gnu.org/software/coreutils/env>
          or available locally via: info '(coreutils) env invocation'

COLOPHON
---------------------------------------------------------

::

          This page is part of the coreutils (basic file, shell and text
          manipulation utilities) project.  Information about the project
          can be found at ⟨http://www.gnu.org/software/coreutils/⟩.  If you
          have a bug report for this manual page, see
          ⟨http://www.gnu.org/software/coreutils/⟩.  This page was obtained
          from the tarball coreutils-8.32.tar.xz fetched from
          ⟨http://ftp.gnu.org/gnu/coreutils/⟩ on 2021-08-27.  If you
          discover any rendering problems in this HTML version of the page,
          or you believe there is a better or more up-to-date source for
          the page, or you have corrections or improvements to the
          information in this COLOPHON (which is not part of the original
          manual page), send a mail to man-pages@man7.org

   GNU coreutils 8.32             March 2020                         ENV(1)

--------------

Pages that refer to this page:
`pmpython(1) <../man1/pmpython.1.html>`__, 
`environ(7) <../man7/environ.7.html>`__

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
