.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

pmaddderived(3) — Linux manual page
===================================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `C SYNOPSIS <#C_SYNOPSIS>`__ \|   |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `DIAGNOSTICS <#DIAGNOSTICS>`__ \| |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   PMADDDERIVED(3)         Library Functions Manual         PMADDDERIVED(3)

NAME
-------------------------------------------------

::

          pmAddDerived, pmAddDerivedMetric  - register a per-context
          derived metric name and definition


-------------------------------------------------------------

::

          #include <pcp/pmapi.h>

          char *pmAddDerived(char *name, char *expr);
          int pmAddDerivedMetric(char *name, char *expr, char **errmsg);

          cc ... -lpcp


---------------------------------------------------------------

::

          Derived metrics provide a way of extending the Performance
          Metrics Name Space (PMNS) with new metrics defined at the PCP
          client-side using expressions over the existing performance
          metrics.

          The pmAddDerived and pmAddDerivedMetric routines may be used to
          create per-context derived metrics, and can only be used after
          the current PMAPI context has been created with pmNewContext(3).

          Per-context derived metrics are similar in all aspects except
          scope to global derived metrics.  The latter are defined across
          all PMAPI contexts and are created with the associated
          pmRegisterDerived(3), pmRegisterDerivedMetric(3) and
          pmRegisterLoadConfig(3) routines.

          The arguments to pmAddDerived are the name of the new derived
          metric and expr is an expression defining how the values of name
          should be computed.

          pmAddDerivedMetric is the exact functional equivalent to
          pmAddDerived except that it provides a simplified model of error
          handling, where a formatted message is returned via the errmsg
          parameter.

          Refer to the pmRegisterDerived(3) man page for a complete
          description of the syntactic rules for name, the syntactic and
          semantic rules for expr, return values and the associated error
          reporting mechanisms, and the expression evaluation rules.

          Note that for per-context derived metrics, all syntactic and
          semantic checks are performed at the time pmAddDerived or
          pmAddDerivedMetric is called.  This is different to global
          derived metrics where the semantic checks are delayed until the
          metric is used in a specific PMAPI context.

          There is no ``unregister'' method, so once registered a per-
          context derived metric persists for the life of the PMAPI
          context, but it is destroyed as a side-effect of
          pmDestroyContext(3).


---------------------------------------------------------------

::

          On success, pmAddDerived returns NULL.

          If a syntactic error is found at the time of calling, the value
          returned by pmAddDerived is a pointer into expr indicating where
          the error was found.  To identify what the error was, the
          application should call pmDerivedErrStr(3) to retrieve the
          corresponding parser error message.

          pmAddDerivedMetric returns 0 and errmsg is undefined if the
          parsing is successful.

          If the given expr does not conform to the required syntax
          pmAddDerivedMetric returns -1 and a dynamically allocated error
          message string in errmsg.  The error message is terminated with a
          newline and includes both the input name and expr, along with an
          indicator of the position at which the error was detected.  e.g.
                    Error: pmAddDerivedMetric("my.disk.rates", ...) syntax
                    error
                    4rat(disk.dev.read)
                        ^

          The position indicator line may be followed by an additional
          diagnostic line describing the nature of the error, when
          available.

          In the case of an error, the caller is responsible for calling
          free(3) to release the space allocated for errmsg.


---------------------------------------------------------

::

          PCPIntro(1), PMAPI(3), pmDerivedErrStr(3), pmDestroyContext(3),
          pmLoadDerivedConfig(3), pmNewContext(3), pmRegisterDerived(3),
          pmRegisterDerivedMetric(3) and PMNS(5).

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

   Performance Co-Pilot                                     PMADDDERIVED(3)

--------------

Pages that refer to this page:
`pmgetderivedcontrol(3) <../man3/pmgetderivedcontrol.3.html>`__, 
`pmregisterderived(3) <../man3/pmregisterderived.3.html>`__, 
`pmwebapi(3) <../man3/pmwebapi.3.html>`__

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
