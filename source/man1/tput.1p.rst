.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

tput(1p) — Linux manual page
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

   TPUT(1P)                POSIX Programmer's Manual               TPUT(1P)


-----------------------------------------------------

::

          This manual page is part of the POSIX Programmer's Manual.  The
          Linux implementation of this interface may differ (consult the
          corresponding Linux manual page for details of Linux behavior),
          or the interface may not be implemented on Linux.

NAME
-------------------------------------------------

::

          tput — change terminal characteristics


---------------------------------------------------------

::

          tput [-T type] operand...


---------------------------------------------------------------

::

          The tput utility shall display terminal-dependent information.
          The manner in which this information is retrieved is unspecified.
          The information displayed shall clear the terminal screen,
          initialize the user's terminal, or reset the user's terminal,
          depending on the operand given. The exact consequences of
          displaying this information are unspecified.


-------------------------------------------------------

::

          The tput utility shall conform to the Base Definitions volume of
          POSIX.1‐2017, Section 12.2, Utility Syntax Guidelines.

          The following option shall be supported:

          -T type   Indicate the type of terminal. If this option is not
                    supplied and the TERM variable is unset or null, an
                    unspecified default terminal type shall be used. The
                    setting of type shall take precedence over the value in
                    TERM.


---------------------------------------------------------

::

          The following strings shall be supported as operands by the
          implementation in the POSIX locale:

          clear     Display the clear-screen sequence.

          init      Display the sequence that initializes the user's
                    terminal in an implementation-defined manner.

          reset     Display the sequence that resets the user's terminal in
                    an implementation-defined manner.

          If a terminal does not support any of the operations described by
          these operands, this shall not be considered an error condition.


---------------------------------------------------

::

          Not used.


---------------------------------------------------------------

::

          None.


-----------------------------------------------------------------------------------

::

          The following environment variables shall affect the execution of
          tput:

          LANG      Provide a default value for the internationalization
                    variables that are unset or null. (See the Base
                    Definitions volume of POSIX.1‐2017, Section 8.2,
                    Internationalization Variables for the precedence of
                    internationalization variables used to determine the
                    values of locale categories.)

          LC_ALL    If set to a non-empty string value, override the values
                    of all the other internationalization variables.

          LC_CTYPE  Determine the locale for the interpretation of
                    sequences of bytes of text data as characters (for
                    example, single-byte as opposed to multi-byte
                    characters in arguments).

          LC_MESSAGES
                    Determine the locale that should be used to affect the
                    format and contents of diagnostic messages written to
                    standard error.

          NLSPATH   Determine the location of message catalogs for the
                    processing of LC_MESSAGES.

          TERM      Determine the terminal type. If this variable is unset
                    or null, and if the -T option is not specified, an
                    unspecified default terminal type shall be used.


-------------------------------------------------------------------------------

::

          Default.


-----------------------------------------------------

::

          If standard output is a terminal device, it may be used for
          writing the appropriate sequence to clear the screen or reset or
          initialize the terminal. If standard output is not a terminal
          device, undefined results occur.


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

          The following exit values shall be returned:

           0    The requested string was written successfully.

           1    Unspecified.

           2    Usage error.

           3    No information is available about the specified terminal
                type.

           4    The specified operand is invalid.

          >4    An error occurred.


-------------------------------------------------------------------------------------

::

          If one of the operands is not available for the terminal, tput
          continues processing the remaining operands.

          The following sections are informative.


---------------------------------------------------------------------------

::

          The difference between resetting and initializing a terminal is
          left unspecified, as they vary greatly based on hardware types.
          In general, resetting is a more severe action.

          Some terminals use control characters to perform the stated
          functions, and on such terminals it might make sense to use tput
          to store the initialization strings in a file or environment
          variable for later use. However, because other terminals might
          rely on system calls to do this work, the standard output cannot
          be used in a portable manner, such as the following non-portable
          constructs:

              ClearVar=`tput clear`
              tput reset | mailx -s "Wake Up" ddg


---------------------------------------------------------

::

           1. Initialize the terminal according to the type of terminal in
              the environmental variable TERM.  This command can be
              included in a .profile file.

                  tput init

           2. Reset a 450 terminal.

                  tput -T 450 reset


-----------------------------------------------------------

::

          The list of operands was reduced to a minimum for the following
          reasons:

           *  The only features chosen were those that were likely to be
              used by human users interacting with a terminal.

           *  Specifying the full terminfo set was not considered
              desirable, but the standard developers did not want to select
              among operands.

           *  This volume of POSIX.1‐2017 does not attempt to provide
              applications with sophisticated terminal handling
              capabilities, as that falls outside of its assigned scope and
              intersects with the responsibilities of other standards
              bodies.

          The difference between resetting and initializing a terminal is
          left unspecified as this varies greatly based on hardware types.
          In general, resetting is a more severe action.

          The exit status of 1 is historically reserved for finding out if
          a Boolean operand is not set. Although the operands were reduced
          to a minimum, the exit status of 1 should still be reserved for
          the Boolean operands, for those sites that wish to support them.


---------------------------------------------------------------------------

::

          None.


---------------------------------------------------------

::

          stty(1p), tabs(1p)

          The Base Definitions volume of POSIX.1‐2017, Chapter 8,
          Environment Variables, Section 12.2, Utility Syntax Guidelines


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

   IEEE/The Open Group               2017                          TPUT(1P)

--------------

Pages that refer to this page: `tabs(1p) <../man1/tabs.1p.html>`__

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
