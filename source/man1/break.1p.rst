.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

break(1p) — Linux manual page
=============================

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

   BREAK(1P)               POSIX Programmer's Manual              BREAK(1P)


-----------------------------------------------------

::

          This manual page is part of the POSIX Programmer's Manual.  The
          Linux implementation of this interface may differ (consult the
          corresponding Linux manual page for details of Linux behavior),
          or the interface may not be implemented on Linux.

NAME
-------------------------------------------------

::

          break — exit from for, while, or until loop


---------------------------------------------------------

::

          break [n]


---------------------------------------------------------------

::

          If n is specified, the break utility shall exit from the nth
          enclosing for, while, or until loop. If n is not specified, break
          shall behave as if n was specified as 1. Execution shall continue
          with the command immediately following the exited loop. The value
          of n is a positive decimal integer. If n is greater than the
          number of enclosing loops, the outermost enclosing loop shall be
          exited. If there is no enclosing loop, the behavior is
          unspecified.

          A loop shall enclose a break or continue command if the loop
          lexically encloses the command. A loop lexically encloses a break
          or continue command if the command is:

           *  Executing in the same execution environment (see Section
              2.12, Shell Execution Environment) as the compound-list of
              the loop's do-group (see Section 2.10.2, Shell Grammar
              Rules), and

           *  Contained in a compound-list associated with the loop (either
              in the compound-list of the loop's do-group or, if the loop
              is a while or until loop, in the compound-list following the
              while or until reserved word), and

           *  Not in the body of a function whose function definition
              command (see Section 2.9.5, Function Definition Command) is
              contained in a compound-list associated with the loop.

          If n is greater than the number of lexically enclosing loops and
          there is a non-lexically enclosing loop in progress in the same
          execution environment as the break or continue command, it is
          unspecified whether that loop encloses the command.


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

           0    Successful completion.

          >0    The n value was not an unsigned decimal integer greater
                than or equal to 1.


-------------------------------------------------------------------------------------

::

          Default.

          The following sections are informative.


---------------------------------------------------------------------------

::

          None.


---------------------------------------------------------

::

          for i in *
          do
              if test -d "$i"
              then break
              fi
          done

          The results of running the following example are unspecified:
          there are two loops in progress when the break command is
          executed, and they are in the same execution environment, but
          neither loop is lexically enclosing the break command. (There are
          no loops lexically enclosing the continue commands, either.)

          foo() {
              for j in 1 2; do
                  echo 'break 2' >/tmp/do_break
                  echo "  sourcing /tmp/do_break ($j)..."
                  # the behavior of the break from running the following command
                  # results in unspecified behavior:
                  . /tmp/do_break

                  do_continue() { continue 2; }
                  echo "  running do_continue ($j)..."
                  # the behavior of the continue in the following function call
                  # results in unspecified behavior (if execution reaches this
                  # point):
                  do_continue

                  trap 'continue 2' USR1
                  echo "  sending SIGUSR1 to self ($j)..."
                  # the behavior of the continue in the trap invoked from the
                  # following signal results in unspecified behavior (if
                  # execution reaches this point):
                  kill -s USR1 $$
                  sleep 1
              done
          }
          for i in 1 2; do
              echo "running foo ($i)..."
              foo
          done


-----------------------------------------------------------

::

          In early proposals, consideration was given to expanding the
          syntax of break and continue to refer to a label associated with
          the appropriate loop as a preferable alternative to the n method.
          However, this volume of POSIX.1‐2017 does reserve the name space
          of command names ending with a <colon>.  It is anticipated that a
          future implementation could take advantage of this and provide
          something like:

              outofloop: for i in a b c d e
              do
                  for j in 0 1 2 3 4 5 6 7 8 9
                  do
                      if test -r "${i}${j}"
                      then break outofloop
                      fi
                  done
              done

          and that this might be standardized after implementation
          experience is achieved.


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

   IEEE/The Open Group               2017                         BREAK(1P)

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
