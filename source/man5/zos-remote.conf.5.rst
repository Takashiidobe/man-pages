.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

zos-remote.conf(5) — Linux manual page
======================================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `AUTHOR <#AUTHOR>`__ \|           |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   ZOS-REMOTE.CONF(5)   System Administration Utilities  ZOS-REMOTE.CONF(5)

NAME
-------------------------------------------------

::

          zos-remote.conf - the audisp-racf plugin configuration file


---------------------------------------------------------------

::

          zos-remote.conf controls the configuration for the
          audispd-zos-remote(8) Audit dispatcher plugin. The default
          location for this file is /etc/audit/zos-remote.conf, however, a
          different file can be specified as the first argument to the
          audispd-zos-remote plugin. See audispd-zos-remote(8) and
          auditd(8).  The options available are as follows:

          server This is the IBM z/OS ITDS server hostname or IP address

          port   The port number where ITDS is running on the z/OS server.
                 Default is 389 (ldap port)

          user   The z/OS RACF user ID which the audispd-zos-remote plugin
                 will use to perform Remote Audit requests. This user needs
                 READ access to FACILITY Class resource
                 IRR.LDAP.REMOTE.AUDIT (See audispd-zos-remote(8)).

          password
                 The password associated the the z/OS user ID configured
                 above.

          timeout
                 The number in seconds that audispd-zos-remote plugin will
                 wait before giving up in connection attempts and event
                 submissions. The default value is 15

          q_depth
                 The audispd-zos-remote plugin will queue inputted events
                 to the maximum of q_depth events while trying to submit
                 those remotely. This can handle burst of events or in case
                 of a slow network connection. However, the
                 audispd-zos-remote plugin will drop events in case the
                 queue is full. The default queue depth is 64 - Increase
                 this value in case you are experiencing event drop due to
                 full queue (audispd-zos-remote will log this to syslog).


---------------------------------------------------------

::

          audispd-zos-remote(8)


-----------------------------------------------------

::

          Klaus Heinrich Kiwi <klausk@br.ibm.com>

COLOPHON
---------------------------------------------------------

::

          This page is part of the audit (Linux Audit) project.
          Information about the project can be found at 
          ⟨http://people.redhat.com/sgrubb/audit/⟩.  If you have a bug
          report for this manual page, send it to linux-audit@redhat.com.
          This page was obtained from the project's upstream Git repository
          ⟨https://github.com/linux-audit/audit-userspace.git⟩ on
          2021-08-27.  (At that time, the date of the most recent commit
          that was found in the repository was 2021-08-21.)  If you
          discover any rendering problems in this HTML version of the page,
          or you believe there is a better or more up-to-date source for
          the page, or you have corrections or improvements to the
          information in this COLOPHON (which is not part of the original
          manual page), send a mail to man-pages@man7.org

   IBM                             Oct 2007              ZOS-REMOTE.CONF(5)

--------------

Pages that refer to this page:
`audispd-zos-remote(8) <../man8/audispd-zos-remote.8.html>`__

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
