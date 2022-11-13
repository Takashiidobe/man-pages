.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

stapbpf(8) — Linux manual page
==============================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `OPTIONS <#OPTIONS>`__ \|         |                                   |
| `ARGUMENTS <#ARGUMENTS>`__ \|     |                                   |
| `EXAMPLES <#EXAMPLES>`__ \|       |                                   |
| `LIMITATIONS <#LIMITATIONS>`__ \| |                                   |
| `SAFETY AND S                     |                                   |
| ECURITY <#SAFETY_AND_SECURITY>`__ |                                   |
| \| `SEE ALSO <#SEE_ALSO>`__ \|    |                                   |
| `BUGS <#BUGS>`__ \|               |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   STAPBPF(8)               System Manager's Manual              STAPBPF(8)

NAME
-------------------------------------------------

::

          stapbpf - systemtap bpf runtime


---------------------------------------------------------

::

          stapbpf [ OPTIONS ] MODULE


---------------------------------------------------------------

::

          The stapbpf program is the BPF back-end of the Systemtap tool.
          It expects a bpf-elf file produced by the front-end stap tool,
          when run with --runtime=bpf.

          Splitting the systemtap tool into a front-end and a back-end
          allows a user to compile a systemtap script on a development
          machine that has the debugging information needed to compile the
          script and then transfer the resulting shared object to a
          production machine that doesn't have any development tools or
          debugging information installed.

          Please refer to stappaths(7) for the version number, or run

           $ rpm -q systemtap # (for Fedora/RHEL)
           $ apt-get -v systemtap # (for Ubuntu)


-------------------------------------------------------

::

          The stapbpf program supports the following options.  Any other
          option prints a list of supported options.

          -v     Verbose mode.

          -V     Print version number and exit.

          -w     Suppress warnings from the script.

          -h     Print help message.

          -x PID The '_stp_target' variable will be set to PID.

          -o FILE
                 Send output to FILE.


-----------------------------------------------------------

::

          MODULE is the path of a bpf-elf file produced by the front-end
          stap tool, when run with --runtime=bpf.


---------------------------------------------------------

::

          Here is a very basic example of how to generate a stapbpf module.
          First, use stap to compile a script.  The stap program will
          report the name of the resulting module in the current working
          directory.

           $ stap --runtime=bpf -p4 -e 'probe begin { printf("Hello
          World!\n"); exit() }'
           stap_28784.bo

          Run stapbpf with the pathname to the module as an argument.

           $ stapbpf ./stap_28784.bo
           Hello World!

          If the -p4 option is omitted, stap will invoke stapbpf
          automatically.


---------------------------------------------------------------

::

          This runtime is in an early stage of development and it currently
          lacks support for a number of features available in the default
          runtime.  A subset of the following probe points is supported:

                 begin
                 end
                 kernel.*
                 process.*
                 timer.*
                 perf.*
                 procfs.*

          In general, probes based on the kprobes, uprobes, tracepoint and
          perf infrastructures are supported. See stapprobes(3stap) for
          more information on the probe points and which tracing
          infrastructures they are based on.

          for loops, foreach loops and while loops are usable only in begin
          and end probes.  try statements are not supported.

          There is limited support for string operations. String variables
          and literals are limited to 64 characters, except for printf
          format strings, which are limited to 256 characters.

          A subset of the statistical aggregate functionality is available,
          with support only for the @count(), @sum(), @avg() extractor
          functions.

          The name of the bpf-elf file produced by the front-end stap tool
          should not be changed.


-------------------------------------------------------------------------------

::

          See the stap(1) manual page for additional information on safety
          and security.


---------------------------------------------------------

::

          stap(1), stapprobes(3stap), staprun(8), stapex(3stap)


-------------------------------------------------

::

          Use the Bugzilla link of the project web page or our mailing
          list.  http://sourceware.org/systemtap/ ,
          <systemtap@sourceware.org>.

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

                                                                 STAPBPF(8)

--------------

Pages that refer to this page: `stap(1) <../man1/stap.1.html>`__

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
