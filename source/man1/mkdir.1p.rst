.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

mkdir(1p) — Linux manual page
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

   MKDIR(1P)               POSIX Programmer's Manual              MKDIR(1P)


-----------------------------------------------------

::

          This manual page is part of the POSIX Programmer's Manual.  The
          Linux implementation of this interface may differ (consult the
          corresponding Linux manual page for details of Linux behavior),
          or the interface may not be implemented on Linux.

NAME
-------------------------------------------------

::

          mkdir — make directories


---------------------------------------------------------

::

          mkdir [-p] [-m mode] dir...


---------------------------------------------------------------

::

          The mkdir utility shall create the directories specified by the
          operands, in the order specified.

          For each dir operand, the mkdir utility shall perform actions
          equivalent to the mkdir() function defined in the System
          Interfaces volume of POSIX.1‐2017, called with the following
          arguments:

           1. The dir operand is used as the path argument.

           2. The value of the bitwise-inclusive OR of S_IRWXU, S_IRWXG,
              and S_IRWXO is used as the mode argument. (If the -m option
              is specified, the value of the mkdir() mode argument is
              unspecified, but the directory shall at no time have
              permissions less restrictive than the -m mode option-
              argument.)


-------------------------------------------------------

::

          The mkdir utility shall conform to the Base Definitions volume of
          POSIX.1‐2017, Section 12.2, Utility Syntax Guidelines.

          The following options shall be supported:

          -m mode   Set the file permission bits of the newly-created
                    directory to the specified mode value. The mode option-
                    argument shall be the same as the mode operand defined
                    for the chmod utility. In the symbolic_mode strings,
                    the op characters '+' and '-' shall be interpreted
                    relative to an assumed initial mode of a=rwx; '+' shall
                    add permissions to the default mode, '-' shall delete
                    permissions from the default mode.

          -p        Create any missing intermediate pathname components.

                    For each dir operand that does not name an existing
                    directory, before performing the actions described in
                    the DESCRIPTION above, the mkdir utility shall create
                    any pathname components of the path prefix of dir that
                    do not name an existing directory by performing actions
                    equivalent to first calling the mkdir() function with
                    the following arguments:

                     1. A pathname naming the missing pathname component,
                        ending with a trailing <slash> character, as the
                        path argument

                     2. The value zero as the mode argument

                    and then calling the chmod() function with the
                    following arguments:

                     1. The same path argument as in the mkdir() call

                     2. The value (S_IWUSR|S_IXUSR|~filemask)&0777 as the
                        mode argument, where filemask is the file mode
                        creation mask of the process (see the System
                        Interfaces volume of POSIX.1‐2017, umask(3p))

                    Each dir operand that names an existing directory shall
                    be ignored without error.


---------------------------------------------------------

::

          The following operand shall be supported:

          dir       A pathname of a directory to be created.


---------------------------------------------------

::

          Not used.


---------------------------------------------------------------

::

          None.


-----------------------------------------------------------------------------------

::

          The following environment variables shall affect the execution of
          mkdir:

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

           0    All the specified directories were created successfully, or
                the -p option was specified and all the specified
                directories either already existed or were created
                successfully.

          >0    An error occurred.


-------------------------------------------------------------------------------------

::

          Default.

          The following sections are informative.


---------------------------------------------------------------------------

::

          The default file mode for directories is a=rwx (777 on most
          systems) with selected permissions removed in accordance with the
          file mode creation mask. For intermediate pathname components
          created by mkdir, the mode is the default modified by u+wx so
          that the subdirectories can always be created regardless of the
          file mode creation mask; if different ultimate permissions are
          desired for the intermediate directories, they can be changed
          afterwards with chmod.

          Note that some of the requested directories may have been created
          even if an error occurs.


---------------------------------------------------------

::

          None.


-----------------------------------------------------------

::

          The System V -m option was included to control the file mode.

          The System V -p option was included to create any needed
          intermediate directories and to complement the functionality
          provided by rmdir for removing directories in the path prefix as
          they become empty.  Because no error is produced if any path
          component already exists, the -p option is also useful to ensure
          that a particular directory exists.

          The functionality of mkdir is described substantially through a
          reference to the mkdir() function in the System Interfaces volume
          of POSIX.1‐2017. For example, by default, the mode of the
          directory is affected by the file mode creation mask in
          accordance with the specified behavior of the mkdir() function.
          In this way, there is less duplication of effort required for
          describing details of the directory creation.


---------------------------------------------------------------------------

::

          None.


---------------------------------------------------------

::

          chmod(1p), rm(1p), rmdir(1p), umask(1p)

          The Base Definitions volume of POSIX.1‐2017, Chapter 8,
          Environment Variables, Section 12.2, Utility Syntax Guidelines

          The System Interfaces volume of POSIX.1‐2017, mkdir(3p),
          umask(3p)


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

   IEEE/The Open Group               2017                         MKDIR(1P)

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
