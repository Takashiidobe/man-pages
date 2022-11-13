.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

pmdasockets(1) — Linux manual page
==================================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `INSTALLATION <#INSTALLATION>`__  |                                   |
| \|                                |                                   |
| `FILTER CONFIGU                   |                                   |
| RATION <#FILTER_CONFIGURATION>`__ |                                   |
| \|                                |                                   |
| `LOGGING CONFIGUR                 |                                   |
| ATION <#LOGGING_CONFIGURATION>`__ |                                   |
| \| `METRICS <#METRICS>`__ \|      |                                   |
| `PCP                              |                                   |
| ENVIRONMENT <#PCP_ENVIRONMENT>`__ |                                   |
| \| `SEE ALSO <#SEE_ALSO>`__ \|    |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   PMDASOCKETS(1)           General Commands Manual          PMDASOCKETS(1)

NAME
-------------------------------------------------

::

          pmdasockets - sockets statistics PMDA


---------------------------------------------------------------

::

          pmdasockets is a Performance Metrics Domain Agent (PMDA) which
          exports metric values for current sockets on the local system.

          This PMDA currently collects its data through the ss(8) utility
          and requires that the program is installed in order to function.
          This dependency may change in the future.


-----------------------------------------------------------------

::

          To install (enable) the sockets PMDA, do the following as root:

              # cd $PCP_PMDAS_DIR/sockets
              # ./Install

          To uninstall (disable), do the following as root:

              # cd $PCP_PMDAS_DIR/sockets
              # ./Remove

          pmdasockets is launched by pmcd(1) and should never be executed
          directly.  The Install and Remove scripts notify pmcd(1) when the
          agent is installed or removed.


---------------------------------------------------------------------------------

::

          The string valued metric network.persocket.filter specifies the
          ss(1) filter to be applied to optionally select socket states, IP
          addresses and other options that pmdasockets will collect (to
          populate it's instance domain).  This is loaded on PMDA startup
          from the file $(PCP_SYSCONF_DIR)/sockets/filter.conf (typically
          /etc/pcp/sockets/filter.conf) and defaults to state connected
          meaning only sockets in the connected state will be included.
          This can be changed persistently by editing filter.conf as the
          root user.  The filter can also be changed dynamically after the
          PMDA has started by using pmstore(1) to store a new filter string
          in the network.persocket.filter metric.  E.g.

              # pmstore network.persocket.filter "state all"

          will change the filter to include sockets in all states.  Note a
          dynamically stored filter is not persisted across PMDA restarts
          or reboots (edit the config file for a persistent change).  For
          further details of the filter syntax and options, consult ss(8).


-----------------------------------------------------------------------------------

::

          The pmlogconf(1) configuration file for pmdasockets is
          $PCP_VAR_DIR/config/pmlogconf/networking/persocket-linux (where
          $PCP_VAR_DIR is typically /var/lib/pcp) which specifies to log
          all metrics below network.persocket in the PCP namespace with a
          default sampling interval of 60 seconds.  The logging interval
          and metrics to be logged can be changed by editing that file and
          then restarting the pmlogger service.  For details of the syntax,
          see pmlogconf(1).


-------------------------------------------------------

::

          The metrics and metadata supported by pmdasockets correspond to
          fields reported by ss -noemitauOH and are also available as help
          text provided by the PMDA, e.g. to list all metrics, metadata
          descriptors and help text:

              # pminfo -fmdtT network.persocket

          Note that the PMDA must be installed (enabled) for this command
          to work correctly, see above.


-----------------------------------------------------------------------

::

          Environment variables with the prefix PCP_ are used to
          parameterize the file and directory names used by PCP. On each
          installation, the file /etc/pcp.conf contains the local values
          for these variables.  The $PCP_CONF variable may be used to
          specify an alternative configuration file, as described in
          pcp.conf(5).


---------------------------------------------------------

::

          PCPIntro(1), pmcd(1), pmlogger(1) and ss(8).

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

   Performance Co-Pilot               PCP                    PMDASOCKETS(1)

--------------

Pages that refer to this page: `pcp-ss(1) <../man1/pcp-ss.1.html>`__

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
