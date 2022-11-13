.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

atoi(3) — Linux manual page
===========================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `RETURN VALUE <#RETURN_VALUE>`__  |                                   |
| \| `ATTRIBUTES <#ATTRIBUTES>`__   |                                   |
| \|                                |                                   |
| `                                 |                                   |
| CONFORMING TO <#CONFORMING_TO>`__ |                                   |
| \| `NOTES <#NOTES>`__ \|          |                                   |
| `BUGS <#BUGS>`__ \|               |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   ATOI(3)                 Linux Programmer's Manual                ATOI(3)

NAME
-------------------------------------------------

::

          atoi, atol, atoll - convert a string to an integer


---------------------------------------------------------

::

          #include <stdlib.h>

          int atoi(const char *nptr);
          long atol(const char *nptr);
          long long atoll(const char *nptr);

      Feature Test Macro Requirements for glibc (see
      feature_test_macros(7)):

          atoll():
              _ISOC99_SOURCE
                  || /* Glibc <= 2.19: */ _BSD_SOURCE || _SVID_SOURCE


---------------------------------------------------------------

::

          The atoi() function converts the initial portion of the string
          pointed to by nptr to int.  The behavior is the same as

              strtol(nptr, NULL, 10);

          except that atoi() does not detect errors.

          The atol() and atoll() functions behave the same as atoi(),
          except that they convert the initial portion of the string to
          their return type of long or long long.


-----------------------------------------------------------------

::

          The converted value or 0 on error.


-------------------------------------------------------------

::

          For an explanation of the terms used in this section, see
          attributes(7).

          ┌───────────────────────────────┬───────────────┬────────────────┐
          │Interface                      │ Attribute     │ Value          │
          ├───────────────────────────────┼───────────────┼────────────────┤
          │atoi(), atol(), atoll()        │ Thread safety │ MT-Safe locale │
          └───────────────────────────────┴───────────────┴────────────────┘


-------------------------------------------------------------------

::

          POSIX.1-2001, POSIX.1-2008, C99, SVr4, 4.3BSD.  C89 and
          POSIX.1-1996 include the functions atoi() and atol() only.


---------------------------------------------------

::

          POSIX.1 leaves the return value of atoi() on error unspecified.
          On glibc, musl libc, and uClibc, 0 is returned on error.


-------------------------------------------------

::

          errno is not set on error so there is no way to distinguish
          between 0 as an error and as the converted value.  No checks for
          overflow or underflow are done.  Only base-10 input can be
          converted.  It is recommended to instead use the strtol() and
          strtoul() family of functions in new programs.


---------------------------------------------------------

::

          atof(3), strtod(3), strtol(3), strtoul(3)

COLOPHON
---------------------------------------------------------

::

          This page is part of release 5.13 of the Linux man-pages project.
          A description of the project, information about reporting bugs,
          and the latest version of this page, can be found at
          https://www.kernel.org/doc/man-pages/.

   GNU                            2021-03-22                        ATOI(3)

--------------

Pages that refer to this page: `atof(3) <../man3/atof.3.html>`__, 
`form_field_validation(3x) <../man3/form_field_validation.3x.html>`__, 
`strtod(3) <../man3/strtod.3.html>`__, 
`strtol(3) <../man3/strtol.3.html>`__, 
`strtoul(3) <../man3/strtoul.3.html>`__

--------------

`Copyright and license for this manual
page <../man3/atoi.3.license.html>`__

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
