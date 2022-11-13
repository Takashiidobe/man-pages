.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

keyutils(7) — Linux manual page
===============================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `UTILITIES <#UTILITIES>`__ \|     |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   KEYUTILS(7)               Kernel key management              KEYUTILS(7)

NAME
-------------------------------------------------

::

          keyutils - in-kernel key management utilities


---------------------------------------------------------------

::

          The keyutils package is a library and a set of utilities for
          accessing the kernel keyrings facility.

          A header file is supplied to provide the definitions and
          declarations required to access the library:

                 #include <keyutils.h>

          To link with the library, the following:

                 -lkeyutils

          should be specified to the linker.

          Three system calls are provided:

          add_key(2)
                 Supply a new key to the kernel.

          request_key(2)
                 Find an existing key for use, or, optionally, create one
                 if one does not exist.

          keyctl(2)
                 Control a key in various ways.  The library provides a
                 variety of wrappers around this system call and those
                 should be used rather than calling it directly.

          See the add_key(2), request_key(2), and keyctl(2) manual pages
          for more information.

          The keyctl() wrappers are listed on the keyctl(3) manual page.


-----------------------------------------------------------

::

          A program is provided to interact with the kernel facility by a
          number of subcommands, e.g.:

                 keyctl add user foo bar @s

          See the keyctl(1) manual page for information on that.

          The kernel has the ability to upcall to userspace to fabricate
          new keys.  This can be triggered by request_key(), but userspace
          is better off using add_key() instead if it possibly can.

          The upcalling mechanism is usually routed via the request-key(8)
          program.  What this does with any particular key is configurable
          in:

                 /etc/request-key.conf
                 /etc/request-key.d/

          See the request-key.conf(5) and the request-key(8) manual pages
          for more information.


---------------------------------------------------------

::

          keyctl(1), keyctl(3), keyrings(7), persistent-keyring(7),
          process-keyring(7), session-keyring(7), thread-keyring(7),
          user-keyring(7), user-session-keyring(7), pam_keyinit(8)

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

   Linux                          21 Feb 2014                   KEYUTILS(7)

--------------

Pages that refer to this page: `add_key(2) <../man2/add_key.2.html>`__, 
`keyctl(2) <../man2/keyctl.2.html>`__, 
`request_key(2) <../man2/request_key.2.html>`__, 
`keyctl(3) <../man3/keyctl.3.html>`__, 
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
`asymmetric-key(7) <../man7/asymmetric-key.7.html>`__, 
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
