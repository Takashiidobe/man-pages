.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

pam_loginuid(8) — Linux manual page
===================================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `OPTIONS <#OPTIONS>`__ \|         |                                   |
| `MODULE TYPES PRO                 |                                   |
| VIDED <#MODULE_TYPES_PROVIDED>`__ |                                   |
| \|                                |                                   |
| `                                 |                                   |
| RETURN VALUES <#RETURN_VALUES>`__ |                                   |
| \| `EXAMPLES <#EXAMPLES>`__ \|    |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `AUTHOR <#AUTHOR>`__ \|           |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   PAM_LOGINUID(8)             Linux-PAM Manual             PAM_LOGINUID(8)

NAME
-------------------------------------------------

::

          pam_loginuid - Record user's login uid to the process attribute


---------------------------------------------------------

::

          pam_loginuid.so [require_auditd]


---------------------------------------------------------------

::

          The pam_loginuid module sets the loginuid process attribute for
          the process that was authenticated. This is necessary for
          applications to be correctly audited. This PAM module should only
          be used for entry point applications like: login, sshd, gdm,
          vsftpd, crond and atd. There are probably other entry point
          applications besides these. You should not use it for
          applications like sudo or su as that defeats the purpose by
          changing the loginuid to the account they just switched to.


-------------------------------------------------------

::

          require_auditd
              This option, when given, will cause this module to query the
              audit daemon status and deny logins if it is not running.


-----------------------------------------------------------------------------------

::

          Only the session module type is provided.


-------------------------------------------------------------------

::

          PAM_SUCCESS
              The loginuid value is set and auditd is running if check
              requested.

          PAM_IGNORE
              The /proc/self/loginuid file is not present on the system or
              the login process runs inside uid namespace and kernel does
              not support overwriting loginuid.

          PAM_SESSION_ERR
              Any other error prevented setting loginuid or auditd is not
              running.


---------------------------------------------------------

::

              #%PAM-1.0
              auth       required     pam_unix.so
              auth       required     pam_nologin.so
              account    required     pam_unix.so
              password   required     pam_unix.so
              session    required     pam_unix.so
              session    required     pam_loginuid.so


---------------------------------------------------------

::

          pam.conf(5), pam.d(5), pam(8), auditctl(8), auditd(8)


-----------------------------------------------------

::

          pam_loginuid was written by Steve Grubb <sgrubb@redhat.com>

COLOPHON
---------------------------------------------------------

::

          This page is part of the linux-pam (Pluggable Authentication
          Modules for Linux) project.  Information about the project can be
          found at ⟨http://www.linux-pam.org/⟩.  If you have a bug report
          for this manual page, see ⟨//www.linux-pam.org/⟩.  This page was
          obtained from the tarball Linux-PAM-1.3.0.tar.bz2 fetched from
          ⟨http://www.linux-pam.org/library/⟩ on 2021-08-27.  If you
          discover any rendering problems in this HTML version of the page,
          or you believe there is a better or more up-to-date source for
          the page, or you have corrections or improvements to the
          information in this COLOPHON (which is not part of the original
          manual page), send a mail to man-pages@man7.org

   Linux-PAM Manual               04/01/2016                PAM_LOGINUID(8)

--------------

Pages that refer to this page:
`audit_setloginuid(3) <../man3/audit_setloginuid.3.html>`__, 
`ausearch(8) <../man8/ausearch.8.html>`__, 
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
