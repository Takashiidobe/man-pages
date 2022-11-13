.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

systemd.slice(5) — Linux manual page
====================================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `AUTOMATIC DEPENDEN               |                                   |
| CIES <#AUTOMATIC_DEPENDENCIES>`__ |                                   |
| \| `SEE ALSO <#SEE_ALSO>`__ \|    |                                   |
| `NOTES <#NOTES>`__ \|             |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   SYSTEMD.SLICE(5)              systemd.slice             SYSTEMD.SLICE(5)

NAME
-------------------------------------------------

::

          systemd.slice - Slice unit configuration


---------------------------------------------------------

::

          slice.slice


---------------------------------------------------------------

::

          A unit configuration file whose name ends in ".slice" encodes
          information about a slice unit. A slice unit is a concept for
          hierarchically managing resources of a group of processes. This
          management is performed by creating a node in the Linux Control
          Group (cgroup) tree. Units that manage processes (primarily scope
          and service units) may be assigned to a specific slice. For each
          slice, certain resource limits may be set that apply to all
          processes of all units contained in that slice. Slices are
          organized hierarchically in a tree. The name of the slice encodes
          the location in the tree. The name consists of a dash-separated
          series of names, which describes the path to the slice from the
          root slice. The root slice is named -.slice. Example:
          foo-bar.slice is a slice that is located within foo.slice, which
          in turn is located in the root slice -.slice.

          Note that slice units cannot be templated, nor is possible to add
          multiple names to a slice unit by creating additional symlinks to
          its unit file.

          By default, service and scope units are placed in system.slice,
          virtual machines and containers registered with
          systemd-machined(8) are found in machine.slice, and user sessions
          handled by systemd-logind(8) in user.slice. See
          systemd.special(7) for more information.

          See systemd.unit(5) for the common options of all unit
          configuration files. The common configuration items are
          configured in the generic [Unit] and [Install] sections. The
          slice specific configuration options are configured in the
          [Slice] section. Currently, only generic resource control
          settings as described in systemd.resource-control(5) are allowed.

          See the New Control Group Interfaces[1] for an introduction on
          how to make use of slice units from programs.


-------------------------------------------------------------------------------------

::

      Implicit Dependencies
          The following dependencies are implicitly added:

          •   Slice units automatically gain dependencies of type After=
              and Requires= on their immediate parent slice unit.

      Default Dependencies
          The following dependencies are added unless
          DefaultDependencies=no is set:

          •   Slice units will automatically have dependencies of type
              Conflicts= and Before= on shutdown.target. These ensure that
              slice units are removed prior to system shutdown. Only slice
              units involved with late system shutdown should disable
              DefaultDependencies= option.


---------------------------------------------------------

::

          systemd(1), systemd.unit(5), systemd.resource-control(5),
          systemd.service(5), systemd.scope(5), systemd.special(7),
          systemd.directives(7)


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

   systemd 249                                             SYSTEMD.SLICE(5)

--------------

Pages that refer to this page:
`journalctl(1) <../man1/journalctl.1.html>`__, 
`systemd(1) <../man1/systemd.1.html>`__, 
`systemd-nspawn(1) <../man1/systemd-nspawn.1.html>`__, 
`systemd-run(1) <../man1/systemd-run.1.html>`__, 
`sd_bus_creds_get_pid(3) <../man3/sd_bus_creds_get_pid.3.html>`__, 
`sd_pid_get_owner_uid(3) <../man3/sd_pid_get_owner_uid.3.html>`__, 
`systemd.resource-control(5) <../man5/systemd.resource-control.5.html>`__, 
`systemd.service(5) <../man5/systemd.service.5.html>`__, 
`systemd.unit(5) <../man5/systemd.unit.5.html>`__, 
`user@.service(5) <../man5/user@.service.5.html>`__, 
`systemd.special(7) <../man7/systemd.special.7.html>`__, 
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
