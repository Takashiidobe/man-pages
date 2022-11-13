.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

qmsg(1p) — Linux manual page
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

   QMSG(1P)                POSIX Programmer's Manual               QMSG(1P)


-----------------------------------------------------

::

          This manual page is part of the POSIX Programmer's Manual.  The
          Linux implementation of this interface may differ (consult the
          corresponding Linux manual page for details of Linux behavior),
          or the interface may not be implemented on Linux.

NAME
-------------------------------------------------

::

          qmsg — send message to batch jobs


---------------------------------------------------------

::

          qmsg [-EO] message_string job_identifier...


---------------------------------------------------------------

::

          To send a message to a batch job is to request that a server
          write a message string into one or more output files of the batch
          job. A message is sent to a batch job by a request to the batch
          server that manages the batch job. The qmsg utility is a user-
          accessible batch client that requests the sending of messages to
          one or more batch jobs.

          The qmsg utility shall write messages into the files of batch
          jobs by sending a Job Message Request to the batch server that
          manages the batch job. The qmsg utility shall not directly write
          the message into the files of the batch job.

          The qmsg utility shall send a Job Message Request for those batch
          jobs, and only those batch jobs, for which a batch job_identifier
          is presented to the utility.

          The qmsg utility shall send Job Message Requests for batch jobs
          in the order in which their batch job_identifiers are presented
          to the utility.

          If the qmsg utility fails to process any batch job_identifier
          successfully, the utility shall proceed to process the remaining
          batch job_identifiers, if any.

          The qmsg utility shall not exit before a Job Message Request has
          been sent to the server that manages the batch job that
          corresponds to each successfully processed batch job_identifier.


-------------------------------------------------------

::

          The qmsg utility shall conform to the Base Definitions volume of
          POSIX.1‐2017, Section 12.2, Utility Syntax Guidelines.

          The following options shall be supported by the implementation:

          -E        Specify that the message is written to the standard
                    error of each batch job.

                    The qmsg utility shall write the message into the
                    standard error of the batch job.

          -O        Specify that the message is written to the standard
                    output of each batch job.

                    The qmsg utility shall write the message into the
                    standard output of the batch job.

          If neither the -O nor the -E option is presented to the qmsg
          utility, the utility shall write the message into an
          implementation-defined file. The conformance document for the
          implementation shall describe the name and location of the
          implementation-defined file. If both the -O and the -E options
          are presented to the qmsg utility, then the utility shall write
          the messages to both standard output and standard error.


---------------------------------------------------------

::

          The qmsg utility shall accept a minimum of two operands,
          message_string and one or more batch job_identifiers.

          The message_string operand shall be the string to be written to
          one or more output files of the batch job followed by a
          <newline>.  If the string contains <blank> characters, then the
          application shall ensure that the string is quoted. The
          message_string shall be encoded in the portable character set
          (see the Base Definitions volume of POSIX.1‐2017, Section 6.1,
          Portable Character Set).

          All remaining operands are batch job_identifiers that conform to
          the syntax for a batch job_identifier (see Section 3.3.1, Batch
          Job Identifier).


---------------------------------------------------

::

          Not used.


---------------------------------------------------------------

::

          None.


-----------------------------------------------------------------------------------

::

          The following environment variables shall affect the execution of
          qmsg:

          LANG      Provide a default value for the internationalization
                    variables that are unset or null. (See the Base
                    Definitions volume of POSIX.1‐2017, Section 8.2,
                    Internationalization Variables the precedence of
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

          LOGNAME   Determine the login name of the user.


-------------------------------------------------------------------------------

::

          Default.


-----------------------------------------------------

::

          None.


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

          In addition to the default behavior, the qmsg utility shall not
          be required to write a diagnostic message to standard error when
          the error reply received from a batch server indicates that the
          batch job_identifier does not exist on the server. Whether or not
          the qmsg utility waits to output the diagnostic message while
          attempting to locate the job on other servers is implementation-
          defined.

          The following sections are informative.


---------------------------------------------------------------------------

::

          None.


---------------------------------------------------------

::

          None.


-----------------------------------------------------------

::

          The qmsg utility allows users to write messages into the output
          files of running jobs. Users, including operators and
          administrators, have a number of occasions when they want to
          place messages in the output files of a batch job. For example,
          if a disk that is being used by a batch job is showing errors,
          the operator might note this in the standard error stream of the
          batch job.

          The options of the qmsg utility provide users with the means of
          placing the message in the output stream of their choice. The
          default output stream for the message—if the user does not
          designate an output stream—is implementation-defined, since many
          implementations will provide, as an extension to this volume of
          POSIX.1‐2017, a log file that shows the history of utility
          execution.

          If users wish to send a message to a set of jobs that meet a
          selection criteria, the qselect utility can be used to acquire
          the appropriate list of job identifiers.

          The -E option allows users to place the message in the standard
          error stream of the batch job.

          The -O option allows users to place the message in the standard
          output stream of the batch job.

          Historically, the qmsg utility is an existing practice in the
          offerings of one or more implementors of an NQS-derived batch
          system. The utility has been found to be useful enough that it
          deserves to be included in this volume of POSIX.1‐2017.


---------------------------------------------------------------------------

::

          The qmsg utility may be removed in a future version.


---------------------------------------------------------

::

          Chapter 3, Batch Environment Services, qselect(1p)

          The Base Definitions volume of POSIX.1‐2017, Section 6.1,
          Portable Character Set, Chapter 8, Environment Variables, Section
          12.2, Utility Syntax Guidelines


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

   IEEE/The Open Group               2017                          QMSG(1P)

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
