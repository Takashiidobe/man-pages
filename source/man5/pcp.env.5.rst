.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

pcp.env(5) — Linux manual page
==============================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `ENVIRONMENT <#ENVIRONMENT>`__ \| |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   PCP.ENV(5)                 File Formats Manual                PCP.ENV(5)

NAME
-------------------------------------------------

::

          pcp.env - script to set Performance Co-Pilot run-time environment
          variables


---------------------------------------------------------

::

          /etc/pcp.env


---------------------------------------------------------------

::

          The pcp.env script is sourced by assorted Performance Co-Pilot
          (PCP) scripts and utilities to define the PCP operating
          environment variables.  The conjugate for executable programs
          using the PCP libraries is the __pmGetConfig(3) function.

          Typical usage of pcp.env in a script is as follows :

                   #! /bin/sh

                   # source the PCP environment variables
                   . /etc/pcp.env
                   rest of script ...

          The full syntax and semantics of the pcp.conf file and the
          __pmGetConfig function are described in their respective
          reference pages.

          If the file $HOME/.pcp/pcp.conf exists then this will be
          processed after the system-wide pcp.conf file.  This provides a
          mechanism to selectively modify or augment the environment
          settings for PCP scripts, which maybe useful if the scripts are
          run with sudo(1) which cleans the environment of important
          settings that are required to ensure the correct execution of the
          PCP scripts, e.g.  $PATH or $PERL5LIB.


---------------------------------------------------------------

::

          The PCP_CONF environment variable specifies an alternative path
          to the pcp.conf file.


---------------------------------------------------------

::

          PCPIntro(1), sudo(1), PCPIntro(3), PMAPI(3), __pmGetConfig(3) and
          pcp.conf(5).

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

   Performance Co-Pilot               PCP                        PCP.ENV(5)

--------------

Pages that refer to this page: `chkhelp(1) <../man1/chkhelp.1.html>`__, 
`collectl2pcp(1) <../man1/collectl2pcp.1.html>`__, 
`dbpmda(1) <../man1/dbpmda.1.html>`__, 
`genpmda(1) <../man1/genpmda.1.html>`__, 
`mkaf(1) <../man1/mkaf.1.html>`__, 
`newhelp(1) <../man1/newhelp.1.html>`__, 
`pcp(1) <../man1/pcp.1.html>`__, 
`pcpintro(1) <../man1/pcpintro.1.html>`__, 
`pcp-iostat(1) <../man1/pcp-iostat.1.html>`__, 
`pcp-kube-pods(1) <../man1/pcp-kube-pods.1.html>`__, 
`pcp-tapestat(1) <../man1/pcp-tapestat.1.html>`__, 
`pmafm(1) <../man1/pmafm.1.html>`__, 
`pmcd(1) <../man1/pmcd.1.html>`__, 
`pmcd_wait(1) <../man1/pmcd_wait.1.html>`__, 
`pmclient(1) <../man1/pmclient.1.html>`__, 
`pmconfig(1) <../man1/pmconfig.1.html>`__, 
`pmcpp(1) <../man1/pmcpp.1.html>`__, 
`pmdaapache(1) <../man1/pmdaapache.1.html>`__, 
`pmdacisco(1) <../man1/pmdacisco.1.html>`__, 
`pmdadenki(1) <../man1/pmdadenki.1.html>`__, 
`pmdadocker(1) <../man1/pmdadocker.1.html>`__, 
`pmdajbd2(1) <../man1/pmdajbd2.1.html>`__, 
`pmdakernel(1) <../man1/pmdakernel.1.html>`__, 
`pmdalmsensors(1) <../man1/pmdalmsensors.1.html>`__, 
`pmdalogger(1) <../man1/pmdalogger.1.html>`__, 
`pmdalustrecomm(1) <../man1/pmdalustrecomm.1.html>`__, 
`pmdamailq(1) <../man1/pmdamailq.1.html>`__, 
`pmdammv(1) <../man1/pmdammv.1.html>`__, 
`pmdamounts(1) <../man1/pmdamounts.1.html>`__, 
`pmdanvidia(1) <../man1/pmdanvidia.1.html>`__, 
`pmdaperfevent(1) <../man1/pmdaperfevent.1.html>`__, 
`pmdapipe(1) <../man1/pmdapipe.1.html>`__, 
`pmdapodman(1) <../man1/pmdapodman.1.html>`__, 
`pmdaproc(1) <../man1/pmdaproc.1.html>`__, 
`pmdaroomtemp(1) <../man1/pmdaroomtemp.1.html>`__, 
`pmdasample(1) <../man1/pmdasample.1.html>`__, 
`pmdasimple(1) <../man1/pmdasimple.1.html>`__, 
`pmdastatsd(1) <../man1/pmdastatsd.1.html>`__, 
`pmdasystemd(1) <../man1/pmdasystemd.1.html>`__, 
`pmdate(1) <../man1/pmdate.1.html>`__, 
`pmdaxfs(1) <../man1/pmdaxfs.1.html>`__, 
`pmdazfs(1) <../man1/pmdazfs.1.html>`__, 
`pmdbg(1) <../man1/pmdbg.1.html>`__, 
`pmdiff(1) <../man1/pmdiff.1.html>`__, 
`pmdumplog(1) <../man1/pmdumplog.1.html>`__, 
`pmerr(1) <../man1/pmerr.1.html>`__, 
`pmfind(1) <../man1/pmfind.1.html>`__, 
`pmgenmap(1) <../man1/pmgenmap.1.html>`__, 
`pmgetopt(1) <../man1/pmgetopt.1.html>`__, 
`pmhostname(1) <../man1/pmhostname.1.html>`__, 
`pmie(1) <../man1/pmie.1.html>`__, 
`pmiestatus(1) <../man1/pmiestatus.1.html>`__, 
`pminfo(1) <../man1/pminfo.1.html>`__, 
`pmjson(1) <../man1/pmjson.1.html>`__, 
`pmlc(1) <../man1/pmlc.1.html>`__, 
`pmlogcheck(1) <../man1/pmlogcheck.1.html>`__, 
`pmlogconf(1) <../man1/pmlogconf.1.html>`__, 
`pmlogextract(1) <../man1/pmlogextract.1.html>`__, 
`pmlogger(1) <../man1/pmlogger.1.html>`__, 
`pmloglabel(1) <../man1/pmloglabel.1.html>`__, 
`pmlogreduce(1) <../man1/pmlogreduce.1.html>`__, 
`pmlogrewrite(1) <../man1/pmlogrewrite.1.html>`__, 
`pmnsadd(1) <../man1/pmnsadd.1.html>`__, 
`pmnscomp(1) <../man1/pmnscomp.1.html>`__, 
`pmnsdel(1) <../man1/pmnsdel.1.html>`__, 
`pmnsmerge(1) <../man1/pmnsmerge.1.html>`__, 
`pmpost(1) <../man1/pmpost.1.html>`__, 
`pmprobe(1) <../man1/pmprobe.1.html>`__, 
`pmproxy(1) <../man1/pmproxy.1.html>`__, 
`pmrepconf(1) <../man1/pmrepconf.1.html>`__, 
`pmsignal(1) <../man1/pmsignal.1.html>`__, 
`pmstat(1) <../man1/pmstat.1.html>`__, 
`pmval(1) <../man1/pmval.1.html>`__, 
`pcpintro(3) <../man3/pcpintro.3.html>`__, 
`pmapi(3) <../man3/pmapi.3.html>`__, 
`pmdiscoverservices(3) <../man3/pmdiscoverservices.3.html>`__, 
`pmdiscoversetup(3) <../man3/pmdiscoversetup.3.html>`__, 
`pmgetarchiveend(3) <../man3/pmgetarchiveend.3.html>`__, 
`pmgetarchivelabel(3) <../man3/pmgetarchivelabel.3.html>`__, 
`pmgetchildren(3) <../man3/pmgetchildren.3.html>`__, 
`pmgetchildrenstatus(3) <../man3/pmgetchildrenstatus.3.html>`__, 
`pmgetconfig(3) <../man3/pmgetconfig.3.html>`__, 
`pmgetcontexthostname(3) <../man3/pmgetcontexthostname.3.html>`__, 
`pmgetindom(3) <../man3/pmgetindom.3.html>`__, 
`pmgetindomarchive(3) <../man3/pmgetindomarchive.3.html>`__, 
`pmgetpmnslocation(3) <../man3/pmgetpmnslocation.3.html>`__, 
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
`LOGARCHIVE(5) <../man5/LOGARCHIVE.5.html>`__, 
`mmv(5) <../man5/mmv.5.html>`__, 
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
