.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

keyctl_get_keyring_ID(3) — Linux manual page
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

   KEYCTL_GET_KEYRING_ID(3)inux Key Management CallsEYCTL_GET_KEYRING_ID(3)

NAME
-------------------------------------------------

::

          keyctl_get_keyring_ID - get the ID of a special keyring


---------------------------------------------------------

::

          #include <keyutils.h>

          key_serial_t keyctl_get_keyring_ID(key_serial_t key,
           int create);


---------------------------------------------------------------

::

          keyctl_get_keyring_ID() maps a special key or keyring ID to the
          serial number of the key actually representing that feature.  The
          serial number will be returned if that key exists.

          If the key or keyring does not yet exist, then if create is non-
          zero, the key or keyring will be created if it is appropriate to
          do so.

          The following special key IDs may be specified as key:

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

          KEY_SPEC_REQKEY_AUTH_KEY
                 This specifies the authorisation key created by
                 request_key() and passed to the process it spawns to
                 generate a key.

          If a valid keyring ID is passed in, then this will simply be
          returned if the key exists; an error will be issued if it doesn't
          exist.


-----------------------------------------------------------------

::

          On success keyctl_get_keyring_ID() returns the serial number of
          the key it found.  On error, the value -1 will be returned and
          errno will have been set to an appropriate error.


-----------------------------------------------------

::

          ENOKEY No matching key was found.

          ENOMEM Insufficient memory to create a key.

          EDQUOT The key quota for this user would be exceeded by creating
                 this key or linking it to the keyring.


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

   Linux                          4 May 2006       KEYCTL_GET_KEYRING_ID(3)

--------------

Pages that refer to this page: `keyctl(2) <../man2/keyctl.2.html>`__, 
`keyctl(3) <../man3/keyctl.3.html>`__

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
