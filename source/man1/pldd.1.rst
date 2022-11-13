.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

pldd(1) — Linux manual page
===========================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `OPTIONS <#OPTIONS>`__ \|         |                                   |
| `EXIT STATUS <#EXIT_STATUS>`__ \| |                                   |
| `VERSIONS <#VERSIONS>`__ \|       |                                   |
| `                                 |                                   |
| CONFORMING TO <#CONFORMING_TO>`__ |                                   |
| \| `NOTES <#NOTES>`__ \|          |                                   |
| `BUGS <#BUGS>`__ \|               |                                   |
| `EXAMPLES <#EXAMPLES>`__ \|       |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   PLDD(1)                     Linux User Manual                    PLDD(1)

NAME
-------------------------------------------------

::

          pldd - display dynamic shared objects linked into a process


---------------------------------------------------------

::

          pldd pid
          pldd option


---------------------------------------------------------------

::

          The pldd command displays a list of the dynamic shared objects
          (DSOs) that are linked into the process with the specified
          process ID (PID).  The list includes the libraries that have been
          dynamically loaded using dlopen(3).


-------------------------------------------------------

::

          -?, --help
                 Display a help message and exit.

          --usage
                 Display a short usage message and exit.

          -V, --version
                 Display program version information and exit.


---------------------------------------------------------------

::

          On success, pldd exits with the status 0.  If the specified
          process does not exist, the user does not have permission to
          access its dynamic shared object list, or no command-line
          arguments are supplied, pldd exists with a status of 1.  If given
          an invalid option, it exits with the status 64.


---------------------------------------------------------

::

          pldd is available since glibc 2.15.


-------------------------------------------------------------------

::

          The pldd command is not specified by POSIX.1.  Some other systems
          have a similar command.


---------------------------------------------------

::

          The command

              lsof -p PID

          also shows output that includes the dynamic shared objects that
          are linked into a process.

          The gdb(1) info shared command also shows the shared libraries
          being used by a process, so that one can obtain similar output to
          pldd using a command such as the following (to monitor the
          process with the specified pid):

              $ gdb -ex "set confirm off" -ex "set height 0" -ex "info shared" \
                      -ex "quit" -p $pid | grep '^0x.*0x'


-------------------------------------------------

::

          From glibc 2.19 to 2.29, pldd was broken: it just hung when
          executed.  This problem was fixed in glibc 2.30, and the fix has
          been backported to earlier glibc versions in some distributions.


---------------------------------------------------------

::

          $ echo $$               # Display PID of shell
          1143
          $ pldd $$               # Display DSOs linked into the shell
          1143:   /usr/bin/bash
          linux-vdso.so.1
          /lib64/libtinfo.so.5
          /lib64/libdl.so.2
          /lib64/libc.so.6
          /lib64/ld-linux-x86-64.so.2
          /lib64/libnss_files.so.2


---------------------------------------------------------

::

          ldd(1), lsof(1), dlopen(3), ld.so(8)

COLOPHON
---------------------------------------------------------

::

          This page is part of release 5.13 of the Linux man-pages project.
          A description of the project, information about reporting bugs,
          and the latest version of this page, can be found at
          https://www.kernel.org/doc/man-pages/.

   GNU                            2020-11-01                        PLDD(1)

--------------

Pages that refer to this page: `ldd(1) <../man1/ldd.1.html>`__, 
`dlopen(3) <../man3/dlopen.3.html>`__, 
`ld.so(8) <../man8/ld.so.8.html>`__

--------------

`Copyright and license for this manual
page <../man1/pldd.1.license.html>`__

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
