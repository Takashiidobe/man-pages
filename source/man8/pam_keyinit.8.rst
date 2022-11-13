.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

pam_keyinit(8) — Linux manual page
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
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `AUTHOR <#AUTHOR>`__ \|           |                                   |
| `NOTES <#NOTES>`__ \|             |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   PAM_KEYINIT(8)              Linux-PAM Manual              PAM_KEYINIT(8)

NAME
-------------------------------------------------

::

          pam_keyinit - Kernel session keyring initialiser module


---------------------------------------------------------

::

          pam_keyinit.so [debug] [force] [revoke]


---------------------------------------------------------------

::

          The pam_keyinit PAM module ensures that the invoking process has
          a session keyring other than the user default session keyring.

          The session component of the module checks to see if the
          process's session keyring is the user default, and, if it is,
          creates a new anonymous session keyring with which to replace it.

          If a new session keyring is created, it will install a link to
          the user common keyring in the session keyring so that keys
          common to the user will be automatically accessible through it.

          The session keyring of the invoking process will thenceforth be
          inherited by all its children unless they override it.

          This module is intended primarily for use by login processes. Be
          aware that after the session keyring has been replaced, the old
          session keyring and the keys it contains will no longer be
          accessible.

          This module should not, generally, be invoked by programs like
          su, since it is usually desirable for the key set to percolate
          through to the alternate context. The keys have their own
          permissions system to manage this.

          This module should be included as early as possible in a PAM
          configuration, so that other PAM modules can attach tokens to the
          keyring.

          The keyutils package is used to manipulate keys more directly.
          This can be obtained from:

          Keyutils[1]


-------------------------------------------------------

::

          debug
              Log debug information with syslog(3).

          force
              Causes the session keyring of the invoking process to be
              replaced unconditionally.

          revoke
              Causes the session keyring of the invoking process to be
              revoked when the invoking process exits if the session
              keyring was created for this process in the first place.


-----------------------------------------------------------------------------------

::

          Only the session module type is provided.


-------------------------------------------------------------------

::

          PAM_SUCCESS
              This module will usually return this value

          PAM_AUTH_ERR
              Authentication failure.

          PAM_BUF_ERR
              Memory buffer error.

          PAM_IGNORE
              The return value should be ignored by PAM dispatch.

          PAM_SERVICE_ERR
              Cannot determine the user name.

          PAM_SESSION_ERR
              This module will return this value if its arguments are
              invalid or if a system error such as ENOMEM occurs.

          PAM_USER_UNKNOWN
              User not known.


---------------------------------------------------------

::

          Add this line to your login entries to start each login session
          with its own session keyring:

              session  required  pam_keyinit.so

          This will prevent keys from one session leaking into another
          session for the same user.


---------------------------------------------------------

::

          pam.conf(5), pam.d(5), pam(8)keyctl(1)


-----------------------------------------------------

::

          pam_keyinit was written by David Howells, <dhowells@redhat.com>.


---------------------------------------------------

::

           1. Keyutils
              http://people.redhat.com/~dhowells/keyutils/

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

   Linux-PAM Manual               04/01/2016                 PAM_KEYINIT(8)

--------------

Pages that refer to this page:
`keyrings(7) <../man7/keyrings.7.html>`__, 
`keyutils(7) <../man7/keyutils.7.html>`__, 
`session-keyring(7) <../man7/session-keyring.7.html>`__, 
`user-keyring(7) <../man7/user-keyring.7.html>`__, 
`user-session-keyring(7) <../man7/user-session-keyring.7.html>`__

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
