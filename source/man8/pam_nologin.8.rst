.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

pam_nologin(8) — Linux manual page
==================================

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
| `NOTES <#NOTES>`__ \|             |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `AUTHOR <#AUTHOR>`__ \|           |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   PAM_NOLOGIN(8)              Linux-PAM Manual              PAM_NOLOGIN(8)

NAME
-------------------------------------------------

::

          pam_nologin - Prevent non-root users from login


---------------------------------------------------------

::

          pam_nologin.so [file=/path/nologin] [successok]


---------------------------------------------------------------

::

          pam_nologin is a PAM module that prevents users from logging into
          the system when /var/run/nologin or /etc/nologin exists. The
          contents of the file are displayed to the user. The pam_nologin
          module has no effect on the root user's ability to log in.


-------------------------------------------------------

::

          file=/path/nologin
              Use this file instead the default /var/run/nologin or
              /etc/nologin.

          successok
              Return PAM_SUCCESS if no file exists, the default is
              PAM_IGNORE.


-----------------------------------------------------------------------------------

::

          The auth and acct module types are provided.


-------------------------------------------------------------------

::

          PAM_AUTH_ERR
              The user is not root and /etc/nologin exists, so the user is
              not permitted to log in.

          PAM_BUF_ERR
              Memory buffer error.

          PAM_IGNORE
              This is the default return value.

          PAM_SUCCESS
              Success: either the user is root or the nologin file does not
              exist.

          PAM_USER_UNKNOWN
              User not known to the underlying authentication module.


---------------------------------------------------------

::

          The suggested usage for /etc/pam.d/login is:

              auth  required  pam_nologin.so


---------------------------------------------------

::

          In order to make this module effective, all login methods should
          be secured by it. It should be used as a required method listed
          before any sufficient methods in order to get standard Unix
          nologin semantics. Note, the use of successok module argument
          causes the module to return PAM_SUCCESS and as such would break
          such a configuration - failing sufficient modules would lead to a
          successful login because the nologin module succeeded.


---------------------------------------------------------

::

          nologin(5), pam.conf(5), pam.d(5), pam(8)


-----------------------------------------------------

::

          pam_nologin was written by Michael K. Johnson
          <johnsonm@redhat.com>.

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

   Linux-PAM Manual               04/01/2016                 PAM_NOLOGIN(8)

--------------

Pages that refer to this page: `nologin(8) <../man8/nologin.8.html>`__, 
`systemd-user-sessions.service(8) <../man8/systemd-user-sessions.service.8.html>`__

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
