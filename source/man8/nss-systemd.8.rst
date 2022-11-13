.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

nss-systemd(8) — Linux manual page
==================================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `STATIC DROP-IN JS                |                                   |
| ON USER/GROUP RECORDS <#STATIC_DR |                                   |
| OP-IN_JSON_USER/GROUP_RECORDS>`__ |                                   |
| \|                                |                                   |
| `CONFIGURATI                      |                                   |
| ON IN /ETC/NSSWITCH.CONF <#CONFIG |                                   |
| URATION_IN_/ETC/NSSWITCH.CONF>`__ |                                   |
| \|                                |                                   |
| `EXAMPLE: MAPPING                 |                                   |
| S PROVIDED BY SYSTEMD-MACHINED.SE |                                   |
| RVICE <#EXAMPLE:_MAPPINGS_PROVIDE |                                   |
| D_BY_SYSTEMD-MACHINED.SERVICE>`__ |                                   |
| \| `SEE ALSO <#SEE_ALSO>`__ \|    |                                   |
| `NOTES <#NOTES>`__ \|             |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   NSS-SYSTEMD(8)                 nss-systemd                NSS-SYSTEMD(8)

NAME
-------------------------------------------------

::

          nss-systemd, libnss_systemd.so.2 - UNIX user and group name
          resolution for user/group lookup via Varlink


---------------------------------------------------------

::

          libnss_systemd.so.2


---------------------------------------------------------------

::

          nss-systemd is a plug-in module for the GNU Name Service Switch
          (NSS) functionality of the GNU C Library (glibc), providing UNIX
          user and group name resolution for services implementing the
          User/Group Record Lookup API via Varlink[1], such as the system
          and service manager systemd(1) (for its DynamicUser= feature, see
          systemd.exec(5) for details), systemd-homed.service(8), or
          systemd-machined.service(8).

          This module also ensures that the root and nobody users and
          groups (i.e. the users/groups with the UIDs/GIDs 0 and 65534)
          remain resolvable at all times, even if they aren't listed in
          /etc/passwd or /etc/group, or if these files are missing.

          This module preferably utilizes systemd-userdbd.service(8) for
          resolving users and groups, but also works without the service
          running.

          To activate the NSS module, add "systemd" to the lines starting
          with "passwd:", "group:", "shadow:" and "gshadow:" in
          /etc/nsswitch.conf.

          It is recommended to place "systemd" after the "files" or
          "compat" entry of the /etc/nsswitch.conf lines so that
          /etc/passwd, /etc/group, /etc/shadow and /etc/gshadow based
          mappings take precedence.


---------------------------------------------------------------------------------------------------------------------

::

          Besides user/group records acquired via the aforementioned
          Varlink IPC interfaces and the synthesized root and nobody
          accounts, this module also makes user and group accounts
          available to the system that are defined in static drop-in files
          in the /etc/userdb/, /run/userdb/, /run/host/userdb/ and
          /usr/lib/userdb/ directories.

          This is a simple mechanism to provide static user and group
          records via JSON drop-in files. Such user records should be
          defined in the format described by the JSON User Records[2]
          specification and be placed in one of the aforementioned
          directories under a file name composed of the user name suffixed
          with .user, with a world-readable access mode. A symlink named
          after the user record's UID formatted in decimal and suffixed
          with .user pointing to the primary record file should be created
          as well, in order to allow both lookups by username and by UID.
          Privileged user record data (e.g. hashed UNIX passwords) may
          optionally be provided as well, in a pair of separate companion
          files with the .user-privileged suffix. The data should be stored
          in a regular file named after the user name, suffixed with
          .user-privileged, and a symlink pointing to it, named after the
          used numeric UID formatted in decimal with the same suffix. These
          companion files should not be readable to anyone but root.
          Example:

              -rw-r--r--. 1 root root  723 May 10 foobar.user
              -rw-------. 1 root root  123 May 10 foobar.user-privileged
              lrwxrwxrwx. 1 root root   19 May 10 4711.user -> foobar.user
              lrwxrwxrwx. 1 root root   19 May 10 4711.user-privileged -> foobar.user-privileged

          Similarly, group records following the format described in JSON
          Group Record[3] may be defined, using the file suffixes .group
          and .group-privileged.

          The primary user/group record files (i.e. those with the .user
          and .group suffixes) should not contain the "privileged" section
          as described in the specifications. The privileged user/group
          record files (i.e. those with the .user-privileged and
          .group-privileged suffixes) should contain this section,
          exclusively.

          Note that static user/group records generally do not override
          conflicting records in /etc/passwd or /etc/group or other account
          databases. In fact, before dropping in these files a reasonable
          level of care should be taken to avoid user/group name and
          UID/GID conflicts.


---------------------------------------------------------------------------------------------------------------

::

          Here is an example /etc/nsswitch.conf file that enables
          nss-systemd correctly:

              passwd:         compat systemd
              group:          compat [SUCCESS=merge] systemd
              shadow:         compat systemd
              gshadow:        files systemd

              hosts:          mymachines resolve [!UNAVAIL=return] files myhostname dns
              networks:       files

              protocols:      db files
              services:       db files
              ethers:         db files
              rpc:            db files

              netgroup:       nis


-----------------------------------------------------------------------------------------------------------------------------------------------------

::

          The container "rawhide" is spawned using systemd-nspawn(1):

              # systemd-nspawn -M rawhide --boot --network-veth --private-users=pick
              Spawning container rawhide on /var/lib/machines/rawhide.
              Selected user namespace base 20119552 and range 65536.
              ...

              $ machinectl --max-addresses=3
              MACHINE CLASS     SERVICE        OS     VERSION ADDRESSES
              rawhide container systemd-nspawn fedora 30      169.254.40.164 fe80::94aa:3aff:fe7b:d4b9

              $ getent passwd vu-rawhide-0 vu-rawhide-81
              vu-rawhide-0:*:20119552:65534:vu-rawhide-0:/:/usr/sbin/nologin
              vu-rawhide-81:*:20119633:65534:vu-rawhide-81:/:/usr/sbin/nologin

              $ getent group vg-rawhide-0 vg-rawhide-81
              vg-rawhide-0:*:20119552:
              vg-rawhide-81:*:20119633:

              $ ps -o user:15,pid,tty,command -e|grep '^vu-rawhide'
              vu-rawhide-0      692 ?        /usr/lib/systemd/systemd
              vu-rawhide-0      731 ?        /usr/lib/systemd/systemd-journald
              vu-rawhide-192    734 ?        /usr/lib/systemd/systemd-networkd
              vu-rawhide-193    738 ?        /usr/lib/systemd/systemd-resolved
              vu-rawhide-0      742 ?        /usr/lib/systemd/systemd-logind
              vu-rawhide-81     744 ?        /usr/bin/dbus-daemon --system --address=systemd: --nofork --nopidfile --systemd-activation --syslog-only
              vu-rawhide-0      746 ?        /usr/sbin/sshd -D ...
              vu-rawhide-0      752 ?        /usr/lib/systemd/systemd --user
              vu-rawhide-0      753 ?        (sd-pam)
              vu-rawhide-0     1628 ?        login -- zbyszek
              vu-rawhide-1000  1630 ?        /usr/lib/systemd/systemd --user
              vu-rawhide-1000  1631 ?        (sd-pam)
              vu-rawhide-1000  1637 pts/8    -zsh


---------------------------------------------------------

::

          systemd(1), systemd.exec(5), nss-resolve(8), nss-myhostname(8),
          nss-mymachines(8), systemd-userdbd.service(8),
          systemd-homed.service(8), systemd-machined.service(8),
          nsswitch.conf(5), getent(1)


---------------------------------------------------

::

           1. User/Group Record Lookup API via Varlink
              https://systemd.io/USER_GROUP_API

           2. JSON User Records
              https://systemd.io/USER_RECORD

           3. JSON Group Record
              https://systemd.io/GROUP_RECORD

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

   systemd 249                                               NSS-SYSTEMD(8)

--------------

Pages that refer to this page:
`systemd-nspawn(1) <../man1/systemd-nspawn.1.html>`__, 
`userdbctl(1) <../man1/userdbctl.1.html>`__, 
`systemd.exec(5) <../man5/systemd.exec.5.html>`__, 
`nss-myhostname(8) <../man8/nss-myhostname.8.html>`__, 
`nss-mymachines(8) <../man8/nss-mymachines.8.html>`__, 
`nss-resolve(8) <../man8/nss-resolve.8.html>`__, 
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
