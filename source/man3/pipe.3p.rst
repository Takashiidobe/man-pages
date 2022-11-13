.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

pipe(3p) — Linux manual page
============================

+-----------------------------------+-----------------------------------+
| `PROLOG <#PROLOG>`__ \|           |                                   |
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `RETURN VALUE <#RETURN_VALUE>`__  |                                   |
| \| `ERRORS <#ERRORS>`__ \|        |                                   |
| `EXAMPLES <#EXAMPLES>`__ \|       |                                   |
| `APPLICAT                         |                                   |
| ION USAGE <#APPLICATION_USAGE>`__ |                                   |
| \| `RATIONALE <#RATIONALE>`__ \|  |                                   |
| `FUTURE D                         |                                   |
| IRECTIONS <#FUTURE_DIRECTIONS>`__ |                                   |
| \| `SEE ALSO <#SEE_ALSO>`__ \|    |                                   |
| `COPYRIGHT <#COPYRIGHT>`__        |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   PIPE(3P)                POSIX Programmer's Manual               PIPE(3P)


-----------------------------------------------------

::

          This manual page is part of the POSIX Programmer's Manual.  The
          Linux implementation of this interface may differ (consult the
          corresponding Linux manual page for details of Linux behavior),
          or the interface may not be implemented on Linux.

NAME
-------------------------------------------------

::

          pipe — create an interprocess channel


---------------------------------------------------------

::

          #include <unistd.h>

          int pipe(int fildes[2]);


---------------------------------------------------------------

::

          The pipe() function shall create a pipe and place two file
          descriptors, one each into the arguments fildes[0] and fildes[1],
          that refer to the open file descriptions for the read and write
          ends of the pipe. The file descriptors shall be allocated as
          described in Section 2.14, File Descriptor Allocation.  The
          O_NONBLOCK and FD_CLOEXEC flags shall be clear on both file
          descriptors. (The fcntl() function can be used to set both these
          flags.)

          Data can be written to the file descriptor fildes[1] and read
          from the file descriptor fildes[0].  A read on the file
          descriptor fildes[0] shall access data written to the file
          descriptor fildes[1] on a first-in-first-out basis. It is
          unspecified whether fildes[0] is also open for writing and
          whether fildes[1] is also open for reading.

          A process has the pipe open for reading (correspondingly writing)
          if it has a file descriptor open that refers to the read end,
          fildes[0] (write end, fildes[1]).

          The pipe's user ID shall be set to the effective user ID of the
          calling process.

          The pipe's group ID shall be set to the effective group ID of the
          calling process.

          Upon successful completion, pipe() shall mark for update the last
          data access, last data modification, and last file status change
          timestamps of the pipe.


-----------------------------------------------------------------

::

          Upon successful completion, 0 shall be returned; otherwise, -1
          shall be returned and errno set to indicate the error, no file
          descriptors shall be allocated and the contents of fildes shall
          be left unmodified.


-----------------------------------------------------

::

          The pipe() function shall fail if:

          EMFILE All, or all but one, of the file descriptors available to
                 the process are currently open.

          ENFILE The number of simultaneously open files in the system
                 would exceed a system-imposed limit.

          The following sections are informative.


---------------------------------------------------------

::

      Using a Pipe to Pass Data Between a Parent Process and a Child
          Process
          The following example demonstrates the use of a pipe to transfer
          data between a parent process and a child process. Error handling
          is excluded, but otherwise this code demonstrates good practice
          when using pipes: after the fork() the two processes close the
          unused ends of the pipe before they commence transferring data.

              #include <stdlib.h>
              #include <unistd.h>
              ...

              int fildes[2];
              const int BSIZE = 100;
              char buf[BSIZE];
              ssize_t nbytes;
              int status;

              status = pipe(fildes);
              if (status == -1 ) {
                  /* an error occurred */
                  ...
              }

              switch (fork()) {
              case -1: /* Handle error */
                  break;

              case 0:  /* Child - reads from pipe */
                  close(fildes[1]);                       /* Write end is unused */
                  nbytes = read(fildes[0], buf, BSIZE);   /* Get data from pipe */
                  /* At this point, a further read would see end-of-file ... */
                  close(fildes[0]);                       /* Finished with pipe */
                  exit(EXIT_SUCCESS);

              default:  /* Parent - writes to pipe */
                  close(fildes[0]);                       /* Read end is unused */
                  write(fildes[1], "Hello world\n", 12);  /* Write data on pipe */
                  close(fildes[1]);                       /* Child will see EOF */
                  exit(EXIT_SUCCESS);
              }


---------------------------------------------------------------------------

::

          None.


-----------------------------------------------------------

::

          The wording carefully avoids using the verb ``to open'' in order
          to avoid any implication of use of open(); see also write().


---------------------------------------------------------------------------

::

          None.


---------------------------------------------------------

::

          Section 2.14, File Descriptor Allocation, fcntl(3p), read(3p),
          write(3p)

          The Base Definitions volume of POSIX.1‐2017, fcntl.h(0p),
          unistd.h(0p)


-----------------------------------------------------------

::

          Portions of this text are reprinted and reproduced in electronic
          form from IEEE Std 1003.1-2017, Standard for Information
          Technology -- Portable Operating System Interface (POSIX), The
          Open Group Base Specifications Issue 7, 2018 Edition, Copyright
          (C) 2018 by the Institute of Electrical and Electronics
          Engineers, Inc and The Open Group.  In the event of any
          discrepancy between this version and the original IEEE and The
          Open Group Standard, the original IEEE and The Open Group
          Standard is the referee document. The original Standard can be
          obtained online at http://www.opengroup.org/unix/online.html .

          Any typographical or formatting errors that appear in this page
          are most likely to have been introduced during the conversion of
          the source files to man page format. To report such errors, see
          https://www.kernel.org/doc/man-pages/reporting_bugs.html .

   IEEE/The Open Group               2017                          PIPE(3P)

--------------

Pages that refer to this page:
`stropts.h(0p) <../man0/stropts.h.0p.html>`__, 
`unistd.h(0p) <../man0/unistd.h.0p.html>`__, 
`sh(1p) <../man1/sh.1p.html>`__, 
`fstatvfs(3p) <../man3/fstatvfs.3p.html>`__, 
`ioctl(3p) <../man3/ioctl.3p.html>`__, 
`popen(3p) <../man3/popen.3p.html>`__, 
`read(3p) <../man3/read.3p.html>`__, 
`system(3p) <../man3/system.3p.html>`__, 
`write(3p) <../man3/write.3p.html>`__

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
