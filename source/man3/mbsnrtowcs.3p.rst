.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

mbsrtowcs(3p) — Linux manual page
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

   MBSRTOWCS(3P)           POSIX Programmer's Manual          MBSRTOWCS(3P)


-----------------------------------------------------

::

          This manual page is part of the POSIX Programmer's Manual.  The
          Linux implementation of this interface may differ (consult the
          corresponding Linux manual page for details of Linux behavior),
          or the interface may not be implemented on Linux.

NAME
-------------------------------------------------

::

          mbsnrtowcs, mbsrtowcs — convert a character string to a wide-
          character string (restartable)


---------------------------------------------------------

::

          #include <wchar.h>

          size_t mbsnrtowcs(wchar_t *restrict dst, const char **restrict src,
              size_t nmc, size_t len, mbstate_t *restrict ps);
          size_t mbsrtowcs(wchar_t *restrict dst, const char **restrict src,
              size_t len, mbstate_t *restrict ps);


---------------------------------------------------------------

::

          For mbsrtowcs(): The functionality described on this reference
          page is aligned with the ISO C standard. Any conflict between the
          requirements described here and the ISO C standard is
          unintentional. This volume of POSIX.1‐2017 defers to the ISO C
          standard.

          The mbsrtowcs() function shall convert a sequence of characters,
          beginning in the conversion state described by the object pointed
          to by ps, from the array indirectly pointed to by src into a
          sequence of corresponding wide characters. If dst is not a null
          pointer, the converted characters shall be stored into the array
          pointed to by dst.  Conversion continues up to and including a
          terminating null character, which shall also be stored.
          Conversion shall stop early in either of the following cases:

           *  A sequence of bytes is encountered that does not form a valid
              character.

           *  len codes have been stored into the array pointed to by dst
              (and dst is not a null pointer).

          Each conversion shall take place as if by a call to the mbrtowc()
          function.

          If dst is not a null pointer, the pointer object pointed to by
          src shall be assigned either a null pointer (if conversion
          stopped due to reaching a terminating null character) or the
          address just past the last character converted (if any). If
          conversion stopped due to reaching a terminating null character,
          and if dst is not a null pointer, the resulting state described
          shall be the initial conversion state.

          If ps is a null pointer, the mbsrtowcs() function shall use its
          own internal mbstate_t object, which is initialized at program
          start-up to the initial conversion state. Otherwise, the
          mbstate_t object pointed to by ps shall be used to completely
          describe the current conversion state of the associated character
          sequence.

          The mbsnrtowcs() function shall be equivalent to the mbsrtowcs()
          function, except that the conversion of characters indirectly
          pointed to by src is limited to at most nmc bytes (the size of
          the input buffer), and under conditions where mbsrtowcs() would
          assign the address just past the last character converted (if
          any) to the pointer object pointed to by src, mbsnrtowcs() shall
          instead assign the address just past the last byte processed (if
          any) to that pointer object. If the input buffer ends with an
          incomplete character, it is unspecified whether conversion stops
          at the end of the previous character (if any), or at the end of
          the input buffer. In the latter case, a subsequent call to
          mbsnrtowcs() with an input buffer that starts with the remainder
          of the incomplete character shall correctly complete the
          conversion of that character.

          The behavior of these functions shall be affected by the LC_CTYPE
          category of the current locale.

          The implementation shall behave as if no function defined in this
          volume of POSIX.1‐2017 calls these functions.

          The mbsnrtowcs() and mbsrtowcs() functions need not be thread-
          safe if called with a NULL ps argument.

          The mbsrtowcs() function shall not change the setting of errno if
          successful.


-----------------------------------------------------------------

::

          If the input conversion encounters a sequence of bytes that do
          not form a valid character, an encoding error occurs. In this
          case, these functions shall store the value of the macro [EILSEQ]
          in errno and shall return (size_t)-1; the conversion state is
          undefined.  Otherwise, these functions shall return the number of
          characters successfully converted, not including the terminating
          null (if any).


-----------------------------------------------------

::

          These functions shall fail if:

          EILSEQ An invalid character sequence is detected.  In the POSIX
                 locale an [EILSEQ] error cannot occur since all byte
                 values are valid characters.

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

          A future version may require that when the input buffer ends with
          an incomplete character, conversion stops at the end of the input
          buffer.


---------------------------------------------------------

::

          iconv(3p), mbrtowc(3p), mbsinit(3p)

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

   IEEE/The Open Group               2017                     MBSRTOWCS(3P)

--------------

Pages that refer to this page:
`wchar.h(0p) <../man0/wchar.h.0p.html>`__, 
`iconv(3p) <../man3/iconv.3p.html>`__, 
`mbrtowc(3p) <../man3/mbrtowc.3p.html>`__, 
`mbsinit(3p) <../man3/mbsinit.3p.html>`__

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
