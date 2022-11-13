.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

pclose(3p) — Linux manual page
==============================

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

   PCLOSE(3P)              POSIX Programmer's Manual             PCLOSE(3P)


-----------------------------------------------------

::

          This manual page is part of the POSIX Programmer's Manual.  The
          Linux implementation of this interface may differ (consult the
          corresponding Linux manual page for details of Linux behavior),
          or the interface may not be implemented on Linux.

NAME
-------------------------------------------------

::

          pclose — close a pipe stream to or from a process


---------------------------------------------------------

::

          #include <stdio.h>

          int pclose(FILE *stream);


---------------------------------------------------------------

::

          The pclose() function shall close a stream that was opened by
          popen(), wait for the command to terminate, and return the
          termination status of the process that was running the command
          language interpreter.  However, if a call caused the termination
          status to be unavailable to pclose(), then pclose() shall return
          -1 with errno set to [ECHILD] to report this situation. This can
          happen if the application calls one of the following functions:

           *  wait()

           *  waitpid() with a pid argument less than or equal to 0 or
              equal to the process ID of the command line interpreter

           *  Any other function not defined in this volume of POSIX.1‐2017
              that could do one of the above

          In any case, pclose() shall not return before the child process
          created by popen() has terminated.

          If the command language interpreter cannot be executed, the child
          termination status returned by pclose() shall be as if the
          command language interpreter terminated using exit(127) or
          _exit(127).

          The pclose() function shall not affect the termination status of
          any child of the calling process other than the one created by
          popen() for the associated stream.

          If the argument stream to pclose() is not a pointer to a stream
          created by popen(), the result of pclose() is undefined.

          If a thread is canceled during execution of pclose(), the
          behavior is undefined.


-----------------------------------------------------------------

::

          Upon successful return, pclose() shall return the termination
          status of the command language interpreter. Otherwise, pclose()
          shall return -1 and set errno to indicate the error.


-----------------------------------------------------

::

          The pclose() function shall fail if:

          ECHILD The status of the child process could not be obtained, as
                 described above.

          The following sections are informative.


---------------------------------------------------------

::

          None.


---------------------------------------------------------------------------

::

          None.


-----------------------------------------------------------

::

          There is a requirement that pclose() not return before the child
          process terminates. This is intended to disallow implementations
          that return [EINTR] if a signal is received while waiting. If
          pclose() returned before the child terminated, there would be no
          way for the application to discover which child used to be
          associated with the stream, and it could not do the cleanup
          itself.

          If the stream pointed to by stream was not created by popen(),
          historical implementations of pclose() return -1 without setting
          errno.  To avoid requiring pclose() to set errno in this case,
          POSIX.1‐2008 makes the behavior unspecified. An application
          should not use pclose() to close any stream that was not created
          by popen().

          Some historical implementations of pclose() either block or
          ignore the signals SIGINT, SIGQUIT, and SIGHUP while waiting for
          the child process to terminate. Since this behavior is not
          described for the pclose() function in POSIX.1‐2008, such
          implementations are not conforming. Also, some historical
          implementations return [EINTR] if a signal is received, even
          though the child process has not terminated. Such implementations
          are also considered non-conforming.

          Consider, for example, an application that uses:

              popen("command", "r")

          to start command, which is part of the same application. The
          parent writes a prompt to its standard output (presumably the
          terminal) and then reads from the popen()ed stream. The child
          reads the response from the user, does some transformation on the
          response (pathname expansion, perhaps) and writes the result to
          its standard output. The parent process reads the result from the
          pipe, does something with it, and prints another prompt. The
          cycle repeats. Assuming that both processes do appropriate buffer
          flushing, this would be expected to work.

          To conform to POSIX.1‐2008, pclose() must use waitpid(), or some
          similar function, instead of wait().

          The code sample below illustrates how the pclose() function might
          be implemented on a system conforming to POSIX.1‐2008.

              int pclose(FILE *stream)
              {
                  int stat;
                  pid_t pid;

                  pid = <pid for process created for stream by popen()>
                  (void) fclose(stream);
                  while (waitpid(pid, &stat, 0) == -1) {
                      if (errno != EINTR){
                          stat = -1;
                          break;
                      }
                  }
                  return(stat);
              }


---------------------------------------------------------------------------

::

          None.


---------------------------------------------------------

::

          fork(3p), popen(3p), wait(3p)

          The Base Definitions volume of POSIX.1‐2017, stdio.h(0p)


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

   IEEE/The Open Group               2017                        PCLOSE(3P)

--------------

Pages that refer to this page:
`stdio.h(0p) <../man0/stdio.h.0p.html>`__, 
`popen(3p) <../man3/popen.3p.html>`__

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
