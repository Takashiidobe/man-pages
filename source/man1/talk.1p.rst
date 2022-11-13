.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

talk(1p) — Linux manual page
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

   TALK(1P)                POSIX Programmer's Manual               TALK(1P)


-----------------------------------------------------

::

          This manual page is part of the POSIX Programmer's Manual.  The
          Linux implementation of this interface may differ (consult the
          corresponding Linux manual page for details of Linux behavior),
          or the interface may not be implemented on Linux.

NAME
-------------------------------------------------

::

          talk — talk to another user


---------------------------------------------------------

::

          talk address [terminal]


---------------------------------------------------------------

::

          The talk utility is a two-way, screen-oriented communication
          program.

          When first invoked, talk shall send a message similar to:

              Message from <unspecified string>
              talk: connection requested by your_address
              talk: respond with: talk your_address

          to the specified address.  At this point, the recipient of the
          message can reply by typing:

              talk your_address

          Once communication is established, the two parties can type
          simultaneously, with their output displayed in separate regions
          of the screen. Characters shall be processed as follows:

           *  Typing the <alert> character shall alert the recipient's
              terminal.

           *  Typing <control>‐L shall cause the sender's screen regions to
              be refreshed.

           *  Typing the erase and kill characters shall affect the
              sender's terminal in the manner described by the termios
              interface in the Base Definitions volume of POSIX.1‐2017,
              Chapter 11, General Terminal Interface.

           *  Typing the interrupt or end-of-file characters shall
              terminate the local talk utility. Once the talk session has
              been terminated on one side, the other side of the talk
              session shall be notified that the talk session has been
              terminated and shall be able to do nothing except exit.

           *  Typing characters from LC_CTYPE classifications print or
              space shall cause those characters to be sent to the
              recipient's terminal.

           *  When and only when the stty iexten local mode is enabled, the
              existence and processing of additional special control
              characters and multi-byte or single-byte functions shall be
              implementation-defined.

           *  Typing other non-printable characters shall cause
              implementation-defined sequences of printable characters to
              be sent to the recipient's terminal.

          Permission to be a recipient of a talk message can be denied or
          granted by use of the mesg utility. However, a user's privilege
          may further constrain the domain of accessibility of other users'
          terminals. The talk utility shall fail when the user lacks
          appropriate privileges to perform the requested action.

          Certain block-mode terminals do not have all the capabilities
          necessary to support the simultaneous exchange of messages
          required for talk.  When this type of exchange cannot be
          supported on such terminals, the implementation may support an
          exchange with reduced levels of simultaneous interaction or it
          may report an error describing the terminal-related deficiency.


-------------------------------------------------------

::

          None.


---------------------------------------------------------

::

          The following operands shall be supported:

          address   The recipient of the talk session. One form of address
                    is the <user name>, as returned by the who utility.
                    Other address formats and how they are handled are
                    unspecified.

          terminal  If the recipient is logged in more than once, the
                    terminal argument can be used to indicate the
                    appropriate terminal name. If terminal is not
                    specified, the talk message shall be displayed on one
                    or more accessible terminals in use by the recipient.
                    The format of terminal shall be the same as that
                    returned by the who utility.


---------------------------------------------------

::

          Characters read from standard input shall be copied to the
          recipient's terminal in an unspecified manner. If standard input
          is not a terminal, talk shall write a diagnostic message and exit
          with a non-zero status.


---------------------------------------------------------------

::

          None.


-----------------------------------------------------------------------------------

::

          The following environment variables shall affect the execution of
          talk:

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

          TERM      Determine the name of the invoker's terminal type. If
                    this variable is unset or null, an unspecified default
                    terminal type shall be used.


-------------------------------------------------------------------------------

::

          When the talk utility receives a SIGINT signal, the utility shall
          terminate and exit with a zero status. It shall take the standard
          action for all other signals.


-----------------------------------------------------

::

          If standard output is a terminal, characters copied from the
          recipient's standard input may be written to standard output.
          Standard output also may be used for diagnostic messages. If
          standard output is not a terminal, talk shall exit with a non-
          zero status.


-----------------------------------------------------

::

          None.


-----------------------------------------------------------------

::

          None.


---------------------------------------------------------------------------------

::

          None.


---------------------------------------------------------------

::

          The following exit values shall be returned:

           0    Successful completion.

          >0    An error occurred or talk was invoked on a terminal
                incapable of supporting it.


-------------------------------------------------------------------------------------

::

          Default.

          The following sections are informative.


---------------------------------------------------------------------------

::

          Because the handling of non-printable, non-<space> characters is
          tied to the stty description of iexten, implementation extensions
          within the terminal driver can be accessed.  For example, some
          implementations provide line editing functions with certain
          control character sequences.


---------------------------------------------------------

::

          None.


-----------------------------------------------------------

::

          The write utility was included in this volume of POSIX.1‐2017
          since it can be implemented on all terminal types. The talk
          utility, which cannot be implemented on certain terminals, was
          considered to be a ``better'' communications interface. Both of
          these programs are in widespread use on historical
          implementations.  Therefore, both utilities have been specified.

          All references to networking abilities (talking to a user on
          another system) were removed as being outside the scope of this
          volume of POSIX.1‐2017.

          Historical BSD and System V versions of talk terminate both of
          the conversations when either user breaks out of the session.
          This can lead to adverse consequences if a user unwittingly
          continues to enter text that is interpreted by the shell when the
          other terminates the session. Therefore, the version of talk
          specified by this volume of POSIX.1‐2017 requires both users to
          terminate their end of the session explicitly.

          Only messages sent to the terminal of the invoking user can be
          internationalized in any way:

           *  The original ``Message from <unspecified string> ...''
              message sent to the terminal of the recipient cannot be
              internationalized because the environment of the recipient is
              as yet inaccessible to the talk utility. The environment of
              the invoking party is irrelevant.

           *  Subsequent communication between the two parties cannot be
              internationalized because the two parties may specify
              different languages in their environment (and non-portable
              characters cannot be mapped from one language to another).

           *  Neither party can be required to communicate in a language
              other than C and/or the one specified by their environment
              because unavailable terminal hardware support (for example,
              fonts) may be required.

          The text in the STDOUT section reflects the usage of the verb
          ``display'' in this section; some talk implementations actually
          use standard output to write to the terminal, but this volume of
          POSIX.1‐2017 does not require that to be the case.

          The format of the terminal name is unspecified, but the
          descriptions of ps, talk, who, and write require that they all
          use or accept the same format.

          The handling of non-printable characters is partially
          implementation-defined because the details of mapping them to
          printable sequences is not needed by the user. Historical
          implementations, for security reasons, disallow the transmission
          of non-printable characters that may send commands to the other
          terminal.


---------------------------------------------------------------------------

::

          None.


---------------------------------------------------------

::

          mesg(1p), stty(1p), who(1p), write(1p)

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

   IEEE/The Open Group               2017                          TALK(1P)

--------------

Pages that refer to this page: `mesg(1p) <../man1/mesg.1p.html>`__, 
`write(1p) <../man1/write.1p.html>`__

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
