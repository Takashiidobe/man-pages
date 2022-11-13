.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

pmerrstr(3) — Linux manual page
===============================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `C SYNOPSIS <#C_SYNOPSIS>`__ \|   |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `NOTES <#NOTES>`__ \|             |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   PMERRSTR(3)             Library Functions Manual             PMERRSTR(3)

NAME
-------------------------------------------------

::

          pmErrStr, pmErrStr_r - convert a PMAPI error code into a string


-------------------------------------------------------------

::

          #include <pcp/pmapi.h>

          const char *pmErrStr(int code);
          char *pmErrStr_r(int code, char *buf, int buflen);

          cc ... -lpcp


---------------------------------------------------------------

::

          Translate an error code into a text string, suitable for
          generating a diagnostic message.  The pmErrStr_r function does
          the same, but stores the result in a user-supplied buffer buf of
          length buflen, which should have room for at least
          PM_MAXERRMSGLEN bytes.

          By convention, all error codes are negative.  The small values
          are assumed to be negated versions of the Unix error codes as
          defined in <errno.h> and the strings returned are as per
          strerror(3).  The larger, negative error codes are Performance
          Metrics Application Programming Interface (PMAPI) error
          conditions and pmErrStr(3) returns an appropriate PMAPI error
          string, as determined by code.


---------------------------------------------------

::

          pmErrStr returns a pointer to a static buffer, so the returned
          value is only valid until the next call to pmErrStr and hence is
          not thread-safe.  Multi-threaded applications should use
          pmErrStr_r instead.


---------------------------------------------------------

::

          pmerr(1), PMAPI(3) and perror(3).

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

   Performance Co-Pilot               PCP                       PMERRSTR(3)

--------------

Pages that refer to this page: `pmerr(1) <../man1/pmerr.1.html>`__, 
`pmprobe(1) <../man1/pmprobe.1.html>`__, 
`pcpintro(3) <../man3/pcpintro.3.html>`__, 
`\__pmaf(3) <../man3/__pmaf.3.html>`__, 
`pmapi(3) <../man3/pmapi.3.html>`__, 
`pmdacache(3) <../man3/pmdacache.3.html>`__, 
`pmdaeventqueue(3) <../man3/pmdaeventqueue.3.html>`__, 
`pmdahelp(3) <../man3/pmdahelp.3.html>`__, 
`pmdarootconnect(3) <../man3/pmdarootconnect.3.html>`__, 
`pmdiscoversetup(3) <../man3/pmdiscoversetup.3.html>`__, 
`pmerrstr(3) <../man3/pmerrstr.3.html>`__, 
`pmfetch(3) <../man3/pmfetch.3.html>`__, 
`pmgetcontexthostname(3) <../man3/pmgetcontexthostname.3.html>`__, 
`pmgetderivedcontrol(3) <../man3/pmgetderivedcontrol.3.html>`__, 
`pmierrstr(3) <../man3/pmierrstr.3.html>`__, 
`pmjsonget(3) <../man3/pmjsonget.3.html>`__, 
`pmloadderivedconfig(3) <../man3/pmloadderivedconfig.3.html>`__, 
`pmlookuplabels(3) <../man3/pmlookuplabels.3.html>`__, 
`pmprintf(3) <../man3/pmprintf.3.html>`__, 
`\__pmprocessexec(3) <../man3/__pmprocessexec.3.html>`__, 
`\__pmprocesspipe(3) <../man3/__pmprocesspipe.3.html>`__, 
`pmrecord(3) <../man3/pmrecord.3.html>`__, 
`pmsetprocessidentity(3) <../man3/pmsetprocessidentity.3.html>`__, 
`pmunpackeventrecords(3) <../man3/pmunpackeventrecords.3.html>`__, 
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
