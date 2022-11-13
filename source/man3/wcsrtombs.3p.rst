.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

wcsrtombs(3p) — Linux manual page
=================================

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

   WCSRTOMBS(3P)           POSIX Programmer's Manual          WCSRTOMBS(3P)


-----------------------------------------------------

::

          This manual page is part of the POSIX Programmer's Manual.  The
          Linux implementation of this interface may differ (consult the
          corresponding Linux manual page for details of Linux behavior),
          or the interface may not be implemented on Linux.

NAME
-------------------------------------------------

::

          wcsnrtombs, wcsrtombs — convert a wide-character string to a
          character string (restartable)


---------------------------------------------------------

::

          #include <wchar.h>

          size_t wcsnrtombs(char *restrict dst, const wchar_t **restrict src,
              size_t nwc, size_t len, mbstate_t *restrict ps);
          size_t wcsrtombs(char *restrict dst, const wchar_t **restrict src,
              size_t len, mbstate_t *restrict ps);


---------------------------------------------------------------

::

          For wcsrtombs(): The functionality described on this reference
          page is aligned with the ISO C standard. Any conflict between the
          requirements described here and the ISO C standard is
          unintentional. This volume of POSIX.1‐2017 defers to the ISO C
          standard.

          The wcsrtombs() function shall convert a sequence of wide
          characters from the array indirectly pointed to by src into a
          sequence of corresponding characters, beginning in the conversion
          state described by the object pointed to by ps.  If dst is not a
          null pointer, the converted characters shall then be stored into
          the array pointed to by dst.  Conversion continues up to and
          including a terminating null wide character, which shall also be
          stored. Conversion shall stop earlier in the following cases:

           *  When a code is reached that does not correspond to a valid
              character

           *  When the next character would exceed the limit of len total
              bytes to be stored in the array pointed to by dst (and dst is
              not a null pointer)

          Each conversion shall take place as if by a call to the wcrtomb()
          function.

          If dst is not a null pointer, the pointer object pointed to by
          src shall be assigned either a null pointer (if conversion
          stopped due to reaching a terminating null wide character) or the
          address just past the last wide character converted (if any). If
          conversion stopped due to reaching a terminating null wide
          character, the resulting state described shall be the initial
          conversion state.

          If ps is a null pointer, the wcsrtombs() function shall use its
          own internal mbstate_t object, which is initialized at program
          start-up to the initial conversion state. Otherwise, the
          mbstate_t object pointed to by ps shall be used to completely
          describe the current conversion state of the associated character
          sequence.

          The wcsnrtombs() and wcsrtombs() functions need not be thread-
          safe if called with a NULL ps argument.

          The wcsnrtombs() function shall be equivalent to the wcsrtombs()
          function, except that the conversion is limited to the first nwc
          wide characters.

          The wcsrtombs() function shall not change the setting of errno if
          successful.

          The behavior of these functions shall be affected by the LC_CTYPE
          category of the current locale.

          The implementation shall behave as if no function defined in
          System Interfaces volume of POSIX.1‐2017 calls these functions.


-----------------------------------------------------------------

::

          If conversion stops because a code is reached that does not
          correspond to a valid character, an encoding error occurs. In
          this case, these functions shall store the value of the macro
          [EILSEQ] in errno and return (size_t)-1; the conversion state is
          undefined.  Otherwise, these functions shall return the number of
          bytes in the resulting character sequence, not including the
          terminating null (if any).


-----------------------------------------------------

::

          These functions shall fail if:

          EILSEQ A wide-character code does not correspond to a valid
                 character.

          These functions may fail if:

          EINVAL ps points to an object that contains an invalid conversion
                 state.

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

          mbsinit(3p), wcrtomb(3p)

          The Base Definitions volume of POSIX.1‐2017, wchar.h(0p)


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

   IEEE/The Open Group               2017                     WCSRTOMBS(3P)

--------------

Pages that refer to this page:
`wchar.h(0p) <../man0/wchar.h.0p.html>`__, 
`mbsinit(3p) <../man3/mbsinit.3p.html>`__, 
`wcrtomb(3p) <../man3/wcrtomb.3p.html>`__, 
`wcsnrtombs(3p) <../man3/wcsnrtombs.3p.html>`__

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
