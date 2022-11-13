.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

man(1p) — Linux manual page
===========================

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

   MAN(1P)                 POSIX Programmer's Manual                MAN(1P)


-----------------------------------------------------

::

          This manual page is part of the POSIX Programmer's Manual.  The
          Linux implementation of this interface may differ (consult the
          corresponding Linux manual page for details of Linux behavior),
          or the interface may not be implemented on Linux.

NAME
-------------------------------------------------

::

          man — display system documentation


---------------------------------------------------------

::

          man [-k] name...


---------------------------------------------------------------

::

          The man utility shall write information about each of the name
          operands. If name is the name of a standard utility, man at a
          minimum shall write a message describing the syntax used by the
          standard utility, its options, and operands. If more information
          is available, the man utility shall provide it in an
          implementation-defined manner.

          An implementation may provide information for values of name
          other than the standard utilities. Standard utilities that are
          listed as optional and that are not supported by the
          implementation either shall cause a brief message indicating that
          fact to be displayed or shall cause a full display of information
          as described previously.


-------------------------------------------------------

::

          The man utility shall conform to the Base Definitions volume of
          POSIX.1‐2017, Section 12.2, Utility Syntax Guidelines.

          The following option shall be supported:

          -k      Interpret name operands as keywords to be used in
                  searching a utilities summary database that contains a
                  brief purpose entry for each standard utility and write
                  lines from the summary database that match any of the
                  keywords. The keyword search shall produce results that
                  are the equivalent of the output of the following
                  command:

                      grep -Ei '
                      name
                      name
                      ...
                      ' summary-database

                  This assumes that the summary-database is a text file
                  with a single entry per line; this organization is not
                  required and the example using grep -Ei is merely
                  illustrative of the type of search intended. The purpose
                  entry to be included in the database shall consist of a
                  terse description of the purpose of the utility.


---------------------------------------------------------

::

          The following operand shall be supported:

          name      A keyword or the name of a standard utility. When -k is
                    not specified and name does not represent one of the
                    standard utilities, the results are unspecified.


---------------------------------------------------

::

          Not used.


---------------------------------------------------------------

::

          None.


-----------------------------------------------------------------------------------

::

          The following environment variables shall affect the execution of
          man:

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
                    characters in arguments and in the summary database).
                    The value of LC_CTYPE need not affect the format of the
                    information written about the name operands.

          LC_MESSAGES
                    Determine the locale that should be used to affect the
                    format and contents of diagnostic messages written to
                    standard error and informative messages written to
                    standard output.

          NLSPATH   Determine the location of message catalogs for the
                    processing of LC_MESSAGES.

          PAGER     Determine an output filtering command for writing the
                    output to a terminal. Any string acceptable as a
                    command_string operand to the sh -c command shall be
                    valid. When standard output is a terminal device, the
                    reference page output shall be piped through the
                    command. If the PAGER variable is null or not set, the
                    command shall be either more or another paginator
                    utility documented in the system documentation.


-------------------------------------------------------------------------------

::

          Default.


-----------------------------------------------------

::

          The man utility shall write text describing the syntax of the
          utility name, its options and its operands, or, when -k is
          specified, lines from the summary database. The format of this
          text is implementation-defined.


-----------------------------------------------------

::

          The standard error shall be used for diagnostic messages, and may
          also be used for informational messages of unspecified format.


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

          None.


-----------------------------------------------------------

::

          It is recognized that the man utility is only of minimal
          usefulness as specified. The opinion of the standard developers
          was strongly divided as to how much or how little information man
          should be required to provide. They considered, however, that the
          provision of some portable way of accessing documentation would
          aid user portability. The arguments against a fuller
          specification were:

           *  Large quantities of documentation should not be required on a
              system that does not have excess disk space.

           *  The current manual system does not present information in a
              manner that greatly aids user portability.

           *  A ``better help system'' is currently an area in which
              vendors feel that they can add value to their POSIX
              implementations.

          The -f option was considered, but due to implementation
          differences, it was not included in this volume of POSIX.1‐2017.

          The description was changed to be more specific about what has to
          be displayed for a utility. The standard developers considered it
          insufficient to allow a display of only the synopsis without
          giving a short description of what each option and operand does.

          The ``purpose'' entry to be included in the database can be
          similar to the section title (less the numeric prefix) from this
          volume of POSIX.1‐2017 for each utility.  These titles are
          similar to those used in historical systems for this purpose.

          See mailx for rationale concerning the default paginator.

          The caveat in the LC_CTYPE description was added because it is
          not a requirement that an implementation provide reference pages
          for all of its supported locales on each system; changing
          LC_CTYPE does not necessarily translate the reference page into
          another language. This is equivalent to the current state of
          LC_MESSAGES in POSIX.1‐2008—locale-specific messages are not yet
          a requirement.

          The historical MANPATH variable is not included in POSIX because
          no attempt is made to specify naming conventions for reference
          page files, nor even to mandate that they are files at all. On
          some implementations they could be a true database, a hypertext
          file, or even fixed strings within the man executable. The
          standard developers considered the portability of reference pages
          to be outside their scope of work. However, users should be aware
          that MANPATH is implemented on a number of historical systems and
          that it can be used to tailor the search pattern for reference
          pages from the various categories (utilities, functions, file
          formats, and so on) when the system administrator reveals the
          location and conventions for reference pages on the system.

          The keyword search can rely on at least the text of the section
          titles from these utility descriptions, and the implementation
          may add more keywords. The term ``section titles'' refers to the
          strings such as:

              man — Display system documentation
              ps — Report process status


---------------------------------------------------------------------------

::

          None.


---------------------------------------------------------

::

          more(1p)

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

   IEEE/The Open Group               2017                           MAN(1P)

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
