.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

pmgetconfig(3) — Linux manual page
==================================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `C SYNOPSIS <#C_SYNOPSIS>`__ \|   |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `RETURN VALUE <#RETURN_VALUE>`__  |                                   |
| \|                                |                                   |
| `PCP                              |                                   |
| ENVIRONMENT <#PCP_ENVIRONMENT>`__ |                                   |
| \| `SEE ALSO <#SEE_ALSO>`__ \|    |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   PMGETCONFIG(3)          Library Functions Manual          PMGETCONFIG(3)

NAME
-------------------------------------------------

::

          pmGetConfig, pmGetOptionalConfig, pmGetAPIConfig - return values
          for Performance Co-Pilot configuration variables


-------------------------------------------------------------

::

          #include <pcp/pmapi.h>

          char *pmGetConfig(const char *variable);
          char *pmGetOptionalConfig(const char *variable);
          char *pmGetAPIConfig(const char *feature);

          cc ... -lpcp


---------------------------------------------------------------

::

          The pmGetConfig and pmGetOptionalConfig functions search for
          variable first in the environment and then, if not found, in the
          Performance Co-Pilot (PCP) configuration file and returns the
          string result.  If variable is not already in the environment, it
          is added with a call to setenv(3) before returning.

          The pmGetOptionalConfig function allows for failures - either
          from variable not being set at all, or due to the configuration
          file being missing.  pmGetConfig is less tolerant to a missing
          configuration file, which it treats as a critical PCP
          installation failure - see the ``RETURN VALUE'' section below for
          further details.

          The default location of the PCP configuration file is
          /etc/pcp.conf but this may be changed by setting PCP_CONF in the
          environment to a new location, as described in pcp.conf(5).

          The pmGetAPIConfig function reports on features of the PCP
          library.  It can be used to query support for multi-threading,
          security extensions, and other features.

          The pmconfig(1) utility provides command line access to both of
          these interfaces, and also provides a mechanism for listing all
          available variables and features that are valid arguments to
          these routines.


-----------------------------------------------------------------

::

          If variable is not found in either the environment or the PCP
          configuration file, or if the configuration file is inaccessible,
          then pmGetOptionalConfig returns NULL.

          If variable is found in neither the environment nor the PCP
          configuration file, then pmGetConfig returns an empty string.  If
          the PCP configuration file is not found then a fatal error
          message is printed and the process will exit(2) - although this
          sounds drastic, it is the only course of action available because
          the PCP configuration/installation is deemed fatally flawed.

          The pmGetAPIConfig routine returns NULL on failure to lookup the
          requested feature.  It does not modify the environment, and
          returns a pointer to a static read-only string.

          The value returned by all of these routines is either a static
          pointer or pointer into the environment, and so changing it is a
          bad idea.


-----------------------------------------------------------------------

::

          Environment variables with the prefix PCP_ are used to
          parameterize the file and directory names used by PCP.  On each
          installation, the file /etc/pcp.conf contains the local values
          for these variables.  The $PCP_CONF variable may be used to
          specify an alternative configuration file, as described in
          pcp.conf(5).  Values for these variables may be obtained
          programmatically using the pmGetConfig(3) function.


---------------------------------------------------------

::

          PCPIntro(1), pmconfig(1), pmGetVersion(3), exit(2), PMAPI(3),
          getenv(3), setenv(3), pcp.conf(5), pcp.env(5) and environ(7).

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

   Performance Co-Pilot               PCP                    PMGETCONFIG(3)

--------------

Pages that refer to this page:
`pmconfig(1) <../man1/pmconfig.1.html>`__, 
`pcpintro(3) <../man3/pcpintro.3.html>`__, 
`pmapi(3) <../man3/pmapi.3.html>`__, 
`pmda(3) <../man3/pmda.3.html>`__, 
`pmdaopenlog(3) <../man3/pmdaopenlog.3.html>`__, 
`pmdatrace(3) <../man3/pmdatrace.3.html>`__, 
`pmdiscoverservices(3) <../man3/pmdiscoverservices.3.html>`__, 
`pmgetarchiveend(3) <../man3/pmgetarchiveend.3.html>`__, 
`pmgetarchivelabel(3) <../man3/pmgetarchivelabel.3.html>`__, 
`pmgetchildren(3) <../man3/pmgetchildren.3.html>`__, 
`pmgetchildrenstatus(3) <../man3/pmgetchildrenstatus.3.html>`__, 
`pmgetconfig(3) <../man3/pmgetconfig.3.html>`__, 
`pmgetcontexthostname(3) <../man3/pmgetcontexthostname.3.html>`__, 
`pmgetindom(3) <../man3/pmgetindom.3.html>`__, 
`pmgetindomarchive(3) <../man3/pmgetindomarchive.3.html>`__, 
`pmgetoptions(3) <../man3/pmgetoptions.3.html>`__, 
`pmgetpmnslocation(3) <../man3/pmgetpmnslocation.3.html>`__, 
`pmgetusername(3) <../man3/pmgetusername.3.html>`__, 
`pmgetversion(3) <../man3/pmgetversion.3.html>`__, 
`pmidstr(3) <../man3/pmidstr.3.html>`__, 
`pmindomstr(3) <../man3/pmindomstr.3.html>`__, 
`pmloadasciinamespace(3) <../man3/pmloadasciinamespace.3.html>`__, 
`pmloadnamespace(3) <../man3/pmloadnamespace.3.html>`__, 
`pmlocaltime(3) <../man3/pmlocaltime.3.html>`__, 
`pmlookupdesc(3) <../man3/pmlookupdesc.3.html>`__, 
`pmlookupindom(3) <../man3/pmlookupindom.3.html>`__, 
`pmlookupindomarchive(3) <../man3/pmlookupindomarchive.3.html>`__, 
`pmlookupindomtext(3) <../man3/pmlookupindomtext.3.html>`__, 
`pmlookupname(3) <../man3/pmlookupname.3.html>`__, 
`pmlookuptext(3) <../man3/pmlookuptext.3.html>`__, 
`pmnameall(3) <../man3/pmnameall.3.html>`__, 
`pmnameid(3) <../man3/pmnameid.3.html>`__, 
`pmnameindom(3) <../man3/pmnameindom.3.html>`__, 
`pmnameindomarchive(3) <../man3/pmnameindomarchive.3.html>`__, 
`pmnewcontext(3) <../man3/pmnewcontext.3.html>`__, 
`pmnewcontextzone(3) <../man3/pmnewcontextzone.3.html>`__, 
`pmnewzone(3) <../man3/pmnewzone.3.html>`__, 
`pcp.conf(5) <../man5/pcp.conf.5.html>`__, 
`pmns(5) <../man5/pmns.5.html>`__

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
