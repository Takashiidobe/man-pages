.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

tcgetattr(3p) — Linux manual page
=================================

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

   TCGETATTR(3P)           POSIX Programmer's Manual          TCGETATTR(3P)


-----------------------------------------------------

::

          This manual page is part of the POSIX Programmer's Manual.  The
          Linux implementation of this interface may differ (consult the
          corresponding Linux manual page for details of Linux behavior),
          or the interface may not be implemented on Linux.

NAME
-------------------------------------------------

::

          tcgetattr — get the parameters associated with the terminal


---------------------------------------------------------

::

          #include <termios.h>

          int tcgetattr(int fildes, struct termios *termios_p);


---------------------------------------------------------------

::

          The tcgetattr() function shall get the parameters associated with
          the terminal referred to by fildes and store them in the termios
          structure referenced by termios_p.  The fildes argument is an
          open file descriptor associated with a terminal.

          The termios_p argument is a pointer to a termios structure.

          The tcgetattr() operation is allowed from any process.

          If the terminal device supports different input and output baud
          rates, the baud rates stored in the termios structure returned by
          tcgetattr() shall reflect the actual baud rates, even if they are
          equal. If differing baud rates are not supported, the rate
          returned as the output baud rate shall be the actual baud rate.
          If the terminal device does not support split baud rates, the
          input baud rate stored in the termios structure shall be the
          output rate (as one of the symbolic values).


-----------------------------------------------------------------

::

          Upon successful completion, 0 shall be returned. Otherwise, -1
          shall be returned and errno set to indicate the error.


-----------------------------------------------------

::

          The tcgetattr() function shall fail if:

          EBADF  The fildes argument is not a valid file descriptor.

          ENOTTY The file associated with fildes is not a terminal.

          The following sections are informative.


---------------------------------------------------------

::

          None.


---------------------------------------------------------------------------

::

          None.


-----------------------------------------------------------

::

          Care must be taken when changing the terminal attributes.
          Applications should always do a tcgetattr(), save the termios
          structure values returned, and then do a tcsetattr(), changing
          only the necessary fields. The application should use the values
          saved from the tcgetattr() to reset the terminal state whenever
          it is done with the terminal.  This is necessary because terminal
          attributes apply to the underlying port and not to each
          individual open instance; that is, all processes that have used
          the terminal see the latest attribute changes.

          A program that uses these functions should be written to catch
          all signals and take other appropriate actions to ensure that
          when the program terminates, whether planned or not, the terminal
          device's state is restored to its original state.

          Existing practice dealing with error returns when only part of a
          request can be honored is based on calls to the ioctl() function.
          In historical BSD and System V implementations, the corresponding
          ioctl() returns zero if the requested actions were semantically
          correct, even if some of the requested changes could not be made.
          Many existing applications assume this behavior and would no
          longer work correctly if the return value were changed from zero
          to -1 in this case.

          Note that either specification has a problem. When zero is
          returned, it implies everything succeeded even if some of the
          changes were not made. When -1 is returned, it implies everything
          failed even though some of the changes were made.

          Applications that need all of the requested changes made to work
          properly should follow tcsetattr() with a call to tcgetattr() and
          compare the appropriate field values.


---------------------------------------------------------------------------

::

          None.


---------------------------------------------------------

::

          tcsetattr(3p)

          The Base Definitions volume of POSIX.1‐2017, Chapter 11, General
          Terminal Interface, termios.h(0p)


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

   IEEE/The Open Group               2017                     TCGETATTR(3P)

--------------

Pages that refer to this page:
`termios.h(0p) <../man0/termios.h.0p.html>`__, 
`cfgetispeed(3p) <../man3/cfgetispeed.3p.html>`__, 
`cfgetospeed(3p) <../man3/cfgetospeed.3p.html>`__, 
`tcsetattr(3p) <../man3/tcsetattr.3p.html>`__

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
