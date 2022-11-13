.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

write(1p) — Linux manual page
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

   WRITE(1P)               POSIX Programmer's Manual              WRITE(1P)


-----------------------------------------------------

::

          This manual page is part of the POSIX Programmer's Manual.  The
          Linux implementation of this interface may differ (consult the
          corresponding Linux manual page for details of Linux behavior),
          or the interface may not be implemented on Linux.

NAME
-------------------------------------------------

::

          write — write to another user


---------------------------------------------------------

::

          write user_name [terminal]


---------------------------------------------------------------

::

          The write utility shall read lines from the standard input and
          write them to the terminal of the specified user. When first
          invoked, it shall write the message:

              Message from sender-login-id (sending-terminal) [date]...

          to user_name.  When it has successfully completed the connection,
          the sender's terminal shall be alerted twice to indicate that
          what the sender is typing is being written to the recipient's
          terminal.

          If the recipient wants to reply, this can be accomplished by
          typing:

              write sender-login-id [sending-terminal]

          upon receipt of the initial message. Whenever a line of input as
          delimited by an NL, EOF, or EOL special character (see the Base
          Definitions volume of POSIX.1‐2017, Chapter 11, General Terminal
          Interface) is accumulated while in canonical input mode, the
          accumulated data shall be written on the other user's terminal.
          Characters shall be processed as follows:

           *  Typing <alert> shall write the <alert> character to the
              recipient's terminal.

           *  Typing the erase and kill characters shall affect the
              sender's terminal in the manner described by the termios
              interface in the Base Definitions volume of POSIX.1‐2017,
              Chapter 11, General Terminal Interface.

           *  Typing the interrupt or end-of-file characters shall cause
              write to write an appropriate message ("EOT\n" in the POSIX
              locale) to the recipient's terminal and exit.

           *  Typing characters from LC_CTYPE classifications print or
              space shall cause those characters to be sent to the
              recipient's terminal.

           *  When and only when the stty iexten local mode is enabled, the
              existence and processing of additional special control
              characters and multi-byte or single-byte functions is
              implementation-defined.

           *  Typing other non-printable characters shall cause
              implementation-defined sequences of printable characters to
              be written to the recipient's terminal.

          To write to a user who is logged in more than once, the terminal
          argument can be used to indicate which terminal to write to;
          otherwise, the recipient's terminal is selected in an
          implementation-defined manner and an informational message is
          written to the sender's standard output, indicating which
          terminal was chosen.

          Permission to be a recipient of a write message can be denied or
          granted by use of the mesg utility. However, a user's privilege
          may further constrain the domain of accessibility of other users'
          terminals. The write utility shall fail when the user lacks
          appropriate privileges to perform the requested action.


-------------------------------------------------------

::

          None.


---------------------------------------------------------

::

          The following operands shall be supported:

          user_name Login name of the person to whom the message shall be
                    written. The application shall ensure that this operand
                    is of the form returned by the who utility.

          terminal  Terminal identification in the same format provided by
                    the who utility.


---------------------------------------------------

::

          Lines to be copied to the recipient's terminal are read from
          standard input.


---------------------------------------------------------------

::

          None.


-----------------------------------------------------------------------------------

::

          The following environment variables shall affect the execution of
          write:

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
                    characters in arguments and input files). If the
                    recipient's locale does not use an LC_CTYPE equivalent
                    to the sender's, the results are undefined.

          LC_MESSAGES
                    Determine the locale that should be used to affect the
                    format and contents of diagnostic messages written to
                    standard error and informative messages written to
                    standard output.

          NLSPATH   Determine the location of message catalogs for the
                    processing of LC_MESSAGES.


-------------------------------------------------------------------------------

::

          If an interrupt signal is received, write shall write an
          appropriate message on the recipient's terminal and exit with a
          status of zero. It shall take the standard action for all other
          signals.


-----------------------------------------------------

::

          An informational message shall be written to standard output if a
          recipient is logged in more than once.


-----------------------------------------------------

::

          The standard error shall be used only for diagnostic messages.


-----------------------------------------------------------------

::

          The recipient's terminal is used for output.


---------------------------------------------------------------------------------

::

          None.


---------------------------------------------------------------

::

          The following exit values shall be returned:

           0    Successful completion.

          >0    The addressed user is not logged on or the addressed user
                denies permission.


-------------------------------------------------------------------------------------

::

          Default.

          The following sections are informative.


---------------------------------------------------------------------------

::

          The talk utility is considered by some users to be a more usable
          utility on full-screen terminals.


---------------------------------------------------------

::

          None.


-----------------------------------------------------------

::

          The write utility was included in this volume of POSIX.1‐2017
          since it can be implemented on all terminal types. The standard
          developers considered the talk utility, which cannot be
          implemented on certain terminals, to be a ``better''
          communications interface. Both of these programs are in
          widespread use on historical implementations. Therefore, the
          standard developers decided that both utilities should be
          specified.

          The format of the terminal name is unspecified, but the
          descriptions of ps, talk, who, and write require that they all
          use or accept the same format.


---------------------------------------------------------------------------

::

          None.


---------------------------------------------------------

::

          mesg(1p), talk(1p), who(1p)

          The Base Definitions volume of POSIX.1‐2017, Chapter 8,
          Environment Variables, Chapter 11, General Terminal Interface


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

   IEEE/The Open Group               2017                         WRITE(1P)

--------------

Pages that refer to this page: `logger(1p) <../man1/logger.1p.html>`__, 
`mesg(1p) <../man1/mesg.1p.html>`__, 
`talk(1p) <../man1/talk.1p.html>`__

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
