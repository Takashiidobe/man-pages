.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

dh_installsystemduser(1) — Linux manual page
============================================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `FILES <#FILES>`__ \|             |                                   |
| `OPTIONS <#OPTIONS>`__ \|         |                                   |
| `NOTES <#NOTES>`__ \|             |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `AUTHORS <#AUTHORS>`__ \|         |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   DH_INSTALLSYSTEMDUSER(1)        Debhelper       DH_INSTALLSYSTEMDUSER(1)

NAME
-------------------------------------------------

::

          dh_installsystemduser - install systemd unit files


---------------------------------------------------------

::

          dh_installsystemduser [debhelper options] [--no-enable]
          [--name=name] [unit file ...]


---------------------------------------------------------------

::

          dh_installsystemduser finds the systemd user instance service
          files installed by a package and generates postinst, and prerm
          code blocks for enabling and disabling the corresponding systemd
          user instance services, when the package is installed, updated,
          or removed. These snippets are added to the maintainer scripts by
          dh_installdeb(1).

          deb-systemd-helper(1) is used to enable and disable the systemd
          units, thus it is not necessary that the machine actually runs
          systemd during package installation time, enabling happens on all
          machines.

          dh_installsystemduser operates on all user instance unit files
          installed by a package. For only generating blocks for specific
          unit files, pass them as arguments. Specific unit files can be
          excluded from processing using the -X common debhelper(1) option.


---------------------------------------------------

::

          debian/package.user.path, debian/package@.user.path,
          debian/package.user.service, debian/package@.user.service,
          debian/package.user.socket, debian/package@.user.socket,
          debian/package.user.target, debian/package@.user.target,
          debian/package.user.timer, debian/package@.user.timer
              If any of those files exists, they are installed into
              usr/lib/systemd/user/ in the package build directory removing
              the .user file name part.


-------------------------------------------------------

::

          --name=name
              Install the service file as name.service instead of the
              default filename package.service. When this parameter is
              used, dh_installsystemd looks for and installs files named
              debian/package.name.user.service instead of the usual
              debian/package.user.service.  Moreover, maintainer scripts
              are only generated for units that match the given name.

          --no-enable
              Disable the service(s) on purge, but do not enable them on
              install.


---------------------------------------------------

::

          This command is not idempotent. dh_prep(1) should be called
          between invocations of this command (with the same arguments).
          Otherwise, it may cause multiple instances of the same text to be
          added to maintainer scripts.


---------------------------------------------------------

::

          debhelper(7), dh_installsystemd(1), deb-systemd-helper(1)


-------------------------------------------------------

::

          pkg-systemd-maintainers@lists.alioth.debian.org

COLOPHON
---------------------------------------------------------

::

          This page is part of the debhelper (helper programs for
          debian/rules) project.  Information about the project can be
          found at [unknown -- if you know, please contact man-
          pages@man7.org] If you have a bug report for this manual page,
          send it to submit@bugs.debian.org.  This page was obtained from
          the project's upstream Git repository
          ⟨https://salsa.debian.org/debian/debhelper.git⟩ on 2021-08-27.
          (At that time, the date of the most recent commit that was found
          in the repository was 2021-08-24.)  If you discover any rendering
          problems in this HTML version of the page, or you believe there
          is a better or more up-to-date source for the page, or you have
          corrections or improvements to the information in this COLOPHON
          (which is not part of the original manual page), send a mail to
          man-pages@man7.org

   13.0.1                         2020-05-16       DH_INSTALLSYSTEMDUSER(1)

--------------

Pages that refer to this page:
`debhelper(7) <../man7/debhelper.7.html>`__

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
