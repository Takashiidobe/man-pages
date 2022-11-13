.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

pidof(1) — Linux manual page
============================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `OPTIONS <#OPTIONS>`__ \|         |                                   |
| `EXIT STATUS <#EXIT_STATUS>`__ \| |                                   |
| `BUGS <#BUGS>`__ \|               |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `AUTHOR <#AUTHOR>`__ \|           |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   PIDOF(1)                      User Commands                     PIDOF(1)

NAME
-------------------------------------------------

::

          pidof -- find the process ID of a running program


---------------------------------------------------------

::

          pidof [-s] [-c] [-q] [-w] [-x] [-o omitpid[,omitpid...]...]  [-S
          separator] program [program...]


---------------------------------------------------------------

::

          Pidof finds the process id's (pids) of the named programs. It
          prints those id's on the standard output.


-------------------------------------------------------

::

          -s     Single shot - this instructs the program to only return
                 one pid.

          -c     Only return process ids that are running with the same
                 root directory.  This option is ignored for non-root
                 users, as they will be unable to check the current root
                 directory of processes they do not own.

          -q     Quiet mode, suppress any output and only sets the exit
                 status accordingly.

          -w     Show also processes that do not have visible command line
                 (e.g. kernel worker threads).

          -x     Scripts too - this causes the program to also return
                 process id's of shells running the named scripts.

          -o omitpid
                 Tells pidof to omit processes with that process id. The
                 special pid %PPID can be used to name the parent process
                 of the pidof program, in other words the calling shell or
                 shell script.

          -S separator
                 Use separator as a separator put between pids. Used only
                 when more than one pids are printed for the program.  The
                 -d option is an alias for this option for sysvinit pidof
                 compatibility.


---------------------------------------------------------------

::

          0      At least one program was found with the requested name.

          1      No program was found with the requested name.


-------------------------------------------------

::

          When using the -x option, pidof only has a simple method for
          detecting scripts and will miss scripts that, for example, use
          env. This limitation is due to how the scripts look in the proc
          filesystem.


---------------------------------------------------------

::

          pgrep(1), pkill(1)


-----------------------------------------------------

::

          Jaromir Capik <jcapik@redhat.com>

COLOPHON
---------------------------------------------------------

::

          This page is part of the procps-ng (/proc filesystem utilities)
          project.  Information about the project can be found at 
          ⟨https://gitlab.com/procps-ng/procps⟩.  If you have a bug report
          for this manual page, see
          ⟨https://gitlab.com/procps-ng/procps/blob/master/Documentation/bugs.md⟩.
          This page was obtained from the project's upstream Git repository
          ⟨https://gitlab.com/procps-ng/procps.git⟩ on 2021-08-27.  (At
          that time, the date of the most recent commit that was found in
          the repository was 2021-08-24.)  If you discover any rendering
          problems in this HTML version of the page, or you believe there
          is a better or more up-to-date source for the page, or you have
          corrections or improvements to the information in this COLOPHON
          (which is not part of the original manual page), send a mail to
          man-pages@man7.org

                                  2020-12-22                       PIDOF(1)

--------------

Pages that refer to this page: `killall(1) <../man1/killall.1.html>`__, 
`unshare(1) <../man1/unshare.1.html>`__

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
