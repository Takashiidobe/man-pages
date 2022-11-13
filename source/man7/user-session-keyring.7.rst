.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

user-session-keyring(7) — Linux manual page
===========================================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `NOTES <#NOTES>`__ \|             |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   USER-SESSION-KEYRING(7) Linux Programmer's ManualUSER-SESSION-KEYRING(7)

NAME
-------------------------------------------------

::

          user-session-keyring - per-user default session keyring


---------------------------------------------------------------

::

          The user session keyring is a keyring used to anchor keys on
          behalf of a user.  Each UID the kernel deals with has its own
          user session keyring that is shared by all processes with that
          UID.  The user session keyring has a name (description) of the
          form _uid_ses.<UID> where <UID> is the user ID of the
          corresponding user.

          The user session keyring is associated with the record that the
          kernel maintains for the UID.  It comes into existence upon the
          first attempt to access either the user session keyring, the
          user-keyring(7), or the session-keyring(7).  The keyring remains
          pinned in existence so long as there are processes running with
          that real UID or files opened by those processes remain open.
          (The keyring can also be pinned indefinitely by linking it into
          another keyring.)

          The user session keyring is created on demand when a thread
          requests it or when a thread asks for its session-keyring(7) and
          that keyring doesn't exist.  In the latter case, a user session
          keyring will be created and, if the session keyring wasn't to be
          created, the user session keyring will be set as the process's
          actual session keyring.

          The user session keyring is searched by request_key(2) if the
          actual session keyring does not exist and is ignored otherwise.

          A special serial number value, KEY_SPEC_USER_SESSION_KEYRING, is
          defined that can be used in lieu of the actual serial number of
          the calling process's user session keyring.

          From the keyctl(1) utility, '@us' can be used instead of a
          numeric key ID in much the same way.

          User session keyrings are independent of clone(2), fork(2),
          vfork(2), execve(2), and _exit(2) excepting that the keyring is
          destroyed when the UID record is destroyed when the last process
          pinning it exits.

          If a user session keyring does not exist when it is accessed, it
          will be created.

          Rather than relying on the user session keyring, it is strongly
          recommended—especially if the process is running as root—that a
          session-keyring(7) be set explicitly, for example by
          pam_keyinit(8).


---------------------------------------------------

::

          The user session keyring was added to support situations where a
          process doesn't have a session keyring, perhaps because it was
          created via a pathway that didn't involve PAM (e.g., perhaps it
          was a daemon started by inetd(8)).  In such a scenario, the user
          session keyring acts as a substitute for the session-keyring(7).


---------------------------------------------------------

::

          keyctl(1), keyctl(3), keyrings(7), persistent-keyring(7),
          process-keyring(7), session-keyring(7), thread-keyring(7),
          user-keyring(7)

COLOPHON
---------------------------------------------------------

::

          This page is part of release 5.13 of the Linux man-pages project.
          A description of the project, information about reporting bugs,
          and the latest version of this page, can be found at
          https://www.kernel.org/doc/man-pages/.

   Linux                          2020-08-13        USER-SESSION-KEYRING(7)

--------------

Pages that refer to this page: `add_key(2) <../man2/add_key.2.html>`__, 
`keyctl(2) <../man2/keyctl.2.html>`__, 
`request_key(2) <../man2/request_key.2.html>`__, 
`keyctl_join_session_keyring(3) <../man3/keyctl_join_session_keyring.3.html>`__, 
`keyctl_session_to_parent(3) <../man3/keyctl_session_to_parent.3.html>`__, 
`keyrings(7) <../man7/keyrings.7.html>`__, 
`keyutils(7) <../man7/keyutils.7.html>`__, 
`persistent-keyring(7) <../man7/persistent-keyring.7.html>`__, 
`process-keyring(7) <../man7/process-keyring.7.html>`__, 
`session-keyring(7) <../man7/session-keyring.7.html>`__, 
`thread-keyring(7) <../man7/thread-keyring.7.html>`__, 
`user-keyring(7) <../man7/user-keyring.7.html>`__

--------------

`Copyright and license for this manual
page <../man7/user-session-keyring.7.license.html>`__

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
