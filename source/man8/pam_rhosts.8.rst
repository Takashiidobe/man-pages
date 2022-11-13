.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

pam_rhosts(8) — Linux manual page
=================================

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

   PAM_RHOSTS(8)               Linux-PAM Manual               PAM_RHOSTS(8)

NAME
-------------------------------------------------

::

          pam_rhosts - The rhosts PAM module


---------------------------------------------------------

::

          pam_rhosts.so


---------------------------------------------------------------

::

          This module performs the standard network authentication for
          services, as used by traditional implementations of rlogin and
          rsh etc.

          The authentication mechanism of this module is based on the
          contents of two files; /etc/hosts.equiv (or and ~/.rhosts.
          Firstly, hosts listed in the former file are treated as
          equivalent to the localhost. Secondly, entries in the user's own
          copy of the latter file is used to map "remote-host remote-user"
          pairs to that user's account on the current host. Access is
          granted to the user if their host is present in /etc/hosts.equiv
          and their remote account is identical to their local one, or if
          their remote account has an entry in their personal configuration
          file.

          The module authenticates a remote user (internally specified by
          the item PAM_RUSER connecting from the remote host (internally
          specified by the item PAM_RHOST). Accordingly, for applications
          to be compatible this authentication module they must set these
          items prior to calling pam_authenticate(). The module is not
          capable of independently probing the network connection for such
          information.


-------------------------------------------------------

::

          debug
              Print debug information.

          silent
              Don't print informative messages.

          superuser=account
              Handle account as root.


-----------------------------------------------------------------------------------

::

          Only the auth module type is provided.


-------------------------------------------------------------------

::

          PAM_AUTH_ERR
              The remote host, remote user name or the local user name
              couldn't be determined or access was denied by .rhosts file.

          PAM_USER_UNKNOWN
              User is not known to system.


---------------------------------------------------------

::

          To grant a remote user access by /etc/hosts.equiv or .rhosts for
          rsh add the following lines to /etc/pam.d/rsh:

              #%PAM-1.0
              #
              auth     required       pam_rhosts.so
              auth     required       pam_nologin.so
              auth     required       pam_env.so
              auth     required       pam_unix.so


---------------------------------------------------------

::

          rootok(3), hosts.equiv(5), rhosts(5), pam.conf(5), pam.d(5),
          pam(8)


-----------------------------------------------------

::

          pam_rhosts was written by Thorsten Kukuk <kukuk@thkukuk.de>

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

   Linux-PAM Manual               04/01/2016                  PAM_RHOSTS(8)

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
