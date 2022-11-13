.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

session-keyring(7) — Linux manual page
======================================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   SESSION-KEYRING(7)      Linux Programmer's Manual     SESSION-KEYRING(7)

NAME
-------------------------------------------------

::

          session-keyring - session shared process keyring


---------------------------------------------------------------

::

          The session keyring is a keyring used to anchor keys on behalf of
          a process.  It is typically created by pam_keyinit(8) when a user
          logs in and a link will be added that refers to the
          user-keyring(7).  Optionally, PAM may revoke the session keyring
          on logout.  (In typical configurations, PAM does do this
          revocation.)  The session keyring has the name (description)
          _ses.

          A special serial number value, KEY_SPEC_SESSION_KEYRING, is
          defined that can be used in lieu of the actual serial number of
          the calling process's session keyring.

          From the keyctl(1) utility, '@s' can be used instead of a numeric
          key ID in much the same way.

          A process's session keyring is inherited across clone(2),
          fork(2), and vfork(2).  The session keyring is preserved across
          execve(2), even when the executable is set-user-ID or set-group-
          ID or has capabilities.  The session keyring is destroyed when
          the last process that refers to it exits.

          If a process doesn't have a session keyring when it is accessed,
          then, under certain circumstances, the user-session-keyring(7)
          will be attached as the session keyring and under others a new
          session keyring will be created.  (See user-session-keyring(7)
          for further details.)

      Special operations
          The keyutils library provides the following special operations
          for manipulating session keyrings:

          keyctl_join_session_keyring(3)
                 This operation allows the caller to change the session
                 keyring that it subscribes to.  The caller can join an
                 existing keyring with a specified name (description),
                 create a new keyring with a given name, or ask the kernel
                 to create a new "anonymous" session keyring with the name
                 "_ses".  (This function is an interface to the keyctl(2)
                 KEYCTL_JOIN_SESSION_KEYRING operation.)

          keyctl_session_to_parent(3)
                 This operation allows the caller to make the parent
                 process's session keyring to the same as its own.  For
                 this to succeed, the parent process must have identical
                 security attributes and must be single threaded.  (This
                 function is an interface to the keyctl(2)
                 KEYCTL_SESSION_TO_PARENT operation.)

          These operations are also exposed through the keyctl(1) utility
          as:

              keyctl session
              keyctl session - [<prog> <arg1> <arg2> ...]
              keyctl session <name> [<prog> <arg1> <arg2> ...]

          and:

              keyctl new_session


---------------------------------------------------------

::

          keyctl(1), keyctl(3), keyctl_join_session_keyring(3),
          keyctl_session_to_parent(3), keyrings(7), persistent-keyring(7),
          process-keyring(7), thread-keyring(7), user-keyring(7),
          user-session-keyring(7), pam_keyinit(8)

COLOPHON
---------------------------------------------------------

::

          This page is part of release 5.13 of the Linux man-pages project.
          A description of the project, information about reporting bugs,
          and the latest version of this page, can be found at
          https://www.kernel.org/doc/man-pages/.

   Linux                          2021-03-22             SESSION-KEYRING(7)

--------------

Pages that refer to this page: `add_key(2) <../man2/add_key.2.html>`__, 
`keyctl(2) <../man2/keyctl.2.html>`__, 
`request_key(2) <../man2/request_key.2.html>`__, 
`keyctl_join_session_keyring(3) <../man3/keyctl_join_session_keyring.3.html>`__, 
`keyctl_session_to_parent(3) <../man3/keyctl_session_to_parent.3.html>`__, 
`systemd.exec(5) <../man5/systemd.exec.5.html>`__, 
`keyrings(7) <../man7/keyrings.7.html>`__, 
`keyutils(7) <../man7/keyutils.7.html>`__, 
`persistent-keyring(7) <../man7/persistent-keyring.7.html>`__, 
`process-keyring(7) <../man7/process-keyring.7.html>`__, 
`thread-keyring(7) <../man7/thread-keyring.7.html>`__, 
`user-keyring(7) <../man7/user-keyring.7.html>`__, 
`user-session-keyring(7) <../man7/user-session-keyring.7.html>`__

--------------

`Copyright and license for this manual
page <../man7/session-keyring.7.license.html>`__

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
