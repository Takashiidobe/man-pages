.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

warning::debuginfo(7stap) — Linux manual page
=============================================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `OTHER                            |                                   |
| AUTOMATION <#OTHER_AUTOMATION>`__ |                                   |
| \| `SEE ALSO <#SEE_ALSO>`__ \|    |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   WARNING::DEBUGINFO(7stap)                      WARNING::DEBUGINFO(7stap)

NAME
-------------------------------------------------

::

          warning::debuginfo - systemtap missing-debuginfo warnings


---------------------------------------------------------------

::

          For many symbolic probing operations, systemtap needs DWARF
          debuginfo for the relevant binaries.  This often includes
          resolving function/statement probes, or $context variables in
          related handlers.  DWARF debuginfo is created by the compiler
          when using CFLAGS -g, and may be found in the original binaries
          built during compilation, or may have been split into separate
          files.  The SYSTEMTAP_DEBUGINFO_PATH environment variable affects
          where systemtap looks for these files.

          If your operating system came from a distributor, check with them
          if debuginfo packages or variants are available.  If your
          distributor does not have debuginfo-equipped binaries at all, you
          may need to rebuild it.

          Systemtap uses the elfutils library to process ELF/DWARF files.
          The version of elfutils used by systemtap is the number after the
          slash in the -V output:

                 % stap -V
                 Systemtap translator/driver (version 4.2/0.178, rpm 4.2-1.fc30)
                 Copyright (C) 2005-2019 Red Hat, Inc. and others
                 [...]

          This indicates systemtap version 4.2 with elfutils version 0.178.

          New enough versions of elfutils (0.178+) enable systemtap to
          automatically download correct debuginfo from servers run by you,
          your organization, and/or someone on the public internet.  Try:

                 % export DEBUGINFOD_URLS=https://debuginfod.elfutils.org/
                 % export DEBUGINFOD_PROGRESS=1   # for progress messages, if you like

          and rerun systemtap.  It might just work.  If it doesn't, read
          on.

          kernel debuginfo
                 For scripts that target the kernel, systemtap may search
                 for the vmlinux file created during its original build.
                 This is distinct from the boot-loader's
                 compressed/stripped vmlinuz file, and much larger.  If you
                 have a hand-built kernel, make sure it was built with the
                 CONFIG_DEBUG_INFO=y option.  Some Linux distributions may
                 include several kernel variants, including a confusingly
                 named kernel-debug (an alternative kernel, with its own
                 kernel-debug-debuginfo package), which is not the same
                 thing as the kernel-debuginfo (DWARF data for the base
                 kernel).  The stap-prep program can help install the right
                 set.

          process debuginfo
                 For scripts that target user-space, systemtap may search
                 for debuginfo.  If you have hand-built binaries, use
                 CFLAGS=-g -O2 to compile them.

          minidebuginfo
                 On some systems, binaries may be compiled with a subset of
                 debuginfo useful for function tracing and backtraces.
                 This 'Minidebuginfo' is a xz compressed section labeled
                 .gnu_debugdata.  Support for minidebuginfo relies on
                 elfutils version 0.156 or later.

          compressed debuginfo
                 On some systems, debuginfo may be available, but
                 compressed into .zdebug_* sections.  Support for
                 compressed debuginfo relies on elfutils version 0.153 or
                 later.

          unnecessary debuginfo
                 In some cases, a script may be altered to avoid requiring
                 debuginfo.  For example, as script that uses probe
                 syscall.*  probes could try instead probe nd_syscall.*
                 (for non-DWARF syscall): these work similarly, and use
                 more intricate (fragile) tapset functions to extract
                 system call arguments.  Another option is use of compiled-
                 in instrumentation such as kernel tracepoints or user-
                 space <sys/sdt.h> markers in libraries or executables,
                 which do not require debuginfo.  If debuginfo was required
                 for resolving a complicated $var->foo->bar expression, it
                 may be possible to use @cast(var,"foo","foo.h")->foo->bar
                 to synthesize debuginfo for that type from a header file.


-------------------------------------------------------------------------

::

          On some platforms, systemtap may advise what commands to run, in
          order to download needed debuginfo.  Another possibility is to
          invoke systemtap with the --download-debuginfo flag, which uses
          ABRT.  The stap-prep script included with systemtap may be able
          to download the appropriate kernel debuginfo.  Another
          possibility is to install and use a stap-server remote-
          compilation instance on a machine on your network, where
          debuginfo and compilation resources can be centralized.  Try the
          stap --use-server option, in case such a server is already
          running.


---------------------------------------------------------

::

          gcc(1),
          stap(1),
          stappaths(7),
          stap-server(8),
          stap-prep(1),
          strip(1),
          warning::symbols(7stap),
          error::dwarf(7stap),
          error::reporting(7stap),
          error::contextvars(7stap),
          debuginfod(8),
          http://elfutils.org/ ,
          https://sourceware.org/elfutils/Debuginfod.html ,
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

                                                  WARNING::DEBUGINFO(7stap)

--------------

Pages that refer to this page:
`error::dwarf(7stap) <../man7/error::dwarf.7stap.html>`__, 
`error::pass2(7stap) <../man7/error::pass2.7stap.html>`__, 
`warning::buildid(7stap) <../man7/warning::buildid.7stap.html>`__, 
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
