.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

strcoll(3p) — Linux manual page
===============================

+-----------------------------------+-----------------------------------+
| `PROLOG <#PROLOG>`__ \|           |                                   |
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `RETURN VALUE <#RETURN_VALUE>`__  |                                   |
| \| `ERRORS <#ERRORS>`__ \|        |                                   |
| `EXAMPLES <#EXAMPLES>`__ \|       |                                   |
| `APPLICAT                         |                                   |
| ION USAGE <#APPLICATION_USAGE>`__ |                                   |
| \| `RATIONALE <#RATIONALE>`__ \|  |                                   |
| `FUTURE D                         |                                   |
| IRECTIONS <#FUTURE_DIRECTIONS>`__ |                                   |
| \| `SEE ALSO <#SEE_ALSO>`__ \|    |                                   |
| `COPYRIGHT <#COPYRIGHT>`__        |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   STRCOLL(3P)             POSIX Programmer's Manual            STRCOLL(3P)


-----------------------------------------------------

::

          This manual page is part of the POSIX Programmer's Manual.  The
          Linux implementation of this interface may differ (consult the
          corresponding Linux manual page for details of Linux behavior),
          or the interface may not be implemented on Linux.

NAME
-------------------------------------------------

::

          strcoll, strcoll_l — string comparison using collating
          information


---------------------------------------------------------

::

          #include <string.h>

          int strcoll(const char *s1, const char *s2);
          int strcoll_l(const char *s1, const char *s2,
              locale_t locale);


---------------------------------------------------------------

::

          For strcoll(): The functionality described on this reference page
          is aligned with the ISO C standard. Any conflict between the
          requirements described here and the ISO C standard is
          unintentional. This volume of POSIX.1‐2017 defers to the ISO C
          standard.

          The strcoll() and strcoll_l() functions shall compare the string
          pointed to by s1 to the string pointed to by s2, both interpreted
          as appropriate to the LC_COLLATE category of the current locale,
          or of the locale represented by locale, respectively.

          The strcoll() and strcoll_l() functions shall not change the
          setting of errno if successful.

          Since no return value is reserved to indicate an error, an
          application wishing to check for error situations should set
          errno to 0, then call strcoll(), or strcoll_l() then check errno.

          The behavior is undefined if the locale argument to strcoll_l()
          is the special locale object LC_GLOBAL_LOCALE or is not a valid
          locale object handle.


-----------------------------------------------------------------

::

          Upon successful completion, strcoll() shall return an integer
          greater than, equal to, or less than 0, according to whether the
          string pointed to by s1 is greater than, equal to, or less than
          the string pointed to by s2 when both are interpreted as
          appropriate to the current locale.  On error, strcoll() may set
          errno, but no return value is reserved to indicate an error.

          Upon successful completion, strcoll_l() shall return an integer
          greater than, equal to, or less than 0, according to whether the
          string pointed to by s1 is greater than, equal to, or less than
          the string pointed to by s2 when both are interpreted as
          appropriate to the locale represented by locale.  On error,
          strcoll_l() may set errno, but no return value is reserved to
          indicate an error.


-----------------------------------------------------

::

          These functions may fail if:

          EINVAL The s1 or s2 arguments contain characters outside the
                 domain of the collating sequence.

          The following sections are informative.


---------------------------------------------------------

::

      Comparing Nodes
          The following example uses an application-defined function,
          node_compare(), to compare two nodes based on an alphabetical
          ordering of the string field.

              #include <string.h>
              ...
              struct node { /* These are stored in the table. */
                  char *string;
                  int length;
              };
              ...
              int node_compare(const void *node1, const void *node2)
              {
                  return strcoll(((const struct node *)node1)->string,
                      ((const struct node *)node2)->string);
              }
              ...


---------------------------------------------------------------------------

::

          The strxfrm() and strcmp() functions should be used for sorting
          large lists.


-----------------------------------------------------------

::

          None.


---------------------------------------------------------------------------

::

          None.


---------------------------------------------------------

::

          alphasort(3p), strcmp(3p), strxfrm(3p)

          The Base Definitions volume of POSIX.1‐2017, string.h(0p)


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

   IEEE/The Open Group               2017                       STRCOLL(3P)

--------------

Pages that refer to this page:
`string.h(0p) <../man0/string.h.0p.html>`__, 
`alphasort(3p) <../man3/alphasort.3p.html>`__, 
`localeconv(3p) <../man3/localeconv.3p.html>`__, 
`setlocale(3p) <../man3/setlocale.3p.html>`__, 
`strxfrm(3p) <../man3/strxfrm.3p.html>`__

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
