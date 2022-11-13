.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

keyctl_search(3) — Linux manual page
====================================

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

   KEYCTL_SEARCH(3)       Linux Key Management Calls       KEYCTL_SEARCH(3)

NAME
-------------------------------------------------

::

          keyctl_search - search a keyring for a key


---------------------------------------------------------

::

          #include <keyutils.h>

          long keyctl_search(key_serial_t keyring, const char *type,
          const char *description, key_serial_t destination);


---------------------------------------------------------------

::

          keyctl_search() recursively searches the keyring for a key of the
          specified type and description.

          If found, the key will be attached to the destination keyring (if
          given), and its serial number will be returned.

          The source keyring must grant search permission to the caller,
          and for a key to be found, it must also grant search permission
          to the caller.  Child keyrings will be only be recursively
          searched if they grant search permission to the caller as well.

          If the destination keyring is zero, no attempt will be made to
          forge a link to the key, and just the serial number will be
          returned.

          If the destination keyring is given, then the link may only be
          formed if the found key grants the caller link permission and the
          destination keyring grants the caller write permission.

          If the search is successful, and if the destination keyring
          already contains a link to a key that matches the specified type
          and description, then that link will be replaced by a link to the
          found key.

          The source keyring and destination keyring serial numbers may be
          those of valid keyrings to which the caller has appropriate
          permission, or they may be special keyring IDs:

          KEY_SPEC_THREAD_KEYRING
                 This specifies the caller's thread-specific keyring.

          KEY_SPEC_PROCESS_KEYRING
                 This specifies the caller's process-specific keyring.

          KEY_SPEC_SESSION_KEYRING
                 This specifies the caller's session-specific keyring.

          KEY_SPEC_USER_KEYRING
                 This specifies the caller's UID-specific keyring.

          KEY_SPEC_USER_SESSION_KEYRING
                 This specifies the caller's UID-session keyring.


-----------------------------------------------------------------

::

          On success keyctl_search() returns the serial number of the key
          it found.  On error, the value -1 will be returned and errno will
          have been set to an appropriate error.


-----------------------------------------------------

::

          ENOKEY One of the keyrings doesn't exist, no key was found by the
                 search, or the only key found by the search was a negative
                 key.

          ENOTDIR
                 One of the keyrings is a valid key that isn't a keyring.

          EKEYEXPIRED
                 One of the keyrings has expired, or the only key found was
                 expired.

          EKEYREVOKED
                 One of the keyrings has been revoked, or the only key
                 found was revoked.

          ENOMEM Insufficient memory to expand the destination keyring.

          EDQUOT The key quota for this user would be exceeded by creating
                 a link to the found key in the destination keyring.

          EACCES The source keyring didn't grant search permission, the
                 destination keyring didn't grant write permission or the
                 found key didn't grant link permission to the caller.


-------------------------------------------------------

::

          Although this is a Linux system call, it is not present in libc
          but can be found rather in libkeyutils.  When linking, -lkeyutils
          should be specified to the linker.


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

   Linux                          4 May 2006               KEYCTL_SEARCH(3)

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
