.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

user-keyring(7) — Linux manual page
===================================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   USER-KEYRING(7)         Linux Programmer's Manual        USER-KEYRING(7)

NAME
-------------------------------------------------

::

          user-keyring - per-user keyring


---------------------------------------------------------------

::

          The user keyring is a keyring used to anchor keys on behalf of a
          user.  Each UID the kernel deals with has its own user keyring
          that is shared by all processes with that UID.  The user keyring
          has a name (description) of the form _uid.<UID> where <UID> is
          the user ID of the corresponding user.

          The user keyring is associated with the record that the kernel
          maintains for the UID.  It comes into existence upon the first
          attempt to access either the user keyring, the
          user-session-keyring(7), or the session-keyring(7).  The keyring
          remains pinned in existence so long as there are processes
          running with that real UID or files opened by those processes
          remain open.  (The keyring can also be pinned indefinitely by
          linking it into another keyring.)

          Typically, the user keyring is created by pam_keyinit(8) when a
          user logs in.

          The user keyring is not searched by default by request_key(2).
          When pam_keyinit(8) creates a session keyring, it adds to it a
          link to the user keyring so that the user keyring will be
          searched when the session keyring is.

          A special serial number value, KEY_SPEC_USER_KEYRING, is defined
          that can be used in lieu of the actual serial number of the
          calling process's user keyring.

          From the keyctl(1) utility, '@u' can be used instead of a numeric
          key ID in much the same way.

          User keyrings are independent of clone(2), fork(2), vfork(2),
          execve(2), and _exit(2) excepting that the keyring is destroyed
          when the UID record is destroyed when the last process pinning it
          exits.

          If it is necessary for a key associated with a user to exist
          beyond the UID record being garbage collected—for example, for
          use by a cron(8) script—then the persistent-keyring(7) should be
          used instead.

          If a user keyring does not exist when it is accessed, it will be
          created.


---------------------------------------------------------

::

          keyctl(1), keyctl(3), keyrings(7), persistent-keyring(7),
          process-keyring(7), session-keyring(7), thread-keyring(7),
          user-session-keyring(7), pam_keyinit(8)

COLOPHON
---------------------------------------------------------

::

          This page is part of release 5.13 of the Linux man-pages project.
          A description of the project, information about reporting bugs,
          and the latest version of this page, can be found at
          https://www.kernel.org/doc/man-pages/.

   Linux                          2020-08-13                USER-KEYRING(7)

--------------

Pages that refer to this page: `add_key(2) <../man2/add_key.2.html>`__, 
`keyctl(2) <../man2/keyctl.2.html>`__, 
`request_key(2) <../man2/request_key.2.html>`__, 
`keyrings(7) <../man7/keyrings.7.html>`__, 
`keyutils(7) <../man7/keyutils.7.html>`__, 
`persistent-keyring(7) <../man7/persistent-keyring.7.html>`__, 
`process-keyring(7) <../man7/process-keyring.7.html>`__, 
`session-keyring(7) <../man7/session-keyring.7.html>`__, 
`thread-keyring(7) <../man7/thread-keyring.7.html>`__, 
`user-session-keyring(7) <../man7/user-session-keyring.7.html>`__

--------------

`Copyright and license for this manual
page <../man7/user-keyring.7.license.html>`__

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
