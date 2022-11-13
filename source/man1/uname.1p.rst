.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

uname(1p) — Linux manual page
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

   UNAME(1P)               POSIX Programmer's Manual              UNAME(1P)


-----------------------------------------------------

::

          This manual page is part of the POSIX Programmer's Manual.  The
          Linux implementation of this interface may differ (consult the
          corresponding Linux manual page for details of Linux behavior),
          or the interface may not be implemented on Linux.

NAME
-------------------------------------------------

::

          uname — return system name


---------------------------------------------------------

::

          uname [-amnrsv]


---------------------------------------------------------------

::

          By default, the uname utility shall write the operating system
          name to standard output. When options are specified, symbols
          representing one or more system characteristics shall be written
          to the standard output. The format and contents of the symbols
          are implementation-defined. On systems conforming to the System
          Interfaces volume of POSIX.1‐2017, the symbols written shall be
          those supported by the uname() function as defined in the System
          Interfaces volume of POSIX.1‐2017.


-------------------------------------------------------

::

          The uname utility shall conform to the Base Definitions volume of
          POSIX.1‐2017, Section 12.2, Utility Syntax Guidelines.

          The following options shall be supported:

          -a        Behave as though all of the options -mnrsv were
                    specified.

          -m        Write the name of the hardware type on which the system
                    is running to standard output.

          -n        Write the name of this node within an implementation-
                    defined communications network.

          -r        Write the current release level of the operating system
                    implementation.

          -s        Write the name of the implementation of the operating
                    system.

          -v        Write the current version level of this release of the
                    operating system implementation.

          If no options are specified, the uname utility shall write the
          operating system name, as if the -s option had been specified.


---------------------------------------------------------

::

          None.


---------------------------------------------------

::

          Not used.


---------------------------------------------------------------

::

          None.


-----------------------------------------------------------------------------------

::

          The following environment variables shall affect the execution of
          uname:

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


-------------------------------------------------------------------------------

::

          Default.


-----------------------------------------------------

::

          By default, the output shall be a single line of the following
          form:

              "%s\n", <sysname>

          If the -a option is specified, the output shall be a single line
          of the following form:

              "%s %s %s %s %s\n", <sysname>, <nodename>, <release>,
                  <version>, <machine>

          Additional implementation-defined symbols may be written; all
          such symbols shall be written at the end of the line of output
          before the <newline>.

          If options are specified to select different combinations of the
          symbols, only those symbols shall be written, in the order shown
          above for the -a option. If a symbol is not selected for writing,
          its corresponding trailing <blank> characters also shall not be
          written.


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

           0    The requested information was successfully written.

          >0    An error occurred.


-------------------------------------------------------------------------------------

::

          Default.

          The following sections are informative.


---------------------------------------------------------------------------

::

          Note that any of the symbols could include embedded <space>
          characters, which may affect parsing algorithms if multiple
          options are selected for output.

          The node name is typically a name that the system uses to
          identify itself for inter-system communication addressing.


---------------------------------------------------------

::

          The following command:

              uname -sr

          writes the operating system name and release level, separated by
          one or more <blank> characters.


-----------------------------------------------------------

::

          It was suggested that this utility cannot be used portably since
          the format of the symbols is implementation-defined. The POSIX.1
          working group could not achieve consensus on defining these
          formats in the underlying uname() function, and there was no
          expectation that this volume of POSIX.1‐2017 would be any more
          successful. Some applications may still find this historical
          utility of value. For example, the symbols could be used for
          system log entries or for comparison with operator or user input.


---------------------------------------------------------------------------

::

          None.


---------------------------------------------------------

::

          The Base Definitions volume of POSIX.1‐2017, Chapter 8,
          Environment Variables, Section 12.2, Utility Syntax Guidelines

          The System Interfaces volume of POSIX.1‐2017, uname(3p)


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

   IEEE/The Open Group               2017                         UNAME(1P)

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
