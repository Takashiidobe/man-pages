.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

qdel(1p) — Linux manual page
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

   QDEL(1P)                POSIX Programmer's Manual               QDEL(1P)


-----------------------------------------------------

::

          This manual page is part of the POSIX Programmer's Manual.  The
          Linux implementation of this interface may differ (consult the
          corresponding Linux manual page for details of Linux behavior),
          or the interface may not be implemented on Linux.

NAME
-------------------------------------------------

::

          qdel — delete batch jobs


---------------------------------------------------------

::

          qdel job_identifier...


---------------------------------------------------------------

::

          A batch job is deleted by sending a request to the batch server
          that manages the batch job. A batch job that has been deleted is
          no longer subject to management by batch services.

          The qdel utility is a user-accessible client of batch services
          that requests the deletion of one or more batch jobs.

          The qdel utility shall request a batch server to delete those
          batch jobs for which a batch job_identifier is presented to the
          utility.

          The qdel utility shall delete batch jobs in the order in which
          their batch job_identifiers are presented to the utility.

          If the qdel utility fails to process any batch job_identifier
          successfully, the utility shall proceed to process the remaining
          batch job_identifiers, if any.

          The qdel utility shall delete each batch job by sending a Delete
          Job Request to the batch server that manages the batch job.

          The qdel utility shall not exit until the batch job corresponding
          to each successfully processed batch job_identifier has been
          deleted.


-------------------------------------------------------

::

          None.


---------------------------------------------------------

::

          The qdel utility shall accept one or more operands that conform
          to the syntax for a batch job_identifier (see Section 3.3.1,
          Batch Job Identifier).


---------------------------------------------------

::

          Not used.


---------------------------------------------------------------

::

          None.


-----------------------------------------------------------------------------------

::

          The following environment variables shall affect the execution of
          qdel:

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

          An implementation of the qdel utility may write informative
          messages to standard output.


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

          In addition to the default behavior, the qdel utility shall not
          be required to write a diagnostic message to standard error when
          the error reply received from a batch server indicates that the
          batch job_identifier does not exist on the server. Whether or not
          the qdel utility waits to output the diagnostic message while
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

          The qdel utility allows users and administrators to delete jobs.

          The qdel utility provides functionality that is not otherwise
          available. For example, the kill utility of the operating system
          does not suffice. First, to use the kill utility, the user might
          have to log in on a remote node, because the kill utility does
          not operate across the network. Second, unlike qdel, kill cannot
          remove jobs from queues. Lastly, the arguments of the qdel
          utility are job identifiers rather than process identifiers, and
          so this utility can be passed the output of the qselect utility,
          thus providing users with a means of deleting a list of jobs.

          Because a set of jobs can be selected using the qselect utility,
          the qdel utility has not been complicated with options that
          provide for selection of jobs. Instead, the batch jobs to be
          deleted are identified individually by their job identifiers.

          Historically, the qdel utility has been a component of NQS, the
          existing practice on which it is based. However, the qdel utility
          defined in this volume of POSIX.1‐2017 does not provide an option
          for specifying a signal number to send to the batch job prior to
          the killing of the process; that capability has been subsumed by
          the qsig utility.

          A discussion was held about the delays of networking and the
          possibility that the batch server may never respond, due to a
          down router, down batch server, or other network mishap. The
          DESCRIPTION records this under the words ``fails to process any
          job identifier''.  In the broad sense, the network problem is
          also an error, which causes the failure to process the batch job
          identifier.


---------------------------------------------------------------------------

::

          The qdel utility may be removed in a future version.


---------------------------------------------------------

::

          Chapter 3, Batch Environment Services, kill(1p), qselect(1p),
          qsig(1p)

          The Base Definitions volume of POSIX.1‐2017, Chapter 8,
          Environment Variables


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

   IEEE/The Open Group               2017                          QDEL(1P)

--------------

Pages that refer to this page: `qalter(1p) <../man1/qalter.1p.html>`__, 
`qselect(1p) <../man1/qselect.1p.html>`__, 
`qsig(1p) <../man1/qsig.1p.html>`__

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
