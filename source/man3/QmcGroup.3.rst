.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

QmcGroup(3) — Linux manual page
===============================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `C++ SYNOPSIS <#C++_SYNOPSIS>`__  |                                   |
| \| `DESCRIPTION <#DESCRIPTION>`__ |                                   |
| \|                                |                                   |
| `CONSTRUCTORS & DESTRUCTO         |                                   |
| R <#CONSTRUCTORS_&_DESTRUCTOR>`__ |                                   |
| \| `CONTEXTS <#CONTEXTS>`__ \|    |                                   |
| `METRICS <#METRICS>`__ \|         |                                   |
| `TIMEZONES <#TIMEZONES>`__ \|     |                                   |
| `DEBUGGING <#DEBUGGING>`__ \|     |                                   |
| `DIAGNOSTICS <#DIAGNOSTICS>`__ \| |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   QMCGROUP(3)             Library Functions Manual             QMCGROUP(3)

NAME
-------------------------------------------------

::

          QmcGroup - container representing a single fetch group of metrics
          from multiple sources


-----------------------------------------------------------------

::

          #include <QmcGroup.h>

          CC ... -lqmc -lpcp


---------------------------------------------------------------

::

          A QmcGroup object is a container for contexts and metrics that
          should be fetched at the same time.  The class manages the
          QmcContext(3) objects, timezones and bounds for every context
          created with QmcGroup::use and QmcGroup::addMetric.


-------------------------------------------------------------------------------------------

::

          ~QmcGroup();
              Destructor which destroys all metrics and contexts created by
              this group.

          QmcGroup(bool restrictArchives = false);
              Construct a new fetch group.  restrictArchives will restrict
              the creating of multiple archive contexts created from the
              same host.


---------------------------------------------------------

::

          The default context of the group is defined as the first context
          created with QmcGroup::use before the first call to
          QmcGroup::addMetric.  If no context is created before the first
          metric is added, the localhost is used as the default context.
          Therefore, if any metrics specifications contain archive sources,
          an archive source must have been created with QmcGroup::use to
          avoid an error for mixing context types.

          uint_t numContexts() const;
              The number of valid contexts created in this group.

          QmcContext const& context(uint_t index) const
              Return a handle to a context.

          QmcContext& context(uint_t index);
              Return a modifiable handle to a context.

          int mode() const;
              Return the type of context, either PM_CONTEXT_LOCAL,
              PM_CONTEXT_HOST or PM_CONTEXT_ARCHIVE.

          QmcContext* which() const;
              Return a handle to the current context of this group. This
              does not call pmUseContext(3) so it may not be the current
              PMAPI(3) context.

          uint_t whichIndex() const
              The index to the current group context.

          int use(int type, char const* source);
              Use the context of type from source.  If a context to this
              source already exists in this group, that context will become
              the current PMAPI(3) context.  Otherwise a new context will
              be created.  The result is the PMAPI(3) context handle for
              the QmcGroup::context or a PMAPI(3) error code if the context
              failed.

          bool defaultDefined() const;
              Returns true if a default context has been determined.

          int useDefault();
              Use the default context. If a default context has not been
              created, the context to the local host will be attempted.  A
              result less than zero indicates that the method failed with
              the PMAPI(3) error encoded in the result.

          void createLocalContext();
              Create and use a context to the local host.  A result less
              than zero indicates that the method failed with the PMAPI(3)
              error encoded in the result.


-------------------------------------------------------

::

          These addMetric methods should be used to create new metrics as
          the QmcMetric constructors are private. These methods will always
          return a pointer to a QmcMetric object, however the
          QmcMetric::status() field should be checked to ensure the metric
          is valid.

          QmcMetric* addMetric(char const* str, double theScale = 0.0,
              bool active = false);

              Add the metric str to the group, with a scaling factor of
              scale.  If active is set the metric will use only active
              instances (see QmcMetric(3)).

          QmcMetric* addMetric(pmMetricSpec* theMetric, double theScale
              = 0.0, bool active);

              Add the metric theMetric to the group, with a scaling factor
              of scale.  If active is set the metric will use only active
              instances (see QmcMetric(3)).

          int fetch(bool update = true);
              Fetch all the metrics in all the contexts in this group.  If
              update is equal to true, all counter metrics will be
              automatically converted to rates (see QmcMetric(3)).

          int setArchiveMode(int mode, const struct timeval *when,
              int interval);

              Set the mode and time to access all archive contexts in this
              group.  See pmSetmode(3) for more details.


-----------------------------------------------------------

::

          These methods assist in the management of multiple timezones and
          help to control the current timezone.

          enum TimeZoneFlag { localTZ, userTZ, groupTZ, unknownTZ };
              Enumeration used to describe the origin of the default
              timezone.  localTZ, userTZ and groupTZ indicate that the
              timezone was set with QmcGroup::useLocalTZ,
              QmcGroup::useTZ(QString const&) and QmcGroup::useTZ()
              respectively.  unknownTZ indicates that a timezone has not
              been set.  userTZ indicates that the timezone was

          int useTZ();
              Use the timezone of the current group context as the default.

          int useTZ(const QString &tz);
              Add and use tz as the default timezone of this group.

          int useLocalTZ();
              Use the timezone of the localhost as the default for this
              group.

          void defaultTZ(QString &label, QString &tz);
              Return the label and tz string of the default timezone of
              this group.

          TimeZoneFlag defaultTZ() const
              Return the origin of the default timezone.

          int useDefaultTZ();
              Set the timezone to be the default timezone as defined in a
              previous call to QmcGroup::useTZ or QmcGroup::useLocalTZ.

          struct timeval const& logStart() const;
              Return the earliest starting time of any archives in this
              group.  Assumes that QmcGroup::updateBounds has been called.

          struct timeval const& logEnd() const;
              Return the latest finish time of any archives in this group.
              Assumes that QmcGroup::updateBounds has been called.

          void updateBounds();
              Determine the earliest start and latest finish times of all
              archives in this group.

          int sendTimezones();
              Send the current timezones to kmtime(3).


-----------------------------------------------------------

::

          void dump(ostream &os);
              Dump state information about this group to os.


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

          PMAPI(3), QMC(3), QmcContext(3), QmcMetric(3), pmflush(3),
          pmprintf(3) and pmSetMode(3).

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

   Performance Co-Pilot               SGI                       QMCGROUP(3)

--------------

Pages that refer to this page: `QMC(3) <../man3/QMC.3.html>`__, 
`QmcContext(3) <../man3/QmcContext.3.html>`__, 
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
