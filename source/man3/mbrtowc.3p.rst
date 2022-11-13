.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

mbrtowc(3p) — Linux manual page
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

   MBRTOWC(3P)             POSIX Programmer's Manual            MBRTOWC(3P)


-----------------------------------------------------

::

          This manual page is part of the POSIX Programmer's Manual.  The
          Linux implementation of this interface may differ (consult the
          corresponding Linux manual page for details of Linux behavior),
          or the interface may not be implemented on Linux.

NAME
-------------------------------------------------

::

          mbrtowc — convert a character to a wide-character code
          (restartable)


---------------------------------------------------------

::

          #include <wchar.h>

          size_t mbrtowc(wchar_t *restrict pwc, const char *restrict s,
              size_t n, mbstate_t *restrict ps);


---------------------------------------------------------------

::

          The functionality described on this reference page is aligned
          with the ISO C standard. Any conflict between the requirements
          described here and the ISO C standard is unintentional. This
          volume of POSIX.1‐2017 defers to the ISO C standard.

          If s is a null pointer, the mbrtowc() function shall be
          equivalent to the call:

              mbrtowc(NULL, "", 1, ps)

          In this case, the values of the arguments pwc and n are ignored.

          If s is not a null pointer, the mbrtowc() function shall inspect
          at most n bytes beginning at the byte pointed to by s to
          determine the number of bytes needed to complete the next
          character (including any shift sequences). If the function
          determines that the next character is completed, it shall
          determine the value of the corresponding wide character and then,
          if pwc is not a null pointer, shall store that value in the
          object pointed to by pwc.  If the corresponding wide character is
          the null wide character, the resulting state described shall be
          the initial conversion state.

          If ps is a null pointer, the mbrtowc() function shall use its own
          internal mbstate_t object, which shall be initialized at program
          start-up to the initial conversion state. Otherwise, the
          mbstate_t object pointed to by ps shall be used to completely
          describe the current conversion state of the associated character
          sequence. The implementation shall behave as if no function
          defined in this volume of POSIX.1‐2017 calls mbrtowc().

          The behavior of this function is affected by the LC_CTYPE
          category of the current locale.

          The mbrtowc() function need not be thread-safe if called with a
          NULL ps argument.

          The mbrtowc() function shall not change the setting of errno if
          successful.


-----------------------------------------------------------------

::

          The mbrtowc() function shall return the first of the following
          that applies:

          0           If the next n or fewer bytes complete the character
                      that corresponds to the null wide character (which is
                      the value stored).

          between 1 and n inclusive
                      If the next n or fewer bytes complete a valid
                      character (which is the value stored); the value
                      returned shall be the number of bytes that complete
                      the character.

          (size_t)-2  If the next n bytes contribute to an incomplete but
                      potentially valid character, and all n bytes have
                      been processed (no value is stored). When n has at
                      least the value of the {MB_CUR_MAX} macro, this case
                      can only occur if s points at a sequence of redundant
                      shift sequences (for implementations with state-
                      dependent encodings).

          (size_t)-1  If an encoding error occurs, in which case the next n
                      or fewer bytes do not contribute to a complete and
                      valid character (no value is stored). In this case,
                      [EILSEQ] shall be stored in errno and the conversion
                      state is undefined.


-----------------------------------------------------

::

          The mbrtowc() function shall fail if:

          EILSEQ An invalid character sequence is detected.  In the POSIX
                 locale an [EILSEQ] error cannot occur since all byte
                 values are valid characters.

          The mbrtowc() function may fail if:

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

          mbsinit(3p), mbsrtowcs(3p)

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

   IEEE/The Open Group               2017                       MBRTOWC(3P)

--------------

Pages that refer to this page:
`wchar.h(0p) <../man0/wchar.h.0p.html>`__, 
`fwprintf(3p) <../man3/fwprintf.3p.html>`__, 
`mbrlen(3p) <../man3/mbrlen.3p.html>`__, 
`mbsinit(3p) <../man3/mbsinit.3p.html>`__, 
`mbsrtowcs(3p) <../man3/mbsrtowcs.3p.html>`__

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
