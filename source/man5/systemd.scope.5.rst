.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

systemd.scope(5) — Linux manual page
====================================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `AUTOMATIC DEPENDEN               |                                   |
| CIES <#AUTOMATIC_DEPENDENCIES>`__ |                                   |
| \| `OPTIONS <#OPTIONS>`__ \|      |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `NOTES <#NOTES>`__ \|             |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   SYSTEMD.SCOPE(5)              systemd.scope             SYSTEMD.SCOPE(5)

NAME
-------------------------------------------------

::

          systemd.scope - Scope unit configuration


---------------------------------------------------------

::

          scope.scope


---------------------------------------------------------------

::

          Scope units are not configured via unit configuration files, but
          are only created programmatically using the bus interfaces of
          systemd. They are named similar to filenames. A unit whose name
          ends in ".scope" refers to a scope unit. Scopes units manage a
          set of system processes. Unlike service units, scope units manage
          externally created processes, and do not fork off processes on
          its own.

          The main purpose of scope units is grouping worker processes of a
          system service for organization and for managing resources.

          systemd-run --scope may be used to easily launch a command in a
          new scope unit from the command line.

          See the New Control Group Interfaces[1] for an introduction on
          how to make use of scope units from programs.

          Note that, unlike service units, scope units have no "main"
          process: all processes in the scope are equivalent. The lifecycle
          of the scope unit is thus not bound to the lifetime of one
          specific process, but to the existence of at least one process in
          the scope. This also means that the exit statuses of these
          processes are not relevant for the scope unit failure state.
          Scope units may still enter a failure state, for example due to
          resource exhaustion or stop timeouts being reached, but not due
          to programs inside of them terminating uncleanly. Since processes
          managed as scope units generally remain children of the original
          process that forked them off, it is also the job of that process
          to collect their exit statuses and act on them as needed.


-------------------------------------------------------------------------------------

::

      Implicit Dependencies
          Implicit dependencies may be added as result of resource control
          parameters as documented in systemd.resource-control(5).

      Default Dependencies
          The following dependencies are added unless
          DefaultDependencies=no is set:

          •   Scope units will automatically have dependencies of type
              Conflicts= and Before= on shutdown.target. These ensure that
              scope units are removed prior to system shutdown. Only scope
              units involved with early boot or late system shutdown should
              disable DefaultDependencies= option.


-------------------------------------------------------

::

          Scope files may include a [Scope] section, which carries
          information about the scope and the units it contains. A number
          of options that may be used in this section are shared with other
          unit types. These options are documented in systemd.kill(5) and
          systemd.resource-control(5). The options specific to the [Scope]
          section of scope units are the following:

          RuntimeMaxSec=
              Configures a maximum time for the scope to run. If this is
              used and the scope has been active for longer than the
              specified time it is terminated and put into a failure state.
              Pass "infinity" (the default) to configure no runtime limit.


---------------------------------------------------------

::

          systemd(1), systemd-run(1), systemd.unit(5),
          systemd.resource-control(5), systemd.service(5),
          systemd.directives(7).


---------------------------------------------------

::

           1. New Control Group Interfaces
              https://www.freedesktop.org/wiki/Software/systemd/ControlGroupInterface/

COLOPHON
---------------------------------------------------------

::

          This page is part of the systemd (systemd system and service
          manager) project.  Information about the project can be found at
          ⟨http://www.freedesktop.org/wiki/Software/systemd⟩.  If you have
          a bug report for this manual page, see
          ⟨http://www.freedesktop.org/wiki/Software/systemd/#bugreports⟩.
          This page was obtained from the project's upstream Git repository
          ⟨https://github.com/systemd/systemd.git⟩ on 2021-08-27.  (At that
          time, the date of the most recent commit that was found in the
          repository was 2021-08-27.)  If you discover any rendering
          problems in this HTML version of the page, or you believe there
          is a better or more up-to-date source for the page, or you have
          corrections or improvements to the information in this COLOPHON
          (which is not part of the original manual page), send a mail to
          man-pages@man7.org

   systemd 249                                             SYSTEMD.SCOPE(5)

--------------

Pages that refer to this page: `systemd(1) <../man1/systemd.1.html>`__, 
`systemd-run(1) <../man1/systemd-run.1.html>`__, 
`environment.d(5) <../man5/environment.d.5.html>`__, 
`logind.conf(5) <../man5/logind.conf.5.html>`__, 
`systemd.kill(5) <../man5/systemd.kill.5.html>`__, 
`systemd.resource-control(5) <../man5/systemd.resource-control.5.html>`__, 
`systemd.slice(5) <../man5/systemd.slice.5.html>`__, 
`systemd.unit(5) <../man5/systemd.unit.5.html>`__, 
`user@.service(5) <../man5/user@.service.5.html>`__, 
`systemd.syntax(7) <../man7/systemd.syntax.7.html>`__, 
`pam_systemd(8) <../man8/pam_systemd.8.html>`__

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
