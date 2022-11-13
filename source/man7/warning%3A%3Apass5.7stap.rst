.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

warning::pass5(7stap) — Linux manual page
=========================================

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

          warning::pass5 - systemtap pass-5 warnings


---------------------------------------------------------------

::

          Warnings that occur during pass 5 (execution) can have a variety
          of causes.

          probe insertion errors
                 With any of the systemtap runtimes, it may be possible
                 that the backends are unable to insert probe points
                 requested by the systemtap script.  For example, you may
                 see errors such as

                 WARNING: probe [...] registration error (rc -524)

                 (524 is a kernel error code for ENOTSUPP).  These
                 situations are out of systemtap's control, and result in
                 some probes not receiving any hits.  This may be caused by
                 temporary resource constraints or permanent problems.  One
                 common permanent problem is such a probe point being
                 placed at instructions that the runtime (kernel kprobes,
                 uprobes or dyninst) cannot decode or intercept.  A
                 possible workaround is to move the probe points slightly
                 in the script, so as to target a nearby statement, or a
                 caller, or a callee.  See also error::dwarf(7stap).


---------------------------------------------------------------------------------------------

::

          Increasing the verbosity of pass-5 with an option such as --vp
          00001 can help pinpoint the problem.


---------------------------------------------------------

::

          stap(1),
          http://sourceware.org/systemtap/wiki/TipExhaustedResourceErrors ,
          error::pass5(7stap),
          error::reporting(7stap)
          error::dwarf(7stap)

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
`error::pass5(7stap) <../man7/error::pass5.7stap.html>`__

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
