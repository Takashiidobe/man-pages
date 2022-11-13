.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

pmdadaemon(3) — Linux manual page
=================================

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

   PMDADAEMON(3)           Library Functions Manual           PMDADAEMON(3)

NAME
-------------------------------------------------

::

          pmdaDaemon - initialize the PMDA to run as a daemon


-------------------------------------------------------------

::

          #include <pcp/pmapi.h>
          #include <pcp/pmda.h>

          void pmdaDaemon(pmdaInterface *dispatch, int interface, const
                  char *name, int domain, const char *logfile, const
                  char *helptext);

          cc ... -lpcp_pmda -lpcp


---------------------------------------------------------------

::

          pmdaDaemon initializes the pmdaInterface structure to use the
          interface extensions assuming the PMDA(3) is to be run as a
          daemon.  The pmdaInterface structure is initialized with:

          name   The name of the agent.

          domain The default domain number of the agent which uniquely
                 identifies this PMDA from other running PMDAs.  This may
                 be subsequently changed by a command line option -d (see
                 pmdaGetOpt(3)).

          logfile
                 The default path to the log file.  This may be replaced by
                 the -l command line option if using pmdaGetOpt.  logfile
                 will be copied with strdup(3), so the storage associated
                 with logfile may be released after the call to pmdaDaemon.

          helptext
                 The default path to the help text (see pmdaText(3).  This
                 may be replaced by the -h command line option if using
                 pmdaGetOpt(3).  If no help text is installed, or you are
                 not using pmdaText(3), then this should be set to NULL,
                 otherwise helptext will be copied with strdup(3), so the
                 storage associated with helptext may be released after the
                 call to pmdaDaemon.

          The callbacks are initialized to pmdaProfile(3), pmdaFetch(3),
          pmdaDesc(3), pmdaText(3), pmdaInstance(3) and pmdaStore(3).


-----------------------------------------------------

::

          The PMDA must be using PMDA_INTERFACE_2 or later.

          Once pmdaDaemon has been called, it is expected that the
          pmdaInterface structure pointed to by dispatch will remain
          accessible to the routines in libpcp_pmda (not reclaimed off the
          stack, not freed or oherwise released, etc.).  If the caller
          needs to move or relocate the pmdaInterface structure for any
          reason, then after the move pmdaInterfaceMoved(3) must be called
          to resestablish the internal integrity of the pmdaInterface
          structure at the new location before any other routine in
          libpcp_pmda is called.


---------------------------------------------------------------

::

          Unable to allocate memory for pmdaExt structure
                 In addition, the dispatch->status field is set to a value
                 less than zero.

          PMDA interface version interface not supported
                 The interface version is not supported by pmdaDaemon.


---------------------------------------------------------

::

          PMAPI(3), PMDA(3), pmdaDSO(3), pmdaGetOpt(3),
          pmdaInterfaceMoved(3) and pmdaText(3).

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

   Performance Co-Pilot               PCP                     PMDADAEMON(3)

--------------

Pages that refer to this page: `pmda(3) <../man3/pmda.3.html>`__, 
`pmdaattribute(3) <../man3/pmdaattribute.3.html>`__, 
`pmdachildren(3) <../man3/pmdachildren.3.html>`__, 
`pmdaconnect(3) <../man3/pmdaconnect.3.html>`__, 
`pmdadesc(3) <../man3/pmdadesc.3.html>`__, 
`pmdadso(3) <../man3/pmdadso.3.html>`__, 
`pmdafetch(3) <../man3/pmdafetch.3.html>`__, 
`pmdagetoptions(3) <../man3/pmdagetoptions.3.html>`__, 
`pmdahelp(3) <../man3/pmdahelp.3.html>`__, 
`pmdainit(3) <../man3/pmdainit.3.html>`__, 
`pmdainstance(3) <../man3/pmdainstance.3.html>`__, 
`pmdainterfacemoved(3) <../man3/pmdainterfacemoved.3.html>`__, 
`pmdalabel(3) <../man3/pmdalabel.3.html>`__, 
`pmdaname(3) <../man3/pmdaname.3.html>`__, 
`pmdaopenlog(3) <../man3/pmdaopenlog.3.html>`__, 
`pmdapmid(3) <../man3/pmdapmid.3.html>`__, 
`pmdaprofile(3) <../man3/pmdaprofile.3.html>`__, 
`pmdastore(3) <../man3/pmdastore.3.html>`__, 
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
