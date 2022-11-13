.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

duplocale(3p) — Linux manual page
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

   DUPLOCALE(3P)           POSIX Programmer's Manual          DUPLOCALE(3P)


-----------------------------------------------------

::

          This manual page is part of the POSIX Programmer's Manual.  The
          Linux implementation of this interface may differ (consult the
          corresponding Linux manual page for details of Linux behavior),
          or the interface may not be implemented on Linux.

NAME
-------------------------------------------------

::

          duplocale — duplicate a locale object


---------------------------------------------------------

::

          #include <locale.h>

          locale_t duplocale(locale_t locobj);


---------------------------------------------------------------

::

          The duplocale() function shall create a duplicate copy of the
          locale object referenced by the locobj argument.

          If the locobj argument is LC_GLOBAL_LOCALE, duplocale() shall
          create a new locale object containing a copy of the global locale
          determined by the setlocale() function.

          The behavior is undefined if the locobj argument is not a valid
          locale object handle.


-----------------------------------------------------------------

::

          Upon successful completion, the duplocale() function shall return
          a handle for a new locale object. Otherwise, duplocale() shall
          return (locale_t)0 and set errno to indicate the error.


-----------------------------------------------------

::

          The duplocale() function shall fail if:

          ENOMEM There is not enough memory available to create the locale
                 object or load the locale data.

          The following sections are informative.


---------------------------------------------------------

::

      Constructing an Altered Version of an Existing Locale Object
          The following example shows a code fragment to create a slightly
          altered version of an existing locale object. The function takes
          a locale object and a locale name and it replaces the LC_TIME
          category data in the locale object with that from the named
          locale.

              #include <locale.h>
              ...

              locale_t
              with_changed_lc_time (locale_t obj, const char *name)
              {

                  locale_t retval = duplocale (obj);
                  if (retval != (locale_t) 0)
                  {
                      locale_t changed = newlocale (LC_TIME_MASK, name, retval);
                      if (changed == (locale_t) 0)
                          /* An error occurred. Free all allocated resources. */
                          freelocale (retval);
                      retval = changed;
                  }
                  return retval;
              }


---------------------------------------------------------------------------

::

          The use of the duplocale() function is recommended for situations
          where a locale object is being used in multiple places, and it is
          possible that the lifetime of the locale object might end before
          all uses are finished. Another reason to duplicate a locale
          object is if a slightly modified form is needed.  This can be
          achieved by a call to newlocale() following the duplocale() call.

          As with the newlocale() function, handles for locale objects
          created by the duplocale() function should be released by a
          corresponding call to freelocale().

          The duplocale() function can also be used in conjunction with
          uselocale((locale_t)0).  This returns the locale in effect for
          the calling thread, but can have the value LC_GLOBAL_LOCALE.
          Passing LC_GLOBAL_LOCALE to functions such as isalnum_l() results
          in undefined behavior, but applications can convert it into a
          usable locale object by using duplocale().


-----------------------------------------------------------

::

          None.


---------------------------------------------------------------------------

::

          None.


---------------------------------------------------------

::

          freelocale(3p), newlocale(3p), uselocale(3p)

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

   IEEE/The Open Group               2017                     DUPLOCALE(3P)

--------------

Pages that refer to this page:
`locale.h(0p) <../man0/locale.h.0p.html>`__, 
`freelocale(3p) <../man3/freelocale.3p.html>`__, 
`newlocale(3p) <../man3/newlocale.3p.html>`__, 
`uselocale(3p) <../man3/uselocale.3p.html>`__

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
