.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

systemd-userdbd.service(8) — Linux manual page
==============================================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `NOTES <#NOTES>`__ \|             |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   SYSTEMD-USERDBD.SERVICE(8)ystemd-userdbd.serviceSTEMD-USERDBD.SERVICE(8)

NAME
-------------------------------------------------

::

          systemd-userdbd.service, systemd-userdbd - JSON User/Group Record
          Query Multiplexer/NSS Compatibility


---------------------------------------------------------

::

          systemd-userdbd.service

          /usr/lib/systemd/systemd-userdbd


---------------------------------------------------------------

::

          systemd-userdbd is a system service that multiplexes user/group
          lookups to all local services that provide JSON user/group record
          definitions to the system. In addition it synthesizes JSON
          user/group records from classic UNIX/glibc NSS user/group records
          in order to provide full backwards compatibility. It may also
          pick up statically defined JSON user/group records from drop-in
          files in /etc/userdb/, /run/userdb/, /run/host/userdb/ and
          /usr/lib/userdb/.

          Most of systemd-userdbd's functionality is accessible through the
          userdbctl(1) command.

          The user and group records this service provides access to follow
          the JSON User Records[1] and JSON Group Record[2] definitions.
          This service implements the User/Group Record Lookup API via
          Varlink[3], and multiplexes access other services implementing
          this API, too. It is thus both server and client of this API.

          This service provides three distinct Varlink[4] services:
          io.systemd.Multiplexer provides a single, unified API for
          querying JSON user and group records. Internally it talks to all
          other user/group record services running on the system in
          parallel and forwards any information discovered. This simplifies
          clients substantially since they need to talk to a single service
          only instead of all of them in parallel.
          io.systemd.NameServiceSwitch provides compatibility with classic
          UNIX/glibc NSS user records, i.e. converts struct passwd and
          struct group records as acquired with APIs such as getpwnam(1) to
          JSON user/group records, thus hiding the differences between the
          services as much as possible.  io.systemd.Dropin makes JSON
          user/group records from the aforementioned drop-in directories
          available.


---------------------------------------------------------

::

          systemd(1), nss-systemd(8), userdbctl(1),
          systemd-homed.service(8)


---------------------------------------------------

::

           1. JSON User Records
              https://systemd.io/USER_RECORD

           2. JSON Group Record
              https://systemd.io/GROUP_RECORD

           3. User/Group Record Lookup API via Varlink
              https://systemd.io/USER_GROUP_API

           4. Varlink
              https://varlink.org/

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

   systemd 249                                   SYSTEMD-USERDBD.SERVICE(8)

--------------

Pages that refer to this page:
`userdbctl(1) <../man1/userdbctl.1.html>`__, 
`nss-systemd(8) <../man8/nss-systemd.8.html>`__

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
