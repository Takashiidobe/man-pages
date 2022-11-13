.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

systemd-machine-id-commit.service(8) — Linux manual page
========================================================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   SYSTEMD-MACHINE-ID-COMMIT.SERVICE(8)id-commit.serviceD-COMMIT.SERVICE(8)

NAME
-------------------------------------------------

::

          systemd-machine-id-commit.service - Commit a transient machine ID
          to disk


---------------------------------------------------------

::

          systemd-machine-id-commit.service


---------------------------------------------------------------

::

          systemd-machine-id-commit.service is an early boot service
          responsible for committing transient /etc/machine-id files to a
          writable disk file system. See machine-id(5) for more information
          about machine IDs.

          This service is started after local-fs.target in case
          /etc/machine-id is a mount point of its own (usually from a
          memory file system such as "tmpfs") and /etc is writable. The
          service will invoke systemd-machine-id-setup --commit, which
          writes the current transient machine ID to disk and unmount the
          /etc/machine-id file in a race-free manner to ensure that file is
          always valid and accessible for other processes. See
          systemd-machine-id-setup(1) for details.

          The main use case of this service are systems where
          /etc/machine-id is read-only and initially not initialized. In
          this case, the system manager will generate a transient machine
          ID file on a memory file system, and mount it over
          /etc/machine-id, during the early boot phase. This service is
          then invoked in a later boot phase, as soon as /etc/ has been
          remounted writable and the ID may thus be committed to disk to
          make it permanent.


---------------------------------------------------------

::

          systemd(1), systemd-machine-id-setup(1), machine-id(5),
          systemd-firstboot(1)

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

   systemd 249                         SYSTEMD-MACHINE-ID-COMMIT.SERVICE(8)

--------------

Pages that refer to this page:
`systemd-machine-id-setup(1) <../man1/systemd-machine-id-setup.1.html>`__, 
`machine-id(5) <../man5/machine-id.5.html>`__

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
