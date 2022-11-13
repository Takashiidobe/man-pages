.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

pcre_assign_jit_stack(3) — Linux manual page
============================================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   PCRE_ASSIGN_JIT_STACK(3)Library Functions ManualPCRE_ASSIGN_JIT_STACK(3)

NAME
-------------------------------------------------

::

          PCRE - Perl-compatible regular expressions


---------------------------------------------------------

::


          #include <pcre.h>

          void pcre_assign_jit_stack(pcre_extra *extra,
               pcre_jit_callback callback, void *data);

          void pcre16_assign_jit_stack(pcre16_extra *extra,
               pcre16_jit_callback callback, void *data);

          void pcre32_assign_jit_stack(pcre32_extra *extra,
               pcre32_jit_callback callback, void *data);


---------------------------------------------------------------

::


          This function provides control over the memory used as a stack at
          run-time by a call to pcre[16|32]_exec() with a pattern that has
          been successfully compiled with JIT optimization. The arguments
          are:

            extra     the data pointer returned by pcre[16|32]_study()
            callback  a callback function
            data      a JIT stack or a value to be passed to the callback
                        function

          If callback is NULL and data is NULL, an internal 32K block on
          the machine stack is used.

          If callback is NULL and data is not NULL, data must be a valid
          JIT stack, the result of calling pcre[16|32]_jit_stack_alloc().

          If callback not NULL, it is called with data as an argument at
          the start of matching, in order to set up a JIT stack. If the
          result is NULL, the internal 32K stack is used; otherwise the
          return value must be a valid JIT stack, the result of calling
          pcre[16|32]_jit_stack_alloc().

          You may safely assign the same JIT stack to multiple patterns, as
          long as they are all matched in the same thread. In a multithread
          application, each thread must use its own JIT stack. For more
          details, see the pcrejit page.

          There is a complete description of the PCRE native API in the
          pcreapi page and a description of the POSIX API in the pcreposix
          page.

COLOPHON
---------------------------------------------------------

::

          This page is part of the PCRE (Perl Compatible Regular
          Expressions) project.  Information about the project can be found
          at ⟨http://www.pcre.org/⟩.  If you have a bug report for this
          manual page, see
          ⟨http://bugs.exim.org/enter_bug.cgi?product=PCRE⟩.  This page was
          obtained from the tarball pcre-8.45.tar.gz fetched from
          ⟨ftp://ftp.csx.cam.ac.uk/pub/software/programming/pcre/⟩ on
          2021-08-27.  If you discover any rendering problems in this HTML
          version of the page, or you believe there is a better or more up-
          to-date source for the page, or you have corrections or
          improvements to the information in this COLOPHON (which is not
          part of the original manual page), send a mail to
          man-pages@man7.org

   PCRE 8.30                     24 June 2012      PCRE_ASSIGN_JIT_STACK(3)

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
