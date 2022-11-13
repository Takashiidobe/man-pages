.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

ovs-kmod-ctl(8) — Linux manual page
===================================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `The ``insert'' command           |                                   |
|  <#The_%60%60insert''_command>`__ |                                   |
| \|                                |                                   |
| `The ``remove'' command           |                                   |
|  <#The_%60%60remove''_command>`__ |                                   |
| \| `EXIT STATUS <#EXIT_STATUS>`__ |                                   |
| \| `ENVIRONMENT <#ENVIRONMENT>`__ |                                   |
| \| `FILES <#FILES>`__ \|          |                                   |
| `EXAMPLE <#EXAMPLE>`__ \|         |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   ovs-ctl(8)                 Open vSwitch Manual                ovs-ctl(8)

NAME
-------------------------------------------------

::

          ovs-kmod-ctl - OVS startup helper script for loading kernel
          modules


---------------------------------------------------------

::

          ovs-kmod-ctl insert
          ovs-kmod-ctl remove
          ovs-kmod-ctl help | -h | --help
          ovs-kmod-ctl --version
          ovs-kmod-ctl version


---------------------------------------------------------------

::

          The ovs-kmod-ctl program is responsible for inserting and
          removing Open vSwitch kernel modules.  It is not meant to be
          invoked directly by system administrators but to be called
          internally by system startup scripts.  The script is used as part
          of an SELinux transition domain.

          Each of ovs-kmod-ctl's commands is described separately below.


------------------------------------------------------------------------------------------

::

          The insert command loads the Open vSwitch kernel modules, if
          needed.  If this fails, and the Linux bridge module is loaded but
          no bridges exist, it tries to unload the bridge module and tries
          loading the Open vSwitch kernel module again.


------------------------------------------------------------------------------------------

::

          The remove command unloads the Open vSwitch kernel module
          (including the bridge compatibility module, if loaded) and any
          associated vport modules.


---------------------------------------------------------------

::

          ovs-kmod-ctl exits with status 0 on success and nonzero on
          failure.  The insert command is considered to succeed if kernel
          modules are already loaded; the remove command is considered to
          succeed if none of the kernel modules are loaded.


---------------------------------------------------------------

::

          The following environment variables affect ovs-kmod-ctl:

          PATH   ovs-kmod-ctl does not hardcode the location of any of the
                 programs that it runs.  ovs-kmod-ctl will add the sbindir
                 and bindir that were specified at configure time to PATH,
                 if they are not already present.

          OVS_LOGDIR
          OVS_RUNDIR
          OVS_DBDIR
          OVS_SYSCONFDIR
          OVS_PKGDATADIR
          OVS_BINDIR
          OVS_SBINDIR
                 Setting one of these variables in the environment
                 overrides the respective configure option, both for
                 ovs-kmod-ctl itself and for the other Open vSwitch
                 programs that it runs.


---------------------------------------------------

::

          ovs-kmod-ctl uses the following files:

          ovs-lib
                 Shell function library used internally by ovs-kmod-ctl.
                 It must be installed in the same directory as
                 ovs-kmod-ctl.


-------------------------------------------------------

::

          ovs-kmod-ctl isn't intended to be manually executed.  However,
          the following examples demonstrate loading the kernel modules.

          ovs-kmod-ctl insert
                 Attempts to insert the Open vSwitch kernel modules.

          ovs-kmod-ctl remove
                 Attempts to remove the Open vSwitch kernel modules.


---------------------------------------------------------

::

          README.rst, ovs-ctl(8)

COLOPHON
---------------------------------------------------------

::

          This page is part of the Open vSwitch (a distributed virtual
          multilayer switch) project.  Information about the project can be
          found at ⟨http://openvswitch.org/⟩.  If you have a bug report for
          this manual page, send it to bugs@openvswitch.org.  This page was
          obtained from the project's upstream Git repository
          ⟨https://github.com/openvswitch/ovs.git⟩ on 2021-08-27.  (At that
          time, the date of the most recent commit that was found in the
          repository was 2021-08-20.)  If you discover any rendering
          problems in this HTML version of the page, or you believe there
          is a better or more up-to-date source for the page, or you have
          corrections or improvements to the information in this COLOPHON
          (which is not part of the original manual page), send a mail to
          man-pages@man7.org

   Open vSwitch                  February 2018                   ovs-ctl(8)

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
