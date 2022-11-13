.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

mbstowcs(3p) — Linux manual page
================================

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

   MBSTOWCS(3P)            POSIX Programmer's Manual           MBSTOWCS(3P)


-----------------------------------------------------

::

          This manual page is part of the POSIX Programmer's Manual.  The
          Linux implementation of this interface may differ (consult the
          corresponding Linux manual page for details of Linux behavior),
          or the interface may not be implemented on Linux.

NAME
-------------------------------------------------

::

          mbstowcs — convert a character string to a wide-character string


---------------------------------------------------------

::

          #include <stdlib.h>

          size_t mbstowcs(wchar_t *restrict pwcs, const char *restrict s,
              size_t n);


---------------------------------------------------------------

::

          The functionality described on this reference page is aligned
          with the ISO C standard. Any conflict between the requirements
          described here and the ISO C standard is unintentional. This
          volume of POSIX.1‐2017 defers to the ISO C standard.

          The mbstowcs() function shall convert a sequence of characters
          that begins in the initial shift state from the array pointed to
          by s into a sequence of corresponding wide-character codes and
          shall store not more than n wide-character codes into the array
          pointed to by pwcs.  No characters that follow a null byte (which
          is converted into a wide-character code with value 0) shall be
          examined or converted. Each character shall be converted as if by
          a call to mbtowc(), except that the shift state of mbtowc() is
          not affected.

          No more than n elements shall be modified in the array pointed to
          by pwcs.  If copying takes place between objects that overlap,
          the behavior is undefined.

          The behavior of this function shall be affected by the LC_CTYPE
          category of the current locale.  If pwcs is a null pointer,
          mbstowcs() shall return the length required to convert the entire
          array regardless of the value of n, but no values are stored.


-----------------------------------------------------------------

::

          If an invalid character is encountered, mbstowcs() shall return
          (size_t)-1 and shall set errno to indicate the error.

          Otherwise, mbstowcs() shall return the number of the array
          elements modified (or required if pwcs is null), not including a
          terminating 0 code, if any. The array shall not be zero-
          terminated if the value returned is n.


-----------------------------------------------------

::

          The mbstowcs() function shall fail if:

          EILSEQ An invalid character sequence is detected. In the POSIX
                 locale an [EILSEQ] error cannot occur since all byte
                 values are valid characters.

          The following sections are informative.


---------------------------------------------------------

::

          None.


---------------------------------------------------------------------------

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

          mblen(3p), mbtowc(3p), wctomb(3p), wcstombs(3p)

          The Base Definitions volume of POSIX.1‐2017, stdlib.h(0p)


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

   IEEE/The Open Group               2017                      MBSTOWCS(3P)

--------------

Pages that refer to this page:
`ctype.h(0p) <../man0/ctype.h.0p.html>`__, 
`stdlib.h(0p) <../man0/stdlib.h.0p.html>`__, 
`mblen(3p) <../man3/mblen.3p.html>`__, 
`mbtowc(3p) <../man3/mbtowc.3p.html>`__, 
`setlocale(3p) <../man3/setlocale.3p.html>`__, 
`wcstombs(3p) <../man3/wcstombs.3p.html>`__, 
`wctomb(3p) <../man3/wctomb.3p.html>`__

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
