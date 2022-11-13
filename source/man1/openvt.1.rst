.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

openvt(1) — Linux manual page
=============================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `NOTE <#NOTE>`__ \|               |                                   |
| `EXAMPLES <#EXAMPLES>`__ \|       |                                   |
| `HISTORY <#HISTORY>`__ \|         |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   OPENVT(1)                General Commands Manual               OPENVT(1)

NAME
-------------------------------------------------

::

          openvt - start a program on a new virtual terminal (VT).


---------------------------------------------------------

::

          openvt [-c vtnumber] [OPTIONS] [--] command


---------------------------------------------------------------

::

          openvt will find the first available VT, and run on it the given
          command with the given command options , standard input, output
          and error are directed to that terminal. The current search path
          ($PATH) is used to find the requested command. If no command is
          specified then the environment variable $SHELL is used.

      OPTIONS
          -c, --console=VTNUMBER
                 Use the given VT number and not the first available. Note
                 you must have write access to the supplied VT for this to
                 work.

          -f, --force
                 Force opening a VT without checking whether it is already
                 in use.

          -e, --exec
                 Directly execute the given command, without forking.  This
                 option is meant for use in /etc/inittab.

          -s, --switch
                 Switch to the new VT when starting the command. The VT of
                 the new command will be made the new current VT.

          -u, --user
                 Figure out the owner of the current VT, and run login as
                 that user.  Suitable to be called by init. Shouldn't be
                 used with -c or -l.

          -l, --login
                 Make the command a login shell. A - is prepended to the
                 name of the command to be executed.

          -v, --verbose
                 Be a bit more verbose.

          -w, --wait
                 wait for command to complete. If -w and -s are used
                 together then openvt will switch back to the controlling
                 terminal when the command completes.

          -V, --version
                 print program version and exit.

          -h, --help
                 show this text and exit.

          --     end of options to openvt.


-------------------------------------------------

::

          If openvt is compiled with a getopt_long() and you wish to set
          options to the command to be run, then you must supply the end of
          options -- flag before the command.


---------------------------------------------------------

::

          openvt can be used to start a shell on the next free VT, by using
          the command:

          openvt bash

          To start the shell as a login shell, use:

          openvt -l bash

          To get a long listing you must supply the -- separator:

          openvt -- ls -l


-------------------------------------------------------

::

          Earlier, openvt was called open.  It was written by Jon Tombs
          <jon@gtex02.us.es> or <jon@robots.ox.ac.uk>.  The -w idea is from
          "sam".


---------------------------------------------------------

::

          chvt(1), doshell(8), login(1)

COLOPHON
---------------------------------------------------------

::

          This page is part of the kbd (Linux keyboard tools) project.
          Information about the project can be found at 
          ⟨http://www.kbd-project.org/⟩.  If you have a bug report for this
          manual page, send it to kbd@lists.altlinux.org.  This page was
          obtained from the project's upstream Git repository
          ⟨https://github.com/legionus/kbd.git⟩ on 2021-08-27.  (At that
          time, the date of the most recent commit that was found in the
          repository was 2021-07-04.)  If you discover any rendering
          problems in this HTML version of the page, or you believe there
          is a better or more up-to-date source for the page, or you have
          corrections or improvements to the information in this COLOPHON
          (which is not part of the original manual page), send a mail to
          man-pages@man7.org

   kbd                            19 Jul 1996                     OPENVT(1)

--------------

Pages that refer to this page:
`deallocvt(1) <../man1/deallocvt.1.html>`__

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
