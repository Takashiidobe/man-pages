.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

strxfrm(3p) — Linux manual page
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

   STRXFRM(3P)             POSIX Programmer's Manual            STRXFRM(3P)


-----------------------------------------------------

::

          This manual page is part of the POSIX Programmer's Manual.  The
          Linux implementation of this interface may differ (consult the
          corresponding Linux manual page for details of Linux behavior),
          or the interface may not be implemented on Linux.

NAME
-------------------------------------------------

::

          strxfrm, strxfrm_l — string transformation


---------------------------------------------------------

::

          #include <string.h>

          size_t strxfrm(char *restrict s1, const char *restrict s2, size_t n);
          size_t strxfrm_l(char *restrict s1, const char *restrict s2,
              size_t n, locale_t locale);


---------------------------------------------------------------

::

          For strxfrm(): The functionality described on this reference page
          is aligned with the ISO C standard. Any conflict between the
          requirements described here and the ISO C standard is
          unintentional. This volume of POSIX.1‐2017 defers to the ISO C
          standard.

          The strxfrm() and strxfrm_l() functions shall transform the
          string pointed to by s2 and place the resulting string into the
          array pointed to by s1.  The transformation is such that if
          strcmp() is applied to two transformed strings, it shall return a
          value greater than, equal to, or less than 0, corresponding to
          the result of strcoll() or strcoll_l(), respectively, applied to
          the same two original strings with the same locale.  No more than
          n bytes are placed into the resulting array pointed to by s1,
          including the terminating NUL character. If n is 0, s1 is
          permitted to be a null pointer. If copying takes place between
          objects that overlap, the behavior is undefined.

          The strxfrm() and strxfrm_l() functions shall not change the
          setting of errno if successful.

          Since no return value is reserved to indicate an error, an
          application wishing to check for error situations should set
          errno to 0, then call strxfrm() or strxfrm_l(), then check errno.

          The behavior is undefined if the locale argument to strxfrm_l()
          is the special locale object LC_GLOBAL_LOCALE or is not a valid
          locale object handle.


-----------------------------------------------------------------

::

          Upon successful completion, strxfrm() and strxfrm_l() shall
          return the length of the transformed string (not including the
          terminating NUL character). If the value returned is n or more,
          the contents of the array pointed to by s1 are unspecified.

          On error, strxfrm() and strxfrm_l() may set errno but no return
          value is reserved to indicate an error.


-----------------------------------------------------

::

          These functions may fail if:

          EINVAL The string pointed to by the s2 argument contains
                 characters outside the domain of the collating sequence.

          The following sections are informative.


---------------------------------------------------------

::

          None.


---------------------------------------------------------------------------

::

          The transformation function is such that two transformed strings
          can be ordered by strcmp() as appropriate to collating sequence
          information in the current locale (category LC_COLLATE).

          The fact that when n is 0 s1 is permitted to be a null pointer is
          useful to determine the size of the s1 array prior to making the
          transformation.


-----------------------------------------------------------

::

          None.


---------------------------------------------------------------------------

::

          None.


---------------------------------------------------------

::

          strcmp(3p), strcoll(3p)

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

   IEEE/The Open Group               2017                       STRXFRM(3P)

--------------

Pages that refer to this page:
`string.h(0p) <../man0/string.h.0p.html>`__, 
`localeconv(3p) <../man3/localeconv.3p.html>`__, 
`setlocale(3p) <../man3/setlocale.3p.html>`__, 
`strcoll(3p) <../man3/strcoll.3p.html>`__

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
