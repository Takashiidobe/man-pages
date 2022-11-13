.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

mktemp(3) — Linux manual page
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
| \| `BUGS <#BUGS>`__ \|            |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   MKTEMP(3)               Linux Programmer's Manual              MKTEMP(3)

NAME
-------------------------------------------------

::

          mktemp - make a unique temporary filename


---------------------------------------------------------

::

          #include <stdlib.h>

          char *mktemp(char *template);

      Feature Test Macro Requirements for glibc (see
      feature_test_macros(7)):

          mktemp():
              Since glibc 2.12:
                  (_XOPEN_SOURCE >= 500) && ! (_POSIX_C_SOURCE >= 200112L)
                      || /* Glibc since 2.19: */ _DEFAULT_SOURCE
                      || /* Glibc <= 2.19: */ _SVID_SOURCE || _BSD_SOURCE
              Before glibc 2.12:
                  _BSD_SOURCE || _SVID_SOURCE || _XOPEN_SOURCE >= 500


---------------------------------------------------------------

::

          Never use this function; see BUGS.

          The mktemp() function generates a unique temporary filename from
          template.  The last six characters of template must be XXXXXX and
          these are replaced with a string that makes the filename unique.
          Since it will be modified, template must not be a string
          constant, but should be declared as a character array.


-----------------------------------------------------------------

::

          The mktemp() function always returns template.  If a unique name
          was created, the last six bytes of template will have been
          modified in such a way that the resulting name is unique (i.e.,
          does not exist already) If a unique name could not be created,
          template is made an empty string, and errno is set to indicate
          the error.


-----------------------------------------------------

::

          EINVAL The last six characters of template were not XXXXXX.


-------------------------------------------------------------

::

          For an explanation of the terms used in this section, see
          attributes(7).

          ┌──────────────────────────────────────┬───────────────┬─────────┐
          │Interface                             │ Attribute     │ Value   │
          ├──────────────────────────────────────┼───────────────┼─────────┤
          │mktemp()                              │ Thread safety │ MT-Safe │
          └──────────────────────────────────────┴───────────────┴─────────┘


-------------------------------------------------------------------

::

          4.3BSD, POSIX.1-2001.  POSIX.1-2008 removes the specification of
          mktemp().


-------------------------------------------------

::

          Never use mktemp().  Some implementations follow 4.3BSD and
          replace XXXXXX by the current process ID and a single letter, so
          that at most 26 different names can be returned.  Since on the
          one hand the names are easy to guess, and on the other hand there
          is a race between testing whether the name exists and opening the
          file, every use of mktemp() is a security risk.  The race is
          avoided by mkstemp(3) and mkdtemp(3).


---------------------------------------------------------

::

          mktemp(1), mkdtemp(3), mkstemp(3), tempnam(3), tmpfile(3),
          tmpnam(3)

COLOPHON
---------------------------------------------------------

::

          This page is part of release 5.13 of the Linux man-pages project.
          A description of the project, information about reporting bugs,
          and the latest version of this page, can be found at
          https://www.kernel.org/doc/man-pages/.

   GNU                            2021-03-22                      MKTEMP(3)

--------------

Pages that refer to this page: `mktemp(1) <../man1/mktemp.1.html>`__, 
`mkdtemp(3) <../man3/mkdtemp.3.html>`__, 
`mkstemp(3) <../man3/mkstemp.3.html>`__, 
`pmrecord(3) <../man3/pmrecord.3.html>`__, 
`stdio(3) <../man3/stdio.3.html>`__, 
`tempnam(3) <../man3/tempnam.3.html>`__, 
`tmpfile(3) <../man3/tmpfile.3.html>`__, 
`tmpnam(3) <../man3/tmpnam.3.html>`__

--------------

`Copyright and license for this manual
page <../man3/mktemp.3.license.html>`__

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
