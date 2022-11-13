.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

renice(1p) — Linux manual page
==============================

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

   RENICE(1P)              POSIX Programmer's Manual             RENICE(1P)


-----------------------------------------------------

::

          This manual page is part of the POSIX Programmer's Manual.  The
          Linux implementation of this interface may differ (consult the
          corresponding Linux manual page for details of Linux behavior),
          or the interface may not be implemented on Linux.

NAME
-------------------------------------------------

::

          renice — set nice values of running processes


---------------------------------------------------------

::

          renice [-g|-p|-u] -n increment ID...


---------------------------------------------------------------

::

          The renice utility shall request that the nice values (see the
          Base Definitions volume of POSIX.1‐2017, Section 3.244, Nice
          Value) of one or more running processes be changed. By default,
          the applicable processes are specified by their process IDs. When
          a process group is specified (see -g), the request shall apply to
          all processes in the process group.

          The nice value shall be bounded in an implementation-defined
          manner.  If the requested increment would raise or lower the nice
          value of the executed utility beyond implementation-defined
          limits, then the limit whose value was exceeded shall be used.

          When a user is reniced, the request applies to all processes
          whose saved set-user-ID matches the user ID corresponding to the
          user.

          Regardless of which options are supplied or any other factor,
          renice shall not alter the nice values of any process unless the
          user requesting such a change has appropriate privileges to do so
          for the specified process. If the user lacks appropriate
          privileges to perform the requested action, the utility shall
          return an error status.

          The saved set-user-ID of the user's process shall be checked
          instead of its effective user ID when renice attempts to
          determine the user ID of the process in order to determine
          whether the user has appropriate privileges.


-------------------------------------------------------

::

          The renice utility shall conform to the Base Definitions volume
          of POSIX.1‐2017, Section 12.2, Utility Syntax Guidelines, except
          for Guideline 9.

          The following options shall be supported:

          -g        Interpret the following operands as unsigned decimal
                    integer process group IDs.

          -n increment
                    Specify how the nice value of the specified process or
                    processes is to be adjusted. The increment option-
                    argument is a positive or negative decimal integer that
                    shall be used to modify the nice value of the specified
                    process or processes.

                    Positive increment values shall cause a lower nice
                    value. Negative increment values may require
                    appropriate privileges and shall cause a higher nice
                    value.

          -p        Interpret the following operands as unsigned decimal
                    integer process IDs. The -p option is the default if no
                    options are specified.

          -u        Interpret the following operands as users. If a user
                    exists with a user name equal to the operand, then the
                    user ID of that user is used in further processing.
                    Otherwise, if the operand represents an unsigned
                    decimal integer, it shall be used as the numeric user
                    ID of the user.


---------------------------------------------------------

::

          The following operands shall be supported:

          ID        A process ID, process group ID, or user name/user ID,
                    depending on the option selected.


---------------------------------------------------

::

          Not used.


---------------------------------------------------------------

::

          None.


-----------------------------------------------------------------------------------

::

          The following environment variables shall affect the execution of
          renice:

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

          Not used.


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

          None.


---------------------------------------------------------

::

           1. Adjust the nice value so that process IDs 987 and 32 would
              have a lower nice value:

                  renice -n 5 -p 987 32

           2. Adjust the nice value so that group IDs 324 and 76 would have
              a higher nice value, if the user has appropriate privileges
              to do so:

                  renice -n -4 -g 324 76

           3. Adjust the nice value so that numeric user ID 8 and user sas
              would have a lower nice value:

                  renice -n 4 -u 8 sas

          Useful nice value increments on historical systems include 19 or
          20 (the affected processes run only when nothing else in the
          system attempts to run) and any negative number (to make
          processes run faster).


-----------------------------------------------------------

::

          The gid, pid, and user specifications do not fit either the
          definition of operand or option-argument. However, for clarity,
          they have been included in the OPTIONS section, rather than the
          OPERANDS section.

          The definition of nice value is not intended to suggest that all
          processes in a system have priorities that are comparable.
          Scheduling policy extensions such as the realtime priorities in
          the System Interfaces volume of POSIX.1‐2017 make the notion of a
          single underlying priority for all scheduling policies
          problematic. Some implementations may implement the nice-related
          features to affect all processes on the system, others to affect
          just the general time-sharing activities implied by this volume
          of POSIX.1‐2017, and others may have no effect at all. Because of
          the use of ``implementation-defined'' in nice and renice, a wide
          range of implementation strategies are possible.

          Originally, this utility was written in the historical manner,
          using the term ``nice value''. This was always a point of concern
          with users because it was never intuitively obvious what this
          meant. With a newer version of renice, which used the term
          ``system scheduling priority'', it was hoped that novice users
          could better understand what this utility was meant to do. Also,
          it would be easier to document what the utility was meant to do.
          Unfortunately, the addition of the POSIX realtime scheduling
          capabilities introduced the concepts of process and thread
          scheduling priorities that were totally unaffected by the
          nice/renice utilities or the nice()/setpriority() functions.
          Continuing to use the term ``system scheduling priority'' would
          have incorrectly suggested that these utilities and functions
          were indeed affecting these realtime priorities. It was decided
          to revert to the historical term ``nice value'' to reference this
          unrelated process attribute.

          Although this utility has use by system administrators (and in
          fact appears in the system administration portion of the BSD
          documentation), the standard developers considered that it was
          very useful for individual end users to control their own
          processes.

          Earlier versions of this standard allowed the following forms in
          the SYNOPSIS:

              renice nice_value[-p] pid...[-g gid...][-p pid...][-u user...]
              renice nice_value -g gid...[-g gid...]-p pid...][-u user...]
              renice nice_value -u user...[-g gid...]-p pid...][-u user...]

          These forms are no longer specified by POSIX.1‐2008 but may be
          present in some implementations.


---------------------------------------------------------------------------

::

          None.


---------------------------------------------------------

::

          nice(1p)

          The Base Definitions volume of POSIX.1‐2017, Section 3.244, Nice
          Value, Chapter 8, Environment Variables, Section 12.2, Utility
          Syntax Guidelines


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

   IEEE/The Open Group               2017                        RENICE(1P)

--------------

Pages that refer to this page: `nice(1p) <../man1/nice.1p.html>`__, 
`ps(1p) <../man1/ps.1p.html>`__

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
