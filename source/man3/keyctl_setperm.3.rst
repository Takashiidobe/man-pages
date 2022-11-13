.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

keyctl_setperm(3) — Linux manual page
=====================================

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

   KEYCTL_SETPERM(3)      Linux Key Management Calls      KEYCTL_SETPERM(3)

NAME
-------------------------------------------------

::

          keyctl_setperm - change the permissions mask on a key


---------------------------------------------------------

::

          #include <keyutils.h>

          long keyctl_setperm(key_serial_t key, key_perm_t perm);


---------------------------------------------------------------

::

          keyctl_setperm() changes the permissions mask on a key.

          A process that does not have the SysAdmin capability may not
          change the permissions mask on a key that doesn't have the same
          UID as the caller.

          The caller must have setattr permission on a key to be able to
          change its permissions mask.

          The permissions mask is a bitwise-OR of the following flags:

          KEY_xxx_VIEW
                 Grant permission to view the attributes of a key.

          KEY_xxx_READ
                 Grant permission to read the payload of a key or to list a
                 keyring.

          KEY_xxx_WRITE
                 Grant permission to modify the payload of a key or to add
                 or remove links to/from a keyring.

          KEY_xxx_SEARCH
                 Grant permission to find a key or to search a keyring.

          KEY_xxx_LINK
                 Grant permission to make links to a key.

          KEY_xxx_SETATTR
                 Grant permission to change the ownership and permissions
                 attributes of a key.

          KEY_xxx_ALL
                 Grant all the above.

          The 'xxx' in the above should be replaced by one of:

          POS    Grant the permission to a process that possesses the key
                 (has it attached searchably to one of the process's
                 keyrings).

          USR    Grant the permission to a process with the same UID as the
                 key.

          GRP    Grant the permission to a process with the same GID as the
                 key, or with a match for the key's GID amongst that
                 process's Groups list.

          OTH    Grant the permission to any other process.

          Examples include: KEY_POS_VIEW, KEY_USR_READ, KEY_GRP_SEARCH and
          KEY_OTH_ALL.

          User, group and other grants are exclusive: if a process
          qualifies in the 'user' category, it will not qualify in the
          'groups' category; and if a process qualifies in either 'user' or
          'groups' then it will not qualify in the 'other' category.

          Possessor grants are cumulative with the grants from the 'user',
          'groups' and 'other' categories.


-----------------------------------------------------------------

::

          On success keyctl_setperm() returns 0 .  On error, the value -1
          will be returned and errno will have been set to an appropriate
          error.


-----------------------------------------------------

::

          ENOKEY The specified key does not exist.

          EKEYEXPIRED
                 The specified key has expired.

          EKEYREVOKED
                 The specified key has been revoked.

          EACCES The named key exists, but does not grant setattr
                 permission to the calling process.


-------------------------------------------------------

::

          This is a library function that can be found in libkeyutils.
          When linking, -lkeyutils should be specified to the linker.


---------------------------------------------------------

::

          keyctl(1), add_key(2), keyctl(2), request_key(2), keyctl(3),
          keyrings(7), keyutils(7)

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

   Linux                          4 May 2006              KEYCTL_SETPERM(3)

--------------

Pages that refer to this page: `keyctl(2) <../man2/keyctl.2.html>`__, 
`keyctl(3) <../man3/keyctl.3.html>`__, 
`keyrings(7) <../man7/keyrings.7.html>`__

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
