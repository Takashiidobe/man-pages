.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

newlocale(3p) — Linux manual page
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

   NEWLOCALE(3P)           POSIX Programmer's Manual          NEWLOCALE(3P)


-----------------------------------------------------

::

          This manual page is part of the POSIX Programmer's Manual.  The
          Linux implementation of this interface may differ (consult the
          corresponding Linux manual page for details of Linux behavior),
          or the interface may not be implemented on Linux.

NAME
-------------------------------------------------

::

          newlocale — create or modify a locale object


---------------------------------------------------------

::

          #include <locale.h>

          locale_t newlocale(int category_mask, const char *locale,
              locale_t base);


---------------------------------------------------------------

::

          The newlocale() function shall create a new locale object or
          modify an existing one.  If the base argument is (locale_t)0, a
          new locale object shall be created. It is unspecified whether the
          locale object pointed to by base shall be modified, or freed and
          a new locale object created.

          The category_mask argument specifies the locale categories to be
          set or modified.  Values for category_mask shall be constructed
          by a bitwise-inclusive OR of the symbolic constants
          LC_CTYPE_MASK, LC_NUMERIC_MASK, LC_TIME_MASK, LC_COLLATE_MASK,
          LC_MONETARY_MASK, and LC_MESSAGES_MASK, or any of the
          implementation-defined mask values defined in <locale.h>.

          For each category with the corresponding bit set in category_mask
          the data from the locale named by locale shall be used. In the
          case of modifying an existing locale object, the data from the
          locale named by locale shall replace the existing data within the
          locale object. If a completely new locale object is created, the
          data for all sections not requested by category_mask shall be
          taken from the default locale.

          The following preset values of locale are defined for all
          settings of category_mask:

          "POSIX"     Specifies the minimal environment for C-language
                      translation called the POSIX locale.

          "C"         Equivalent to "POSIX".

          ""          Specifies an implementation-defined native
                      environment. This corresponds to the value of the
                      associated environment variables, LC_* and LANG; see
                      the Base Definitions volume of POSIX.1‐2017, Chapter
                      7, Locale and Chapter 8, Environment Variables.

          If the base argument is not (locale_t)0 and the newlocale()
          function call succeeds, the contents of base are unspecified.
          Applications shall ensure that they stop using base as a locale
          object before calling newlocale().  If the function call fails
          and the base argument is not (locale_t)0, the contents of base
          shall remain valid and unchanged.

          The behavior is undefined if the base argument is the special
          locale object LC_GLOBAL_LOCALE, or is not a valid locale object
          handle and is not (locale_t)0.


-----------------------------------------------------------------

::

          Upon successful completion, the newlocale() function shall return
          a handle which the caller may use on subsequent calls to
          duplocale(), freelocale(), and other functions taking a locale_t
          argument.

          Upon failure, the newlocale() function shall return (locale_t)0
          and set errno to indicate the error.


-----------------------------------------------------

::

          The newlocale() function shall fail if:

          ENOMEM There is not enough memory available to create the locale
                 object or load the locale data.

          EINVAL The category_mask contains a bit that does not correspond
                 to a valid category.

          ENOENT For any of the categories in category_mask, the locale
                 data is not available.

          The newlocale() function may fail if:

          EINVAL The locale argument is not a valid string pointer.

          The following sections are informative.


---------------------------------------------------------

::

      Constructing a Locale Object from Different Locales
          The following example shows the construction of a locale where
          the LC_CTYPE category data comes from a locale loc1 and the
          LC_TIME category data from a locale loc2:

              #include <locale.h>
              ...
              locale_t loc, new_loc;

              /* Get the "loc1" data. */

              loc = newlocale (LC_CTYPE_MASK, "loc1", (locale_t)0);
              if (loc == (locale_t) 0)
                  abort ();

              /* Get the "loc2" data. */

              new_loc = newlocale (LC_TIME_MASK, "loc2", loc);
              if (new_loc != (locale_t) 0)
                  /* We don t abort if this fails. In this case this
                     simply used to unchanged locale object. */
                  loc = new_loc;

              ...

      Freeing up a Locale Object
          The following example shows a code fragment to free a locale
          object created by newlocale():

              #include <locale.h>
              ...

              /* Every locale object allocated with newlocale() should be
               * freed using freelocale():
               */

              locale_t loc;

              /* Get the locale. */

              loc = newlocale (LC_CTYPE_MASK | LC_TIME_MASK, "locname", (locale_t)0);

              /* ... Use the locale object ... */
              ...

              /* Free the locale object resources. */
              freelocale (loc);


---------------------------------------------------------------------------

::

          Handles for locale objects created by the newlocale() function
          should either be released by a corresponding call to
          freelocale(), or be used as a base locale to another newlocale()
          call.

          The special locale object LC_GLOBAL_LOCALE must not be passed for
          the base argument, even when returned by the uselocale()
          function.


-----------------------------------------------------------

::

          None.


---------------------------------------------------------------------------

::

          None.


---------------------------------------------------------

::

          duplocale(3p), freelocale(3p), uselocale(3p)

          The Base Definitions volume of POSIX.1‐2017, Chapter 7, Locale,
          Chapter 8, Environment Variables, locale.h(0p)


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

   IEEE/The Open Group               2017                     NEWLOCALE(3P)

--------------

Pages that refer to this page:
`locale.h(0p) <../man0/locale.h.0p.html>`__, 
`duplocale(3p) <../man3/duplocale.3p.html>`__, 
`freelocale(3p) <../man3/freelocale.3p.html>`__, 
`setlocale(3p) <../man3/setlocale.3p.html>`__, 
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
