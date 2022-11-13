.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

QmcSource(3) — Linux manual page
================================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `C++ SYNOPSIS <#C++_SYNOPSIS>`__  |                                   |
| \| `DESCRIPTION <#DESCRIPTION>`__ |                                   |
| \| `DESTRUCTOR <#DESTRUCTOR>`__   |                                   |
| \|                                |                                   |
| `CONSTRUCTORS <#CONSTRUCTORS>`__  |                                   |
| \| `DIAGNOSTICS <#DIAGNOSTICS>`__ |                                   |
| \| `SEE ALSO <#SEE_ALSO>`__ \|    |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   QMCSOURCE(3)            Library Functions Manual            QMCSOURCE(3)

NAME
-------------------------------------------------

::

          QmcSource  - manages contexts created by all groups


-----------------------------------------------------------------

::

          #include <QmcSource.h>

          CC ... -lqmc -lpcp


---------------------------------------------------------------

::

          The QmcSource class maintains a unique list of all metric sources
          in use to minimize the creation of new contexts (see
          pmNewContext(3)) when the context could have been duplicated (see
          pmDupContext(3)).  This also reduces the duplication of
          descriptions of each source.

          In general, QMC users should only need to access QmcSource
          methods to obtain source descriptions for a QmcContext(3) object.
          All context creation by the user should be handled through
          QmcGroup(3).


-------------------------------------------------------------

::

          ~QmcSource();
              Destructor.


-----------------------------------------------------------------

::

          static QmcSource* getSource(int type, const char* source,
              bool matchHosts)

              This method will return a QmcSource object that represents a
              context of type to source.  The QmcSource object may be a new
              object if the source has not been previously requested.
              Memory management of the QmcSource objects is handled by
              QmcSource.  If all QmcContext(3)s to the QmcSource have been
              deleted, the QmcSource object will also be deleted.

              The matchHosts flag controls the algorithm that is used to
              match hosts to archives.  If matchHosts is equal to false
              then no attempt will be made by this method to match a host
              context to an existing source context. A QmcSource object
              will always be returned in this case, although the
              QmcSource::status method may indicate that a context to
              source failed.

              If matchHosts is equal to true, host contexts will be matched
              to a pre-defined archive source collected from that source.
              If no archive sources for the source have been previous
              specified, getSource will return a NULL pointer.


---------------------------------------------------------------

::

          Error messages are generated using pmprintf(3) but are not
          flushed. It is the responsibility of the user to call pmflush(3)
          to output any messages.

          Additional diagnostics may be activated by adding the option pmc
          to the global debugging specification, as described in
          pmSetDebug(3).


---------------------------------------------------------

::

          PMAPI(3), QMC(3), QmcContext(3), QmcGroup(3), pmDupContext(3),
          pmflush(3), pmNewContext(3) and pmprintf(3).

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

   Performance Co-Pilot               SGI                      QMCSOURCE(3)

--------------

Pages that refer to this page: `QMC(3) <../man3/QMC.3.html>`__

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
