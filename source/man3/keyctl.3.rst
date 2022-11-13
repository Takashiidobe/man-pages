.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

keyctl(3) — Linux manual page
=============================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `KEYCTL                           |                                   |
|  FUNCTIONS <#KEYCTL_FUNCTIONS>`__ |                                   |
| \|                                |                                   |
| `UTILITY                          |                                   |
| FUNCTIONS <#UTILITY_FUNCTIONS>`__ |                                   |
| \| `SEE ALSO <#SEE_ALSO>`__ \|    |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   KEYCTL(3)              Linux Key Management Calls              KEYCTL(3)

NAME
-------------------------------------------------

::

          keyctl_*() - key management function wrappers


---------------------------------------------------------------

::

          The keyctl() system call is a multiplexor for a number of key
          management functions.  These should be called via the wrappers in
          the libkeyutils library.

          The functions can be compiled in by including the keyutils header
          file:

                 #include <keyutils.h>

          and then telling the linker it should link in the library:

                 -lkeyutils


-------------------------------------------------------------------------

::

          keyctl_assume_authority(3)
          keyctl_chown(3)
          keyctl_capabilities(3)
          keyctl_clear(3)
          keyctl_describe(3)
          keyctl_describe_alloc(3)
          keyctl_dh_compute(3)
          keyctl_dh_compute_alloc(3)
          keyctl_get_keyring_ID(3)
          keyctl_get_persistent(3)
          keyctl_get_security(3)
          keyctl_get_security_alloc(3)
          keyctl_instantiate(3)
          keyctl_instantiate_iov(3)
          keyctl_invalidate(3)
          keyctl_join_session_keyring(3)
          keyctl_link(3)
          keyctl_move(3)
          keyctl_negate(3)
          keyctl_pkey_decrypt(3)
          keyctl_pkey_encrypt(3)
          keyctl_pkey_query(3)
          keyctl_pkey_sign(3)
          keyctl_pkey_verify(3)
          keyctl_read(3)
          keyctl_read_alloc(3)
          keyctl_reject(3)
          keyctl_restrict_keyring(3)
          keyctl_revoke(3)
          keyctl_search(3)
          keyctl_session_to_parent(3)
          keyctl_set_reqkey_keyring(3)
          keyctl_set_timeout(3)
          keyctl_setperm(3)
          keyctl_unlink(3)
          keyctl_update(3)
          keyctl_watch_key(3)


---------------------------------------------------------------------------

::

          find_key_by_type_and_name(3)
          recursive_key_scan(3)
          recursive_session_key_scan(3)


---------------------------------------------------------

::

          keyctl(1), add_key(2), keyctl(2), request_key(2), keyrings(7),
          keyutils(7)

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

   Linux                          21 Feb 2014                     KEYCTL(3)

--------------

Pages that refer to this page: `keyctl(1) <../man1/keyctl.1.html>`__, 
`add_key(2) <../man2/add_key.2.html>`__, 
`keyctl(2) <../man2/keyctl.2.html>`__, 
`request_key(2) <../man2/request_key.2.html>`__, 
`find_key_by_type_and_name(3) <../man3/find_key_by_type_and_name.3.html>`__, 
`keyctl_capabilities(3) <../man3/keyctl_capabilities.3.html>`__, 
`keyctl_chown(3) <../man3/keyctl_chown.3.html>`__, 
`keyctl_clear(3) <../man3/keyctl_clear.3.html>`__, 
`keyctl_describe(3) <../man3/keyctl_describe.3.html>`__, 
`keyctl_dh_compute(3) <../man3/keyctl_dh_compute.3.html>`__, 
`keyctl_get_keyring_ID(3) <../man3/keyctl_get_keyring_ID.3.html>`__, 
`keyctl_get_persistent(3) <../man3/keyctl_get_persistent.3.html>`__, 
`keyctl_get_security(3) <../man3/keyctl_get_security.3.html>`__, 
`keyctl_instantiate(3) <../man3/keyctl_instantiate.3.html>`__, 
`keyctl_invalidate(3) <../man3/keyctl_invalidate.3.html>`__, 
`keyctl_join_session_keyring(3) <../man3/keyctl_join_session_keyring.3.html>`__, 
`keyctl_link(3) <../man3/keyctl_link.3.html>`__, 
`keyctl_move(3) <../man3/keyctl_move.3.html>`__, 
`keyctl_pkey_encrypt(3) <../man3/keyctl_pkey_encrypt.3.html>`__, 
`keyctl_pkey_query(3) <../man3/keyctl_pkey_query.3.html>`__, 
`keyctl_pkey_sign(3) <../man3/keyctl_pkey_sign.3.html>`__, 
`keyctl_read(3) <../man3/keyctl_read.3.html>`__, 
`keyctl_restrict_keyring(3) <../man3/keyctl_restrict_keyring.3.html>`__, 
`keyctl_revoke(3) <../man3/keyctl_revoke.3.html>`__, 
`keyctl_search(3) <../man3/keyctl_search.3.html>`__, 
`keyctl_session_to_parent(3) <../man3/keyctl_session_to_parent.3.html>`__, 
`keyctl_setperm(3) <../man3/keyctl_setperm.3.html>`__, 
`keyctl_set_reqkey_keyring(3) <../man3/keyctl_set_reqkey_keyring.3.html>`__, 
`keyctl_set_timeout(3) <../man3/keyctl_set_timeout.3.html>`__, 
`keyctl_update(3) <../man3/keyctl_update.3.html>`__, 
`keyctl_watch_key(3) <../man3/keyctl_watch_key.3.html>`__, 
`recursive_key_scan(3) <../man3/recursive_key_scan.3.html>`__, 
`asymmetric-key(7) <../man7/asymmetric-key.7.html>`__, 
`keyrings(7) <../man7/keyrings.7.html>`__, 
`keyutils(7) <../man7/keyutils.7.html>`__, 
`persistent-keyring(7) <../man7/persistent-keyring.7.html>`__, 
`process-keyring(7) <../man7/process-keyring.7.html>`__, 
`session-keyring(7) <../man7/session-keyring.7.html>`__, 
`thread-keyring(7) <../man7/thread-keyring.7.html>`__, 
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
