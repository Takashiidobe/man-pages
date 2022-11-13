.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

error::pass4(7stap) — Linux manual page
=======================================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   ERROR::PASS4(7stap)                                  ERROR::PASS4(7stap)

NAME
-------------------------------------------------

::

          error::pass4 - systemtap pass-4 errors


---------------------------------------------------------------

::

          Errors that occur during pass 4 (compilation) have generally only
          a few causes:

          kernel or OS version changes
                 The systemtap runtime and embedded-C fragments in the
                 tapset library are designed to be portable across a wide
                 range of OS versions.  However, incompatibilities can
                 occur when some OS changes occur, such as kernel
                 modifications that change functions, types, or macros
                 referenced by systemtap.  Upstream
                 (git://sourceware.org/git/systemtap.git) builds of
                 systemtap are often quickly updated to include relevant
                 fixes, so try getting or making an updated build.
                 Reworded: build systemtap from git for use with very young
                 kernels.  If the issue persists, report the problem to the
                 systemtap developers.

          buggy embedded-C code
                 Embedded-C code in your own guru-mode script cannot be
                 checked by systemtap, and is passed through verbatim to
                 the compiler.  Errors in such snippets of code may be
                 found during the pass-4 compiler invocation, though may be
                 hard to identify by the compiler errors.

          incompatible embedded-C code
                 The interface standards between systemtap-generated code
                 and embedded-C code occasionally change.  For example,
                 before version 1.8, arguments were passed using macros
                 THIS->foo and THIS->__retvalue but from version 1.8
                 onward, using STAP_ARG_foo and STAP_RETVALUE.  Adjust your
                 embedded-C code to current standards, or use the stap
                 --compatible=VERSION option to make systemtap use a
                 different one.

          compiler bugs and mysteries
                 Messages such as "internal compiler error" suggest
                 compiler problems.  These should be reported to the
                 compiler developers in the form of a preprocessed .i file,
                 plus the compiler command line.  To gather relevant
                 information, run

                 stap -k --vp 0003 -p4 ....

                 Systemtap will report the saved temporary directory, and
                 the compiler command line it attempted.  Go to the
                 directory to find he main generated file stap_NNNNN_src.c.
                 Force the compiler to produce a preprocessed file with:

                 make -C /lib/modules/`uname -r`/build M=`pwd` stap_NNNNN_src.i

                 (note the .i suffix), and the compiler command line should
                 be in the file .stap_NNNNN_src.i.cmd.


---------------------------------------------------------

::

          stap(1),
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

                                                        ERROR::PASS4(7stap)

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
