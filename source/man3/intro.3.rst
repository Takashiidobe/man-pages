.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

intro(3) — Linux manual page
============================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `                                 |                                   |
| CONFORMING TO <#CONFORMING_TO>`__ |                                   |
| \| `NOTES <#NOTES>`__ \|          |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   INTRO(3)                Linux Programmer's Manual               INTRO(3)

NAME
-------------------------------------------------

::

          intro - introduction to library functions


---------------------------------------------------------------

::

          Section 3 of the manual describes all library functions excluding
          the library functions (system call wrappers) described in Section
          2, which implement system calls.

          Many of the functions described in the section are part of the
          Standard C Library (libc).  Some functions are part of other
          libraries (e.g., the math library, libm, or the real-time
          library, librt) in which case the manual page will indicate the
          linker option needed to link against the required library (e.g.,
          -lm and -lrt, respectively, for the aforementioned libraries).

          In some cases, the programmer must define a feature test macro in
          order to obtain the declaration of a function from the header
          file specified in the man page SYNOPSIS section.  (Where
          required, these feature test macros must be defined before
          including any header files.)  In such cases, the required macro
          is described in the man page.  For further information on feature
          test macros, see feature_test_macros(7).


-------------------------------------------------------------------

::

          Certain terms and abbreviations are used to indicate UNIX
          variants and standards to which calls in this section conform.
          See standards(7).


---------------------------------------------------

::

      Authors and copyright conditions
          Look at the header of the manual page source for the author(s)
          and copyright conditions.  Note that these can be different from
          page to page!


---------------------------------------------------------

::

          intro(2), errno(3), capabilities(7), credentials(7), environ(7),
          feature_test_macros(7), libc(7), math_error(7),
          path_resolution(7), pthreads(7), signal(7), standards(7),
          system_data_types(7)

COLOPHON
---------------------------------------------------------

::

          This page is part of release 5.13 of the Linux man-pages project.
          A description of the project, information about reporting bugs,
          and the latest version of this page, can be found at
          https://www.kernel.org/doc/man-pages/.

   Linux                          2020-11-01                       INTRO(3)

--------------

Pages that refer to this page: `intro(2) <../man2/intro.2.html>`__

--------------

`Copyright and license for this manual
page <../man3/intro.3.license.html>`__

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
