.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

ausearch-expression(5) — Linux manual page
==========================================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `OVERVIEW <#OVERVIEW>`__ \|       |                                   |
| `LEXICAL                          |                                   |
| STRUCTURE <#LEXICAL_STRUCTURE>`__ |                                   |
| \|                                |                                   |
| `EXPRESSI                         |                                   |
| ON SYNTAX <#EXPRESSION_SYNTAX>`__ |                                   |
| \|                                |                                   |
| `VI                               |                                   |
| RTUAL FIELDS <#VIRTUAL_FIELDS>`__ |                                   |
| \| `SEMANTICS <#SEMANTICS>`__ \|  |                                   |
| `EXAMPLES <#EXAMPLES>`__ \|       |                                   |
| `FUTURE D                         |                                   |
| IRECTIONS <#FUTURE_DIRECTIONS>`__ |                                   |
| \| `AUTHOR <#AUTHOR>`__ \|        |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   AUSEARCH-EXPRESSION(5)         Linux Audit        AUSEARCH-EXPRESSION(5)

NAME
-------------------------------------------------

::

          ausearch-expression - audit search expression format


---------------------------------------------------------

::

          This man page describes the format of "ausearch expressions".
          Parsing and evaluation of these expressions is provided by
          libauparse and is common to applications that use this library.


---------------------------------------------------------------------------

::

          White space (ASCII space, tab and new-line characters) between
          tokens is ignored.  The following tokens are recognized:

          Punctuation
                 ( ) \

          Logical operators
                 ! && ||

          Comparison operators
                 < <= == > >= !== i= i!= r= r!=

          Unquoted strings
                 Any non-empty sequence of ASCII letters, digits, and the _
                 symbol.

          Quoted strings
                 A sequence of characters surrounded by the " quotes.  The
                 \ character starts an escape sequence.  The only defined
                 escape sequences are \\ and \".  The semantics of other
                 escape sequences is undefined.

          Regexps
                 A sequence of characters surrounded by the / characters.
                 The \ character starts an escape sequence.  The only
                 defined escape sequences are \\ and \/.  The semantics of
                 other escape sequences is undefined.

          Anywhere an unquoted string is valid, a quoted string is valid as
          well, and vice versa.  In particular, field names may be
          specified using quoted strings, and field values may be specified
          using unquoted strings.


---------------------------------------------------------------------------

::

          The primary expression has one of the following forms:

                 field comparison-operator value

                 \regexp string-or-regexp

          field is either a string, which specifies the first field with
          that name within the current audit record, or the \ escape
          character followed by a string, which specifies a virtual field
          with the specified name (virtual fields are defined in a later
          section).

          field is a string.  operator specifies the comparison to perform

          r= r!= Get the "raw" string of field, and compare it to value.
                 For fields in audit records, the "raw" string is the exact
                 string stored in the audit record (with all escaping and
                 unprintable character encoding left alone); applications
                 can read the "raw" string using auparse_get_field_str(3).
                 Each virtual field may define a "raw" string.  If field is
                 not present or does not define a "raw" string, the result
                 of the comparison is false (regardless of the operator).

          i= i!= Get the "interpreted" string of field, and compare it to
                 value.  For fields in audit records, the "interpreted"
                 string is an "user-readable" interpretation of the field
                 value; applications can read the "interpreted" string
                 using auparse_interpret_field(3).  Each virtual field may
                 define an "interpreted" string.  If field is not present
                 or does not define an "interpreted" string, the result of
                 the comparison is false (regardless of the operator).

          < <= == > >= !==
                 Evaluate the "value" of field, and compare it to value.  A
                 "value" may be defined for any field or virtual field, but
                 no "value" is currently defined for any audit record
                 field.  The rules of parsing value for comparing it with
                 the "value" of field are specific for each field.  If
                 field is not present, the result of the comparison is
                 false (regardless of the operator).  If field does not
                 define a "value", an error is reported when parsing the
                 expression.

          In the special case of \regexp regexp-or-string, the current
          audit record is taken as a string (without interpreting field
          values), and matched against regexp-or-string.  regexp-or-string
          is an extended regular expression, using a string or regexp token
          (in other words, delimited by " or /).

          If E1 and E2 are valid expressions, then !  E1, E1 && E2, and E1
          || E2 are valid expressions as well, with the usual C semantics
          and evaluation priorities.  Note that !  field op value is
          interpreted as !(field op value), not as (!field) op value.


---------------------------------------------------------------------

::

          The following virtual fields are defined:

          \timestamp
                 The value is the timestamp of the current event.  value
                 must be formatted as:

                      ts:seconds.milli

                 where seconds and milli are decimal numbers specifying the
                 seconds and milliseconds part of the timestamp,
                 respectively.

          \timestamp_ex
                 This is similar to \timestamp but also includes the
                 event's serial number.  value must be formatted as:

                      ts:seconds.milli:serial

                 where serial is a decimal number specifying the event's
                 serial number.

          \record_type
                 The value is the type of the current record.  value is
                 either the record type name, or a decimal number
                 specifying the type.


-----------------------------------------------------------

::

          The expression as a whole applies to a single record.  The
          expression is true for a specified event if it is true for any
          record associated with the event.


---------------------------------------------------------

::

          As a demonstration of the semantics of handling missing fields,
          the following expression is true if field is present:

                 (field r= "") || (field r!= "")

          and the same expression surrounded by !( and ) is true if field
          is not present.


---------------------------------------------------------------------------

::

          New escape sequences for quoted strings may be defined.

          For currently defined virtual fields that do not define a "raw"
          or "interpreted" string, the definition may be added.  Therefore,
          don't rely on the fact that comparing the "raw" or "interpreted"
          string of the field with any value is false.

          New formats of value constants for the \timestamp virtual field
          may be added.


-----------------------------------------------------

::

          Miloslav Trmac

COLOPHON
---------------------------------------------------------

::

          This page is part of the audit (Linux Audit) project.
          Information about the project can be found at 
          ⟨http://people.redhat.com/sgrubb/audit/⟩.  If you have a bug
          report for this manual page, send it to linux-audit@redhat.com.
          This page was obtained from the project's upstream Git repository
          ⟨https://github.com/linux-audit/audit-userspace.git⟩ on
          2021-08-27.  (At that time, the date of the most recent commit
          that was found in the repository was 2021-08-21.)  If you
          discover any rendering problems in this HTML version of the page,
          or you believe there is a better or more up-to-date source for
          the page, or you have corrections or improvements to the
          information in this COLOPHON (which is not part of the original
          manual page), send a mail to man-pages@man7.org

   Red Hat                         Feb 2008          AUSEARCH-EXPRESSION(5)

--------------

Pages that refer to this page:
`ausearch_add_expression(3) <../man3/ausearch_add_expression.3.html>`__, 
`ausearch_add_interpreted_item(3) <../man3/ausearch_add_interpreted_item.3.html>`__, 
`ausearch_add_item(3) <../man3/ausearch_add_item.3.html>`__, 
`ausearch_add_timestamp_item(3) <../man3/ausearch_add_timestamp_item.3.html>`__, 
`ausearch_add_timestamp_item_ex(3) <../man3/ausearch_add_timestamp_item_ex.3.html>`__

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
