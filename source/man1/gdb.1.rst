.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

gdb(1) — Linux manual page
==========================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `OPTIONS <#OPTIONS>`__ \|         |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `COPYRIGHT <#COPYRIGHT>`__ \|     |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   GDB(1)                    GNU Development Tools                   GDB(1)

NAME
-------------------------------------------------

::

          gdb - The GNU Debugger


---------------------------------------------------------

::

          gdb [-help] [-nh] [-nx] [-q] [-batch] [-cd=dir] [-f] [-b bps]
              [-tty=dev] [-s symfile] [-e prog] [-se prog] [-c core]
          [-p procID]
              [-x cmds] [-d dir] [prog|prog procID|prog core]


---------------------------------------------------------------

::

          The purpose of a debugger such as GDB is to allow you to see what
          is going on "inside" another program while it executes -- or what
          another program was doing at the moment it crashed.

          GDB can do four main kinds of things (plus other things in
          support of these) to help you catch bugs in the act:

          •   Start your program, specifying anything that might affect its
              behavior.

          •   Make your program stop on specified conditions.

          •   Examine what has happened, when your program has stopped.

          •   Change things in your program, so you can experiment with
              correcting the effects of one bug and go on to learn about
              another.

          You can use GDB to debug programs written in C, C++, Fortran and
          Modula-2.

          GDB is invoked with the shell command "gdb".  Once started, it
          reads commands from the terminal until you tell it to exit with
          the GDB command "quit".  You can get online help from GDB itself
          by using the command "help".

          You can run "gdb" with no arguments or options; but the most
          usual way to start GDB is with one argument or two, specifying an
          executable program as the argument:

                  gdb program

          You can also start with both an executable program and a core
          file specified:

                  gdb program core

          You can, instead, specify a process ID as a second argument or
          use option "-p", if you want to debug a running process:

                  gdb program 1234
                  gdb -p 1234

          would attach GDB to process 1234.  With option -p you can omit
          the program filename.

          Here are some of the most frequently needed GDB commands:

          break [file:]function
              Set a breakpoint at function (in file).

          run [arglist]
              Start your program (with arglist, if specified).

          bt  Backtrace: display the program stack.

          print expr
              Display the value of an expression.

          c   Continue running your program (after stopping, e.g. at a
              breakpoint).

          next
              Execute next program line (after stopping); step over any
              function calls in the line.

          edit [file:]function
              look at the program line where it is presently stopped.

          list [file:]function
              type the text of the program in the vicinity of where it is
              presently stopped.

          step
              Execute next program line (after stopping); step into any
              function calls in the line.

          help [name]
              Show information about GDB command name, or general
              information about using GDB.

          quit
              Exit from GDB.

          For full details on GDB, see Using GDB: A Guide to the GNU
          Source-Level Debugger, by Richard M. Stallman and Roland H.
          Pesch.  The same text is available online as the "gdb" entry in
          the "info" program.


-------------------------------------------------------

::

          Any arguments other than options specify an executable file and
          core file (or process ID); that is, the first argument
          encountered with no associated option flag is equivalent to a -se
          option, and the second, if any, is equivalent to a -c option if
          it's the name of a file.  Many options have both long and short
          forms; both are shown here.  The long forms are also recognized
          if you truncate them, so long as enough of the option is present
          to be unambiguous.  (If you prefer, you can flag option arguments
          with + rather than -, though we illustrate the more usual
          convention.)

          All the options and command line arguments you give are processed
          in sequential order.  The order makes a difference when the -x
          option is used.

          -help
          -h  List all options, with brief explanations.

          -symbols=file
          -s file
              Read symbol table from file file.

          -write
              Enable writing into executable and core files.

          -exec=file
          -e file
              Use file file as the executable file to execute when
              appropriate, and for examining pure data in conjunction with
              a core dump.

          -se=file
              Read symbol table from file file and use it as the executable
              file.

          -core=file
          -c file
              Use file file as a core dump to examine.

          -command=file
          -x file
              Execute GDB commands from file file.

          -ex command
              Execute given GDB command.

          -directory=directory
          -d directory
              Add directory to the path to search for source files.

          -nh Do not execute commands from ~/.gdbinit.

          -nx
          -n  Do not execute commands from any .gdbinit initialization
              files.

          -quiet
          -q  "Quiet".  Do not print the introductory and copyright
              messages.  These messages are also suppressed in batch mode.

          -batch
              Run in batch mode.  Exit with status 0 after processing all
              the command files specified with -x (and .gdbinit, if not
              inhibited).  Exit with nonzero status if an error occurs in
              executing the GDB commands in the command files.

              Batch mode may be useful for running GDB as a filter, for
              example to download and run a program on another computer; in
              order to make this more useful, the message

                      Program exited normally.

              (which is ordinarily issued whenever a program running under
              GDB control terminates) is not issued when running in batch
              mode.

          -cd=directory
              Run GDB using directory as its working directory, instead of
              the current directory.

          -fullname
          -f  Emacs sets this option when it runs GDB as a subprocess.  It
              tells GDB to output the full file name and line number in a
              standard, recognizable fashion each time a stack frame is
              displayed (which includes each time the program stops).  This
              recognizable format looks like two \032 characters, followed
              by the file name, line number and character position
              separated by colons, and a newline.  The Emacs-to-GDB
              interface program uses the two \032 characters as a signal to
              display the source code for the frame.

          -b bps
              Set the line speed (baud rate or bits per second) of any
              serial interface used by GDB for remote debugging.

          -tty=device
              Run using device for your program's standard input and
              output.


---------------------------------------------------------

::

          The full documentation for GDB is maintained as a Texinfo manual.
          If the "info" and "gdb" programs and GDB's Texinfo documentation
          are properly installed at your site, the command

                  info gdb

          should give you access to the complete manual.

          Using GDB: A Guide to the GNU Source-Level Debugger, Richard M.
          Stallman and Roland H. Pesch, July 1991.


-----------------------------------------------------------

::

          Copyright (c) 1988-2021 Free Software Foundation, Inc.

          Permission is granted to copy, distribute and/or modify this
          document under the terms of the GNU Free Documentation License,
          Version 1.3 or any later version published by the Free Software
          Foundation; with the Invariant Sections being "Free Software" and
          "Free Software Needs Free Documentation", with the Front-Cover
          Texts being "A GNU Manual," and with the Back-Cover Texts as in
          (a) below.

          (a) The FSF's Back-Cover Text is: "You are free to copy and
          modify this GNU Manual.  Buying copies from GNU Press supports
          the FSF in developing GNU and promoting software freedom."

COLOPHON
---------------------------------------------------------

::

          This page is part of the gdb (GNU debugger) project.  Information
          about the project can be found at 
          ⟨http://www.gnu.org/software/gdb/⟩.  If you have a bug report for
          this manual page, see ⟨http://www.gnu.org/software/gdb/bugs/⟩.
          This page was obtained from the tarball gdb-10.2.tar.gz fetched
          from ⟨https://ftp.gnu.org/gnu/gdb/⟩ on 2021-08-27.  If you
          discover any rendering problems in this HTML version of the page,
          or you believe there is a better or more up-to-date source for
          the page, or you have corrections or improvements to the
          information in this COLOPHON (which is not part of the original
          manual page), send a mail to man-pages@man7.org

   gdb-10.2                       2021-04-25                         GDB(1)

--------------

Pages that refer to this page:
`coredumpctl(1) <../man1/coredumpctl.1.html>`__, 
`dbpmda(1) <../man1/dbpmda.1.html>`__, 
`pldd(1) <../man1/pldd.1.html>`__, 
`pmdbg(1) <../man1/pmdbg.1.html>`__, 
`stap(1) <../man1/stap.1.html>`__, 
`stap-merge(1) <../man1/stap-merge.1.html>`__, 
`ptrace(2) <../man2/ptrace.2.html>`__, 
`abort(3) <../man3/abort.3.html>`__, 
`backtrace(3) <../man3/backtrace.3.html>`__, 
`core(5) <../man5/core.5.html>`__,  `elf(5) <../man5/elf.5.html>`__, 
`gdbinit(5) <../man5/gdbinit.5.html>`__, 
`proc(5) <../man5/proc.5.html>`__, 
`stappaths(7) <../man7/stappaths.7.html>`__, 
`crash(8) <../man8/crash.8.html>`__, 
`systemd-coredump(8) <../man8/systemd-coredump.8.html>`__, 
`systemd-sysext(8) <../man8/systemd-sysext.8.html>`__

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
