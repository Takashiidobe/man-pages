.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

error::dwarf(7stap) — Linux manual page
=======================================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `ALTERNATIVES <#ALTERNATIVES>`__  |                                   |
| \| `SEE ALSO <#SEE_ALSO>`__ \|    |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   ERROR::DWARF(7stap)                                  ERROR::DWARF(7stap)

NAME
-------------------------------------------------

::

          error::dwarf - dwarf debuginfo quality problems


---------------------------------------------------------------

::

          Systemtap sometimes relies on ELF/DWARF debuginfo for programs
          being instrumented to locate places to probe, or context
          variables to read/write, just like a symbolic debugger does.
          Even though examination of the program's source code may show
          variables or lines where probes may be desired, the compiler must
          preserve information about them for systemtap (or a debugger such
          as gdb) to get pinpoint access to the desired information.  If a
          script requires such data, but the compiler did not preserve
          enough of it, pass-2 errors may result.

          Common conditions that trigger these problems include:

          debuginfo missing or mismatching
                 Sometimes debuginfo is installed, but does not match the
                 binaries being probed.  See the warning::debuginfo man
                 page for more help for locating correct debuginfo.

          compiler version
                 Prior to GCC version 4.5, debuginfo quality was fairly
                 limited.  Often developers were advised to build their
                 programs with -O0 -g flags to disable optimization.  GCC
                 version 4.5 introduced a facility called "variable-
                 tracking assignments" that allows it to generate high-
                 quality debuginfo under full -O2 -g optimization.  It is
                 not perfect, but much better than before.  Note that, due
                 to another gcc bug (PR51358) -O0 -g can actually sometimes
                 make debuginfo quality worse than for -O2 -g.

                 Another related problem involves debuginfo quality for the
                 prologue area of a function (PR15123), wherein a program
                 compiled with CFLAGS=-mfentry (especially the kernel, for
                 ftrace) may lack accurate debuginfo for the entry
                 instructions for gcc prior to version 4.8.  If able,
                 arrange to compile your programs with -grecord-gcc-
                 switches CFLAGS, and/or try rerunning systemtap with
                 $PR15123_ASSUME_MFENTRY=1.

          linux kbuild damaging debuginfo quality
                 An upstream kernel commit #2062afb4f804a put
                 -fno-var-tracking-assignments into KCFLAGS, dramatically
                 reducing debuginfo quality, which can cause debuginfo
                 failures. The simplest fix is to erase, excise, nay,
                 eradicate this line from the top level linux Makefile:

                 KBUILD_CFLAGS += [...] -fno-var-tracking-assignments [...]

          function inlining
                 Even modern gcc sometimes has problems with parameters for
                 inlined functions.  It may be necessary to change the
                 script to probe at a slightly different place.  Try a
                 .statement() probe, instead of a .function() probe,
                 somewhere a few source lines into the body of the inlined
                 function.  Or try putting a probe at the call site of the
                 inlined function.  Or use the if @defined($var) { ... }
                 script language construct to test for the resolvability of
                 the context variable before using it.

          instruction reordering
                 Heavily optimized code often smears the instructions from
                 multiple source statements together.  This can leave
                 systemtap with no place to choose to place a probe,
                 especially a statement probe specified by line number.
                 Systemtap may advise to try a nearby line number, but
                 these may not work well either.  Consider placing a probe
                 by a statement wildcard or line number range.

          elfutils configuration
                 It is possible that the DWARF debuginfo being sought is
                 available, but not in a format acceptable to the copy of
                 elfutils used by systemtap.  For example, your copy of gcc
                 might produce compressed debuginfo (.zdebug_* ELF sections
                 or .xz files) while your copy of elfutils might lack
                 appropriate decompression capabilities.  Unfortunately,
                 there is no easy way to tell if this is the problem.  If
                 you're building your own copy of elfutils, ensure all
                 decompression library headers/libraries are available at
                 build time.

          debuginfo configuration
                 Some tools may generate debuginfo that is unsupported by
                 systemtap, such as the linux kernel
                 CONFIG_DEBUG_INFO_SPLIT (.dwo files) option.  Stick with
                 plain ELF/DWARF (optinally split, Fedora-style), if
                 possible.


-----------------------------------------------------------------

::

          In order to reduce reliance on ELF/DWARF debuginfo, consider the
          use of statically compiled-in instrumentation, such as kernel
          tracepoints, or <sys/sdt.h> userspace markers.  Such
          instrumentation hook sites are relatively low cost (just one NOP
          instruction for sdt.h), and nearly guarantee the availability of
          parameter data and a reliable probe site, all without reliance on
          debuginfo.


---------------------------------------------------------

::

          stap(1),
          http://dwarfstd.org/ ,
          http://sourceware.org/systemtap/wiki/TipContextVariables ,
          http://gcc.gnu.org/wiki/Var_Tracking_Assignments ,
          warning::debuginfo(7stap),
          warning::buildid(7stap),
          error::reporting(7stap)

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

                                                        ERROR::DWARF(7stap)

--------------

Pages that refer to this page:
`error::pass2(7stap) <../man7/error::pass2.7stap.html>`__, 
`error::sdt(7stap) <../man7/error::sdt.7stap.html>`__, 
`warning::debuginfo(7stap) <../man7/warning::debuginfo.7stap.html>`__, 
`warning::pass5(7stap) <../man7/warning::pass5.7stap.html>`__, 
`warning::symbols(7stap) <../man7/warning::symbols.7stap.html>`__

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
