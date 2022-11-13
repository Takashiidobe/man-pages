.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

ulimit(3p) — Linux manual page
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

   ULIMIT(3P)              POSIX Programmer's Manual             ULIMIT(3P)


-----------------------------------------------------

::

          This manual page is part of the POSIX Programmer's Manual.  The
          Linux implementation of this interface may differ (consult the
          corresponding Linux manual page for details of Linux behavior),
          or the interface may not be implemented on Linux.

NAME
-------------------------------------------------

::

          ulimit — get and set process limits


---------------------------------------------------------

::

          #include <ulimit.h>

          long ulimit(int cmd, ...);


---------------------------------------------------------------

::

          The ulimit() function shall control process limits. The process
          limits that can be controlled by this function include the
          maximum size of a single file that can be written (this is
          equivalent to using setrlimit() with RLIMIT_FSIZE). The cmd
          values, defined in <ulimit.h>, include:

          UL_GETFSIZE Return the file size limit (RLIMIT_FSIZE) of the
                      process. The limit shall be in units of 512-byte
                      blocks and shall be inherited by child processes.
                      Files of any size can be read. The return value shall
                      be the integer part of the soft file size limit
                      divided by 512. If the result cannot be represented
                      as a long, the result is unspecified.

          UL_SETFSIZE Set the file size limit for output operations of the
                      process to the value of the second argument, taken as
                      a long, multiplied by 512. If the result would
                      overflow an rlim_t, the actual value set is
                      unspecified. Any process may decrease its own limit,
                      but only a process with appropriate privileges may
                      increase the limit. The return value shall be the
                      integer part of the new file size limit divided by
                      512.

          The ulimit() function shall not change the setting of errno if
          successful.

          As all return values are permissible in a successful situation,
          an application wishing to check for error situations should set
          errno to 0, then call ulimit(), and, if it returns -1, check to
          see if errno is non-zero.


-----------------------------------------------------------------

::

          Upon successful completion, ulimit() shall return the value of
          the requested limit. Otherwise, -1 shall be returned and errno
          set to indicate the error.


-----------------------------------------------------

::

          The ulimit() function shall fail and the limit shall be unchanged
          if:

          EINVAL The cmd argument is not valid.

          EPERM  A process not having appropriate privileges attempts to
                 increase its file size limit.

          The following sections are informative.


---------------------------------------------------------

::

          None.


---------------------------------------------------------------------------

::

          Since the ulimit() function uses type long rather than rlim_t,
          this function is not sufficient for file sizes on many current
          systems.  Applications should use the getrlimit() or setrlimit()
          functions instead of the obsolescent ulimit() function.


-----------------------------------------------------------

::

          None.


---------------------------------------------------------------------------

::

          The ulimit() function may be removed in a future version.


---------------------------------------------------------

::

          exec(1p), getrlimit(3p), write(3p)

          The Base Definitions volume of POSIX.1‐2017, ulimit.h(0p)


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

   IEEE/The Open Group               2017                        ULIMIT(3P)

--------------

Pages that refer to this page:
`ulimit.h(0p) <../man0/ulimit.h.0p.html>`__, 
`sh(1p) <../man1/sh.1p.html>`__, 
`ulimit(1p) <../man1/ulimit.1p.html>`__, 
`exec(3p) <../man3/exec.3p.html>`__, 
`fclose(3p) <../man3/fclose.3p.html>`__, 
`fflush(3p) <../man3/fflush.3p.html>`__, 
`fputc(3p) <../man3/fputc.3p.html>`__, 
`fputwc(3p) <../man3/fputwc.3p.html>`__, 
`fseek(3p) <../man3/fseek.3p.html>`__, 
`getrlimit(3p) <../man3/getrlimit.3p.html>`__, 
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
