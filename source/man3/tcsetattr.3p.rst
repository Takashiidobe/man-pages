.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

tcsetattr(3p) — Linux manual page
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

   TCSETATTR(3P)           POSIX Programmer's Manual          TCSETATTR(3P)


-----------------------------------------------------

::

          This manual page is part of the POSIX Programmer's Manual.  The
          Linux implementation of this interface may differ (consult the
          corresponding Linux manual page for details of Linux behavior),
          or the interface may not be implemented on Linux.

NAME
-------------------------------------------------

::

          tcsetattr — set the parameters associated with the terminal


---------------------------------------------------------

::

          #include <termios.h>

          int tcsetattr(int fildes, int optional_actions,
              const struct termios *termios_p);


---------------------------------------------------------------

::

          The tcsetattr() function shall set the parameters associated with
          the terminal referred to by the open file descriptor fildes (an
          open file descriptor associated with a terminal) from the termios
          structure referenced by termios_p as follows:

           *  If optional_actions is TCSANOW, the change shall occur
              immediately.

           *  If optional_actions is TCSADRAIN, the change shall occur
              after all output written to fildes is transmitted. This
              function should be used when changing parameters that affect
              output.

           *  If optional_actions is TCSAFLUSH, the change shall occur
              after all output written to fildes is transmitted, and all
              input so far received but not read shall be discarded before
              the change is made.

          If the output baud rate stored in the termios structure pointed
          to by termios_p is the zero baud rate, B0, the modem control
          lines shall no longer be asserted. Normally, this shall
          disconnect the line.

          If the input baud rate stored in the termios structure pointed to
          by termios_p is 0, the input baud rate given to the hardware is
          the same as the output baud rate stored in the termios structure.

          The tcsetattr() function shall return successfully if it was able
          to perform any of the requested actions, even if some of the
          requested actions could not be performed. It shall set all the
          attributes that the implementation supports as requested and
          leave all the attributes not supported by the implementation
          unchanged. If no part of the request can be honored, it shall
          return -1 and set errno to [EINVAL].  If the input and output
          baud rates differ and are a combination that is not supported,
          neither baud rate shall be changed. A subsequent call to
          tcgetattr() shall return the actual state of the terminal device
          (reflecting both the changes made and not made in the previous
          tcsetattr() call). The tcsetattr() function shall not change the
          values found in the termios structure under any circumstances.

          The effect of tcsetattr() is undefined if the value of the
          termios structure pointed to by termios_p was not derived from
          the result of a call to tcgetattr() on fildes; an application
          should modify only fields and flags defined by this volume of
          POSIX.1‐2017 between the call to tcgetattr() and tcsetattr(),
          leaving all other fields and flags unmodified.

          No actions defined by this volume of POSIX.1‐2017, other than a
          call to tcsetattr(), a close of the last file descriptor in the
          system associated with this terminal device, or an open of the
          first file descriptor in the system associated with this terminal
          device (using the O_TTY_INIT flag if it is non-zero and the
          device is not a pseudo-terminal), shall cause any of the terminal
          attributes defined by this volume of POSIX.1‐2017 to change.

          If tcsetattr() is called from a process which is a member of a
          background process group on a fildes associated with its
          controlling terminal:

           *  If the calling thread is blocking SIGTTOU signals or the
              process is ignoring SIGTTOU signals, the operation completes
              normally and no signal is sent.

           *  Otherwise, a SIGTTOU signal shall be sent to the process
              group.


-----------------------------------------------------------------

::

          Upon successful completion, 0 shall be returned. Otherwise, -1
          shall be returned and errno set to indicate the error.


-----------------------------------------------------

::

          The tcsetattr() function shall fail if:

          EBADF  The fildes argument is not a valid file descriptor.

          EINTR  A signal interrupted tcsetattr().

          EINVAL The optional_actions argument is not a supported value, or
                 an attempt was made to change an attribute represented in
                 the termios structure to an unsupported value.

          EIO    The process group of the writing process is orphaned, the
                 calling thread is not blocking SIGTTOU, and the process is
                 not ignoring SIGTTOU.

          ENOTTY The file associated with fildes is not a terminal.

          The following sections are informative.


---------------------------------------------------------

::

          None.


---------------------------------------------------------------------------

::

          If trying to change baud rates, applications should call
          tcsetattr() then call tcgetattr() in order to determine what baud
          rates were actually selected.

          In general, there are two reasons for an application to change
          the parameters associated with a terminal device:

           1. The device already has working parameter settings but the
              application needs a different behavior, such as non-canonical
              mode instead of canonical mode. The application sets (or
              clears) only a few flags or c_cc[] values. Typically, the
              terminal device in this case is either the controlling
              terminal for the process or a pseudo-terminal.

           2. The device is a modem or similar piece of equipment connected
              by a serial line, and it was not open before the application
              opened it. In this case, the application needs to initialize
              all of the parameter settings ``from scratch''. However,
              since the termios structure may include both standard and
              non-standard parameters, the application cannot just
              initialize the whole structure in an arbitrary way (e.g.,
              using memset()) as this may cause some of the non-standard
              parameters to be set incorrectly, resulting in non-conforming
              behavior of the terminal device. Conversely, the application
              cannot just set the standard parameters, assuming that the
              non-standard parameters will already have suitable values, as
              the device might previously have been used with non-
              conforming parameter settings (and some implementations
              retain the settings from one use to the next). The solution
              is to open the terminal device using the O_TTY_INIT flag to
              initialize the terminal device to have conforming parameter
              settings, obtain those settings using tcgetattr(), and then
              set all of the standard parameters to the desired settings.


-----------------------------------------------------------

::

          The tcsetattr() function can be interrupted in the following
          situations:

           *  It is interrupted while waiting for output to drain.

           *  It is called from a process in a background process group and
              SIGTTOU is caught.

          See also the RATIONALE section in tcgetattr(3p).


---------------------------------------------------------------------------

::

          Using an input baud rate of 0 to set the input rate equal to the
          output rate may not necessarily be supported in a future version
          of this volume of POSIX.1‐2017.


---------------------------------------------------------

::

          cfgetispeed(3p), tcgetattr(3p)

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

   IEEE/The Open Group               2017                     TCSETATTR(3P)

--------------

Pages that refer to this page:
`termios.h(0p) <../man0/termios.h.0p.html>`__, 
`cfsetispeed(3p) <../man3/cfsetispeed.3p.html>`__, 
`cfsetospeed(3p) <../man3/cfsetospeed.3p.html>`__, 
`tcgetattr(3p) <../man3/tcgetattr.3p.html>`__

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
