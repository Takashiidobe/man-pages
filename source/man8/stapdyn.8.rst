.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

stapdyn(8) — Linux manual page
==============================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `OPTIONS <#OPTIONS>`__ \|         |                                   |
| `ARGUMENTS <#ARGUMENTS>`__ \|     |                                   |
| `EXAMPLES <#EXAMPLES>`__ \|       |                                   |
| `SAFETY AND S                     |                                   |
| ECURITY <#SAFETY_AND_SECURITY>`__ |                                   |
| \| `SEE ALSO <#SEE_ALSO>`__ \|    |                                   |
| `BUGS <#BUGS>`__ \|               |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   STAPDYN(8)               System Manager's Manual              STAPDYN(8)

NAME
-------------------------------------------------

::

          stapdyn - systemtap dyninst runtime


---------------------------------------------------------

::

          stapdyn [ OPTIONS ] MODULE [ MODULE-OPTIONS ]


---------------------------------------------------------------

::

          The stapdyn program is the dyninst back-end of the Systemtap
          tool.  It expects a shared library produced by the front-end stap
          tool, when run with --dyninst.

          Splitting the systemtap tool into a front-end and a back-end
          allows a user to compile a systemtap script on a development
          machine that has the debugging information (need to compile the
          script) and then transfer the resulting shared object to a
          production machine that doesn't have any development tools or
          debugging information installed.

          Please refer to stappaths (7) for the version number, or run rpm
          -q systemtap (fedora/red hat) apt-get -v systemtap (ubuntu)


-------------------------------------------------------

::

          The stapdyn program supports the following options.  Any other
          option prints a list of supported options.

          -v     Verbose mode.

          -V     Print version number and exit.

          -w     Suppress warnings from the script.

          -c CMD Command CMD will be run and the stapdyn program will exit
                 when CMD does.  The '_stp_target' variable will contain
                 the pid for CMD.

          -x PID The '_stp_target' variable will be set to PID.

          -o FILE
                 Send output to FILE. If the module uses bulk mode, the
                 output will be in percpu files FILE_x(FILE_cpux in
                 background and bulk mode) where 'x' is the cpu number.
                 This supports strftime(3) formats for FILE.

          -C WHEN
                 Control coloring of error messages. WHEN must be either
                 "never", "always", or "auto" (i.e. enable only if at a
                 terminal). If the option is missing, then "auto" is
                 assumed. Colors can be modified using the SYSTEMTAP_COLORS
                 environment variable. See the stap(1) manual page for more
                 information on syntax and behaviour.

          var1=val
                 Sets the value of global variable var1 to val. Global
                 variables contained within a script are treated as options
                 and can be set from the stapdyn command line.


-----------------------------------------------------------

::

          MODULE is either a module path or a module name.  If it is a
          module name, the module will be looked for in the following
          directory (where 'VERSION' is the output of "uname -r"):

                 /lib/modules/VERSION/systemtap

           $ stap --dyninst -p4 -m mod1 -e 'global var1="foo"; probe
          begin{printf("%s\n", var1); exit()}'

          Running this with an additional module argument:

           $ stapdyn mod1.so var1="HelloWorld"
           HelloWorld

          Spaces and exclamation marks currently cannot be passed into
          global variables this way.


---------------------------------------------------------

::

          See the stapex(3stap) manual page for a collection of sample
          scripts.

          Here is a very basic example of how to use stapdyn.  First, use
          stap to compile a script.  The stap program will report the
          pathname to the resulting module.

           $ stap --dyninst -p4 -e 'probe begin { printf("Hello World!\n");
          exit() }'
           /home/user/.systemtap/cache/85/stap_8553d83f78c_265.so

          Run stapdyn with the pathname to the module as an argument.

           $ stapdyn /home/user/.systemtap/cache/85/stap_8553d83f78c_265.so
           Hello World!


-------------------------------------------------------------------------------

::

          Systemtap, in DynInst mode, is a developer tool, and runs
          completely unprivileged.  The Linux kernel will only permit one's
          own processes to be accessed, which is enforced by the ptrace(2)
          system call.  See the stap(1) manual page for additional
          information on safety and security.


---------------------------------------------------------

::

          stap(1), stapprobes(3stap), stap-server(8), staprun(8),
          stapex(3stap)


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

                                                                 STAPDYN(8)

--------------

Pages that refer to this page: `stap(1) <../man1/stap.1.html>`__, 
`staprun(8) <../man8/staprun.8.html>`__

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
