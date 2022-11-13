.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

pmnewcontext(3) — Linux manual page
===================================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `C SYNOPSIS <#C_SYNOPSIS>`__ \|   |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `CAVEATS <#CAVEATS>`__ \|         |                                   |
| `DIAGNOSTICS <#DIAGNOSTICS>`__ \| |                                   |
| `ENVIRONMENT <#ENVIRONMENT>`__ \| |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   PMNEWCONTEXT(3)         Library Functions Manual         PMNEWCONTEXT(3)

NAME
-------------------------------------------------

::

          pmNewContext - establish a new PMAPI context


-------------------------------------------------------------

::

          #include <pcp/pmapi.h>

          int pmNewContext(int type, const char *name);

          cc ... -lpcp


---------------------------------------------------------------

::

          An application using the Performance Metrics Application
          Programming Interface (PMAPI) may manipulate several concurrent
          contexts, each associated with a source of performance metrics,
          e.g. pmcd(1) on some host, or a set of archive logs of
          performance metrics as created by pmlogger(1), or a standalone
          connection on the local host that does not involve pmcd(1).

          pmNewContext may be used to establish a new context.  The source
          of the metrics is identified by name, and may be either a host
          name (type is PM_CONTEXT_HOST), or a comma-separated list of
          names referring to a set of archive logs (type is
          PM_CONTEXT_ARCHIVE).  Each element of the list may either be the
          base name common to all of the physical files of an archive log
          or the name of a directory containing archive logs.

          For a type of PM_CONTEXT_HOST, in addition to identifying a host
          the name may also be used to encode additional optional
          information in the form of a pmcd(1) port number, a pmproxy(1)
          hostname and a proxy port number. For example the name
          "app23:14321,4321@firewall.example.com:11111" specifies a
          connection on port 14321 (or port 4321 if 14321 is unavailable)
          to pmcd(1) on the host app23 via port 11111 to pmproxy(1) on the
          host firewall.example.com.

          For a type of PM_CONTEXT_ARCHIVE, each element of the list of
          names in name may also be the name of any of the physical files
          of an archive, e.g.  myarchive.meta (the metadata file) or
          myarchive.index (the temporal index) or myarchive.0 (the first
          data volume of the archive) or myarchive.0.bz2 or myarchive.0.bz
          (the first data volume compressed with bzip2(1)) or
          myarchive.0.gz or myarchive.0.Z or myarchive.0.z (the first data
          volume compressed with gzip(1)), myarchive.1 or myarchive.3.bz2
          or myarchive.42.gz etc.

          If more than one archive is specified for a type of
          PM_CONTEXT_ARCHIVE, there are some restrictions on the archives
          within the set:

          •  The archives must all have been generated on the same host.

          •  The archives must not overlap in time.

          •  The archives must all have been created using the same time
             zone.

          •  The PMID of each metric should be the same in all of the
             archives.  Multiple PMIDs are currently tolerated by using the
             first PMID defined for each metric and ignoring subsequent
             PMIDs.

          •  The type of each metric must be the same in all of the
             archives.

          •  The semantics of each metric must be the same in all of the
             archives.

          •  The units of each metric must be the same in all of the
             archives.

          •  The instance domain of each metric must be the same in all of
             the archives.

          In the case where type is PM_CONTEXT_LOCAL, name is ignored, and
          the context uses a standalone connection to the PMDA methods used
          by pmcd(1).  When this type of context is used, the range of
          accessible performance metrics is constrained to those from the
          operating system, and optionally the ``proc'', ``sample'' and
          ``ib'' PMDAs.

          In the case where type is PM_CONTEXT_HOST, additional flags can
          be added to the type to indicate if the connection to pmcd(1)
          should be encrypted (PM_CTXFLAG_SECURE), deferred
          (PM_CTXFLAG_SHALLOW) and if the file descriptor used to
          communicate with pmcd(1), should not be shared across contexts
          (PM_CTXFLAG_EXCLUSIVE).  Both the PM_CTXFLAG_SHALLOW and
          PM_CTXFLAG_EXCLUSIVE flags are now deprecated and ignored.

          The initial instance profile is set up to select all instances in
          all instance domains.  In the case of a set of archives, the
          initial collection time is also set to zero, so that an initial
          pmFetch(3) will result in the earliest set of metrics being
          returned from the set of archives.

          Once established, the association between a context and a source
          of metrics is fixed for the life of the context, however routines
          are provided to independently manipulate both the instance
          profile (see pmAddProfile(3) and pmDelProfile(3)) and the
          collection time for archives (see pmSetMode(3)).

          pmNewContext returns a handle that may be used with subsequent
          calls to pmUseContext(3).

          The new context remains the current PMAPI context for all
          subsequent calls across the PMAPI, until another call to
          pmNewContext(3) is made, or the context is explicitly changed
          with a call to pmDupContext(3) or pmUseContext(3), or destroyed
          using pmDestroyContext(3).

          When attempting to connect to a remote pmcd(1) on a machine that
          is booting, pmNewContext could potentially block for a long time
          until the remote machine finishes its initialization.
          pmNewContext will abort and return an error if the connection has
          not been established after some specified interval has elapsed.
          The default interval is 5 seconds.  This may be modified by
          setting PMCD_CONNECT_TIMEOUT in the environment to a real number
          of seconds for the desired timeout.  This is most useful in cases
          where the remote host is at the end of a slow network, requiring
          longer latencies to establish the connection correctly.


-------------------------------------------------------

::

          When using a type of PM_CONTEXT_LOCAL, the operating system PMDA
          may export data structures directly from the kernel, which means
          that the pmNewContext caller should be an executable program
          compiled for the same object code format as the booted kernel.

          In addition, applications using a PM_CONTEXT_LOCAL context must
          be single-threaded because the various DSO PMDAs may not be
          thread-safe.  This restriction is enforced at the PMAPI(3), where
          routines may return the error code PM_ERR_THREAD if the library
          detects calls from more than one thread.

          Applications that use gethostbyname(3) should exercise caution
          because the static fields in struct hostent may not be preserved
          across some PMAPI(3) calls.  In particular, pmNewContext(3) and
          pmReconnectContext(3) both may call gethostbyname(3) internally.


---------------------------------------------------------------

::

          PM_ERR_PERMISSION

                 No permission to perform requested operation

          PM_ERR_CONNLIMIT

                 PMCD connection limit for this host exceeded

          PM_ERR_NOCONTEXT

                 Requested context type was not PM_CONTEXT_LOCAL,
                 PM_CONTEXT_HOST or PM_CONTEXT_ARCHIVE.

          PM_ERR_LOGOVERLAP

                 Archives overlap in time

          PM_ERR_LOGHOST

                 Archives differ by host

          PM_ERR_LOGTIMEZONE

                 Archives differ by time zone.

          PM_ERR_LOGCHANGETYPE

                 The type of a metric differs among archives

          PM_ERR_LOGCHANGESEM

                 The semantics of a metric differs among archives

          PM_ERR_LOGCHANGEINDOM

                 The instance domain of a metric differs among archives

          PM_ERR_LOGCHANGEUNITS

                 The units of a metric differs among archives


---------------------------------------------------------------

::

          PMCD_CONNECT_TIMEOUT
                 Timeout period (in seconds) for pmcd(1) connection
                 attempts.

          PMCD_PORT
                 TCP/IP port(s) for connecting to pmcd(1), historically was
                 4321 and more recently the officially registered port
                 44321; in the current release, pmcd listens on both these
                 ports as a transitional arrangement.  If used, should be
                 set to a comma-separated list of numerical port numbers.

          PMDA_PATH
                 When searching for PMDAs to be loaded when type is
                 PM_CONTEXT_LOCAL, the PMDA_PATH environment variable may
                 be used to define a search path of directories to be used
                 to locate the PMDA executables.  The default search path
                 is $PCP_SHARE_DIR/lib:/usr/pcp/lib.


---------------------------------------------------------

::

          pmcd(1), pmproxy(1), pmAddProfile(3), PMAPI(3), pmDelProfile(3),
          pmDestroyContext(3), pmDupContext(3), pmGetConfig(3),
          pmReconnectContext(3), pmSetMode(3), pmUseContext(3),
          pmWhichContext(3), pcp.conf(5) and pcp.env(5).

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

   Performance Co-Pilot               PCP                   PMNEWCONTEXT(3)

--------------

Pages that refer to this page:
`pcpintro(1) <../man1/pcpintro.1.html>`__, 
`pmdaib(1) <../man1/pmdaib.1.html>`__, 
`pmgenmap(1) <../man1/pmgenmap.1.html>`__, 
`pmstat(1) <../man1/pmstat.1.html>`__, 
`pcpintro(3) <../man3/pcpintro.3.html>`__, 
`pmaddderived(3) <../man3/pmaddderived.3.html>`__, 
`pmaddprofile(3) <../man3/pmaddprofile.3.html>`__, 
`pmapi(3) <../man3/pmapi.3.html>`__, 
`pmdelprofile(3) <../man3/pmdelprofile.3.html>`__, 
`pmdestroycontext(3) <../man3/pmdestroycontext.3.html>`__, 
`pmdupcontext(3) <../man3/pmdupcontext.3.html>`__, 
`pmfetch(3) <../man3/pmfetch.3.html>`__, 
`pmfetcharchive(3) <../man3/pmfetcharchive.3.html>`__, 
`pmfetchgroup(3) <../man3/pmfetchgroup.3.html>`__, 
`pmgetarchivelabel(3) <../man3/pmgetarchivelabel.3.html>`__, 
`pmgetcontexthostname(3) <../man3/pmgetcontexthostname.3.html>`__, 
`pmgetoptions(3) <../man3/pmgetoptions.3.html>`__, 
`\__pmlocalpmda(3) <../man3/__pmlocalpmda.3.html>`__, 
`pmlookuplabels(3) <../man3/pmlookuplabels.3.html>`__, 
`pmlookupname(3) <../man3/pmlookupname.3.html>`__, 
`pmnameall(3) <../man3/pmnameall.3.html>`__, 
`pmnameid(3) <../man3/pmnameid.3.html>`__, 
`pmnewcontext(3) <../man3/pmnewcontext.3.html>`__, 
`pmnewcontextzone(3) <../man3/pmnewcontextzone.3.html>`__, 
`pmparsehostattrsspec(3) <../man3/pmparsehostattrsspec.3.html>`__, 
`pmparsehostspec(3) <../man3/pmparsehostspec.3.html>`__, 
`pmreconnectcontext(3) <../man3/pmreconnectcontext.3.html>`__, 
`pmregisterderived(3) <../man3/pmregisterderived.3.html>`__, 
`pmspeclocalpmda(3) <../man3/pmspeclocalpmda.3.html>`__, 
`pmtrimnamespace(3) <../man3/pmtrimnamespace.3.html>`__, 
`pmusecontext(3) <../man3/pmusecontext.3.html>`__, 
`pmwebapi(3) <../man3/pmwebapi.3.html>`__, 
`pmwhichcontext(3) <../man3/pmwhichcontext.3.html>`__, 
`QmcSource(3) <../man3/QmcSource.3.html>`__

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
