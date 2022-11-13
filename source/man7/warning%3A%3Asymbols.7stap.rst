.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

warning::symbols(7stap) — Linux manual page
===========================================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   WARNING::SYMBOLS(7stap)                          WARNING::SYMBOLS(7stap)

NAME
-------------------------------------------------

::

          warning::symbols - systemtap missing-symbols warnings


---------------------------------------------------------------

::

          For some probing operations, where DWARF debugging data is not
          available, systemtap needs ELF symbols for the relevant binaries.
          This allows at least probe addresses to be calculated, some
          variables resolved, and with @cast() and headers, maybe even some
          types.

          kernel symbol table
                 Systemtap may need a linux-build style System.map file to
                 find addresses of kernel functions/data.  It may be
                 possible to create it by hand:

                 % su
                 # cp /proc/kallsyms /boot/System.map-`uname -r`
                 or
                 # nm /lib/modules/`uname -r`/build/vmlinux > /boot/System.map-`uname -r`

          minisymbols
                 On some systems, binaries may be compiled with a subset of
                 symbols useful for function tracing and backtraces.  This
                 'Minisymbols' is a xz compressed section labeled
                 .gnu_debugdata.  Support for minisymbols relies on
                 elfutils version 0.156 or later.

          compressed symbols
                 On some systems, symbols may be available, but compressed
                 into .zdebug_* sections.  Support for compressed symbols
                 relies on elfutils version 0.153 or later.


---------------------------------------------------------

::

          stap(1),
          stappaths(7),
          strip(1),
          warning::debuginfo(7stap),
          error::dwarf(7stap),
          error::reporting(7stap),
          http://fedoraproject.org/wiki/Features/MiniDebugInfo 

COLOPHON
---------------------------------------------------------

::

          This page is part of the systemtap (a tracing and live-system
          analysis tool) project.  Information about the project can be
          found at ⟨https://sourceware.org/systemtap/⟩.  If you have a bug
          report for this manual page, send it to systemtap@sourceware.org.
          This page was obtained from the project's upstream Git repository
          ⟨git://sourceware.org/git/systemtap.git⟩ on 2021-08-27.  (At that
          time, the date of the most recent commit that was found in the
          repository was 2021-08-26.)  If you discover any rendering
          problems in this HTML version of the page, or you believe there
          is a better or more up-to-date source for the page, or you have
          corrections or improvements to the information in this COLOPHON
          (which is not part of the original manual page), send a mail to
          man-pages@man7.org

                                                    WARNING::SYMBOLS(7stap)

--------------

Pages that refer to this page:
`warning::debuginfo(7stap) <../man7/warning::debuginfo.7stap.html>`__

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
