.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

export(1p) — Linux manual page
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
| `STDERR S <#STDERR_S>`__ \|       |                                   |
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

   EXPORT(1P)              POSIX Programmer's Manual             EXPORT(1P)


-----------------------------------------------------

::

          This manual page is part of the POSIX Programmer's Manual.  The
          Linux implementation of this interface may differ (consult the
          corresponding Linux manual page for details of Linux behavior),
          or the interface may not be implemented on Linux.

NAME
-------------------------------------------------

::

          export — set the export attribute for variables


---------------------------------------------------------

::

          export name[=word]...

          export -p


---------------------------------------------------------------

::

          The shell shall give the export attribute to the variables
          corresponding to the specified names, which shall cause them to
          be in the environment of subsequently executed commands. If the
          name of a variable is followed by =word, then the value of that
          variable shall be set to word.

          The export special built-in shall support the Base Definitions
          volume of POSIX.1‐2017, Section 12.2, Utility Syntax Guidelines.

          When -p is specified, export shall write to the standard output
          the names and values of all exported variables, in the following
          format:

              "export %s=%s\n", <name>, <value>

          if name is set, and:

              "export %s\n", <name>

          if name is unset.

          The shell shall format the output, including the proper use of
          quoting, so that it is suitable for reinput to the shell as
          commands that achieve the same exporting results, except:

           1. Read-only variables with values cannot be reset.

           2. Variables that were unset at the time they were output need
              not be reset to the unset state if a value is assigned to the
              variable between the time the state was saved and the time at
              which the saved output is reinput to the shell.

          When no arguments are given, the results are unspecified.


-------------------------------------------------------

::

          See the DESCRIPTION.


---------------------------------------------------------

::

          See the DESCRIPTION.


---------------------------------------------------

::

          Not used.


---------------------------------------------------------------

::

          None.


-----------------------------------------------------------------------------------

::

          None.


-------------------------------------------------------------------------------

::

          Default.


-----------------------------------------------------

::

          See the DESCRIPTION.


---------------------------------------------------------

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

           0    All name operands were successfully exported.

          >0    At least one name could not be exported, or the -p option
                was specified and an error occurred.


-------------------------------------------------------------------------------------

::

          Default.

          The following sections are informative.


---------------------------------------------------------------------------

::

          Note that, unless X was previously marked readonly, the value of
          "$?" after:

              export X=$(false)

          will be 0 (because export successfully set X to the empty string)
          and that execution continues, even if set -e is in effect. In
          order to detect command substitution failures, a user must
          separate the assignment from the export, as in:

              X=$(false)
              export X


---------------------------------------------------------

::

          Export PWD and HOME variables:

              export PWD HOME

          Set and export the PATH variable:

              export PATH=/local/bin:$PATH

          Save and restore all exported variables:

              export -p > temp-file
              unset a lot of variables
              ... processing
              . temp-file


-----------------------------------------------------------

::

          Some historical shells use the no-argument case as the functional
          equivalent of what is required here with -p.  This feature was
          left unspecified because it is not historical practice in all
          shells, and some scripts may rely on the now-unspecified results
          on their implementations. Attempts to specify the -p output as
          the default case were unsuccessful in achieving consensus.  The
          -p option was added to allow portable access to the values that
          can be saved and then later restored using; for example, a dot
          script.


---------------------------------------------------------------------------

::

          None.


---------------------------------------------------------

::

          Section 2.14, Special Built-In Utilities

          The Base Definitions volume of POSIX.1‐2017, Section 12.2,
          Utility Syntax Guidelines


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

   IEEE/The Open Group               2017                        EXPORT(1P)

--------------

Pages that refer to this page:
`readonly(1p) <../man1/readonly.1p.html>`__

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
