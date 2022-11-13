.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

pcp.conf(5) — Linux manual page
===============================

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

   PCP.CONF(5)                File Formats Manual               PCP.CONF(5)

NAME
-------------------------------------------------

::

          pcp.conf - the Performance Co-Pilot configuration and environment
          file


---------------------------------------------------------

::

          /etc/pcp.conf


---------------------------------------------------------------

::

          When using Performance Co-Pilot (PCP) tools and utilities and
          when calling PCP library functions, a standard set of environment
          variables are defined in /etc/pcp.conf.  These variables are
          generally used to specify the location of various PCP pieces in
          the file system and may be loaded into shell scripts by sourcing
          the /etc/pcp.env(5) shell script and queried by C/C++ programs
          using the pmGetConfig(3) library function.  If a variable is
          already defined in the environment, the values in pcp.conf do not
          override those values, i.e. the values in pcp.conf serve as
          installation defaults only.

          Both the pcp.env and pcp.conf files are expected to be found in
          /etc by default.  If required, the pcp.conf file may be relocated
          and PCP_CONF set in the environment to specify the full path to
          the new location.  The pcp.env file can not be relocated (this is
          the only hard coded path required by PCP).

          The syntax rules for pcp.conf are as follows :

          1.  the general syntax is
                     PCP_VARIABLE_NAME=variable value to end of line

          2.  lines that begin with # and all blank lines are ignored.

          3.  all variables must be prefixed with PCP_.  This is a security
              issue - variables that do not have this prefix will be
              silently ignored.

          4.  there should be no space between the variable name and the
              literal = and no space between the = and the variable value
              (unless the value actually starts with a space).  This is
              required because the pcp.conf file may be sourced directly by
              Makefiles as well as interpreted by the pcp.env script and
              the pmGetConfig function.

          5.  variable values may contain spaces and should not be quoted.
              The pcp.env script automatically quotes all variable values
              from the character immediately following the = through to the
              end of the line.

          For further details and an explanation of the use of each
          variable, see the comments in the /etc/pcp.conf file itself.


---------------------------------------------------------------

::

          The PCP_CONF environment variable specifies an alternative path
          to the pcp.conf file.


---------------------------------------------------------

::

          PCPIntro(1), pmconfig(1), PCPIntro(3), PMAPI(3), pmGetConfig(3)
          and pcp.env(5).

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

   Performance Co-Pilot               PCP                       PCP.CONF(5)

--------------

Pages that refer to this page:
`autofsd-probe(1) <../man1/autofsd-probe.1.html>`__, 
`chkhelp(1) <../man1/chkhelp.1.html>`__, 
`collectl2pcp(1) <../man1/collectl2pcp.1.html>`__, 
`dbpmda(1) <../man1/dbpmda.1.html>`__, 
`ganglia2pcp(1) <../man1/ganglia2pcp.1.html>`__, 
`genpmda(1) <../man1/genpmda.1.html>`__, 
`iostat2pcp(1) <../man1/iostat2pcp.1.html>`__, 
`mkaf(1) <../man1/mkaf.1.html>`__, 
`mrtg2pcp(1) <../man1/mrtg2pcp.1.html>`__, 
`newhelp(1) <../man1/newhelp.1.html>`__, 
`pcp(1) <../man1/pcp.1.html>`__, 
`pcp2elasticsearch(1) <../man1/pcp2elasticsearch.1.html>`__, 
`pcp2graphite(1) <../man1/pcp2graphite.1.html>`__, 
`pcp2influxdb(1) <../man1/pcp2influxdb.1.html>`__, 
`pcp2json(1) <../man1/pcp2json.1.html>`__, 
`pcp2spark(1) <../man1/pcp2spark.1.html>`__, 
`pcp2template(1) <../man1/pcp2template.1.html>`__, 
`pcp2xlsx(1) <../man1/pcp2xlsx.1.html>`__, 
`pcp2xml(1) <../man1/pcp2xml.1.html>`__, 
`pcp2zabbix(1) <../man1/pcp2zabbix.1.html>`__, 
`pcp-atop(1) <../man1/pcp-atop.1.html>`__, 
`pcp-atopsar(1) <../man1/pcp-atopsar.1.html>`__, 
`pcp-dmcache(1) <../man1/pcp-dmcache.1.html>`__, 
`pcp-dstat(1) <../man1/pcp-dstat.1.html>`__, 
`pcp-free(1) <../man1/pcp-free.1.html>`__, 
`pcpintro(1) <../man1/pcpintro.1.html>`__, 
`pcp-iostat(1) <../man1/pcp-iostat.1.html>`__, 
`pcp-ipcs(1) <../man1/pcp-ipcs.1.html>`__, 
`pcp-kube-pods(1) <../man1/pcp-kube-pods.1.html>`__, 
`pcp-mpstat(1) <../man1/pcp-mpstat.1.html>`__, 
`pcp-numastat(1) <../man1/pcp-numastat.1.html>`__, 
`pcp-pidstat(1) <../man1/pcp-pidstat.1.html>`__, 
`pcp-python(1) <../man1/pcp-python.1.html>`__, 
`pcp-shping(1) <../man1/pcp-shping.1.html>`__, 
`pcp-ss(1) <../man1/pcp-ss.1.html>`__, 
`pcp-tapestat(1) <../man1/pcp-tapestat.1.html>`__, 
`pcp-uptime(1) <../man1/pcp-uptime.1.html>`__, 
`pcp-verify(1) <../man1/pcp-verify.1.html>`__, 
`pmafm(1) <../man1/pmafm.1.html>`__, 
`pmcd(1) <../man1/pmcd.1.html>`__, 
`pmcd_wait(1) <../man1/pmcd_wait.1.html>`__, 
`pmchart(1) <../man1/pmchart.1.html>`__, 
`pmclient(1) <../man1/pmclient.1.html>`__, 
`pmconfig(1) <../man1/pmconfig.1.html>`__, 
`pmcpp(1) <../man1/pmcpp.1.html>`__, 
`pmdaactivemq(1) <../man1/pmdaactivemq.1.html>`__, 
`pmdaapache(1) <../man1/pmdaapache.1.html>`__, 
`pmdabash(1) <../man1/pmdabash.1.html>`__, 
`pmdabcc(1) <../man1/pmdabcc.1.html>`__, 
`pmdabind2(1) <../man1/pmdabind2.1.html>`__, 
`pmdabonding(1) <../man1/pmdabonding.1.html>`__, 
`pmdabpftrace(1) <../man1/pmdabpftrace.1.html>`__, 
`pmdacifs(1) <../man1/pmdacifs.1.html>`__, 
`pmdacisco(1) <../man1/pmdacisco.1.html>`__, 
`pmdadbping(1) <../man1/pmdadbping.1.html>`__, 
`pmdadenki(1) <../man1/pmdadenki.1.html>`__, 
`pmdadm(1) <../man1/pmdadm.1.html>`__, 
`pmdadocker(1) <../man1/pmdadocker.1.html>`__, 
`pmdads389(1) <../man1/pmdads389.1.html>`__, 
`pmdads389log(1) <../man1/pmdads389log.1.html>`__, 
`pmdaelasticsearch(1) <../man1/pmdaelasticsearch.1.html>`__, 
`pmdagfs2(1) <../man1/pmdagfs2.1.html>`__, 
`pmdagluster(1) <../man1/pmdagluster.1.html>`__, 
`pmdagpfs(1) <../man1/pmdagpfs.1.html>`__, 
`pmdahacluster(1) <../man1/pmdahacluster.1.html>`__, 
`pmdahaproxy(1) <../man1/pmdahaproxy.1.html>`__, 
`pmdajbd2(1) <../man1/pmdajbd2.1.html>`__, 
`pmdajson(1) <../man1/pmdajson.1.html>`__, 
`pmdakernel(1) <../man1/pmdakernel.1.html>`__, 
`pmdakvm(1) <../man1/pmdakvm.1.html>`__, 
`pmdalibvirt(1) <../man1/pmdalibvirt.1.html>`__, 
`pmdalio(1) <../man1/pmdalio.1.html>`__, 
`pmdalmsensors(1) <../man1/pmdalmsensors.1.html>`__, 
`pmdalogger(1) <../man1/pmdalogger.1.html>`__, 
`pmdalustre(1) <../man1/pmdalustre.1.html>`__, 
`pmdalustrecomm(1) <../man1/pmdalustrecomm.1.html>`__, 
`pmdamailq(1) <../man1/pmdamailq.1.html>`__, 
`pmdamemcache(1) <../man1/pmdamemcache.1.html>`__, 
`pmdamic(1) <../man1/pmdamic.1.html>`__, 
`pmdammv(1) <../man1/pmdammv.1.html>`__, 
`pmdamounts(1) <../man1/pmdamounts.1.html>`__, 
`pmdamssql(1) <../man1/pmdamssql.1.html>`__, 
`pmdamysql(1) <../man1/pmdamysql.1.html>`__, 
`pmdanetcheck(1) <../man1/pmdanetcheck.1.html>`__, 
`pmdanetfilter(1) <../man1/pmdanetfilter.1.html>`__, 
`pmdanfsclient(1) <../man1/pmdanfsclient.1.html>`__, 
`pmdanginx(1) <../man1/pmdanginx.1.html>`__, 
`pmdanutcracker(1) <../man1/pmdanutcracker.1.html>`__, 
`pmdanvidia(1) <../man1/pmdanvidia.1.html>`__, 
`pmdaopenmetrics(1) <../man1/pmdaopenmetrics.1.html>`__, 
`pmdaopenvswitch(1) <../man1/pmdaopenvswitch.1.html>`__, 
`pmdaoracle(1) <../man1/pmdaoracle.1.html>`__, 
`pmdaperfevent(1) <../man1/pmdaperfevent.1.html>`__, 
`pmdapipe(1) <../man1/pmdapipe.1.html>`__, 
`pmdapodman(1) <../man1/pmdapodman.1.html>`__, 
`pmdapostfix(1) <../man1/pmdapostfix.1.html>`__, 
`pmdapostgresql(1) <../man1/pmdapostgresql.1.html>`__, 
`pmdaproc(1) <../man1/pmdaproc.1.html>`__, 
`pmdarabbitmq(1) <../man1/pmdarabbitmq.1.html>`__, 
`pmdaredis(1) <../man1/pmdaredis.1.html>`__, 
`pmdaroomtemp(1) <../man1/pmdaroomtemp.1.html>`__, 
`pmdaroot(1) <../man1/pmdaroot.1.html>`__, 
`pmdarsyslog(1) <../man1/pmdarsyslog.1.html>`__, 
`pmdasample(1) <../man1/pmdasample.1.html>`__, 
`pmdasendmail(1) <../man1/pmdasendmail.1.html>`__, 
`pmdashping(1) <../man1/pmdashping.1.html>`__, 
`pmdasimple(1) <../man1/pmdasimple.1.html>`__, 
`pmdaslurm(1) <../man1/pmdaslurm.1.html>`__, 
`pmdasmart(1) <../man1/pmdasmart.1.html>`__, 
`pmdasockets(1) <../man1/pmdasockets.1.html>`__, 
`pmdastatsd(1) <../man1/pmdastatsd.1.html>`__, 
`pmdasummary(1) <../man1/pmdasummary.1.html>`__, 
`pmdasystemd(1) <../man1/pmdasystemd.1.html>`__, 
`pmdate(1) <../man1/pmdate.1.html>`__, 
`pmdatrace(1) <../man1/pmdatrace.1.html>`__, 
`pmdatrivial(1) <../man1/pmdatrivial.1.html>`__, 
`pmdatxmon(1) <../man1/pmdatxmon.1.html>`__, 
`pmdaunbound(1) <../man1/pmdaunbound.1.html>`__, 
`pmdaweblog(1) <../man1/pmdaweblog.1.html>`__, 
`pmdaxfs(1) <../man1/pmdaxfs.1.html>`__, 
`pmdazfs(1) <../man1/pmdazfs.1.html>`__, 
`pmdazimbra(1) <../man1/pmdazimbra.1.html>`__, 
`pmdazswap(1) <../man1/pmdazswap.1.html>`__, 
`pmdbg(1) <../man1/pmdbg.1.html>`__, 
`pmdiff(1) <../man1/pmdiff.1.html>`__, 
`pmdumplog(1) <../man1/pmdumplog.1.html>`__, 
`pmdumptext(1) <../man1/pmdumptext.1.html>`__, 
`pmerr(1) <../man1/pmerr.1.html>`__, 
`pmfind(1) <../man1/pmfind.1.html>`__, 
`pmfind_check(1) <../man1/pmfind_check.1.html>`__, 
`pmgenmap(1) <../man1/pmgenmap.1.html>`__, 
`pmgetopt(1) <../man1/pmgetopt.1.html>`__, 
`pmhostname(1) <../man1/pmhostname.1.html>`__, 
`pmie(1) <../man1/pmie.1.html>`__, 
`pmie2col(1) <../man1/pmie2col.1.html>`__, 
`pmie_check(1) <../man1/pmie_check.1.html>`__, 
`pmieconf(1) <../man1/pmieconf.1.html>`__, 
`pmiestatus(1) <../man1/pmiestatus.1.html>`__, 
`pminfo(1) <../man1/pminfo.1.html>`__, 
`pmjson(1) <../man1/pmjson.1.html>`__, 
`pmlc(1) <../man1/pmlc.1.html>`__, 
`pmlogcheck(1) <../man1/pmlogcheck.1.html>`__, 
`pmlogconf(1) <../man1/pmlogconf.1.html>`__, 
`pmlogctl(1) <../man1/pmlogctl.1.html>`__, 
`pmlogextract(1) <../man1/pmlogextract.1.html>`__, 
`pmlogger(1) <../man1/pmlogger.1.html>`__, 
`pmlogger_check(1) <../man1/pmlogger_check.1.html>`__, 
`pmlogger_daily_report(1) <../man1/pmlogger_daily_report.1.html>`__, 
`pmlogger_merge(1) <../man1/pmlogger_merge.1.html>`__, 
`pmlogger_rewrite(1) <../man1/pmlogger_rewrite.1.html>`__, 
`pmloglabel(1) <../man1/pmloglabel.1.html>`__, 
`pmlogpaste(1) <../man1/pmlogpaste.1.html>`__, 
`pmlogreduce(1) <../man1/pmlogreduce.1.html>`__, 
`pmlogrewrite(1) <../man1/pmlogrewrite.1.html>`__, 
`pmlogsize(1) <../man1/pmlogsize.1.html>`__, 
`pmlogsummary(1) <../man1/pmlogsummary.1.html>`__, 
`pmnsadd(1) <../man1/pmnsadd.1.html>`__, 
`pmnscomp(1) <../man1/pmnscomp.1.html>`__, 
`pmnsdel(1) <../man1/pmnsdel.1.html>`__, 
`pmnsmerge(1) <../man1/pmnsmerge.1.html>`__, 
`pmpost(1) <../man1/pmpost.1.html>`__, 
`pmprobe(1) <../man1/pmprobe.1.html>`__, 
`pmproxy(1) <../man1/pmproxy.1.html>`__, 
`pmpython(1) <../man1/pmpython.1.html>`__, 
`pmquery(1) <../man1/pmquery.1.html>`__, 
`pmrep(1) <../man1/pmrep.1.html>`__, 
`pmrepconf(1) <../man1/pmrepconf.1.html>`__, 
`pmsearch(1) <../man1/pmsearch.1.html>`__, 
`pmseries(1) <../man1/pmseries.1.html>`__, 
`pmsignal(1) <../man1/pmsignal.1.html>`__, 
`pmstat(1) <../man1/pmstat.1.html>`__, 
`pmstore(1) <../man1/pmstore.1.html>`__, 
`pmtrace(1) <../man1/pmtrace.1.html>`__, 
`pmval(1) <../man1/pmval.1.html>`__, 
`pmview(1) <../man1/pmview.1.html>`__, 
`sar2pcp(1) <../man1/sar2pcp.1.html>`__, 
`sheet2pcp(1) <../man1/sheet2pcp.1.html>`__, 
`telnet-probe(1) <../man1/telnet-probe.1.html>`__, 
`pcpintro(3) <../man3/pcpintro.3.html>`__, 
`pmapi(3) <../man3/pmapi.3.html>`__, 
`pmda(3) <../man3/pmda.3.html>`__, 
`pmdaopenlog(3) <../man3/pmdaopenlog.3.html>`__, 
`pmdatrace(3) <../man3/pmdatrace.3.html>`__, 
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
`pmgetoptions(3) <../man3/pmgetoptions.3.html>`__, 
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
`pcp-dstat(5) <../man5/pcp-dstat.5.html>`__, 
`pcp.env(5) <../man5/pcp.env.5.html>`__, 
`pmns(5) <../man5/pmns.5.html>`__, 
`pmrep.conf(5) <../man5/pmrep.conf.5.html>`__

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
