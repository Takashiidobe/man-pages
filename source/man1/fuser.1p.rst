.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

fuser(1p) — Linux manual page
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

   FUSER(1P)               POSIX Programmer's Manual              FUSER(1P)


-----------------------------------------------------

::

          This manual page is part of the POSIX Programmer's Manual.  The
          Linux implementation of this interface may differ (consult the
          corresponding Linux manual page for details of Linux behavior),
          or the interface may not be implemented on Linux.

NAME
-------------------------------------------------

::

          fuser — list process IDs of all processes that have one or more
          files open


---------------------------------------------------------

::

          fuser [-cfu] file...


---------------------------------------------------------------

::

          The fuser utility shall write to standard output the process IDs
          of processes running on the local system that have one or more
          named files open.  For block special devices, all processes using
          any file on that device are listed.

          The fuser utility shall write to standard error additional
          information about the named files indicating how the file is
          being used.

          Any output for processes running on remote systems that have a
          named file open is unspecified.

          A user may need appropriate privileges to invoke the fuser
          utility.


-------------------------------------------------------

::

          The fuser utility shall conform to the Base Definitions volume of
          POSIX.1‐2017, Section 12.2, Utility Syntax Guidelines.

          The following options shall be supported:

          -c        The file is treated as a mount point and the utility
                    shall report on any files open in the file system.

          -f        The report shall be only for the named files.

          -u        The user name, in parentheses, associated with each
                    process ID written to standard output shall be written
                    to standard error.


---------------------------------------------------------

::

          The following operand shall be supported:

          file      A pathname on which the file or file system is to be
                    reported.


---------------------------------------------------

::

          Not used.


---------------------------------------------------------------

::

          The user database.


-----------------------------------------------------------------------------------

::

          The following environment variables shall affect the execution of
          fuser:

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

          The fuser utility shall write the process ID for each process
          using each file given as an operand to standard output in the
          following format:

              "%d", <process_id>


-----------------------------------------------------

::

          The fuser utility shall write diagnostic messages to standard
          error.

          The fuser utility also shall write the following to standard
          error:

           *  The pathname of each named file is written followed
              immediately by a <colon>.

           *  For each process ID written to standard output, the character
              'c' shall be written to standard error if the process is
              using the file as its current directory and the character 'r'
              shall be written to standard error if the process is using
              the file as its root directory. Implementations may write
              other alphabetic characters to indicate other uses of files.

           *  When the -u option is specified, characters indicating the
              use of the file shall be followed immediately by the user
              name, in parentheses, corresponding to the real user ID of
              the process. If the user name cannot be resolved from the
              real user ID of the process, the real user ID of the process
              shall be written instead of the user name.

          When standard output and standard error are directed to the same
          file, the output shall be interleaved so that the filename
          appears at the start of each line, followed by the process ID and
          characters indicating the use of the file. Then, if the -u option
          is specified, the user name or user ID for each process using
          that file shall be written.

          A <newline> shall be written to standard error after the last
          output described above for each file operand.


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

          None.


---------------------------------------------------------

::

          The command:

              fuser -fu .

          writes to standard output the process IDs of processes that are
          using the current directory and writes to standard error an
          indication of how those processes are using the directory and the
          user names associated with the processes that are using the
          current directory.

              fuser -c <mount point>

          writes to standard output the process IDs of processes that are
          using any file in the file system which is mounted on <mount
          point> and writes to standard error an indication of how those
          processes are using the files.

              fuser <mount point>

          writes to standard output the process IDs of processes that are
          using the file which is named by <mount point> and writes to
          standard error an indication of how those processes are using the
          file.

              fuser <block device>

          writes to standard output the process IDs of processes that are
          using any file which is on the device named by <block device> and
          writes to standard error an indication of how those processes are
          using the file.

              fuser -f <block device>

          writes to standard output the process IDs of processes that are
          using the file <block device> itself and writes to standard error
          an indication of how those processes are using the file.


-----------------------------------------------------------

::

          The definition of the fuser utility follows existing practice.


---------------------------------------------------------------------------

::

          None.


---------------------------------------------------------

::

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

   IEEE/The Open Group               2017                         FUSER(1P)

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
