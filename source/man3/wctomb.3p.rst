.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

wctomb(3p) — Linux manual page
==============================

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

   WCTOMB(3P)              POSIX Programmer's Manual             WCTOMB(3P)


-----------------------------------------------------

::

          This manual page is part of the POSIX Programmer's Manual.  The
          Linux implementation of this interface may differ (consult the
          corresponding Linux manual page for details of Linux behavior),
          or the interface may not be implemented on Linux.

NAME
-------------------------------------------------

::

          wctomb — convert a wide-character code to a character


---------------------------------------------------------

::

          #include <stdlib.h>

          int wctomb(char *s, wchar_t wchar);


---------------------------------------------------------------

::

          The functionality described on this reference page is aligned
          with the ISO C standard. Any conflict between the requirements
          described here and the ISO C standard is unintentional. This
          volume of POSIX.1‐2017 defers to the ISO C standard.

          The wctomb() function shall determine the number of bytes needed
          to represent the character corresponding to the wide-character
          code whose value is wchar (including any change in the shift
          state). It shall store the character representation (possibly
          multiple bytes and any special bytes to change shift state) in
          the array object pointed to by s (if s is not a null pointer). At
          most {MB_CUR_MAX} bytes shall be stored. If wchar is 0, a null
          byte shall be stored, preceded by any shift sequence needed to
          restore the initial shift state, and wctomb() shall be left in
          the initial shift state.

          The behavior of this function is affected by the LC_CTYPE
          category of the current locale. For a state-dependent encoding,
          this function shall be placed into its initial state by a call
          for which its character pointer argument, s, is a null pointer.
          Subsequent calls with s as other than a null pointer shall cause
          the internal state of the function to be altered as necessary. A
          call with s as a null pointer shall cause this function to return
          a non-zero value if encodings have state dependency, and 0
          otherwise. Changing the LC_CTYPE category causes the shift state
          of this function to be unspecified.

          The wctomb() function need not be thread-safe.

          The implementation shall behave as if no function defined in this
          volume of POSIX.1‐2017 calls wctomb().


-----------------------------------------------------------------

::

          If s is a null pointer, wctomb() shall return a non-zero or 0
          value, if character encodings, respectively, do or do not have
          state-dependent encodings. If s is not a null pointer, wctomb()
          shall return -1 if the value of wchar does not correspond to a
          valid character, or return the number of bytes that constitute
          the character corresponding to the value of wchar.

          In no case shall the value returned be greater than the value of
          the {MB_CUR_MAX} macro.


-----------------------------------------------------

::

          The wctomb() function shall fail if:

          EILSEQ An invalid wide-character code is detected.

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

          mblen(3p), mbtowc(3p), mbstowcs(3p), wcstombs(3p)

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

   IEEE/The Open Group               2017                        WCTOMB(3P)

--------------

Pages that refer to this page:
`ctype.h(0p) <../man0/ctype.h.0p.html>`__, 
`stdlib.h(0p) <../man0/stdlib.h.0p.html>`__, 
`mblen(3p) <../man3/mblen.3p.html>`__, 
`mbstowcs(3p) <../man3/mbstowcs.3p.html>`__, 
`mbtowc(3p) <../man3/mbtowc.3p.html>`__, 
`setlocale(3p) <../man3/setlocale.3p.html>`__, 
`wcstombs(3p) <../man3/wcstombs.3p.html>`__

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
