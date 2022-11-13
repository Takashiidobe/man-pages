.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

systemd-rc-local-generator(8) — Linux manual page
=================================================

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

   SYSTEMD-RC-LOCAL-GENERATOR(8)d-rc-local-generatorD-RC-LOCAL-GENERATOR(8)

NAME
-------------------------------------------------

::

          systemd-rc-local-generator, rc-local.service - Compatibility
          generator and service to start /etc/rc.local during boot


---------------------------------------------------------

::

          /usr/lib/systemd/system-generators/systemd-rc-local-generator

          rc-local.service


---------------------------------------------------------------

::

          systemd-rc-local-generator is a generator that checks whether
          /etc/rc.local exists and is executable, and if it is, pulls the
          rc-local.service unit into the boot process. This unit is
          responsible for running this script during late boot. The script
          is run after network.target, but in parallel with most other
          regular system services.

          Note that rc-local.service runs with slightly different semantics
          than the original System V version, which was executed "last" in
          the boot process, which is a concept that does not translate to
          systemd.

          Also note that rc-local.service is ordered after network.target,
          which does not mean that the network is functional, see
          systemd.special(7). If the script requires a configured network
          connection, it may be desirable to pull in and order it after
          network-online.target with a drop-in:

              # /etc/systemd/system/rc-local.service.d/network.conf
              [Unit]
              Wants=network-online.target
              After=network-online.target

          Support for /etc/rc.local is provided for compatibility with
          specific System V systems only. However, it is strongly
          recommended to avoid making use of this script today, and instead
          provide proper unit files with appropriate dependencies for any
          scripts to run during the boot process. Note that the path to the
          script is set at compile time and varies between distributions.

          systemd-rc-local-generator implements systemd.generator(7).


---------------------------------------------------------

::

          systemd(1), systemctl(1)

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

   systemd 249                                SYSTEMD-RC-LOCAL-GENERATOR(8)

--------------

Pages that refer to this page:
`systemd.generator(7) <../man7/systemd.generator.7.html>`__

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
