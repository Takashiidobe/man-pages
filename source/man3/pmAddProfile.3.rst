.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

pmaddprofile(3) — Linux manual page
===================================

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

   PMADDPROFILE(3)         Library Functions Manual         PMADDPROFILE(3)

NAME
-------------------------------------------------

::

          pmAddProfile - add instance(s) to the current PMAPI instance
          profile


-------------------------------------------------------------

::

          #include <pcp/pmapi.h>

          int pmAddProfile(pmInDom indom, int numinst, int *instlist);

          cc ... -lpcp


---------------------------------------------------------------

::

          The set of instances for performance metrics returned from a
          pmFetch(3) call may be filtered or restricted using an instance
          profile.  There is one instance profile for each context the
          application creates at the Performance Metrics Application
          Programming Interface (PMAPI(3)), and each instance profile may
          include instances from one or more instance domains (see
          pmLookupDesc(3)).

          pmAddProfile may be used to add new instance specifications to
          the instance profile of the current PMAPI context.

          In the simplest variant, the list of instances identified by the
          instlist argument for the indom instance domain are added to the
          instance profile.  The list of instance identifiers contains
          numinst values.

          The indom value would normally be extracted from a call to
          pmLookupDesc(3) for a particular performance metric, and the
          instances in instlist would typically be determined by calls to
          pmGetInDom(3) or pmLookupInDom(3).

          To select all instances in all instance domains, use

             pmAddProfile(PM_INDOM_NULL, 0, (int *)0)

          This is the only case where indom may be equal to PM_INDOM_NULL.
          If numinst is zero, or instlist is NULL, then all instances in
          indom are selected.


-----------------------------------------------------

::

          It is possible to add non-existent instance domains and non-
          existent instances to an instance profile.  None of the routines
          that use the instance profile will ever issue an error if you do
          this.  The cost of checking, when checking is possible, outweighs
          any benefits.


---------------------------------------------------------------

::

          PM_ERR_PROFILESPEC
                 indom was PM_INDOM_NULL and instlist was not empty


---------------------------------------------------------

::

          PMAPI(3), pmDelProfile(3), pmFetch(3), pmGetInDom(3),
          pmLookupDesc(3), pmLookupInDom(3), pmNewContext(3),
          pmUseContext(3) and pmWhichContext(3).

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

   Performance Co-Pilot               PCP                   PMADDPROFILE(3)

--------------

Pages that refer to this page:
`pcpintro(3) <../man3/pcpintro.3.html>`__, 
`pmapi(3) <../man3/pmapi.3.html>`__, 
`pmdelprofile(3) <../man3/pmdelprofile.3.html>`__, 
`pmfetch(3) <../man3/pmfetch.3.html>`__, 
`pmnewcontext(3) <../man3/pmnewcontext.3.html>`__, 
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
