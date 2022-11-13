.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

error::pass1(7stap) — Linux manual page
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

   ERROR::PASS1(7stap)                                  ERROR::PASS1(7stap)

NAME
-------------------------------------------------

::

          error::pass1 - systemtap pass-1 errors


---------------------------------------------------------------

::

          Errors that occur during pass 1 (parsing) usually mean a basic
          syntax error of some sort occurred in the systemtap script.
          There are several classes of problems possible:

          plain syntax error
                 The systemtap script parser detects a large variety of
                 errors, such as missing operands, bad punctuation.  It
                 tries to list what kinds of tokens it was expecting to
                 see, and will show the region of the source code with the
                 problem.  Please review the stap(1) man page and/or the
                 tutorial, to correct the script's syntax.

          grammar ambiguities
                 There is at least one known ambiguity in the systemtap
                 grammar.  It relates to the optionality of ; (semicolon)
                 separators between statements, and the ++ and --
                 increment/decrement operators.  If the parser indicates an
                 error, consider adding some explicit ; separators between
                 nearby statements and try again.

          missing command line arguments
                 A systemtap script that uses the $N and @N constructs for
                 substituting in command-line options may fail if not
                 enough options were given on the stap command line.

          compatibility changes
                 Some versions of systemtap have changed the language
                 incompatibly, for example by adding the try/catch keywords
                 for exception handling.  In such cases, rerun systemtap
                 with the --compatibility=VERSION option, substituting the
                 last systemtap version where your script was known to
                 work.  You may also check the release-history NEWS file
                 for compatibility changes.


---------------------------------------------------------------------------------------------

::

          Increasing the verbosity of pass-1 with an option such as --vp 1
          can help pinpoint the problem.


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

                                                        ERROR::PASS1(7stap)

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
