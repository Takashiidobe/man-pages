.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

df(1p) — Linux manual page
==========================

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

   DF(1P)                  POSIX Programmer's Manual                 DF(1P)


-----------------------------------------------------

::

          This manual page is part of the POSIX Programmer's Manual.  The
          Linux implementation of this interface may differ (consult the
          corresponding Linux manual page for details of Linux behavior),
          or the interface may not be implemented on Linux.

NAME
-------------------------------------------------

::

          df — report free disk space


---------------------------------------------------------

::

          df [-k] [-P|-t] [file...]


---------------------------------------------------------------

::

          The df utility shall write the amount of available space and file
          slots for file systems on which the invoking user has appropriate
          read access. File systems shall be specified by the file
          operands; when none are specified, information shall be written
          for all file systems. The format of the default output from df is
          unspecified, but all space figures are reported in 512-byte
          units, unless the -k option is specified. This output shall
          contain at least the file system names, amount of available space
          on each of these file systems, and, if no options other than -t
          are specified, the number of free file slots, or inodes,
          available; when -t is specified, the output shall contain the
          total allocated space as well.


-------------------------------------------------------

::

          The df utility shall conform to the Base Definitions volume of
          POSIX.1‐2017, Section 12.2, Utility Syntax Guidelines.

          The following options shall be supported:

          -k        Use 1024-byte units, instead of the default 512-byte
                    units, when writing space figures.

          -P        Produce output in the format described in the STDOUT
                    section.

          -t        Include total allocated-space figures in the output.


---------------------------------------------------------

::

          The following operand shall be supported:

          file      A pathname of a file within the hierarchy of the
                    desired file system.  If a file other than a FIFO, a
                    regular file, a directory, or a special file
                    representing the device containing the file system (for
                    example, /dev/dsk/0s1) is specified, the results are
                    unspecified. If the file operand names a file other
                    than a special file containing a file system, df shall
                    write the amount of free space in the file system
                    containing the specified file operand.  Otherwise, df
                    shall write the amount of free space in that file
                    system.


---------------------------------------------------

::

          Not used.


---------------------------------------------------------------

::

          None.


-----------------------------------------------------------------------------------

::

          The following environment variables shall affect the execution of
          df:

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
                    standard error and informative messages written to
                    standard output.

          NLSPATH   Determine the location of message catalogs for the
                    processing of LC_MESSAGES.


-------------------------------------------------------------------------------

::

          Default.


-----------------------------------------------------

::

          When both the -k and -P options are specified, the following
          header line shall be written (in the POSIX locale):

              "Filesystem 1024-blocks Used Available Capacity Mounted on\n"

          When the -P option is specified without the -k option, the
          following header line shall be written (in the POSIX locale):

              "Filesystem 512-blocks Used Available Capacity Mounted on\n"

          The implementation may adjust the spacing of the header line and
          the individual data lines so that the information is presented in
          orderly columns.

          The remaining output with -P shall consist of one line of
          information for each specified file system. These lines shall be
          formatted as follows:

              "%s %d %d %d %d%% %s\n", <file system name>, <total space>,
                  <space used>, <space free>, <percentage used>,
                  <file system root>

          In the following list, all quantities expressed in 512-byte units
          (1024-byte when -k is specified) shall be rounded up to the next
          higher unit. The fields are:

          <file system name>
                    The name of the file system, in an implementation-
                    defined format.

          <total space>
                    The total size of the file system in 512-byte units.
                    The exact meaning of this figure is implementation-
                    defined, but should include <space used>, <space free>,
                    plus any space reserved by the system not normally
                    available to a user.

          <space used>
                    The total amount of space allocated to existing files
                    in the file system, in 512-byte units.

          <space free>
                    The total amount of space available within the file
                    system for the creation of new files by unprivileged
                    users, in 512-byte units. When this figure is less than
                    or equal to zero, it shall not be possible to create
                    any new files on the file system without first deleting
                    others, unless the process has appropriate privileges.
                    The figure written may be less than zero.

          <percentage used>
                    The percentage of the normally available space that is
                    currently allocated to all files on the file system.
                    This shall be calculated using the fraction:

                        <space used>/( <space used>+ <space free>)

                    expressed as a percentage. This percentage may be
                    greater than 100 if <space free> is less than zero. The
                    percentage value shall be expressed as a positive
                    integer, with any fractional result causing it to be
                    rounded to the next highest integer.

          <file system root>
                    The directory below which the file system hierarchy
                    appears.

          The output format is unspecified when -t is used.


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

          On most systems, the ``name of the file system, in an
          implementation-defined format'' is the special file on which the
          file system is mounted.

          On large file systems, the calculation specified for percentage
          used can create huge rounding errors.


---------------------------------------------------------

::

           1. The following example writes portable information about the
              /usr file system:

                  df -P /usr

           2. Assuming that /usr/src is part of the /usr file system, the
              following produces the same output as the previous example:

                  df -P /usr/src


-----------------------------------------------------------

::

          The behavior of df with the -P option is the default action of
          the 4.2 BSD df utility. The uppercase -P was selected to avoid
          collision with a known industry extension using -p.

          Historical df implementations vary considerably in their default
          output. It was therefore necessary to describe the default output
          in a loose manner to accommodate all known historical
          implementations and to add a portable option (-P) to provide
          information in a portable format.

          The use of 512-byte units is historical practice and maintains
          compatibility with ls and other utilities in this volume of
          POSIX.1‐2017. This does not mandate that the file system itself
          be based on 512-byte blocks. The -k option was added as a
          compromise measure. It was agreed by the standard developers that
          512 bytes was the best default unit because of its complete
          historical consistency on System V (versus the mixed
          512/1024-byte usage on BSD systems), and that a -k option to
          switch to 1024-byte units was a good compromise. Users who prefer
          the more logical 1024-byte quantity can easily alias df to df -k
          without breaking many historical scripts relying on the 512-byte
          units.

          It was suggested that df and the various related utilities be
          modified to access a BLOCKSIZE environment variable to achieve
          consistency and user acceptance. Since this is not historical
          practice on any system, it is left as a possible area for system
          extensions and will be re-evaluated in a future version if it is
          widely implemented.


---------------------------------------------------------------------------

::

          None.


---------------------------------------------------------

::

          find(1p)

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

   IEEE/The Open Group               2017                            DF(1P)

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
