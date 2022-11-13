.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

cgcc(1) — Linux manual page
===========================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `ENVIRONMENT <#ENVIRONMENT>`__ \| |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   cgcc(1)                  General Commands Manual                 cgcc(1)

NAME
-------------------------------------------------

::

          cgcc - Compiler wrapper to run Sparse after compiling


---------------------------------------------------------

::

          cgcc [SPARSE OPTIONS]... [COMPILER OPTIONS]... [INPUT FILES]...
          make CC=cgcc


---------------------------------------------------------------

::

          cgcc provides a wrapper around a C compiler (cc by default) which
          also invokes the Sparse static analysis tool.

          cgcc accepts all Sparse command-line options, such as warning
          options, and passes all other options through to the compiler.

          By providing the same interface as the C compiler, cgcc allows
          projects to run Sparse as part of their build without modifying
          their build system, by using cgcc as the compiler.  For many
          projects, setting CC=cgcc on the make command-line will work.


---------------------------------------------------------------

::

          REAL_CC
                 If set, cgcc will use this as the compiler to invoke,
                 rather than the default cc.

          CHECK  If set, cgcc will use this as the Sparse program to
                 invoke, rather than the default sparse.


---------------------------------------------------------

::

          sparse(1)

COLOPHON
---------------------------------------------------------

::

          This page is part of the sparse (a Semantic Parser for C)
          project.  Information about the project can be found at 
          ⟨https://sparse.wiki.kernel.org/⟩.  If you have a bug report for
          this manual page, send it to linux-sparse@vger.kernel.org.  This
          page was obtained from the project's upstream Git repository
          ⟨https://git.kernel.org/pub/scm/devel/sparse/sparse.git⟩ on
          2021-08-27.  (At that time, the date of the most recent commit
          that was found in the repository was 2021-08-02.)  If you
          discover any rendering problems in this HTML version of the page,
          or you believe there is a better or more up-to-date source for
          the page, or you have corrections or improvements to the
          information in this COLOPHON (which is not part of the original
          manual page), send a mail to man-pages@man7.org

                                                                    cgcc(1)

--------------

Pages that refer to this page: `sparse(1) <../man1/sparse.1.html>`__

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
