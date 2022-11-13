.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

uux(1p) — Linux manual page
===========================

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

   UUX(1P)                 POSIX Programmer's Manual                UUX(1P)


-----------------------------------------------------

::

          This manual page is part of the POSIX Programmer's Manual.  The
          Linux implementation of this interface may differ (consult the
          corresponding Linux manual page for details of Linux behavior),
          or the interface may not be implemented on Linux.

NAME
-------------------------------------------------

::

          uux — remote command execution


---------------------------------------------------------

::

          uux [-jnp] command-string


---------------------------------------------------------------

::

          The uux utility shall gather zero or more files from various
          systems, execute a shell pipeline (see Section 2.9, Shell
          Commands) on a specified system, and then send the standard
          output of the command to a file on a specified system. Only the
          first command of a pipeline can have a system-name!  prefix. All
          other commands in the pipeline shall be executed on the system of
          the first command.

          The following restrictions are applicable to the shell pipeline
          processed by uux:

           *  In gathering files from different systems, pathname expansion
              shall not be performed by uux.  Thus, a request such as:

                  uux "c99 remsys!~/*.c"

              would attempt to copy the file named literally *.c to the
              local system.

           *  The redirection operators ">>", "<<", ">|", and ">&" shall
              not be accepted. Any use of these redirection operators shall
              cause this utility to write an error message describing the
              problem and exit with a non-zero exit status.

           *  The reserved word !  cannot be used at the head of the
              pipeline to modify the exit status.  (See the command-string
              operand description below.)

           *  Alias substitution shall not be performed.

          A filename can be specified as for uucp; it can be an absolute
          pathname, a pathname preceded by ~name (which is replaced by the
          corresponding login directory), a pathname specified as ~/dest
          (dest is prefixed by the public directory called PUBDIR; the
          actual location of PUBDIR is implementation-defined), or a simple
          filename (which is prefixed by uux with the current directory).
          See uucp(1p) for the details.

          The execution of commands on remote systems shall take place in
          an execution directory known to the uucp system. All files
          required for the execution shall be put into this directory
          unless they already reside on that machine. Therefore, the
          application shall ensure that non-local filenames (without path
          or machine reference) are unique within the uux request.

          The uux utility shall attempt to get all files to the execution
          system. For files that are output files, the application shall
          ensure that the filename is escaped using parentheses.

          The remote system shall notify the user by mail if the requested
          command on the remote system was disallowed or the files were not
          accessible. This notification can be turned off by the -n option.

          Typical implementations of this utility require a communications
          line configured to use the Base Definitions volume of
          POSIX.1‐2017, Chapter 11, General Terminal Interface, but other
          communications means may be used. On systems where there are no
          available communications means (either temporarily or
          permanently), this utility shall write an error message
          describing the problem and exit with a non-zero exit status.

          The uux utility cannot guarantee support for all character
          encodings in all circumstances. For example, transmission data
          may be restricted to 7 bits by the underlying network, 8-bit data
          and filenames need not be portable to non-internationalized
          systems, and so on. Under these circumstances, it is recommended
          that only characters defined in the ISO/IEC 646:1991 standard
          International Reference Version (equivalent to ASCII) 7-bit range
          of characters be used and that only characters defined in the
          portable filename character set be used for naming files.


-------------------------------------------------------

::

          The uux utility shall conform to the Base Definitions volume of
          POSIX.1‐2017, Section 12.2, Utility Syntax Guidelines.

          The following options shall be supported:

          -j        Write the job identification string to standard output.
                    This job identification can be used by uustat to obtain
                    the status or terminate a job.

          -n        Do not notify the user if the command fails.

          -p        Make the standard input to uux the standard input to
                    the command-string.


---------------------------------------------------------

::

          The following operand shall be supported:

          command-string
                    A string made up of one or more arguments that are
                    similar to normal command arguments, except that the
                    command and any filenames can be prefixed by system-
                    name!.  A null system-name shall be interpreted as the
                    local system.


---------------------------------------------------

::

          The standard input shall not be used unless the '-' or -p option
          is specified; in those cases, the standard input shall be made
          the standard input of the command-string.


---------------------------------------------------------------

::

          Input files shall be selected according to the contents of
          command-string.


-----------------------------------------------------------------------------------

::

          The following environment variables shall affect the execution of
          uux:

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

          The standard output shall not be used unless the -j option is
          specified; in that case, the job identification string shall be
          written to standard output in the following format:

              "%s\n", <jobid>


-----------------------------------------------------

::

          The standard error shall be used only for diagnostic messages.


-----------------------------------------------------------------

::

          Output files shall be created or written, or both, according to
          the contents of command-string.

          If -n is not used, mail files shall be modified following any
          command or file-access failures on the remote system.


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

          This utility is part of the UUCP Utilities option and need not be
          supported by all implementations.

          Note that, for security reasons, many installations limit the
          list of commands executable on behalf of an incoming request from
          uux.  Many sites permit little more than the receipt of mail via
          uux.

          Any characters special to the command interpreter should be
          quoted either by quoting the entire command-string or quoting the
          special characters as individual arguments.

          As noted in uucp, shell pattern matching notation characters
          appearing in pathnames are expanded on the appropriate local
          system. This is done under the control of local settings of
          LC_COLLATE and LC_CTYPE.  Thus, care should be taken when using
          bracketed filename patterns, as collation and typing rules may
          vary from one system to another. Also be aware that certain types
          of expression (that is, equivalence classes, character classes,
          and collating symbols) need not be supported on non-
          internationalized systems.


---------------------------------------------------------

::

           1. The following command gets file1 from system a and file2 from
              system b, executes diff on the local system, and puts the
              results in file.diff in the local PUBDIR directory. (PUBDIR
              is the uucp public directory on the local system.)

                  uux "!diff a!/usr/file1 b!/a4/file2 >!~/file.diff"

           2. The following command fails because uux places all files
              copied to a system in the same working directory.  Although
              the files xyz are from two different systems, their filenames
              are the same and conflict.

                  uux "!diff a!/usr1/xyz b!/usr2/xyz >!~/xyz.diff"

           3. The following command succeeds (assuming diff is permitted on
              system a) because the file local to system a is not copied to
              the working directory, and hence does not conflict with the
              file from system c.

                  uux "a!diff a!/usr/xyz c!/usr/xyz >!~/xyz.diff"


-----------------------------------------------------------

::

          None.


---------------------------------------------------------------------------

::

          None.


---------------------------------------------------------

::

          Chapter 2, Shell Command Language, uucp(1p), uuencode(1p),
          uustat(1p)

          The Base Definitions volume of POSIX.1‐2017, Chapter 8,
          Environment Variables, Chapter 11, General Terminal Interface,
          Section 12.2, Utility Syntax Guidelines


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

   IEEE/The Open Group               2017                           UUX(1P)

--------------

Pages that refer to this page: `uucp(1p) <../man1/uucp.1p.html>`__

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
