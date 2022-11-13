.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

psiginfo(3p) — Linux manual page
================================

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

   PSIGINFO(3P)            POSIX Programmer's Manual           PSIGINFO(3P)


-----------------------------------------------------

::

          This manual page is part of the POSIX Programmer's Manual.  The
          Linux implementation of this interface may differ (consult the
          corresponding Linux manual page for details of Linux behavior),
          or the interface may not be implemented on Linux.

NAME
-------------------------------------------------

::

          psiginfo, psignal — write signal information to standard error


---------------------------------------------------------

::

          #include <signal.h>

          void psiginfo(const siginfo_t *pinfo, const char *message);
          void psignal(int signum, const char *message);


---------------------------------------------------------------

::

          The psiginfo() and psignal() functions shall write a language-
          dependent message associated with a signal number to the standard
          error stream as follows:

           *  First, if message is not a null pointer and is not the empty
              string, the string pointed to by the message argument shall
              be written, followed by a <colon> and a <space>.

           *  Then the signal description string associated with signum or
              with the signal indicated by pinfo shall be written, followed
              by a <newline>.

          For psiginfo(), the application shall ensure that the argument
          pinfo references a valid siginfo_t structure. For psignal(), if
          signum is not a valid signal number, the behavior is
          implementation-defined.

          The psiginfo() and psignal() functions shall not change the
          orientation of the standard error stream.

          The psiginfo() and psignal() functions shall mark for update the
          last data modification and last file status change timestamps of
          the file associated with the standard error stream at some time
          between their successful completion and exit(), abort(), or the
          completion of fflush() or fclose() on stderr.

          The psiginfo() and psignal() functions shall not change the
          setting of errno if successful.

          On error, the psiginfo() and psignal() functions shall set the
          error indicator for the stream to which stderr points, and shall
          set errno to indicate the error.

          Since no value is returned, an application wishing to check for
          error situations should set errno to 0, then call psiginfo() or
          psignal(), then check errno.


-----------------------------------------------------------------

::

          These functions shall not return a value.


-----------------------------------------------------

::

          Refer to fputc(3p).

          The following sections are informative.


---------------------------------------------------------

::

          None.


---------------------------------------------------------------------------

::

          As an alternative to setting errno to zero before the call and
          checking if it is non-zero afterwards, applications can use
          ferror() to detect whether psiginfo() or psignal() encountered an
          error.

          An application wishing to use this method to check for error
          situations should call clearerr(stderr) before calling psiginfo()
          or psignal(), then if ferror(stderr) returns non-zero, the value
          of errno indicates which error occurred.


-----------------------------------------------------------

::

          System V historically has psignal() and psiginfo() in
          <siginfo.h>.  However, the <siginfo.h> header is not specified in
          the Base Definitions volume of POSIX.1‐2017, and the type
          siginfo_t is defined in <signal.h>.


---------------------------------------------------------------------------

::

          None.


---------------------------------------------------------

::

          fputc(3p), perror(3p), strsignal(3p)

          The Base Definitions volume of POSIX.1‐2017, signal.h(0p)


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

   IEEE/The Open Group               2017                      PSIGINFO(3P)

--------------

Pages that refer to this page:
`signal.h(0p) <../man0/signal.h.0p.html>`__, 
`perror(3p) <../man3/perror.3p.html>`__, 
`setlocale(3p) <../man3/setlocale.3p.html>`__, 
`strsignal(3p) <../man3/strsignal.3p.html>`__

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
