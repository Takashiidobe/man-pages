.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

pmdagetoptions(3) — Linux manual page
=====================================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `C SYNOPSIS <#C_SYNOPSIS>`__ \|   |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `CAVEAT <#CAVEAT>`__ \|           |                                   |
| `DIAGNOSTICS <#DIAGNOSTICS>`__ \| |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   PMDAGETOPTIONS(3)       Library Functions Manual       PMDAGETOPTIONS(3)

NAME
-------------------------------------------------

::

          pmdaGetOpt, pmdaGetOptions - get options from arguments, parsing
          generic PMDA options


-------------------------------------------------------------

::

          #include <pcp/pmapi.h>
          #include <pcp/pmda.h>

          int pmdaGetOptions(int argc, char *const *argv, pmdaOptions
                  *opts, pmdaInterface *dispatch);

          int pmdaGetOpt(int argc, char *const *argv,
                  const char *optstring, pmdaInterface *dispatch,
                  int *err);

          cc ... -lpcp_pmda -lpcp


---------------------------------------------------------------

::

          These functions are wrappers for pmgetopt_r(3).  The behavior of
          each function is that certain options are assumed to have a
          predefined behavior which initializes several fields in the
          pmdaInterface structure.  The pmdaGetOptions interface allows
          both short and long options to be given, whereas pmdaGetOpt
          allows for short form options only.

          The options that both pmdaGetOptions and pmdaGetOpt will trap
          are:

          -Ddebugspec
                 Set the PMAPI(3) debugging options to debugspec, as
                 described in PCPIntro(1).  Used for controlling levels of
                 trace output while debugging.

          -ddomain
                 Set the domain number of this agent.

          -hhelpfile
                 Obtain the help text (see pmdaText(3)) for the metrics
                 from this file rather than from the path specified with
                 pmdaDSO(3) or pmdaDaemon(3).

          -iport Expect PMCD to connect on inet port (number or name).

          -6port Expect PMCD to connect on ipv6 port (number or name).

          -llogfile
                 Redirect diagnostics and trace output to logfile.

          -p     Expect PMCD to supply stdin/stdout pipe.

          -usocket
                 Expect PMCD to connect on unix domain socket.

          The pmdaGetOptions interface will also capture the following
          options, and store them within the opts parameter:

          -Uusername
                 Set the user account name under which the PMDA should
                 execute.

          Only one of -i, -6, -p and -u may be specified.  If none of these
          three options is given, a pipe (-p) is assumed.  When these
          options are encountered by pmdaGetOpt, the option is processed
          and the next option is examined.  Therefore, pmdaGetOpt will only
          return when an option other than those listed above is found, or
          the end of the list is reached.  The returned value will be the
          argument or EOF, respectively.

          A PMDA can control which of these options the program will accept
          with either the opts or optstring argument.  To accept all the
          options, the PMDA should call pmdaGetOptions with the
          short_options field of the opts structure set to the PMDA_OPTIONS
          macro, or pmdaGetOpt with the option string "D:d:h:i:l:pu:".  Any
          PMDA specific options should be added to these strings in the
          style of getopt(3), and will be returned by both pmdaGetOptions
          and pmdaGetOpt if encountered.

          When a command line option usage error is detected in the
          pmdaGetOptions interface, the error field of the opts structure
          will contain a non-zero error count.

          pmdaGetOpt takes a pointer to an int, err, which is used as an
          error count.  This variable should be initialized to zero before
          pmdaGetOpt is first called, and tested when pmdaGetOpt returns
          EOF.

          Neither pmdaGetOptions nor pmdaGetOpt modify their argc or argv
          parameters.

          The global variables used by the system getopt(3) interface may
          also be used by the caller of pmdaGetOpt within the argument
          parsing loop.

          On the other hand, the pmdaGetOptions interface does not utilize
          global variables at all (neither reading nor modifying them).
          Instead, these variables can be access via the opts fields of the
          same name.


-----------------------------------------------------

::

          The options -D, -d, -i, -l, -p and -u cannot be reused for other
          purposes by the PMDA, unless using the override method provided
          by the pmdaGetOptions interface, which operates in the same way
          as described for the pmGetOptions(3) interface used by PMAPI
          client tools.

          The PMDA must be using PMDA_INTERFACE_2 or later, as specified in
          the call to pmdaDSO(3) or pmdaDaemon(3).


---------------------------------------------------------------

::

          Both pmdaGetOptions and pmdaGetOpt will display the same error
          messages as getopt.


---------------------------------------------------------

::

          pmdbg(1), getopt(3), pmgetopt_r(3), pmGetOptions(3), PMAPI(3),
          PMDA(3), pmdaDaemon(3), pmdaDSO(3) and pmdaText(3).

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

   Performance Co-Pilot               PCP                 PMDAGETOPTIONS(3)

--------------

Pages that refer to this page: `pmda(3) <../man3/pmda.3.html>`__, 
`pmdaconnect(3) <../man3/pmdaconnect.3.html>`__, 
`pmdadaemon(3) <../man3/pmdadaemon.3.html>`__, 
`pmdainit(3) <../man3/pmdainit.3.html>`__, 
`pmdaopenlog(3) <../man3/pmdaopenlog.3.html>`__, 
`pmdatext(3) <../man3/pmdatext.3.html>`__

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
