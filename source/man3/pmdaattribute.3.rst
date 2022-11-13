.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

pmdaattribute(3) — Linux manual page
====================================

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

   PMDAATTRIBUTE(3)        Library Functions Manual        PMDAATTRIBUTE(3)

NAME
-------------------------------------------------

::

          pmdaAttribute - informs a PMDA about client connection attributes


-------------------------------------------------------------

::

          #include <pcp/pmapi.h>
          #include <pcp/pmda.h>

          int pmdaAttribute(int context, int key, char *value, int length,
          pmdaExt *pmda);

          cc ... -lpcp_pmda -lpcp


---------------------------------------------------------------

::

          As part of the Performance Metrics Domain Agent (PMDA) API (see
          PMDA(3)), pmdaAttribute is the generic callback for responding to
          client connection attributes.  These attributes include client
          credential information, such as user ID and group ID.

          A PMDA that supports connection attributes will provide a private
          pmdaAttribute callback by assignment to version.six.attribute of
          the pmdaInterface structure, and implement custom logic for any
          of the attribute key-value pairs of interest to it.

          All attributes are associated with a specific client context, and
          these can be uniquely identified using the ctx first argument.
          The PMDA should track client connections, and disconnections
          using the pmdaSetEndContextCallBack(3) interface, as a result.
          The pmdaGetContext(3) interface may be particularly helpful also.

          All attributes are passed as key-value pairs and the value is
          always passed as a null-terminated string of given length.  This
          includes numeric attributes like the user ID.

          The most commonly used attributes would be PCP_ATTR_USERID and
          PCP_ATTR_GROUPID but others may also be optionally passed (such
          as PCP_ATTR_USERNAME) if they are available.  Some attributes
          will be consumed by pmcd and never through passed to PMDAs, such
          as PCP_ATTR_PASSWORD.  A complete list of all possible attributes
          can be found in the headers listed above, all are prefixed by
          PCP_ATTR.


-----------------------------------------------------

::

          The PMDA must be using PMDA_PROTOCOL_6 or later, as specified in
          the call to pmdaDSO(3) or pmdaDaemon(3).


---------------------------------------------------------------

::

          pmdaAttribute should return either zero on success, or a negative
          return code to indicate an error in handling the attribute.  This
          return code cannot be used to indicate a client should be
          disallowed access - such functionality must be performed by the
          agent in response to callbacks for the client in question (using
          PM_ERR_PERMISSION for those specific callbacks, for that specific
          client.  In other words, errors will be be passed to PMCD but
          there is no guarantee made that the error will be return to the
          client and result in termination of the client, for example.


---------------------------------------------------------

::

          PMAPI(3), PMDA(3), pmdaDaemon(3), pmdaDSO(3), pmdaMain(3) and
          pmdaGetContext(3).

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

   Performance Co-Pilot               PCP                  PMDAATTRIBUTE(3)

--------------

Pages that refer to this page: `pmdamain(3) <../man3/pmdamain.3.html>`__

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
