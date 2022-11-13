.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

pmsearch(1) — Linux manual page
===============================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `OPTIONS <#OPTIONS>`__ \|         |                                   |
| `EXAMPLES <#EXAMPLES>`__ \|       |                                   |
| `PCP                              |                                   |
| ENVIRONMENT <#PCP_ENVIRONMENT>`__ |                                   |
| \| `SEE ALSO <#SEE_ALSO>`__ \|    |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   PMSEARCH(1)              General Commands Manual             PMSEARCH(1)

NAME
-------------------------------------------------

::

          pmsearch - help text and names search for metrics, instances and
          instance domains


---------------------------------------------------------

::

          pmsearch [-CdinqsStTV?]  [-c config] [-h host] [-p port] [-N
          number] [-O offset] [query | indom]


---------------------------------------------------------------

::

          pmsearch performs full text search queries to find metrics using
          names and help text from metrics, instance domains and instances.

          It makes use of capabilties of the Performance Co-Pilot (PCP)
          pmproxy(1) service, the Redis distributed data store, and the
          RediSearch module.

          Note that in order to use these services, it is mandatory that
          pmproxy is communicating with a redis-server(1) that has the
          redisearch.so module loaded.  When configured to do so, pmproxy
          will then automatically index PCP metric names, instance names,
          metric and instance domain help text into the RediSearch store,
          from PCP archives that it discovers locally.  Refer to
          pmlogger(1) and pmlogger_daily(1) for further details.

          By default pmsearch communicates with a local redis-server(1),
          however the -h and -p options can be used to specify an alternate
          Redis instance.  If this instance is a node of a Redis cluster,
          all other instances in the cluster will be discovered and used
          automatically.


-------------------------------------------------------

::

          -c config, --config=config
               Specify the config file to use.

          -C, --no-colour
               No highlighting in results text.

          -d, --docid
               Report document ID of each search result.  Documents are
               identified using a unique SHA-1 hash which is always
               displayed in a 40-hexdigit human readable form.

          -h host, --host=host
               Connect to the Redis server at host, rather than the one the
               localhost.

          -i, --info
               Report search engine internal metrics.

          -n, --indom
               Perform an instance domain related entities search

          -N N, --number=N
               Return N, search results at most.

          -O N, --offset=N
               Paginated results from given offset.

          -p port, --port=port
               Connect to the Redis server at port, rather than the default
               6379.

          -q, --query
               Perform a general text search (default).

          -s, --suggest
               Peform a name suggestion search

          -S, --score
               Report score (rank) of each result.

          -T, --total
               Report total number of of search results.

          -t, --times
               Report elapsed search execution time.

          -V, --version
               Display version number and exit.

          -?, --help
               Display usage message and exit.


---------------------------------------------------------

::

            $ pmsearch kernel idle
            Type: metric
            Name: kernel.all.cpu.idle
            One line: total idle CPU time from /proc/stat for all CPUs

            Type: metric
            Name: kernel.all.idletime
            One line: time the current kernel has been idle since boot

            Type: metric
            Name: kernel.percpu.cpu.idle
            InDom: 60.0
            One line: percpu idle CPU time metric from /proc/stat


-----------------------------------------------------------------------

::

          Environment variables with the prefix PCP_ are used to
          parameterize the file and directory names used by PCP.  On each
          installation, the file /etc/pcp.conf contains the local values
          for these variables.  The $PCP_CONF variable may be used to
          specify an alternative configuration file, as described in
          pcp.conf(5).

          For environment variables affecting PCP tools, see
          pmGetOptions(3).


---------------------------------------------------------

::

          PCPIntro(1), pmproxy(1), pmlogger(1), pmlogger_daily(1) and
          redis-server(1).

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

   Performance Co-Pilot               PCP                       PMSEARCH(1)

--------------

Pages that refer to this page:
`pmsearchinfo(3) <../man3/pmsearchinfo.3.html>`__, 
`pmsearchsetup(3) <../man3/pmsearchsetup.3.html>`__, 
`pmsearchtextindom(3) <../man3/pmsearchtextindom.3.html>`__, 
`pmsearchtextquery(3) <../man3/pmsearchtextquery.3.html>`__, 
`pmsearchtextsuggest(3) <../man3/pmsearchtextsuggest.3.html>`__, 
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
