.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

`Go to the version of this page provided by the dnf
project <yum-shell.8.html>`__

--------------

yum-shell(8) — Linux manual page
================================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `Examples <#Examples>`__ \|       |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `AUTHORS <#AUTHORS>`__ \|         |                                   |
| `BUGS <#BUGS>`__ \|               |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   yum(8)                                                            yum(8)

NAME
-------------------------------------------------

::

          yum - Yellowdog Updater Modified shell


---------------------------------------------------------

::

          yum shell [filename]


---------------------------------------------------------------

::

          yum includes an interactive shell for conducting multiple
          commands or sets of commands during a single execution of yum.
          These commands can be issued manually or passed to yum from a
          file. The commands are much the same as the normal yum command
          line options. See here yum(8) for that information. There are a
          few additional commands documented below.

          config
                    [argument] [value]
                    args: debuglevel, errorlevel, obsoletes, gpgcheck,
                 assumeyes, exclude
                      If no value is given it prints the current value.
                      If value is given it sets that value.

          repo
                    [argument] [option]
                      list: lists repositories and their status
                      enable: enable repositories. option = repository id
                      disable: disable repositories. option = repository id

          transaction
                    [argument]
                      list: lists the contents of the transaction
                      reset: reset (zero-out) the transaction
                      solve: run the dependency solver on the transaction
                      run: run the transaction

          exit
                      Causes the shell to exit, setting the exit status as
                 specified by the
                      shell_exit_status option in yum.conf(5).
                      This command is also triggered when EOF is read
                 (usually the C-d keystroke
                      or end of script).


---------------------------------------------------------

::

          The following are examples of using the yum shell.

                  list available packagename*
                  groupinfo 'Some Group'
                  install foo
                  remove bar
                  update baz
                  run

                 That will list available packages matching the glob
                 'packagename*'.  It will return information on the group
                 'Some Group' It will then queue the following commands
                 into  the transaction: install foo, remove bar, update
                 baz. Then the 'run' command will resolve dependencies for
                 the transaction commands and run the transaction.


---------------------------------------------------------

::

          yum(8)
          http://yum.baseurl.org/


-------------------------------------------------------

::

          See the Authors file included with this program.


-------------------------------------------------

::

          There of course aren't any bugs, but if you find any, they should
          be sent to the mailing list: yum@lists.baseurl.org or filed in
          bugzilla.

COLOPHON
---------------------------------------------------------

::

          This page is part of the yum (Yum Package Manager) project.
          Information about the project can be found at 
          ⟨https://github.com/rpm-software-management/yum⟩.  It is not known
          how to report bugs for this man page; if you know, please send a
          mail to man-pages@man7.org.  This page was obtained from the
          project's upstream Git repository
          ⟨https://github.com/rpm-software-management/yum.git⟩ on
          2021-08-27.  (At that time, the date of the most recent commit
          that was found in the repository was 2021-04-02.)  If you
          discover any rendering problems in this HTML version of the page,
          or you believe there is a better or more up-to-date source for
          the page, or you have corrections or improvements to the
          information in this COLOPHON (which is not part of the original
          manual page), send a mail to man-pages@man7.org

   Seth Vidal                                                        yum(8)

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
