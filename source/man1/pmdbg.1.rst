.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

pmdbg(1) — Linux manual page
============================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `OPTIONS <#OPTIONS>`__ \|         |                                   |
| `PCP                              |                                   |
| ENVIRONMENT <#PCP_ENVIRONMENT>`__ |                                   |
| \| `SEE ALSO <#SEE_ALSO>`__ \|    |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   PMDBG(1)                 General Commands Manual                PMDBG(1)

NAME
-------------------------------------------------

::

          pmdbg - report Performance Co-Pilot debug options


---------------------------------------------------------

::

          pmdbg code ...
          pmdbg -l [-o] [-g]
          pmdbg -D name[,name ...]


---------------------------------------------------------------

::

          The components of the Performance Co-Pilot (PCP) use a global
          mechanism to control diagnostic and debug output.  Historically
          this was a vector of bit-fields but this was later replaced by an
          array of debug options.  All of the bit-field debug controls have
          an equivalent in the new scheme, but some new debug options
          cannot be represented in the old bit-field scheme.

          pmdbg with a -l option prints out all the debug options.  If
          there is no -g and no -o option then the output lists the name of
          each option and some descriptive text.

          With the -l and -g options the descriptive text is replaced with
          an expression that can be used to set or print the corresponding
          debug flag in gdb(1).

          With the -l and -o options the output is for only the old bit-
          fields with the mnemonic and decimal values of each the bit-field
          along with some descriptive text.

          Obviously the -o and -g options are mutually exclusive.

          pmdbg with a -D option parses the list of names(s) using
          __pmParseDebug(3) and reports the corresponding decimal value.
          This use is not required in the new scheme, but for the old bit-
          fields scheme it was useful when debugging and wanting to set the
          internal value of the control vector (pmDebug) via a debugger,
          e.g.  gdb(1).  For the new scheme, the same effect can be
          achieved using the name of the option(s) and calling
          pmSetDebug(3) from within the debugger.

          The alternative usage also relates to the old bit-field scheme
          and the code arguments are values for the debug vector, and the
          bit-fields that are enabled by each of these values is listed.

          Each code may be an integer, a hexadecimal value or a hexadecimal
          value prefixed by either ``0x'' or ``0X''.

          Most applications using the facilities of the PCP support a -D
          name[,name ...]  command-line syntax to enable debug control
          using the name(s) of the desired debug options.

          Alternatively the initial value of the debug control flags may be
          set to either a value N (old scheme) or a comma-separated list if
          option name(s) (new scheme) using the environment variable
          $PCP_DEBUG.  If both mechanisms are used the effect is additive,
          so the resultant flags are those set via $PCP_DEBUG combined with
          those set via any -D command line options.


-------------------------------------------------------

::

          The available command line options are:

          -D name, --debug=name
               Parse a comma-separated list of name(s) and report the
               corresponding decimal value(s).

          -l, --list
               List all the debug options.

          -g, --gdb
               Output gdb(1) expressions with -l.

          -o, --old
               Use old-style output format with -l.

          -?, --help
               Display usage message and exit.


-----------------------------------------------------------------------

::

          Environment variables with the prefix PCP_ are used to
          parameterize the file and directory names used by PCP.  On each
          installation, the file /etc/pcp.conf contains the local values
          for these variables.  The $PCP_CONF variable may be used to
          specify an alternative configuration file, as described in
          pcp.conf(5).


---------------------------------------------------------

::

          PCPIntro(1), pmSetDebug(3), pmClearDebug(3), __pmParseDebug(3),
          pcp.conf(5) and pcp.env(5).

COLOPHON
---------------------------------------------------------

::

          This page is part of the PCP (Performance Co-Pilot) project.
          Information about the project can be found at 
          ⟨http://www.pcp.io/⟩.  If you have a bug report for this manual
          page, send it to pcp@groups.io.  This page was obtained from the
          project's upstream Git repository
          ⟨https://github.com/performancecopilot/pcp.git⟩ on 2021-08-27.
          (At that time, the date of the most recent commit that was found
          in the repository was 2021-08-27.)  If you discover any rendering
          problems in this HTML version of the page, or you believe there
          is a better or more up-to-date source for the page, or you have
          corrections or improvements to the information in this COLOPHON
          (which is not part of the original manual page), send a mail to
          man-pages@man7.org

   Performance Co-Pilot               PCP                          PMDBG(1)

--------------

Pages that refer to this page: `dbpmda(1) <../man1/dbpmda.1.html>`__, 
`pcpintro(1) <../man1/pcpintro.1.html>`__, 
`pmcd(1) <../man1/pmcd.1.html>`__, 
`pmdaib(1) <../man1/pmdaib.1.html>`__, 
`pmproxy(1) <../man1/pmproxy.1.html>`__, 
`pmda(3) <../man3/pmda.3.html>`__, 
`pmdagetoptions(3) <../man3/pmdagetoptions.3.html>`__, 
`pmparsedebug(3) <../man3/pmparsedebug.3.html>`__, 
`pmprintf(3) <../man3/pmprintf.3.html>`__, 
`pmsetdebug(3) <../man3/pmsetdebug.3.html>`__

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
