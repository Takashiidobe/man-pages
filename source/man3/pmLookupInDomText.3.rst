.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

pmlookupindomtext(3) — Linux manual page
========================================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `C SYNOPSIS <#C_SYNOPSIS>`__ \|   |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `DIAGNOSTICS <#DIAGNOSTICS>`__ \| |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   PMLOOKUPINDOMTEXT(3)    Library Functions Manual    PMLOOKUPINDOMTEXT(3)

NAME
-------------------------------------------------

::

          pmLookupInDomText - return text describing a performance metrics
          instance domain


-------------------------------------------------------------

::

          #include <pcp/pmapi.h>

          int pmLookupInDomText(pmInDom indom, int level, char **buffer);

          cc ... -lpcp


---------------------------------------------------------------

::

          Retrieve descriptive text about the performance metrics instance
          domain identified by indom.

          The value for the instance domain indom is typically extracted
          from a pmDesc structure, following a call to pmLookupDesc(3) for
          a particular performance metric.

          The argument level should be PM_TEXT_ONELINE for a one-line
          summary, else PM_TEXT_HELP for a more verbose description, suited
          to a help dialog.

          The space pointed to by buffer will have been allocated in
          pmLookupInDomText with malloc(3), and it is the responsibility of
          the caller to free(3) the space when it is no longer required.

          pmLookupInDomText returns zero on success.


---------------------------------------------------------------

::

          PM_ERR_NOTHOST
                 For archives created with versions of PCP prior to 4.0, if
                 the current PMAPI context is an archive log (help and one-
                 line text was previously not maintained in the archive
                 logs)


---------------------------------------------------------

::

          chkhelp(1), newhelp(1), PMAPI(3), pmGetConfig(3),
          pmLookupDesc(3), pmLookupLabels(3), pmLookupText(3), pcp.conf(5)
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

   Performance Co-Pilot               PCP              PMLOOKUPINDOMTEXT(3)

--------------

Pages that refer to this page: `chkhelp(1) <../man1/chkhelp.1.html>`__, 
`newhelp(1) <../man1/newhelp.1.html>`__, 
`pcpintro(3) <../man3/pcpintro.3.html>`__, 
`pmdatext(3) <../man3/pmdatext.3.html>`__, 
`pmlookuptext(3) <../man3/pmlookuptext.3.html>`__, 
`LOGARCHIVE(5) <../man5/LOGARCHIVE.5.html>`__

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
