.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

keyctl_get_persistent(3) — Linux manual page
============================================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `RETURN VALUE <#RETURN_VALUE>`__  |                                   |
| \| `ERRORS <#ERRORS>`__ \|        |                                   |
| `LINKING <#LINKING>`__ \|         |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   KEYCTL_GET_PERSISTENT(3)inux Key Management CallsEYCTL_GET_PERSISTENT(3)

NAME
-------------------------------------------------

::

          keyctl_get_persistent - get the persistent keyring for a user


---------------------------------------------------------

::

          #include <keyutils.h>

          long keyctl_get_persistent(uid_t uid, key_serial_t keyring);


---------------------------------------------------------------

::

          keyctl_get_persistent() gets the persistent keyring for the
          specified user ID.  Unlike the session and user keyrings, this
          keyring will persist once all login sessions have been deleted
          and can thus be used to carry authentication tokens for processes
          that run without user interaction, such as programs started by
          cron.

          The persistent keyring will be created by the kernel if it does
          not yet exist.  Each time this function is called, the persistent
          keyring will have its expiration timeout reset to the value in:

                 /proc/sys/kernel/keys/persistent_keyring_expiry

          (by default three days).  Should the timeout be reached, the
          persistent keyring will be removed and everything it pins can
          then be garbage collected.

          If uid is -1 then the calling process's real user ID will be
          used.  If uid is not -1 then error EPERM will be given if the
          user ID requested does not match either the caller's real or
          effective user IDs or if the calling process does not have SetUid
          capability.

          If successful, a link to the persistent keyring will be added
          into keyring.


-----------------------------------------------------------------

::

          On success keyctl_get_persistent() returns the serial number of
          the persistent keyring.  On error, the value -1 will be returned
          and errno will have been set to an appropriate error.


-----------------------------------------------------

::

          EPERM  Not permitted to access the persistent keyring for the
                 requested uid.

          ENOMEM Insufficient memory to create the persistent keyring or to
                 extend keyring.

          ENOKEY keyring does not exist.

          EKEYEXPIRED
                 keyring has expired.

          EKEYREVOKED
                 keyring has been revoked.

          EDQUOT The user does not have sufficient quota to extend keyring.

          EACCES keyring exists, but does not grant write permission to the
                 calling process.


-------------------------------------------------------

::

          This is a library function that can be found in libkeyutils.
          When linking, -lkeyutils should be specified to the linker.


---------------------------------------------------------

::

          keyctl(1), add_key(2), keyctl(2), request_key(2), keyctl(3),
          keyrings(7), keyutils(7), persistent-keyring(7),

COLOPHON
---------------------------------------------------------

::

          This page is part of the keyutils (key management utilities)
          project.  Information about the project can be found at [unknown
          -- if you know, please contact man-pages@man7.org] If you have a
          bug report for this manual page, send it to
          keyrings@linux-nfs.org.  This page was obtained from the
          project's upstream Git repository
          ⟨http://git.kernel.org/pub/scm/linux/kernel/git/dhowells/keyutils.git⟩
          on 2021-08-27.  (At that time, the date of the most recent commit
          that was found in the repository was 2020-07-07.)  If you
          discover any rendering problems in this HTML version of the page,
          or you believe there is a better or more up-to-date source for
          the page, or you have corrections or improvements to the
          information in this COLOPHON (which is not part of the original
          manual page), send a mail to man-pages@man7.org

   Linux                          20 Feb 2014      KEYCTL_GET_PERSISTENT(3)

--------------

Pages that refer to this page: `keyctl(2) <../man2/keyctl.2.html>`__, 
`keyctl(3) <../man3/keyctl.3.html>`__, 
`keyrings(7) <../man7/keyrings.7.html>`__, 
`persistent-keyring(7) <../man7/persistent-keyring.7.html>`__

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
