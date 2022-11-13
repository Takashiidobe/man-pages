.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

pmindomstr(3) — Linux manual page
=================================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `C SYNOPSIS <#C_SYNOPSIS>`__ \|   |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `NOTES <#NOTES>`__ \|             |                                   |
| `PCP                              |                                   |
| ENVIRONMENT <#PCP_ENVIRONMENT>`__ |                                   |
| \| `SEE ALSO <#SEE_ALSO>`__ \|    |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   PMINDOMSTR(3)           Library Functions Manual           PMINDOMSTR(3)

NAME
-------------------------------------------------

::

          pmInDomStr, pmInDomStr_r - convert a performance metric instance
          domain identifier into a string


-------------------------------------------------------------

::

          #include <pcp/pmapi.h>

          const char *pmInDomStr(pmInDom indom);
          char *pmInDomStr_r(pmInDom indom, char *buf, int buflen);

          cc ... -lpcp


---------------------------------------------------------------

::

          For use in error and diagnostic messages, pmInDomStr return a
          'human readable' version of the specified instance domain
          identifier.  The pmInDomStr_r function does the same, but stores
          the result in a user-supplied buffer buf of length buflen, which
          should have room for at least 20 bytes.

          The value for the instance domain indom is typically extracted
          from a pmDesc structure, following a call to pmLookupDesc(3) for
          a particular performance metric.

          Internally, an instance domain identifier is encoded with two
          fields: domain and serial.

          pmInDomStr returns a string with each of the fields appearing as
          decimal numbers, separated by periods.

          The string value returned by pmInDomStr is held in a single
          static buffer, so the returned value is only valid until the next
          call to pmInDomStr.


---------------------------------------------------

::

          pmInDomStr returns a pointer to a static buffer and hence is not
          thread-safe.  Multi-threaded applications should use pmInDomStr_r
          instead.


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

          PMAPI(3), pmGetConfig(3), pmIDStr(3), pmTypeStr(3), pmSemStr(3),
          pmUnitsStr(3), pmLookupDesc(3), pcp.conf(5) and pcp.env(5).

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

   Performance Co-Pilot               PCP                     PMINDOMSTR(3)

--------------

Pages that refer to this page: `pmidstr(3) <../man3/pmidstr.3.html>`__, 
`pmindom_helper(3) <../man3/pmindom_helper.3.html>`__, 
`pmsemstr(3) <../man3/pmsemstr.3.html>`__, 
`pmtypestr(3) <../man3/pmtypestr.3.html>`__, 
`pmunitsstr(3) <../man3/pmunitsstr.3.html>`__, 
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
