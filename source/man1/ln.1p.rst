.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

ln(1p) — Linux manual page
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

   LN(1P)                  POSIX Programmer's Manual                 LN(1P)


-----------------------------------------------------

::

          This manual page is part of the POSIX Programmer's Manual.  The
          Linux implementation of this interface may differ (consult the
          corresponding Linux manual page for details of Linux behavior),
          or the interface may not be implemented on Linux.

NAME
-------------------------------------------------

::

          ln — link files


---------------------------------------------------------

::

          ln [-fs] [-L|-P] source_file target_file

          ln [-fs] [-L|-P] source_file... target_dir


---------------------------------------------------------------

::

          In the first synopsis form, the ln utility shall create a new
          directory entry (link) at the destination path specified by the
          target_file operand. If the -s option is specified, a symbolic
          link shall be created for the file specified by the source_file
          operand. This first synopsis form shall be assumed when the final
          operand does not name an existing directory; if more than two
          operands are specified and the final is not an existing
          directory, an error shall result.

          In the second synopsis form, the ln utility shall create a new
          directory entry (link), or if the -s option is specified a
          symbolic link, for each file specified by a source_file operand,
          at a destination path in the existing directory named by
          target_dir.

          If the last operand specifies an existing file of a type not
          specified by the System Interfaces volume of POSIX.1‐2017, the
          behavior is implementation-defined.

          The corresponding destination path for each source_file shall be
          the concatenation of the target directory pathname, a <slash>
          character if the target directory pathname did not end in a
          <slash>, and the last pathname component of the source_file.  The
          second synopsis form shall be assumed when the final operand
          names an existing directory.

          For each source_file:

           1. If the destination path exists and was created by a previous
              step, it is unspecified whether ln shall write a diagnostic
              message to standard error, do nothing more with the current
              source_file, and go on to any remaining source_files; or will
              continue processing the current source_file.  If the
              destination path exists:

               a. If the -f option is not specified, ln shall write a
                  diagnostic message to standard error, do nothing more
                  with the current source_file, and go on to any remaining
                  source_files.

               b. If the destination path names the same directory entry as
                  the current source_file ln shall write a diagnostic
                  message to standard error, do nothing more with the
                  current source_file, and go on to any remaining
                  source_files.

               c. Actions shall be performed equivalent to the unlink()
                  function defined in the System Interfaces volume of
                  POSIX.1‐2017, called using the destination path as the
                  path argument. If this fails for any reason, ln shall
                  write a diagnostic message to standard error, do nothing
                  more with the current source_file, and go on to any
                  remaining source_files.

           2. If the -s option is specified, actions shall be performed
              equivalent to the symlink() function with source_file as the
              path1 argument and the destination path as the path2
              argument. The ln utility shall do nothing more with
              source_file and shall go on to any remaining files.

           3. If source_file is a symbolic link:

               a. If the -P option is in effect, actions shall be performed
                  equivalent to the linkat() function with source_file as
                  the path1 argument, the destination path as the path2
                  argument, AT_FDCWD as the fd1 and fd2 arguments, and zero
                  as the flag argument.

               b. If the -L option is in effect, actions shall be performed
                  equivalent to the linkat() function with source_file as
                  the path1 argument, the destination path as the path2
                  argument, AT_FDCWD as the fd1 and fd2 arguments, and
                  AT_SYMLINK_FOLLOW as the flag argument.

              The ln utility shall do nothing more with source_file and
              shall go on to any remaining files.

           4. Actions shall be performed equivalent to the link() function
              defined in the System Interfaces volume of POSIX.1‐2017 using
              source_file as the path1 argument, and the destination path
              as the path2 argument.


-------------------------------------------------------

::

          The ln utility shall conform to the Base Definitions volume of
          POSIX.1‐2017, Section 12.2, Utility Syntax Guidelines.

          The following options shall be supported:

          -f        Force existing destination pathnames to be removed to
                    allow the link.

          -L        For each source_file operand that names a file of type
                    symbolic link, create a (hard) link to the file
                    referenced by the symbolic link.

          -P        For each source_file operand that names a file of type
                    symbolic link, create a (hard) link to the symbolic
                    link itself.

          -s        Create symbolic links instead of hard links. If the -s
                    option is specified, the -L and -P options shall be
                    silently ignored.

          Specifying more than one of the mutually-exclusive options -L and
          -P shall not be considered an error. The last option specified
          shall determine the behavior of the utility (unless the -s option
          causes it to be ignored).

          If the -s option is not specified and neither a -L nor a -P
          option is specified, it is implementation-defined which of the -L
          and -P options will be used as the default.


---------------------------------------------------------

::

          The following operands shall be supported:

          source_file
                    A pathname of a file to be linked. If the -s option is
                    specified, no restrictions on the type of file or on
                    its existence shall be made. If the -s option is not
                    specified, whether a directory can be linked is
                    implementation-defined.

          target_file
                    The pathname of the new directory entry to be created.

          target_dir
                    A pathname of an existing directory in which the new
                    directory entries are created.


---------------------------------------------------

::

          Not used.


---------------------------------------------------------------

::

          None.


-----------------------------------------------------------------------------------

::

          The following environment variables shall affect the execution of
          ln:

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

           0    All the specified files were linked successfully.

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

          None.


-----------------------------------------------------------

::

          The CONSEQUENCES OF ERRORS section does not require ln -f a b to
          remove b if a subsequent link operation would fail.

          Some historic versions of ln (including the one specified by the
          SVID) unlink the destination file, if it exists, by default. If
          the mode does not permit writing, these versions prompt for
          confirmation before attempting the unlink. In these versions the
          -f option causes ln not to attempt to prompt for confirmation.

          This allows ln to succeed in creating links when the target file
          already exists, even if the file itself is not writable (although
          the directory must be).  Early proposals specified this
          functionality.

          This volume of POSIX.1‐2017 does not allow the ln utility to
          unlink existing destination paths by default for the following
          reasons:

           *  The ln utility has historically been used to provide locking
              for shell applications, a usage that is incompatible with ln
              unlinking the destination path by default. There was no
              corresponding technical advantage to adding this
              functionality.

           *  This functionality gave ln the ability to destroy the link
              structure of files, which changes the historical behavior of
              ln.

           *  This functionality is easily replicated with a combination of
              rm and ln.

           *  It is not historical practice in many systems; BSD and BSD-
              derived systems do not support this behavior. Unfortunately,
              whichever behavior is selected can cause scripts written
              expecting the other behavior to fail.

           *  It is preferable that ln perform in the same manner as the
              link() function, which does not permit the target to exist
              already.

          This volume of POSIX.1‐2017 retains the -f option to provide
          support for shell scripts depending on the SVID semantics. It
          seems likely that shell scripts would not be written to handle
          prompting by ln and would therefore have specified the -f option.

          The -f option is an undocumented feature of many historical
          versions of the ln utility, allowing linking to directories.
          These versions require modification.

          Early proposals of this volume of POSIX.1‐2017 also required a -i
          option, which behaved like the -i options in cp and mv, prompting
          for confirmation before unlinking existing files. This was not
          historical practice for the ln utility and has been omitted.

          The -L and -P options allow for implementing both common
          behaviors of the ln utility. Earlier versions of this standard
          did not specify these options and required the behavior now
          described for the -L option. Many systems by default or as an
          alternative provided a non-conforming ln utility with the
          behavior now described for the -P option. Since applications
          could not rely on ln following links in practice, the -L and -P
          options were added to specify the desired behavior for the
          application.

          The -L and -P options are ignored when -s is specified in order
          to allow an alias to be created to alter the default behavior
          when creating hard links (for example, alias ln='ln -L').  They
          serve no purpose when -s is specified, since source_file is then
          just a string to be used as the contents of the created symbolic
          link and need not exist as a file.

          The specification ensures that ln a a with or without the -f
          option will not unlink the file a.  Earlier versions of this
          standard were unclear in this case.


---------------------------------------------------------------------------

::

          None.


---------------------------------------------------------

::

          chmod(1p), find(1p), pax(1p), rm(1p)

          The Base Definitions volume of POSIX.1‐2017, Chapter 8,
          Environment Variables, Section 12.2, Utility Syntax Guidelines

          The System Interfaces volume of POSIX.1‐2017, link(3p),
          unlink(3p)


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

   IEEE/The Open Group               2017                            LN(1P)

--------------

Pages that refer to this page: `cp(1p) <../man1/cp.1p.html>`__, 
`link(1p) <../man1/link.1p.html>`__,  `mv(1p) <../man1/mv.1p.html>`__

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
