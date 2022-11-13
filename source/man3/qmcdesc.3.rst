.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

QmcDesc(3) — Linux manual page
==============================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `C++ SYNOPSIS <#C++_SYNOPSIS>`__  |                                   |
| \| `DESCRIPTION <#DESCRIPTION>`__ |                                   |
| \|                                |                                   |
| `CONSTRUCTORS & DESTRUCTO         |                                   |
| R <#CONSTRUCTORS_&_DESTRUCTOR>`__ |                                   |
| \| `DESCRIPTION <#DESCRIPTION>`__ |                                   |
| \| `UNITS <#UNITS>`__ \|          |                                   |
| `DIAGNOSTICS <#DIAGNOSTICS>`__ \| |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   QMCDESC(3)              Library Functions Manual              QMCDESC(3)

NAME
-------------------------------------------------

::

          QmcDesc - container for a metric description


-----------------------------------------------------------------

::

          #include <QmcDesc.h>

          CC ... -lqmc -lpcp


---------------------------------------------------------------

::

          A QmcDesc object is a container for a metric descriptor (pmDesc,
          see PMAPI(3)) and units.


-------------------------------------------------------------------------------------------

::

          ~QmcDesc();
              Destructor.

          QmcDesc(pmID pmid);
              Construct a container for the descriptor for pmid.  The
              descriptor is obtained from the current PMAPI(3) context
              using pmLookupDesc(3).

.. _description-top-1:


---------------------------------------------------------------

::

          int status() const;
              A status less than zero indicates that the descriptor could
              not be obtained, the PMAPI(3) error is encoded in the result.

          pmID id() const;
              Return the pmID for this descriptor.

          pmDesc desc() const;
              Return a copy of the actual metric descriptor.

          const pmDesc *descPtr() const;
              Return a pointer to the actual descriptor to avoid using a
              pointer to a temporary.


---------------------------------------------------

::

          const QString &units() const;
              The complete unit string for this descriptor.

          const QString &abvUnits() const;
              The unit string using abbreviations.

          bool useScaleUnits() const;
              Returns true if the units have been set by a call to
              QmcDesc::setScaleUnits.

          const pmUnits &scaleUnits() const;
              Return the scaling units for this descriptor.

          void setScaleUnits(const pmUnits &units);
              Set the scaling units for this descriptor.


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

          PMAPI(3), QMC(3), pmflush(3), pmLookupDesc(3) and pmprintf(3).

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

   Performance Co-Pilot               SGI                        QMCDESC(3)

--------------

Pages that refer to this page: `QMC(3) <../man3/QMC.3.html>`__, 
`QmcContext(3) <../man3/QmcContext.3.html>`__, 
`QmcIndom(3) <../man3/QmcIndom.3.html>`__

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
