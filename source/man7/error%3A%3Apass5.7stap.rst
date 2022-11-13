.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

error::pass5(7stap) — Linux manual page
=======================================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `GATHERING MORE INFORMATION       |                                   |
|  <#GATHERING_MORE_INFORMATION>`__ |                                   |
| \| `SEE ALSO <#SEE_ALSO>`__ \|    |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   ERROR::PASS5(7stap)                                  ERROR::PASS5(7stap)

NAME
-------------------------------------------------

::

          error::pass5 - systemtap pass-5 errors


---------------------------------------------------------------

::

          Errors that occur during pass 5 (execution) can have a variety of
          causes.

          exceptional events during script execution
                 The systemtap translator and runtime include numerous
                 error checks that aim to protect the systems and the users
                 from mistakes or transient conditions.  The script may
                 deliberately call the error() tapset function to signal a
                 problem.  Some memory needed for accessing $context
                 variables may be temporarily unavailable.  Consider using
                 the try/catch construct to wrap script fragments in
                 exception-handling code.  Consider using the stap
                 --suppress-handler-errors or stap --skip-badvars option.

          resource exhaustion
                 One of several types of space or time resource limits may
                 be exceeded by the script, including system overload, too
                 many tuples to be stored in an array, etc.  Some of the
                 error messages identify the constraint by macro name,
                 which may be individually raised.  Consider using the stap
                 --suppress-handler-errors and/or stap -g --suppress-time-
                 limits options.  Extend or disable individual resource
                 limits using the stap -DSOME_LIMIT=NNNN option.  The stap
                 -t option may identify those probes that are taking too
                 long.

          remote execution server problems
                 If you use the stap --remote option to direct a systemtap
                 script to be executed somewhere else, ensure that an SSH
                 connection may be made to the remote host, and that it has
                 the current systemtap runtime installed & available.

          installation/permission problems
                 It is possible that your copy of systemtap was not
                 correctly installed.  For example, the /usr/bin/staprun
                 program may lack the necessary setuid permissions, or your
                 invoking userid might not have sufficient privileges
                 (root, or stapusr and related group memberships).
                 Environment variables may interfere with locating
                 /usr/libexec/.../stapio.

          security configuration
                 SecureBoot or other module signing machinery may be in
                 effect, preventing .ko module loading.  A local or remote
                 stap-server service would be necessary to securely manage
                 keys.  This situation is detected automatically on most
                 kernels, but on some, the SYSTEMTAP_SIGN environment
                 varible may have to be set to trigger this extra signing-
                 related processing.

                 The normal kernel-module based systemtap backend may be
                 more than your script requires.  Try stap --runtime=bpf
                 and/or stap --runtime=dyninst backends.  Though they have
                 inherent limitations, they operate with lesser privileges
                 and perceived risks.

                 It may be possible to disable secure/lockdown measures
                 temporarily with the SysRQ+x keystroke, or permanently
                 with sudo mokutil --disable-validation and a reboot.

          errors from target program
                 The program invoked by the stap -c CMD option may exit
                 with a non-zero code.

          uncaught exceptions in the target program
                 When using --runtime=dyninst you may encounter an issue
                 where the target program aborts with a message like
                 "terminate called after throwing an instance of
                 'foo_exception'".  This is unfortunately a limitation of
                 Dyninst, which sometimes prevents exceptions from properly
                 unwinding through instrumented code.


---------------------------------------------------------------------------------------------

::

          Increasing the verbosity of pass-5 with an option such as --vp
          00001 can help pinpoint the problem.


---------------------------------------------------------

::

          stap(1),
          http://sourceware.org/systemtap/wiki/TipExhaustedResourceErrors ,
          error::fault(7stap),
          error::reporting(7stap)
          warning::pass5(7stap)

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

                                                        ERROR::PASS5(7stap)

--------------

Pages that refer to this page:
`warning::pass5(7stap) <../man7/warning::pass5.7stap.html>`__

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
