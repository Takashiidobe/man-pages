.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

pmgetcontexthostname(3) — Linux manual page
===========================================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `C SYNOPSIS <#C_SYNOPSIS>`__ \|   |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `RETURN VALUE <#RETURN_VALUE>`__  |                                   |
| \| `NOTES <#NOTES>`__ \|          |                                   |
| `PCP                              |                                   |
| ENVIRONMENT <#PCP_ENVIRONMENT>`__ |                                   |
| \| `SEE ALSO <#SEE_ALSO>`__ \|    |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   PMGETCONTEXTHOSTNAME(3) Library Functions Manual PMGETCONTEXTHOSTNAME(3)

NAME
-------------------------------------------------

::

          pmGetHostName, pmGetContextHostName, pmGetContextHostName_r -
          return the hostname associated with a Performance Co-Pilot
          context


-------------------------------------------------------------

::

          #include <pcp/pmapi.h>

          int pmGetHostName(int id, char *buf, int buflen);
          const char *pmGetContextHostName(int id);
          char *pmGetContextHostName_r(int id, char *buf, int buflen);

          cc ... -lpcp


---------------------------------------------------------------

::

          Given a valid PCP context identifier previously created with
          pmNewContext(3) or pmDupContext(3), the pmGetContextHostName
          function returns the hostname associated with id.  The
          pmGetContextHostName_r function does the same, but stores the
          result in a user-supplied buffer buf of length buflen, which
          should have room for at least MAXHOSTNAMELEN bytes.  The
          pmGetHostName function behaves similarly again, but returns a
          status code to indicate success or failure.

          If the context id is associated with an archive source of data,
          the hostname returned is extracted from the archive label using
          pmGetArchiveLabel(3).

          For live contexts, an attempt will first be made to retrieve the
          hostname from the PCP collector system using pmFetch(3) with the
          pmcd.hostname metric.  This allows client tools using this
          interface to retrieve an accurate host identifier even in the
          presence of port forwarding and tunnelled connections.

          Should this not succeed, then a fallback method is used.  For
          local contexts - with local meaning any of DSO, ``localhost'' or
          Unix domain socket connection - a hostname will be sought via
          gethostname(3).  For other contexts, the hostname extracted from
          the initial context host specification will be used.


-----------------------------------------------------------------

::

          If id is not a valid PCP context identifier, the returned
          hostname is a zero length string.

          On failure, the return code of pmGetHostName is a negative PMAPI
          error code which can be processed by pmErrStr_r(3) for
          diagnostics relating to the failure to obtain the context
          hostname.


---------------------------------------------------

::

          pmGetContextHostName returns a pointer to a static buffer, so the
          returned value is only valid until the next call to
          pmGetContextHostName and hence is not thread-safe.  Multi-
          threaded applications should use pmGetHostName or
          pmGetContextHostName_r instead.


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

          PCPIntro(1), PMAPI(3), gethostname(3), pmDupContext(3),
          pmErrStr_r(3), pmFetch(3), pmGetArchiveLabel(3), pmNewContext(3),
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

   Performance Co-Pilot               PCP           PMGETCONTEXTHOSTNAME(3)

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
