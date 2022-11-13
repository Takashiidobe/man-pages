.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

exit(1p) — Linux manual page
============================

+-----------------------------------+-----------------------------------+
| `PROLOG <#PROLOG>`__ \|           |                                   |
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `OPTIONS <#OPTIONS>`__ \|         |                                   |
| `OPERANDS <#OPERANDS>`__ \|       |                                   |
| `STDIN <#STDIN>`__ \|             |                                   |
| `INPUT FILES <#INPUT_FILES>`__ \| |                                   |
| `ENVIRONMENT VARI                 |                                   |
| ABLES <#ENVIRONMENT_VARIABLES>`__ |                                   |
| \|                                |                                   |
| `ASYNCHRONOUS                     |                                   |
|  EVENTS <#ASYNCHRONOUS_EVENTS>`__ |                                   |
| \| `STDOUT <#STDOUT>`__ \|        |                                   |
| `STDERR <#STDERR>`__ \|           |                                   |
| `OUTPUT FILES <#OUTPUT_FILES>`__  |                                   |
| \|                                |                                   |
| `EXTENDED DESCR                   |                                   |
| IPTION <#EXTENDED_DESCRIPTION>`__ |                                   |
| \| `EXIT STATUS <#EXIT_STATUS>`__ |                                   |
| \|                                |                                   |
| `CONSEQUENCES OF ER               |                                   |
| RORS <#CONSEQUENCES_OF_ERRORS>`__ |                                   |
| \|                                |                                   |
| `APPLICAT                         |                                   |
| ION USAGE <#APPLICATION_USAGE>`__ |                                   |
| \| `EXAMPLES <#EXAMPLES>`__ \|    |                                   |
| `RATIONALE <#RATIONALE>`__ \|     |                                   |
| `FUTURE D                         |                                   |
| IRECTIONS <#FUTURE_DIRECTIONS>`__ |                                   |
| \| `SEE ALSO <#SEE_ALSO>`__ \|    |                                   |
| `COPYRIGHT <#COPYRIGHT>`__        |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   EXIT(1P)                POSIX Programmer's Manual               EXIT(1P)


-----------------------------------------------------

::

          This manual page is part of the POSIX Programmer's Manual.  The
          Linux implementation of this interface may differ (consult the
          corresponding Linux manual page for details of Linux behavior),
          or the interface may not be implemented on Linux.

NAME
-------------------------------------------------

::

          exit — cause the shell to exit


---------------------------------------------------------

::

          exit [n]


---------------------------------------------------------------

::

          The exit utility shall cause the shell to exit from its current
          execution environment with the exit status specified by the
          unsigned decimal integer n.  If the current execution environment
          is a subshell environment, the shell shall exit from the subshell
          environment with the specified exit status and continue in the
          environment from which that subshell environment was invoked;
          otherwise, the shell utility shall terminate with the specified
          exit status. If n is specified, but its value is not between 0
          and 255 inclusively, the exit status is undefined.

          A trap on EXIT shall be executed before the shell terminates,
          except when the exit utility is invoked in that trap itself, in
          which case the shell shall exit immediately.


-------------------------------------------------------

::

          None.


---------------------------------------------------------

::

          See the DESCRIPTION.


---------------------------------------------------

::

          Not used.


---------------------------------------------------------------

::

          None.


-----------------------------------------------------------------------------------

::

          None.


-------------------------------------------------------------------------------

::

          Default.


-----------------------------------------------------

::

          Not used.


-----------------------------------------------------

::

          The standard error shall be used only for diagnostic messages.


-----------------------------------------------------------------

::

          None.


---------------------------------------------------------------------------------

::

          None.


---------------------------------------------------------------

::

          The exit status shall be n, if specified, except that the
          behavior is unspecified if n is not an unsigned decimal integer
          or is greater than 255. Otherwise, the value shall be the exit
          value of the last command executed, or zero if no command was
          executed. When exit is executed in a trap action, the last
          command is considered to be the command that executed immediately
          preceding the trap action.


-------------------------------------------------------------------------------------

::

          Default.

          The following sections are informative.


---------------------------------------------------------------------------

::

          None.


---------------------------------------------------------

::

          Exit with a true value:

              exit 0

          Exit with a false value:

              exit 1

          Propagate error handling from within a subshell:

              (
                  command1 || exit 1
                  command2 || exit 1
                  exec command3
              ) > outputfile || exit 1
              echo "outputfile created successfully"


-----------------------------------------------------------

::

          As explained in other sections, certain exit status values have
          been reserved for special uses and should be used by applications
          only for those purposes:

           126    A file to be executed was found, but it was not an
                  executable utility.

           127    A utility to be executed was not found.

          >128    A command was interrupted by a signal.

          The behavior of exit when given an invalid argument or unknown
          option is unspecified, because of differing practices in the
          various historical implementations. A value larger than 255 might
          be truncated by the shell, and be unavailable even to a parent
          process that uses waitid() to get the full exit value. It is
          recommended that implementations that detect any usage error
          should cause a non-zero exit status (or, if the shell is
          interactive and the error does not cause the shell to abort,
          store a non-zero value in "$?"), but even this was not done
          historically in all shells.


---------------------------------------------------------------------------

::

          None.


---------------------------------------------------------

::

          Section 2.14, Special Built-In Utilities


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

   IEEE/The Open Group               2017                          EXIT(1P)

--------------

Pages that refer to this page: `return(1p) <../man1/return.1p.html>`__, 
`sh(1p) <../man1/sh.1p.html>`__

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
