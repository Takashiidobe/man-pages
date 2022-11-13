.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

pam_xauth(8) — Linux manual page
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
| `IMPLEMENTATION DET               |                                   |
| AILS <#IMPLEMENTATION_DETAILS>`__ |                                   |
| \| `FILES <#FILES>`__ \|          |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `AUTHOR <#AUTHOR>`__ \|           |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   PAM_XAUTH(8)                Linux-PAM Manual                PAM_XAUTH(8)

NAME
-------------------------------------------------

::

          pam_xauth - PAM module to forward xauth keys between users


---------------------------------------------------------

::

          pam_xauth.so [debug] [xauthpath=/path/to/xauth] [systemuser=UID]
                       [targetuser=UID]


---------------------------------------------------------------

::

          The pam_xauth PAM module is designed to forward xauth keys
          (sometimes referred to as "cookies") between users.

          Without pam_xauth, when xauth is enabled and a user uses the
          su(1) command to assume another user's privileges, that user is
          no longer able to access the original user's X display because
          the new user does not have the key needed to access the display.
          pam_xauth solves the problem by forwarding the key from the user
          running su (the source user) to the user whose identity the
          source user is assuming (the target user) when the session is
          created, and destroying the key when the session is torn down.

          This means, for example, that when you run su(1) from an xterm
          session, you will be able to run X programs without explicitly
          dealing with the xauth(1) xauth command or ~/.Xauthority files.

          pam_xauth will only forward keys if xauth can list a key
          connected to the $DISPLAY environment variable.

          Primitive access control is provided by ~/.xauth/export in the
          invoking user's home directory and ~/.xauth/import in the target
          user's home directory.

          If a user has a ~/.xauth/import file, the user will only receive
          cookies from users listed in the file. If there is no
          ~/.xauth/import file, the user will accept cookies from any other
          user.

          If a user has a .xauth/export file, the user will only forward
          cookies to users listed in the file. If there is no
          ~/.xauth/export file, and the invoking user is not root, the user
          will forward cookies to any other user. If there is no
          ~/.xauth/export file, and the invoking user is root, the user
          will not forward cookies to other users.

          Both the import and export files support wildcards (such as *).
          Both the import and export files can be empty, signifying that no
          users are allowed.


-------------------------------------------------------

::

          debug
              Print debug information.

          xauthpath=/path/to/xauth
              Specify the path the xauth program (it is expected in
              /usr/X11R6/bin/xauth, /usr/bin/xauth, or /usr/bin/X11/xauth
              by default).

          systemuser=UID
              Specify the highest UID which will be assumed to belong to a
              "system" user. pam_xauth will refuse to forward credentials
              to users with UID less than or equal to this number, except
              for root and the "targetuser", if specified.

          targetuser=UID
              Specify a single target UID which is exempt from the
              systemuser check.


-----------------------------------------------------------------------------------

::

          Only the session type is provided.


-------------------------------------------------------------------

::

          PAM_BUF_ERR
              Memory buffer error.

          PAM_PERM_DENIED
              Permission denied by import/export file.

          PAM_SESSION_ERR
              Cannot determine user name, UID or access users home
              directory.

          PAM_SUCCESS
              Success.

          PAM_USER_UNKNOWN
              User not known.


---------------------------------------------------------

::

          Add the following line to /etc/pam.d/su to forward xauth keys
          between users when calling su:

              session  optional  pam_xauth.so


-------------------------------------------------------------------------------------

::

          pam_xauth will work only if it is used from a setuid application
          in which the getuid() call returns the id of the user running the
          application, and for which PAM can supply the name of the account
          that the user is attempting to assume. The typical application of
          this type is su(1). The application must call both
          pam_open_session() and pam_close_session() with the ruid set to
          the uid of the calling user and the euid set to root, and must
          have provided as the PAM_USER item the name of the target user.

          pam_xauth calls xauth(1) as the source user to extract the key
          for $DISPLAY, then calls xauth as the target user to merge the
          key into the a temporary database and later remove the database.

          pam_xauth cannot be told to not remove the keys when the session
          is closed.


---------------------------------------------------

::

          ~/.xauth/import
              XXX

          ~/.xauth/export
              XXX


---------------------------------------------------------

::

          pam.conf(5), pam.d(5), pam(8)


-----------------------------------------------------

::

          pam_xauth was written by Nalin Dahyabhai <nalin@redhat.com>,
          based on original version by Michael K. Johnson
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

   Linux-PAM Manual               04/01/2016                   PAM_XAUTH(8)

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
