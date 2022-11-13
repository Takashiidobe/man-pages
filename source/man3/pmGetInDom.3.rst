.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

pmgetindom(3) — Linux manual page
=================================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `C SYNOPSIS <#C_SYNOPSIS>`__ \|   |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `DIAGNOSTICS <#DIAGNOSTICS>`__ \| |                                   |
| `PCP                              |                                   |
| ENVIRONMENT <#PCP_ENVIRONMENT>`__ |                                   |
| \| `SEE ALSO <#SEE_ALSO>`__ \|    |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   PMGETINDOM(3)           Library Functions Manual           PMGETINDOM(3)

NAME
-------------------------------------------------

::

          pmGetInDom - get instance identifiers for a performance metrics
          instance domain


-------------------------------------------------------------

::

          #include <pcp/pmapi.h>

          int pmGetInDom(pmInDom indom, int **instlist, char ***namelist);

          cc ... -lpcp


---------------------------------------------------------------

::

          In the current Performance Metrics Application Programming
          Interface (PMAPI) context, locate the description of the instance
          domain indom, and return via instlist the internal instance
          identifiers for all instances, and via namelist the full external
          identifiers for all instances.  The number of instances found is
          returned as the function value (else less than zero to indicate
          an error).

          The value for the instance domain indom is typically extracted
          from a pmDesc structure, following a call to pmLookupDesc(3) for
          a particular performance metric.

          The resulting lists of instance identifiers (instlist and
          namelist), and the names that the elements of namelist point to,
          will have been allocated by pmGetInDom with two calls to
          malloc(3), and it is the responsibility of the caller to
          free(instlist) and free(namelist) to release the space when it is
          no longer required.

          When the result of pmGetInDom is less than one, both instlist and
          namelist are undefined (no space will have been allocated, and so
          calling free(3) is a singularly bad idea).


---------------------------------------------------------------

::

          PM_ERR_INDOM
                 indom is not a valid instance domain identifier


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

          PMAPI(3), pmGetConfig(3), pmGetInDomArchive(3), pmLookupDesc(3),
          pmLookupInDom(3), pmNameInDom(3), pcp.conf(5) and pcp.env(5).

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

   Performance Co-Pilot               PCP                     PMGETINDOM(3)

--------------

Pages that refer to this page:
`pmdumplog(1) <../man1/pmdumplog.1.html>`__, 
`pmlogextract(1) <../man1/pmlogextract.1.html>`__, 
`pmlogger(1) <../man1/pmlogger.1.html>`__, 
`pcpintro(3) <../man3/pcpintro.3.html>`__, 
`pmaddprofile(3) <../man3/pmaddprofile.3.html>`__, 
`pmapi(3) <../man3/pmapi.3.html>`__, 
`pmdacache(3) <../man3/pmdacache.3.html>`__, 
`pmdainstance(3) <../man3/pmdainstance.3.html>`__, 
`pmdelprofile(3) <../man3/pmdelprofile.3.html>`__, 
`pmfetch(3) <../man3/pmfetch.3.html>`__, 
`pmgetindomarchive(3) <../man3/pmgetindomarchive.3.html>`__, 
`pmlookupindom(3) <../man3/pmlookupindom.3.html>`__, 
`pmlookuplabels(3) <../man3/pmlookuplabels.3.html>`__, 
`pmnameindom(3) <../man3/pmnameindom.3.html>`__, 
`pmsetmode(3) <../man3/pmsetmode.3.html>`__, 
`pmwebapi(3) <../man3/pmwebapi.3.html>`__, 
`QmcIndom(3) <../man3/QmcIndom.3.html>`__

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
