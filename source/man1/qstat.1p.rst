.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

qstat(1p) — Linux manual page
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

   QSTAT(1P)               POSIX Programmer's Manual              QSTAT(1P)


-----------------------------------------------------

::

          This manual page is part of the POSIX Programmer's Manual.  The
          Linux implementation of this interface may differ (consult the
          corresponding Linux manual page for details of Linux behavior),
          or the interface may not be implemented on Linux.

NAME
-------------------------------------------------

::

          qstat — show status of batch jobs


---------------------------------------------------------

::

          qstat [-f] job_identifier...

          qstat -Q [-f] destination...

          qstat -B [-f] server_name...


---------------------------------------------------------------

::

          The status of a batch job, batch queue, or batch server is
          obtained by a request to the server. The qstat utility is a user-
          accessible batch client that requests the status of one or more
          batch jobs, batch queues, or servers, and writes the status
          information to standard output.

          For each successfully processed batch job_identifier, the qstat
          utility shall display information about the corresponding batch
          job.

          For each successfully processed destination, the qstat utility
          shall display information about the corresponding batch queue.

          For each successfully processed server name, the qstat utility
          shall display information about the corresponding server.

          The qstat utility shall acquire batch job status information by
          sending a Job Status Request to a batch server. The qstat utility
          shall acquire batch queue status information by sending a Queue
          Status Request to a batch server. The qstat utility shall acquire
          server status information by sending a Server Status Request to a
          batch server.


-------------------------------------------------------

::

          The qstat utility shall conform to the Base Definitions volume of
          POSIX.1‐2017, Section 12.2, Utility Syntax Guidelines.

          The following options shall be supported by the implementation:

          -f        Specify that a full display is produced.

                    The minimum contents of a full display are specified in
                    the STDOUT section.

                    Additional contents and format of a full display are
                    implementation-defined.

          -Q        Specify that the operand is a destination.

                    The qstat utility shall display information about each
                    batch queue at each destination identified as an
                    operand.

          -B        Specify that the operand is a server name.

                    The qstat utility shall display information about each
                    server identified as an operand.


---------------------------------------------------------

::

          If the -Q option is presented to the qstat utility, the utility
          shall accept one or more operands that conform to the syntax for
          a destination (see Section 3.3.2, Destination).

          If the -B option is presented to the qstat utility, the utility
          shall accept one or more server_name operands.

          If neither the -B nor the -Q option is presented to the qstat
          utility, the utility shall accept one or more operands that
          conform to the syntax for a batch job_identifier (see Section
          3.3.1, Batch Job Identifier).


---------------------------------------------------

::

          Not used.


---------------------------------------------------------------

::

          None.


-----------------------------------------------------------------------------------

::

          The following environment variables shall affect the execution of
          qstat:

          HOME      Determine the pathname of the user's home directory.

          LANG      Provide a default value for the internationalization
                    variables that are unset or null. (See the Base
                    Definitions volume of POSIX.1‐2017, Section 8.2,
                    Internationalization Variables the precedence of
                    internationalization variables used to determine the
                    values of locale categories.)

          LC_ALL    If set to a non-empty string value, override the values
                    of all the other internationalization variables.

          LC_COLLATE
                    Determine the locale for the behavior of ranges,
                    equivalence classes, and multi-character collating
                    elements within regular expressions.

          LC_CTYPE  Determine the locale for the interpretation of
                    sequences of bytes of text data as characters (for
                    example, single-byte as opposed to multi-byte
                    characters in arguments).

          LC_MESSAGES
                    Determine the locale that should be used to affect the
                    format and contents of diagnostic messages written to
                    standard error.

          LC_NUMERIC
                    Determine the locale for selecting the radix character
                    used when writing floating-point formatted output.


-------------------------------------------------------------------------------

::

          Default.


-----------------------------------------------------

::

          If an operand presented to the qstat utility is a batch
          job_identifier and the -f option is not specified, the qstat
          utility shall display the following items on a single line, in
          the stated order, with white space between each item, for each
          successfully processed operand:

           *  The batch job_identifier

           *  The batch job name

           *  The Job_Owner attribute

           *  The CPU time used by the batch job

           *  The batch job state

           *  The batch job location

          If an operand presented to the qstat utility is a batch
          job_identifier and the -f option is specified, the qstat utility
          shall display the following items for each success fully
          processed operand:

           *  The batch job_identifier

           *  The batch job name

           *  The Job_Owner attribute

           *  The execution user ID

           *  The CPU time used by the batch job

           *  The batch job state

           *  The batch job location

           *  Additional implementation-defined information, if any, about
              the batch job or batch queue

          If an operand presented to the qstat utility is a destination,
          the -Q option is specified, and the -f option is not specified,
          the qstat utility shall display the following items on a single
          line, in the stated order, with white space between each item,
          for each successfully processed operand:

           *  The batch queue name

           *  The maximum number of batch jobs that shall be run in the
              batch queue concurrently

           *  The total number of batch jobs in the batch queue

           *  The status of the batch queue

           *  For each state, the number of batch jobs in that state in the
              batch queue and the name of the state

           *  The type of batch queue (execution or routing)

          If the operands presented to the qstat utility are destinations,
          the -Q option is specified, and the -f option is specified, the
          qstat utility shall display the following items for each
          successfully processed operand:

           *  The batch queue name

           *  The maximum number of batch jobs that shall be run in the
              batch queue concurrently

           *  The total number of batch jobs in the batch queue

           *  The status of the batch queue

           *  For each state, the number of batch jobs in that state in the
              batch queue and the name of the state

           *  The type of batch queue (execution or routing)

           *  Additional implementation-defined information, if any, about
              the batch queue

          If the operands presented to the qstat utility are batch server
          names, the -B option is specified, and the -f option is not
          specified, the qstat utility shall display the following items on
          a single line, in the stated order, with white space between each
          item, for each successfully processed operand:

           *  The batch server name

           *  The maximum number of batch jobs that shall be run in the
              batch queue concurrently

           *  The total number of batch jobs managed by the batch server

           *  The status of the batch server

           *  For each state, the number of batch jobs in that state and
              the name of the state

          If the operands presented to the qstat utility are server names,
          the -B option is specified, and the -f option is specified, the
          qstat utility shall display the following items for each
          successfully processed operand:

           *  The server name

           *  The maximum number of batch jobs that shall be run in the
              batch queue concurrently

           *  The total number of batch jobs managed by the server

           *  The status of the server

           *  For each state, the number of batch jobs in that state and
              the name of the state

           *  Additional implementation-defined information, if any, about
              the server


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

          In addition to the default behavior, the qstat utility shall not
          be required to write a diagnostic message to standard error when
          the error reply received from a batch server indicates that the
          batch job_identifier does not exist on the server. Whether or not
          the qstat utility waits to output the diagnostic message while
          attempting to locate the batch job on other servers is
          implementation-defined.

          The following sections are informative.


---------------------------------------------------------------------------

::

          None.


---------------------------------------------------------

::

          None.


-----------------------------------------------------------

::

          The qstat utility allows users to display the status of jobs and
          list the batch jobs in queues.

          The operands of the qstat utility may be either job identifiers,
          queues (specified as destination identifiers), or batch server
          names. The -Q and -B options, or absence thereof, indicate the
          nature of the operands.

          The other options of the qstat utility allow the user to control
          the amount of information displayed and the format in which it is
          displayed. Should a user wish to display the status of a set of
          jobs that match a selection criteria, the qselect utility may be
          used to acquire such a list.

          The -f option allows users to request a ``full'' display in an
          implementation-defined format.

          Historically, the qstat utility has been a part of the NQS and
          its derivatives, the existing practice on which it is based.


---------------------------------------------------------------------------

::

          The qstat utility may be removed in a future version.


---------------------------------------------------------

::

          Chapter 3, Batch Environment Services, qselect(1p)

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

   IEEE/The Open Group               2017                         QSTAT(1P)

--------------

Pages that refer to this page: `qsub(1p) <../man1/qsub.1p.html>`__

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
