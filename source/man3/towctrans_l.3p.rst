.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

towctrans(3p) — Linux manual page
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

   TOWCTRANS(3P)           POSIX Programmer's Manual          TOWCTRANS(3P)


-----------------------------------------------------

::

          This manual page is part of the POSIX Programmer's Manual.  The
          Linux implementation of this interface may differ (consult the
          corresponding Linux manual page for details of Linux behavior),
          or the interface may not be implemented on Linux.

NAME
-------------------------------------------------

::

          towctrans, towctrans_l — wide-character transliteration


---------------------------------------------------------

::

          #include <wctype.h>

          wint_t towctrans(wint_t wc, wctrans_t desc);
          wint_t towctrans_l(wint_t wc, wctrans_t desc,
              locale_t locale);


---------------------------------------------------------------

::

          For towctrans(): The functionality described on this reference
          page is aligned with the ISO C standard. Any conflict between the
          requirements described here and the ISO C standard is
          unintentional. This volume of POSIX.1‐2017 defers to the ISO C
          standard.

          The towctrans() and towctrans_l() functions shall transliterate
          the wide-character code wc using the mapping described by desc.

          The current setting of the LC_CTYPE category in the current
          locale or in the locale represented by locale, respectively,
          should be the same as during the call to wctrans() or wctrans_l()
          that returned the value desc.

          If the value of desc is invalid (that is, not obtained by a call
          to wctrans() or desc is invalidated by a subsequent call to
          setlocale() that has affected category LC_CTYPE), the result is
          unspecified.

          If the value of desc is invalid (that is, not obtained by a call
          to wctrans_l() with the same locale object locale) the result is
          unspecified.

          An application wishing to check for error situations should set
          errno to 0 before calling towctrans() or towctrans_l().

          If errno is non-zero on return, an error has occurred.

          The behavior is undefined if the locale argument to towctrans_l()
          is the special locale object LC_GLOBAL_LOCALE or is not a valid
          locale object handle.


-----------------------------------------------------------------

::

          If successful, the towctrans() and towctrans_l() functions shall
          return the mapped value of wc using the mapping described by
          desc.  Otherwise, they shall return wc unchanged.


-----------------------------------------------------

::

          These functions may fail if:

          EINVAL desc contains an invalid transliteration descriptor.

          The following sections are informative.


---------------------------------------------------------

::

          None.


---------------------------------------------------------------------------

::

          The strings "tolower" and "toupper" are reserved for the standard
          mapping names. In the table below, the functions in the left
          column are equivalent to the functions in the right column.

              towlower(wc)            towctrans(wc, wctrans("tolower"))
              towlower_l(wc, locale)  towctrans_l(wc, wctrans("tolower"), locale)
              towupper(wc)            towctrans(wc, wctrans("toupper"))
              towupper_l(wc, locale)  towctrans_l(wc, wctrans("toupper"), locale)


-----------------------------------------------------------

::

          None.


---------------------------------------------------------------------------

::

          None.


---------------------------------------------------------

::

          towlower(3p), towupper(3p), wctrans(3p)

          The Base Definitions volume of POSIX.1‐2017, wctype.h(0p)


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

   IEEE/The Open Group               2017                     TOWCTRANS(3P)

--------------

Pages that refer to this page:
`wctype.h(0p) <../man0/wctype.h.0p.html>`__, 
`wctrans(3p) <../man3/wctrans.3p.html>`__

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
