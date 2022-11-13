.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

wcrtomb(3p) — Linux manual page
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

   WCRTOMB(3P)             POSIX Programmer's Manual            WCRTOMB(3P)


-----------------------------------------------------

::

          This manual page is part of the POSIX Programmer's Manual.  The
          Linux implementation of this interface may differ (consult the
          corresponding Linux manual page for details of Linux behavior),
          or the interface may not be implemented on Linux.

NAME
-------------------------------------------------

::

          wcrtomb — convert a wide-character code to a character
          (restartable)


---------------------------------------------------------

::

          #include <wchar.h>

          size_t wcrtomb(char *restrict s, wchar_t wc, mbstate_t *restrict ps);


---------------------------------------------------------------

::

          The functionality described on this reference page is aligned
          with the ISO C standard. Any conflict between the requirements
          described here and the ISO C standard is unintentional. This
          volume of POSIX.1‐2017 defers to the ISO C standard.

          If s is a null pointer, the wcrtomb() function shall be
          equivalent to the call:

              wcrtomb(buf, L'\0', ps)

          where buf is an internal buffer.

          If s is not a null pointer, the wcrtomb() function shall
          determine the number of bytes needed to represent the character
          that corresponds to the wide character given by wc (including any
          shift sequences), and store the resulting bytes in the array
          whose first element is pointed to by s.  At most {MB_CUR_MAX}
          bytes are stored. If wc is a null wide character, a null byte
          shall be stored, preceded by any shift sequence needed to restore
          the initial shift state. The resulting state described shall be
          the initial conversion state.

          If ps is a null pointer, the wcrtomb() function shall use its own
          internal mbstate_t object, which is initialized at program start-
          up to the initial conversion state. Otherwise, the mbstate_t
          object pointed to by ps shall be used to completely describe the
          current conversion state of the associated character sequence.
          The implementation shall behave as if no function defined in this
          volume of POSIX.1‐2017 calls wcrtomb().

          The wcrtomb() function need not be thread-safe if called with a
          NULL ps argument.

          The behavior of this function shall be affected by the LC_CTYPE
          category of the current locale.

          The wcrtomb() function shall not change the setting of errno if
          successful.


-----------------------------------------------------------------

::

          The wcrtomb() function shall return the number of bytes stored in
          the array object (including any shift sequences). When wc is not
          a valid wide character, an encoding error shall occur. In this
          case, the function shall store the value of the macro [EILSEQ] in
          errno and shall return (size_t)-1; the conversion state shall be
          undefined.


-----------------------------------------------------

::

          The wcrtomb() function shall fail if:

          EILSEQ An invalid wide-character code is detected.

          The wcrtomb() function may fail if:

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

          mbsinit(3p), wcsrtombs(3p)

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

   IEEE/The Open Group               2017                       WCRTOMB(3P)

--------------

Pages that refer to this page:
`wchar.h(0p) <../man0/wchar.h.0p.html>`__, 
`fprintf(3p) <../man3/fprintf.3p.html>`__, 
`fscanf(3p) <../man3/fscanf.3p.html>`__, 
`fwscanf(3p) <../man3/fwscanf.3p.html>`__, 
`mbsinit(3p) <../man3/mbsinit.3p.html>`__, 
`wcsrtombs(3p) <../man3/wcsrtombs.3p.html>`__

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
