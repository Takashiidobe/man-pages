.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

nfsidmap(5) — Linux manual page
===============================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `OPTIONS <#OPTIONS>`__ \|         |                                   |
| `CONFIGURING <#CONFIGURING>`__ \| |                                   |
| `FILES <#FILES>`__ \|             |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `AUTHOR <#AUTHOR>`__ \|           |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   nfsidmap(5)                File Formats Manual               nfsidmap(5)

NAME
-------------------------------------------------

::

          nfsidmap - The NFS idmapper upcall program


---------------------------------------------------------

::

          nfsidmap [-v] [-t timeout] key desc
          nfsidmap [-v] [-c]
          nfsidmap [-v] [-u|-g|-r user]
          nfsidmap -d
          nfsidmap -l
          nfsidmap -h


---------------------------------------------------------------

::

          The NFSv4 protocol represents the local system's UID and GID
          values on the wire as strings of the form user@domain.  The
          process of translating from UID to string and string to UID is
          referred to as "ID mapping."

          The system derives the user part of the string by performing a
          password or group lookup.  The lookup mechanism is configured in
          /etc/idmapd.conf.

          By default, the domain part of the string is the system's DNS
          domain name.  It can also be specified in /etc/idmapd.conf if the
          system is multi-homed, or if the system's DNS domain name does
          not match the name of the system's Kerberos realm.

          When the domain is not specified in /etc/idmapd.conf the local
          DNS server will be queried for the _nfsv4idmapdomain text record.
          If the record exists that will be used as the domain. When the
          record does not exist, the domain part of the DNS domain will
          used.

          The /usr/sbin/nfsidmap program performs translations on behalf of
          the kernel.  The kernel uses the request-key mechanism to perform
          an upcall.  /usr/sbin/nfsidmap is invoked by /sbin/request-key,
          performs the translation, and initializes a key with the
          resulting information.  The kernel then caches the translation
          results in the key.

          nfsidmap can also clear cached ID map results in the kernel, or
          revoke one particular key.  An incorrect cached key can result in
          file and directory ownership reverting to "nobody" on NFSv4 mount
          points.

          In addition, the -d and -l options are available to help diagnose
          misconfigurations.  They have no effect on the keyring containing
          ID mapping results.


-------------------------------------------------------

::

          -c     Clear the keyring of all the keys.

          -d     Display the system's effective NFSv4 domain name on
                 stdout.

          -g user
                 Revoke the gid key of the given user.

          -h     Display usage message.

          -l     Display on stdout all keys currently in the keyring used
                 to cache ID mapping results.  These keys are visible only
                 to the superuser.

          -r user
                 Revoke both the uid and gid key of the given user.

          -t timeout
                 Set the expiration timer, in seconds, on the key.  The
                 default is 600 seconds (10 mins).

          -u user
                 Revoke the uid key of the given user.

          -v     Increases the verbosity of the output to syslog (can be
                 specified multiple times).


---------------------------------------------------------------

::

          The file /etc/request-key.conf will need to be modified so
          /sbin/request-key can properly direct the upcall. The following
          line should be added before a call to keyctl negate:

          create    id_resolver    *    *    /usr/sbin/nfsidmap -t 600 %k
          %d

          This will direct all id_resolver requests to the program
          /usr/sbin/nfsidmap.  The -t 600 defines how many seconds into the
          future the key will expire.  This is an optional parameter for
          /usr/sbin/nfsidmap and will default to 600 seconds when not
          specified.

          The idmapper system uses four key descriptions:

                 uid: Find the UID for the given user
                 gid: Find the GID for the given group
                user: Find the user name for the given UID
               group: Find the group name for the given GID

          You can choose to handle any of these individually, rather than
          using the generic upcall program.  If you would like to use your
          own program for a uid lookup then you would edit your request-
          key.conf so it looks similar to this:

          create    id_resolver    uid:*     *    /some/other/program %k %d
          create    id_resolver    *         *    /usr/sbin/nfsidmap %k %d

          Notice that the new line was added above the line for the generic
          program.  request-key will find the first matching line and run
          the corresponding program.  In this case, /some/other/program
          will handle all uid lookups, and /usr/sbin/nfsidmap will handle
          gid, user, and group lookups.


---------------------------------------------------

::

          /etc/idmapd.conf
                 ID mapping configuration file

          /etc/request-key.conf
                 Request key configuration file


---------------------------------------------------------

::

          idmapd.conf(5), request-key(8)


-----------------------------------------------------

::

          Bryan Schumaker, <bjschuma@netapp.com>

COLOPHON
---------------------------------------------------------

::

          This page is part of the nfs-utils (NFS utilities) project.
          Information about the project can be found at 
          ⟨http://linux-nfs.org/wiki/index.php/Main_Page⟩.  If you have a
          bug report for this manual page, see
          ⟨http://linux-nfs.org/wiki/index.php/Main_Page⟩.  This page was
          obtained from the project's upstream Git repository
          ⟨http://git.linux-nfs.org/?p=steved/nfs-utils.git;a=summary⟩ on
          2021-08-27.  (At that time, the date of the most recent commit
          that was found in the repository was 2021-08-21.)  If you
          discover any rendering problems in this HTML version of the page,
          or you believe there is a better or more up-to-date source for
          the page, or you have corrections or improvements to the
          information in this COLOPHON (which is not part of the original
          manual page), send a mail to man-pages@man7.org

                                1 October 2010                  nfsidmap(5)

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
