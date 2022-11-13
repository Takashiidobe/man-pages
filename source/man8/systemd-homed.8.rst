.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

systemd-homed.service(8) — Linux manual page
============================================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `KE                               |                                   |
| Y MANAGEMENT <#KEY_MANAGEMENT>`__ |                                   |
| \| `SEE ALSO <#SEE_ALSO>`__ \|    |                                   |
| `NOTES <#NOTES>`__ \|             |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   SYSTEMD-HOMED.SERVICE(8)  systemd-homed.service SYSTEMD-HOMED.SERVICE(8)

NAME
-------------------------------------------------

::

          systemd-homed.service, systemd-homed - Home Area/User Account
          Manager


---------------------------------------------------------

::

          systemd-homed.service

          /usr/lib/systemd/systemd-homed


---------------------------------------------------------------

::

          systemd-homed is a system service that may be used to create,
          remove, change or inspect home areas (directories and network
          mounts and real or loopback block devices with a filesystem,
          optionally encrypted).

          Most of systemd-homed's functionality is accessible through the
          homectl(1) command.

          See the Home Directories[1] documentation for details about the
          format and design of home areas managed by systemd-homed.service.

          Each home directory managed by systemd-homed.service synthesizes
          a local user and group. These are made available to the system
          using the User/Group Record Lookup API via Varlink[2], and thus
          may be browsed with userdbctl(1).


---------------------------------------------------------------------

::

          User records are cryptographically signed with a public/private
          key pair (the signature is part of the JSON record itself). For a
          user to be permitted to log in locally the public key matching
          the signature of their user record must be installed. For a user
          record to be modified locally the private key matching the
          signature must be installed locally, too. The keys are stored in
          the /var/lib/systemd/home/ directory:

          /var/lib/systemd/home/local.private
              The private key of the public/private key pair used for local
              records. Currently, only a single such key may be installed.

          /var/lib/systemd/home/local.public
              The public key of the public/private key pair used for local
              records. Currently, only a single such key may be installed.

          /var/lib/systemd/home/*.public
              Additional public keys. Any users whose user records are
              signed with any of these keys are permitted to log in
              locally. An arbitrary number of keys may be installed this
              way.

          All key files listed above are in PEM format.

          In order to migrate a home directory from a host "foobar" to
          another host "quux" it is hence sufficient to copy
          /var/lib/systemd/home/local.public from the host "foobar" to
          "quux", maybe calling the file on the destination
          /var/lib/systemd/home/foobar.public, reflecting the origin of the
          key. If the user record should be modifiable on "quux" the pair
          /var/lib/systemd/home/local.public and
          /var/lib/systemd/home/local.private need to be copied from
          "foobar" to "quux", and placed under the identical paths there,
          as currently only a single private key is supported per host.
          Note of course that the latter means that user records
          generated/signed before the key pair is copied in, lose their
          validity.


---------------------------------------------------------

::

          systemd(1), homed.conf(5), homectl(1), pam_systemd_home(8),
          userdbctl(1), org.freedesktop.home1(5)


---------------------------------------------------

::

           1. Home Directories
              https://systemd.io/HOME_DIRECTORY

           2. User/Group Record Lookup API via Varlink
              https://systemd.io/USER_GROUP_API

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

   systemd 249                                     SYSTEMD-HOMED.SERVICE(8)

--------------

Pages that refer to this page: `homectl(1) <../man1/homectl.1.html>`__, 
`userdbctl(1) <../man1/userdbctl.1.html>`__, 
`mount_setattr(2) <../man2/mount_setattr.2.html>`__, 
`homed.conf(5) <../man5/homed.conf.5.html>`__, 
`org.freedesktop.home1(5) <../man5/org.freedesktop.home1.5.html>`__, 
`systemd.exec(5) <../man5/systemd.exec.5.html>`__, 
`systemd.directives(7) <../man7/systemd.directives.7.html>`__, 
`nss-systemd(8) <../man8/nss-systemd.8.html>`__, 
`pam_systemd_home(8) <../man8/pam_systemd_home.8.html>`__, 
`systemd-userdbd.service(8) <../man8/systemd-userdbd.service.8.html>`__

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
