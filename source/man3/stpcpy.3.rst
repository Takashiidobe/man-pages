.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

stpcpy(3) — Linux manual page
=============================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `RETURN VALUE <#RETURN_VALUE>`__  |                                   |
| \| `ATTRIBUTES <#ATTRIBUTES>`__   |                                   |
| \|                                |                                   |
| `                                 |                                   |
| CONFORMING TO <#CONFORMING_TO>`__ |                                   |
| \| `BUGS <#BUGS>`__ \|            |                                   |
| `EXAMPLES <#EXAMPLES>`__ \|       |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   STPCPY(3)               Linux Programmer's Manual              STPCPY(3)

NAME
-------------------------------------------------

::

          stpcpy - copy a string returning a pointer to its end


---------------------------------------------------------

::

          #include <string.h>

          char *stpcpy(char *restrict dest, const char *restrict src);

      Feature Test Macro Requirements for glibc (see
      feature_test_macros(7)):

          stpcpy():
              Since glibc 2.10:
                  _POSIX_C_SOURCE >= 200809L
              Before glibc 2.10:
                  _GNU_SOURCE


---------------------------------------------------------------

::

          The stpcpy() function copies the string pointed to by src
          (including the terminating null byte ('\0')) to the array pointed
          to by dest.  The strings may not overlap, and the destination
          string dest must be large enough to receive the copy.


-----------------------------------------------------------------

::

          stpcpy() returns a pointer to the end of the string dest (that
          is, the address of the terminating null byte) rather than the
          beginning.


-------------------------------------------------------------

::

          For an explanation of the terms used in this section, see
          attributes(7).

          ┌──────────────────────────────────────┬───────────────┬─────────┐
          │Interface                             │ Attribute     │ Value   │
          ├──────────────────────────────────────┼───────────────┼─────────┤
          │stpcpy()                              │ Thread safety │ MT-Safe │
          └──────────────────────────────────────┴───────────────┴─────────┘


-------------------------------------------------------------------

::

          This function was added to POSIX.1-2008.  Before that, it was not
          part of the C or POSIX.1 standards, nor customary on UNIX
          systems.  It first appeared at least as early as 1986, in the
          Lattice C AmigaDOS compiler, then in the GNU fileutils and GNU
          textutils in 1989, and in the GNU C library by 1992.  It is also
          present on the BSDs.


-------------------------------------------------

::

          This function may overrun the buffer dest.


---------------------------------------------------------

::

          For example, this program uses stpcpy() to concatenate foo and
          bar to produce foobar, which it then prints.

          #define _GNU_SOURCE
          #include <string.h>
          #include <stdio.h>

          int
          main(void)
          {
              char buffer[20];
              char *to = buffer;

              to = stpcpy(to, "foo");
              to = stpcpy(to, "bar");
              printf("%s\n", buffer);
          }


---------------------------------------------------------

::

          bcopy(3), memccpy(3), memcpy(3), memmove(3), stpncpy(3),
          strcpy(3), string(3), wcpcpy(3)

COLOPHON
---------------------------------------------------------

::

          This page is part of release 5.13 of the Linux man-pages project.
          A description of the project, information about reporting bugs,
          and the latest version of this page, can be found at
          https://www.kernel.org/doc/man-pages/.

   GNU                            2021-03-22                      STPCPY(3)

--------------

Pages that refer to this page: `strcpy(3) <../man3/strcpy.3.html>`__, 
`string(3) <../man3/string.3.html>`__, 
`wcpcpy(3) <../man3/wcpcpy.3.html>`__, 
`feature_test_macros(7) <../man7/feature_test_macros.7.html>`__, 
`signal-safety(7) <../man7/signal-safety.7.html>`__

--------------

`Copyright and license for this manual
page <../man3/stpcpy.3.license.html>`__

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
