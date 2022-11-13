.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

uselocale(3p) — Linux manual page
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

   USELOCALE(3P)           POSIX Programmer's Manual          USELOCALE(3P)


-----------------------------------------------------

::

          This manual page is part of the POSIX Programmer's Manual.  The
          Linux implementation of this interface may differ (consult the
          corresponding Linux manual page for details of Linux behavior),
          or the interface may not be implemented on Linux.

NAME
-------------------------------------------------

::

          uselocale — use locale in current thread


---------------------------------------------------------

::

          #include <locale.h>

          locale_t uselocale(locale_t newloc);


---------------------------------------------------------------

::

          The uselocale() function shall set or query the current locale
          for the calling thread.

          The value for the newloc argument shall be one of the following:

           1. A value returned by the newlocale() or duplocale() functions

           2. The special locale object descriptor LC_GLOBAL_LOCALE

           3. (locale_t)0

          If the newloc argument is (locale_t)0, the current locale shall
          not be changed; this value can be used to query the current
          locale setting. If the newloc argument is LC_GLOBAL_LOCALE, any
          thread-local locale for the calling thread shall be uninstalled;
          the thread shall again use the global locale as the current
          locale, and changes to the global locale shall affect the thread.
          Otherwise, the locale represented by newloc shall be installed as
          a thread-local locale to be used as the current locale for the
          calling thread.

          Once the uselocale() function has been called to install a
          thread-local locale, the behavior of every interface using data
          from the current locale shall be affected for the calling thread.
          The current locale for other threads shall remain unchanged.


-----------------------------------------------------------------

::

          Upon successful completion, the uselocale() function shall return
          a handle for the thread-local locale that was in use as the
          current locale for the calling thread on entry to the function,
          or LC_GLOBAL_LOCALE if no thread-local locale was in use.
          Otherwise, uselocale() shall return (locale_t)0 and set errno to
          indicate the error.


-----------------------------------------------------

::

          The uselocale() function may fail if:

          EINVAL newloc is not a valid locale object and is not
                 (locale_t)0.

          The following sections are informative.


---------------------------------------------------------

::

          None.


---------------------------------------------------------------------------

::

          Unlike the setlocale() function, the uselocale() function does
          not allow replacing some locale categories only. Applications
          that need to install a locale which differs only in a few
          categories must use newlocale() to change a locale object
          equivalent to the currently used locale and install it.


-----------------------------------------------------------

::

          None.


---------------------------------------------------------------------------

::

          None.


---------------------------------------------------------

::

          duplocale(3p), freelocale(3p), newlocale(3p), setlocale(3p)

          The Base Definitions volume of POSIX.1‐2017, locale.h(0p)


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

   IEEE/The Open Group               2017                     USELOCALE(3P)

--------------

Pages that refer to this page:
`locale.h(0p) <../man0/locale.h.0p.html>`__, 
`duplocale(3p) <../man3/duplocale.3p.html>`__, 
`freelocale(3p) <../man3/freelocale.3p.html>`__, 
`isalnum(3p) <../man3/isalnum.3p.html>`__, 
`isalpha(3p) <../man3/isalpha.3p.html>`__, 
`isblank(3p) <../man3/isblank.3p.html>`__, 
`iscntrl(3p) <../man3/iscntrl.3p.html>`__, 
`isgraph(3p) <../man3/isgraph.3p.html>`__, 
`islower(3p) <../man3/islower.3p.html>`__, 
`isprint(3p) <../man3/isprint.3p.html>`__, 
`ispunct(3p) <../man3/ispunct.3p.html>`__, 
`isspace(3p) <../man3/isspace.3p.html>`__, 
`isupper(3p) <../man3/isupper.3p.html>`__, 
`iswalnum(3p) <../man3/iswalnum.3p.html>`__, 
`iswalpha(3p) <../man3/iswalpha.3p.html>`__, 
`iswblank(3p) <../man3/iswblank.3p.html>`__, 
`iswcntrl(3p) <../man3/iswcntrl.3p.html>`__, 
`iswctype(3p) <../man3/iswctype.3p.html>`__, 
`iswdigit(3p) <../man3/iswdigit.3p.html>`__, 
`iswgraph(3p) <../man3/iswgraph.3p.html>`__, 
`iswlower(3p) <../man3/iswlower.3p.html>`__, 
`iswprint(3p) <../man3/iswprint.3p.html>`__, 
`iswpunct(3p) <../man3/iswpunct.3p.html>`__, 
`iswspace(3p) <../man3/iswspace.3p.html>`__, 
`iswupper(3p) <../man3/iswupper.3p.html>`__, 
`iswxdigit(3p) <../man3/iswxdigit.3p.html>`__, 
`localeconv(3p) <../man3/localeconv.3p.html>`__, 
`newlocale(3p) <../man3/newlocale.3p.html>`__, 
`nl_langinfo(3p) <../man3/nl_langinfo.3p.html>`__, 
`setlocale(3p) <../man3/setlocale.3p.html>`__, 
`strftime(3p) <../man3/strftime.3p.html>`__, 
`tolower(3p) <../man3/tolower.3p.html>`__, 
`toupper(3p) <../man3/toupper.3p.html>`__, 
`towlower(3p) <../man3/towlower.3p.html>`__, 
`towupper(3p) <../man3/towupper.3p.html>`__

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
