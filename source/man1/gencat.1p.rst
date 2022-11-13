.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

gencat(1p) — Linux manual page
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

   GENCAT(1P)              POSIX Programmer's Manual             GENCAT(1P)


-----------------------------------------------------

::

          This manual page is part of the POSIX Programmer's Manual.  The
          Linux implementation of this interface may differ (consult the
          corresponding Linux manual page for details of Linux behavior),
          or the interface may not be implemented on Linux.

NAME
-------------------------------------------------

::

          gencat — generate a formatted message catalog


---------------------------------------------------------

::

          gencat catfile msgfile...


---------------------------------------------------------------

::

          The gencat utility shall merge the message text source file
          msgfile into a formatted message catalog catfile.  The file
          catfile shall be created if it does not already exist. If catfile
          does exist, its messages shall be included in the new catfile.
          If set and message numbers collide, the new message text defined
          in msgfile shall replace the old message text currently contained
          in catfile.


-------------------------------------------------------

::

          None.


---------------------------------------------------------

::

          The following operands shall be supported:

          catfile   A pathname of the formatted message catalog. If '-' is
                    specified, standard output shall be used. The format of
                    the message catalog produced is unspecified.

          msgfile   A pathname of a message text source file. If '-' is
                    specified for an instance of msgfile, standard input
                    shall be used. The format of message text source files
                    is defined in the EXTENDED DESCRIPTION section.


---------------------------------------------------

::

          The standard input shall not be used unless a msgfile operand is
          specified as '-'.


---------------------------------------------------------------

::

          The input files shall be text files.


-----------------------------------------------------------------------------------

::

          The following environment variables shall affect the execution of
          gencat:

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
                    characters in arguments and input files).

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

          The standard output shall not be used unless the catfile operand
          is specified as '-'.


-----------------------------------------------------

::

          The standard error shall be used only for diagnostic messages.


-----------------------------------------------------------------

::

          None.


---------------------------------------------------------------------------------

::

          The content of a message text file shall be in the format defined
          as follows. Note that the fields of a message text source line
          are separated by a single <blank> character. Any other <blank>
          characters are considered to be part of the subsequent field.

          $set n comment
                    This line specifies the set identifier of the following
                    messages until the next $set or end-of-file appears.
                    The n denotes the set identifier, which is defined as a
                    number in the range [1, {NL_SETMAX}] (see the
                    <limits.h> header defined in the Base Definitions
                    volume of POSIX.1‐2017). The application shall ensure
                    that set identifiers are presented in ascending order
                    within a single source file, but need not be
                    contiguous. Any string following the set identifier
                    shall be treated as a comment. If no $set directive is
                    specified in a message text source file, all messages
                    shall be located in an implementation-defined default
                    message set NL_SETD (see the <nl_types.h> header
                    defined in the Base Definitions volume of
                    POSIX.1‐2017).

          $delset n comment
                    This line deletes message set n from an existing
                    message catalog. The n denotes the set number [1,
                    {NL_SETMAX}].  Any string following the set number
                    shall be treated as a comment.

          $ comment A line beginning with '$' followed by a <blank> shall
                    be treated as a comment.

          m message-text
                    The m denotes the message identifier, which is defined
                    as a number in the range [1, {NL_MSGMAX}] (see the
                    <limits.h> header). The message-text shall be stored in
                    the message catalog with the set identifier specified
                    by the last $set directive, and with message identifier
                    m.  If the message-text is empty, and a <blank> field
                    separator is present, an empty string shall be stored
                    in the message catalog. If a message source line has a
                    message number, but neither a field separator nor
                    message-text, the existing message with that number (if
                    any) shall be deleted from the catalog. The application
                    shall ensure that message identifiers are in ascending
                    order within a single set, but need not be contiguous.
                    The application shall ensure that the length of
                    message-text is in the range [0, {NL_TEXTMAX}] (see the
                    <limits.h> header).

          $quote n  This line specifies an optional quote character c,
                    which can be used to surround message-text so that
                    trailing <space> characters or null (empty) messages
                    are visible in a message source line. By default, or if
                    an empty $quote directive is supplied, no quoting of
                    message-text shall be recognized.

          Empty lines in a message text source file shall be ignored. The
          effects of lines starting with any character other than those
          defined above are implementation-defined.

          Text strings can contain the special characters and escape
          sequences defined in the following table:

                       ┌──────────────────┬────────┬──────────┐
                       │   Description    │ Symbol │ Sequence │
                       ├──────────────────┼────────┼──────────┤
                       │<newline>         │ NL(LF) │ \n       │
                       │Horizontal-tab    │ HT     │ \t       │
                       │<vertical-tab>    │ VT     │ \v       │
                       │<backspace>       │ BS     │ \b       │
                       │<carriage-return> │ CR     │ \r       │
                       │<form-feed>       │ FF     │ \f       │
                       │Backslash         │ \      │ \\       │
                       │Bit pattern       │ ddd    │ \ddd     │
                       └──────────────────┴────────┴──────────┘
          The escape sequence "\ddd" consists of <backslash> followed by
          one, two, or three octal digits, which shall be taken to specify
          the value of the desired character. If the character following a
          <backslash> is not one of those specified, the <backslash> shall
          be ignored.

          A <backslash> followed by a <newline> is also used to continue a
          string on the following line. Thus, the following two lines
          describe a single message string:

              1 This line continues \
              to the next line

          which shall be equivalent to:

              1 This line continues to the next line


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

          Message catalogs produced by gencat are binary encoded, meaning
          that their portability cannot be guaranteed between different
          types of machine. Thus, just as C programs need to be recompiled
          for each type of machine, so message catalogs must be recreated
          via gencat.


---------------------------------------------------------

::

          None.


-----------------------------------------------------------

::

          None.


---------------------------------------------------------------------------

::

          None.


---------------------------------------------------------

::

          iconv(1p)

          The Base Definitions volume of POSIX.1‐2017, Chapter 8,
          Environment Variables, limits.h(0p), nl_types.h(0p)


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

   IEEE/The Open Group               2017                        GENCAT(1P)

--------------

Pages that refer to this page:
`nl_types.h(0p) <../man0/nl_types.h.0p.html>`__, 
`iconv(1p) <../man1/iconv.1p.html>`__

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
