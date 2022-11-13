.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

chgrp(1p) — Linux manual page
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

   CHGRP(1P)               POSIX Programmer's Manual              CHGRP(1P)


-----------------------------------------------------

::

          This manual page is part of the POSIX Programmer's Manual.  The
          Linux implementation of this interface may differ (consult the
          corresponding Linux manual page for details of Linux behavior),
          or the interface may not be implemented on Linux.

NAME
-------------------------------------------------

::

          chgrp — change the file group ownership


---------------------------------------------------------

::

          chgrp [-h] group file...

          chgrp -R [-H|-L|-P] group file...


---------------------------------------------------------------

::

          The chgrp utility shall set the group ID of the file named by
          each file operand to the group ID specified by the group operand.

          For each file operand, or, if the -R option is used, each file
          encountered while walking the directory trees specified by the
          file operands, the chgrp utility shall perform actions equivalent
          to the chown() function defined in the System Interfaces volume
          of POSIX.1‐2017, called with the following arguments:

           *  The file operand shall be used as the path argument.

           *  The user ID of the file shall be used as the owner argument.

           *  The specified group ID shall be used as the group argument.

          Unless chgrp is invoked by a process with appropriate privileges,
          the set-user-ID and set-group-ID bits of a regular file shall be
          cleared upon successful completion; the set-user-ID and set-
          group-ID bits of other file types may be cleared.


-------------------------------------------------------

::

          The chgrp utility shall conform to the Base Definitions volume of
          POSIX.1‐2017, Section 12.2, Utility Syntax Guidelines.

          The following options shall be supported by the implementation:

          -h        For each file operand that names a file of type
                    symbolic link, chgrp shall attempt to set the group ID
                    of the symbolic link instead of the file referenced by
                    the symbolic link.

          -H        If the -R option is specified and a symbolic link
                    referencing a file of type directory is specified on
                    the command line, chgrp shall change the group of the
                    directory referenced by the symbolic link and all files
                    in the file hierarchy below it.

          -L        If the -R option is specified and a symbolic link
                    referencing a file of type directory is specified on
                    the command line or encountered during the traversal of
                    a file hierarchy, chgrp shall change the group of the
                    directory referenced by the symbolic link and all files
                    in the file hierarchy below it.

          -P        If the -R option is specified and a symbolic link is
                    specified on the command line or encountered during the
                    traversal of a file hierarchy, chgrp shall change the
                    group ID of the symbolic link. The chgrp utility shall
                    not follow the symbolic link to any other part of the
                    file hierarchy.

          -R        Recursively change file group IDs. For each file
                    operand that names a directory, chgrp shall change the
                    group of the directory and all files in the file
                    hierarchy below it. Unless a -H, -L, or -P option is
                    specified, it is unspecified which of these options
                    will be used as the default.

          Specifying more than one of the mutually-exclusive options -H,
          -L, and -P shall not be considered an error. The last option
          specified shall determine the behavior of the utility.


---------------------------------------------------------

::

          The following operands shall be supported:

          group     A group name from the group database or a numeric group
                    ID. Either specifies a group ID to be given to each
                    file named by one of the file operands. If a numeric
                    group operand exists in the group database as a group
                    name, the group ID number associated with that group
                    name is used as the group ID.

          file      A pathname of a file whose group ID is to be modified.


---------------------------------------------------

::

          Not used.


---------------------------------------------------------------

::

          None.


-----------------------------------------------------------------------------------

::

          The following environment variables shall affect the execution of
          chgrp:

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

           0    The utility executed successfully and all requested changes
                were made.

          >0    An error occurred.


-------------------------------------------------------------------------------------

::

          Default.

          The following sections are informative.


---------------------------------------------------------------------------

::

          Only the owner of a file or the user with appropriate privileges
          may change the owner or group of a file.

          Some implementations restrict the use of chgrp to a user with
          appropriate privileges when the group specified is not the
          effective group ID or one of the supplementary group IDs of the
          calling process.


---------------------------------------------------------

::

          None.


-----------------------------------------------------------

::

          The System V and BSD versions use different exit status codes.
          Some implementations used the exit status as a count of the
          number of errors that occurred; this practice is unworkable since
          it can overflow the range of valid exit status values. The
          standard developers chose to mask these by specifying only 0 and
          >0 as exit values.

          The functionality of chgrp is described substantially through
          references to chown().  In this way, there is no duplication of
          effort required for describing the interactions of permissions,
          multiple groups, and so on.


---------------------------------------------------------------------------

::

          None.


---------------------------------------------------------

::

          chmod(1p), chown(1p)

          The Base Definitions volume of POSIX.1‐2017, Chapter 8,
          Environment Variables, Section 12.2, Utility Syntax Guidelines

          The System Interfaces volume of POSIX.1‐2017, chown(3p)


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

   IEEE/The Open Group               2017                         CHGRP(1P)

--------------

Pages that refer to this page: `chown(1p) <../man1/chown.1p.html>`__

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
