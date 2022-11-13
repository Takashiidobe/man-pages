.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

tabs(1p) — Linux manual page
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

   TABS(1P)                POSIX Programmer's Manual               TABS(1P)


-----------------------------------------------------

::

          This manual page is part of the POSIX Programmer's Manual.  The
          Linux implementation of this interface may differ (consult the
          corresponding Linux manual page for details of Linux behavior),
          or the interface may not be implemented on Linux.

NAME
-------------------------------------------------

::

          tabs — set terminal tabs


---------------------------------------------------------

::

          tabs [-n|-a|-a2|-c|-c2|-c3|-f|-p|-s|-u] [-T type]

          tabs [-T type] n[[sep[+]n]...]


---------------------------------------------------------------

::

          The tabs utility shall display a series of characters that first
          clears the hardware terminal tab settings and then initializes
          the tab stops at the specified positions and optionally adjusts
          the margin.

          The phrase ``tab-stop position N'' shall be taken to mean that,
          from the start of a line of output, tabbing to position N shall
          cause the next character output to be in the (N+1)th column
          position on that line. The maximum number of tab stops allowed is
          terminal-dependent.

          It need not be possible to implement tabs on certain terminals.
          If the terminal type obtained from the TERM environment variable
          or -T option represents such a terminal, an appropriate
          diagnostic message shall be written to standard error and tabs
          shall exit with a status greater than zero.


-------------------------------------------------------

::

          The tabs utility shall conform to the Base Definitions volume of
          POSIX.1‐2017, Section 12.2, Utility Syntax Guidelines, except for
          various extensions: the options -a2, -c2, and -c3 are multi-
          character.

          The following options shall be supported:

          -n        Specify repetitive tab stops separated by a uniform
                    number of column positions, n, where n is a single-
                    digit decimal number. The default usage of tabs with no
                    arguments shall be equivalent to tabs -8. When -0 is
                    used, the tab stops shall be cleared and no new ones
                    set.

          -a        1,10,16,36,72
                    Assembler, applicable to some mainframes.

          -a2       1,10,16,40,72
                    Assembler, applicable to some mainframes.

          -c        1,8,12,16,20,55
                    COBOL, normal format.

          -c2       1,6,10,14,49
                    COBOL, compact format (columns 1 to 6 omitted).

          -c3       1,6,10,14,18,22,26,30,34,38,42,46,50,54,58,62,67
                    COBOL compact format (columns 1 to 6 omitted), with
                    more tabs than -c2.

          -f        1,7,11,15,19,23
                    FORTRAN

          -p        1,5,9,13,17,21,25,29,33,37,41,45,49,53,57,61
                    PL/1

          -s        1,10,55
                    SNOBOL

          -u        1,12,20,44
                    Assembler, applicable to some mainframes.

          -T type   Indicate the type of terminal. If this option is not
                    supplied and the TERM variable is unset or null, an
                    unspecified default terminal type shall be used. The
                    setting of type shall take precedence over the value in
                    TERM.


---------------------------------------------------------

::

          The following operand shall be supported:

          n[[sep[+]n]...]
                    A single command line argument that consists of one or
                    more tab-stop values (n) separated by a separator
                    character (sep) which is either a <comma> or a <blank>
                    character. The application shall ensure that the tab-
                    stop values are positive decimal integers in strictly
                    ascending order. If any tab-stop value (except the
                    first one) is preceded by a <plus-sign>, it is taken as
                    an increment to be added to the previous value. For
                    example, the tab lists 1,10,20,30 and "110+10+10" are
                    considered to be identical.


---------------------------------------------------

::

          Not used.


---------------------------------------------------------------

::

          None.


-----------------------------------------------------------------------------------

::

          The following environment variables shall affect the execution of
          tabs:

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

          If standard output is a terminal, the appropriate sequence to
          clear and set the tab stops may be written to standard output in
          an unspecified format. If standard output is not a terminal,
          undefined results occur.


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

           0    Successful completion.

          >0    An error occurred.


-------------------------------------------------------------------------------------

::

          Default.

          The following sections are informative.


---------------------------------------------------------------------------

::

          This utility makes use of the terminal's hardware tabs and the
          stty tabs option.

          This utility is not recommended for application use.

          Some integrated display units might not have escape sequences to
          set tab stops, but may be set by internal system calls. On these
          terminals, tabs works if standard output is directed to the
          terminal; if output is directed to another file, however, tabs
          fails.


---------------------------------------------------------

::

          None.


-----------------------------------------------------------

::

          Consideration was given to having the tput utility handle all of
          the functions described in tabs.  However, the separate tabs
          utility was retained because it seems more intuitive to use a
          command named tabs than tput with a new option. The tput utility
          does not support setting or clearing tabs, and no known
          historical version of tabs supports the capability of setting
          arbitrary tab stops.

          The System V tabs interface is very complex; the version in this
          volume of POSIX.1‐2017 has a reduced feature list, but many of
          the features omitted were restored as part of the XSI option even
          though the supported languages and coding styles are primarily
          historical.

          There was considerable sentiment for specifying only a means of
          resetting the tabs back to a known state—presumably the
          ``standard'' of tabs every eight positions. The following
          features were omitted:

           *  Setting tab stops via the first line in a file, using --file.
              Since even the SVID has no complete explanation of this
              feature, it is doubtful that it is in widespread use.

          In an early proposal, a -t tablist option was added for
          consistency with expand; this was later removed when
          inconsistencies with the historical list of tabs were identified.

          Consideration was given to adding a -p option that would output
          the current tab settings so that they could be saved and then
          later restored. This was not accepted because querying the tab
          stops of the terminal is not a capability in historical terminfo
          or termcap facilities and might not be supported on a wide range
          of terminals.


---------------------------------------------------------------------------

::

          None.


---------------------------------------------------------

::

          expand(1p), stty(1p), tput(1p), unexpand(1p)

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

   IEEE/The Open Group               2017                          TABS(1P)

--------------

Pages that refer to this page: `expand(1p) <../man1/expand.1p.html>`__, 
`tput(1p) <../man1/tput.1p.html>`__, 
`unexpand(1p) <../man1/unexpand.1p.html>`__

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
