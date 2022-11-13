.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

error::reporting(7stap) — Linux manual page
===========================================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `COMMERCIAL                       |                                   |
|  SUPPORT <#COMMERCIAL_SUPPORT>`__ |                                   |
| \|                                |                                   |
| `COMMUNIT                         |                                   |
| Y SUPPORT <#COMMUNITY_SUPPORT>`__ |                                   |
| \|                                |                                   |
| `INFORMATION TO COL               |                                   |
| LECT <#INFORMATION_TO_COLLECT>`__ |                                   |
| \| `SEE ALSO <#SEE_ALSO>`__ \|    |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   ERROR::REPORTING(7stap)                          ERROR::REPORTING(7stap)

NAME
-------------------------------------------------

::

          error::reporting - systemtap error reporting


-----------------------------------------------------------------------------

::

          If you have a commercial support agreement with your OS
          distributor that covers this software, we recommend getting your
          money's worth by using their problem reporting systems first.


---------------------------------------------------------------------------

::

          Systemtap community & volunteer developers are eager to hear
          problem reports, so they can improve the software.  Various ways
          to contact them include:

          public mailing list
                 systemtap@sourceware.org

          public IRC
                 #systemtap on irc.oftc.net, use fpaste.org for snippets of
                 text

          public bugzilla
                 http://sourceware.org/bugzilla/


-------------------------------------------------------------------------------------

::

          In general, please include information about your platform,
          systemtap version, your scripts & custom tapsets, systemtap
          invocation, actual behavior / errors seen, and expected behavior.
          The stap-report script collects useful system/kernel information
          that helps describe the OS environment; please include its
          output.


---------------------------------------------------------

::

          stap(1),
          stap-report(1),
          http://sourceware.org/systemtap/wiki/ 

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

                                                    ERROR::REPORTING(7stap)

--------------

Pages that refer to this page: `dtrace(1) <../man1/dtrace.1.html>`__, 
`stap(1) <../man1/stap.1.html>`__, 
`error::dwarf(7stap) <../man7/error::dwarf.7stap.html>`__, 
`error::fault(7stap) <../man7/error::fault.7stap.html>`__, 
`error::inode-uprobes(7stap) <../man7/error::inode-uprobes.7stap.html>`__, 
`error::pass1(7stap) <../man7/error::pass1.7stap.html>`__, 
`error::pass2(7stap) <../man7/error::pass2.7stap.html>`__, 
`error::pass3(7stap) <../man7/error::pass3.7stap.html>`__, 
`error::pass4(7stap) <../man7/error::pass4.7stap.html>`__, 
`error::pass5(7stap) <../man7/error::pass5.7stap.html>`__, 
`error::process-tracking(7stap) <../man7/error::process-tracking.7stap.html>`__, 
`error::sdt(7stap) <../man7/error::sdt.7stap.html>`__, 
`warning::buildid(7stap) <../man7/warning::buildid.7stap.html>`__, 
`warning::debuginfo(7stap) <../man7/warning::debuginfo.7stap.html>`__, 
`warning::pass5(7stap) <../man7/warning::pass5.7stap.html>`__, 
`warning::symbols(7stap) <../man7/warning::symbols.7stap.html>`__, 
`stap-exporter(8) <../man8/stap-exporter.8.html>`__

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
