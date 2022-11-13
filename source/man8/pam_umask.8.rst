.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

pam_umask(8) — Linux manual page
================================

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

   PAM_UMASK(8)                Linux-PAM Manual                PAM_UMASK(8)

NAME
-------------------------------------------------

::

          pam_umask - PAM module to set the file mode creation mask


---------------------------------------------------------

::

          pam_umask.so [debug] [silent] [usergroups] [umask=mask]


---------------------------------------------------------------

::

          pam_umask is a PAM module to set the file mode creation mask of
          the current environment. The umask affects the default
          permissions assigned to newly created files.

          The PAM module tries to get the umask value from the following
          places in the following order:

          •   umask= argument

          •   umask= entry in the user's GECOS field

          •   UMASK= entry from /etc/default/login

          •   UMASK entry from /etc/login.defs

          The GECOS field is split on comma ',' characters. The module also
          in addition to the umask= entry recognizes pri= entry, which sets
          the nice priority value for the session, and ulimit= entry, which
          sets the maximum size of files the processes in the session can
          create.


-------------------------------------------------------

::

          debug
              Print debug information.

          silent
              Don't print informative messages.

          usergroups
              If the user is not root and the username is the same as
              primary group name, the umask group bits are set to be the
              same as owner bits (examples: 022 -> 002, 077 -> 007).

          umask=mask
              Sets the calling process's file mode creation mask (umask) to
              mask & 0777. The value is interpreted as Octal.


-----------------------------------------------------------------------------------

::

          Only the session type is provided.


-------------------------------------------------------------------

::

          PAM_SUCCESS
              The new umask was set successfully.

          PAM_SERVICE_ERR
              No username was given.

          PAM_USER_UNKNOWN
              User not known.


---------------------------------------------------------

::

          Add the following line to /etc/pam.d/login to set the user
          specific umask at login:

                      session optional pam_umask.so umask=0022


---------------------------------------------------------

::

          pam.conf(5), pam.d(5), pam(8)


-----------------------------------------------------

::

          pam_umask was written by Thorsten Kukuk <kukuk@thkukuk.de>.

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

   Linux-PAM Manual               04/01/2016                   PAM_UMASK(8)

--------------

Pages that refer to this page:
`systemd.exec(5) <../man5/systemd.exec.5.html>`__

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
