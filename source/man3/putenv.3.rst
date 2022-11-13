.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

putenv(3) — Linux manual page
=============================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `RETURN VALUE <#RETURN_VALUE>`__  |                                   |
| \| `ERRORS <#ERRORS>`__ \|        |                                   |
| `ATTRIBUTES <#ATTRIBUTES>`__ \|   |                                   |
| `                                 |                                   |
| CONFORMING TO <#CONFORMING_TO>`__ |                                   |
| \| `NOTES <#NOTES>`__ \|          |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   PUTENV(3)               Linux Programmer's Manual              PUTENV(3)

NAME
-------------------------------------------------

::

          putenv - change or add an environment variable


---------------------------------------------------------

::

          #include <stdlib.h>

          int putenv(char *string);

      Feature Test Macro Requirements for glibc (see
      feature_test_macros(7)):

          putenv():
              _XOPEN_SOURCE
                  || /* Glibc since 2.19: */ _DEFAULT_SOURCE
                  || /* Glibc <= 2.19: */ _SVID_SOURCE


---------------------------------------------------------------

::

          The putenv() function adds or changes the value of environment
          variables.  The argument string is of the form name=value.  If
          name does not already exist in the environment, then string is
          added to the environment.  If name does exist, then the value of
          name in the environment is changed to value.  The string pointed
          to by string becomes part of the environment, so altering the
          string changes the environment.


-----------------------------------------------------------------

::

          The putenv() function returns zero on success.  On failure, it
          returns a nonzero value, and errno is set to indicate the error.


-----------------------------------------------------

::

          ENOMEM Insufficient space to allocate new environment.


-------------------------------------------------------------

::

          For an explanation of the terms used in this section, see
          attributes(7).

          ┌──────────────────────────┬───────────────┬─────────────────────┐
          │Interface                 │ Attribute     │ Value               │
          ├──────────────────────────┼───────────────┼─────────────────────┤
          │putenv()                  │ Thread safety │ MT-Unsafe const:env │
          └──────────────────────────┴───────────────┴─────────────────────┘


-------------------------------------------------------------------

::

          POSIX.1-2001, POSIX.1-2008, SVr4, 4.3BSD.


---------------------------------------------------

::

          The putenv() function is not required to be reentrant, and the
          one in glibc 2.0 is not, but the glibc 2.1 version is.

          Since version 2.1.2, the glibc implementation conforms to SUSv2:
          the pointer string given to putenv() is used.  In particular,
          this string becomes part of the environment; changing it later
          will change the environment.  (Thus, it is an error to call
          putenv() with an automatic variable as the argument, then return
          from the calling function while string is still part of the
          environment.)  However, glibc versions 2.0 to 2.1.1 differ: a
          copy of the string is used.  On the one hand this causes a memory
          leak, and on the other hand it violates SUSv2.

          The 4.4BSD version, like glibc 2.0, uses a copy.

          SUSv2 removes the const from the prototype, and so does glibc
          2.1.3.

          The GNU C library implementation provides a nonstandard
          extension.  If string does not include an equal sign:

              putenv("NAME");

          then the named variable is removed from the caller's environment.


---------------------------------------------------------

::

          clearenv(3), getenv(3), setenv(3), unsetenv(3), environ(7)

COLOPHON
---------------------------------------------------------

::

          This page is part of release 5.13 of the Linux man-pages project.
          A description of the project, information about reporting bugs,
          and the latest version of this page, can be found at
          https://www.kernel.org/doc/man-pages/.

   GNU                            2021-03-22                      PUTENV(3)

--------------

Pages that refer to this page:
`clearenv(3) <../man3/clearenv.3.html>`__, 
`getenv(3) <../man3/getenv.3.html>`__, 
`pam_putenv(3) <../man3/pam_putenv.3.html>`__, 
`setenv(3) <../man3/setenv.3.html>`__, 
`proc(5) <../man5/proc.5.html>`__, 
`environ(7) <../man7/environ.7.html>`__

--------------

`Copyright and license for this manual
page <../man3/putenv.3.license.html>`__

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
