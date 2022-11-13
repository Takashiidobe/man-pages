.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

pam_mail(8) — Linux manual page
===============================

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

   PAM_MAIL(8)                 Linux-PAM Manual                 PAM_MAIL(8)

NAME
-------------------------------------------------

::

          pam_mail - Inform about available mail


---------------------------------------------------------

::

          pam_mail.so [close] [debug] [dir=maildir] [empty] [hash=count]
                      [noenv] [nopen] [quiet] [standard]


---------------------------------------------------------------

::

          The pam_mail PAM module provides the "you have new mail" service
          to the user. It can be plugged into any application that has
          credential or session hooks. It gives a single message indicating
          the newness of any mail it finds in the user's mail folder. This
          module also sets the PAM environment variable, MAIL, to the
          user's mail directory.

          If the mail spool file (be it /var/mail/$USER or a pathname given
          with the dir= parameter) is a directory then pam_mail assumes it
          is in the Maildir format.


-------------------------------------------------------

::

          close
              Indicate if the user has any mail also on logout.

          debug
              Print debug information.

          dir=maildir
              Look for the user's mail in an alternative location defined
              by maildir/<login>. The default location for mail is
              /var/mail/<login>. Note, if the supplied maildir is prefixed
              by a '~', the directory is interpreted as indicating a file
              in the user's home directory.

          empty
              Also print message if user has no mail.

          hash=count
              Mail directory hash depth. For example, a hashcount of 2
              would make the mail file be /var/spool/mail/u/s/user.

          noenv
              Do not set the MAIL environment variable.

          nopen
              Don't print any mail information on login. This flag is
              useful to get the MAIL environment variable set, but to not
              display any information about it.

          quiet
              Only report when there is new mail.

          standard
              Old style "You have..." format which doesn't show the mail
              spool being used. This also implies "empty".


-----------------------------------------------------------------------------------

::

          The session and auth (on establishment and deletion of
          credentials) module types are provided.


-------------------------------------------------------------------

::

          PAM_BUF_ERR
              Memory buffer error.

          PAM_SERVICE_ERR
              Badly formed arguments.

          PAM_SUCCESS
              Success.

          PAM_USER_UNKNOWN
              User not known.


---------------------------------------------------------

::

          Add the following line to /etc/pam.d/login to indicate that the
          user has new mail when they login to the system.

              session  optional  pam_mail.so standard


---------------------------------------------------------

::

          pam.conf(5), pam.d(5), pam(8)


-----------------------------------------------------

::

          pam_mail was written by Andrew G. Morgan <morgan@kernel.org>.

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

   Linux-PAM Manual               04/01/2016                    PAM_MAIL(8)

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
