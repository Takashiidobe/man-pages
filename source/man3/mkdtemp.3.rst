.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

mkdtemp(3) — Linux manual page
==============================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `RETURN VALUE <#RETURN_VALUE>`__  |                                   |
| \| `ERRORS <#ERRORS>`__ \|        |                                   |
| `VERSIONS <#VERSIONS>`__ \|       |                                   |
| `ATTRIBUTES <#ATTRIBUTES>`__ \|   |                                   |
| `                                 |                                   |
| CONFORMING TO <#CONFORMING_TO>`__ |                                   |
| \| `SEE ALSO <#SEE_ALSO>`__ \|    |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   MKDTEMP(3)              Linux Programmer's Manual             MKDTEMP(3)

NAME
-------------------------------------------------

::

          mkdtemp - create a unique temporary directory


---------------------------------------------------------

::

          #include <stdlib.h>

          char *mkdtemp(char *template);

      Feature Test Macro Requirements for glibc (see
      feature_test_macros(7)):

          mkdtemp():
              /* Since glibc 2.19: */ _DEFAULT_SOURCE
                  || /* Glibc 2.19 and earlier: */ _BSD_SOURCE
                  || /* Since glibc 2.10: */ _POSIX_C_SOURCE >= 200809L


---------------------------------------------------------------

::

          The mkdtemp() function generates a uniquely named temporary
          directory from template.  The last six characters of template
          must be XXXXXX and these are replaced with a string that makes
          the directory name unique.  The directory is then created with
          permissions 0700.  Since it will be modified, template must not
          be a string constant, but should be declared as a character
          array.


-----------------------------------------------------------------

::

          The mkdtemp() function returns a pointer to the modified template
          string on success, and NULL on failure, in which case errno is
          set to indicate the error.


-----------------------------------------------------

::

          EINVAL The last six characters of template were not XXXXXX.  Now
                 template is unchanged.

          Also see mkdir(2) for other possible values for errno.


---------------------------------------------------------

::

          Available since glibc 2.1.91.


-------------------------------------------------------------

::

          For an explanation of the terms used in this section, see
          attributes(7).

          ┌──────────────────────────────────────┬───────────────┬─────────┐
          │Interface                             │ Attribute     │ Value   │
          ├──────────────────────────────────────┼───────────────┼─────────┤
          │mkdtemp()                             │ Thread safety │ MT-Safe │
          └──────────────────────────────────────┴───────────────┴─────────┘


-------------------------------------------------------------------

::

          POSIX.1-2008.  This function is present on the BSDs.


---------------------------------------------------------

::

          mktemp(1), mkdir(2), mkstemp(3), mktemp(3), tempnam(3),
          tmpfile(3), tmpnam(3)

COLOPHON
---------------------------------------------------------

::

          This page is part of release 5.13 of the Linux man-pages project.
          A description of the project, information about reporting bugs,
          and the latest version of this page, can be found at
          https://www.kernel.org/doc/man-pages/.

   GNU                            2021-03-22                     MKDTEMP(3)

--------------

Pages that refer to this page: `mktemp(1) <../man1/mktemp.1.html>`__, 
`mkstemp(3) <../man3/mkstemp.3.html>`__, 
`mktemp(3) <../man3/mktemp.3.html>`__, 
`file-hierarchy(7) <../man7/file-hierarchy.7.html>`__

--------------

`Copyright and license for this manual
page <../man3/mkdtemp.3.license.html>`__

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
