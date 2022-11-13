.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

keyctl_capabilities(3) — Linux manual page
==========================================

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

   KEYCTL_CAPABILITIES(3) Linux Key Management Calls KEYCTL_CAPABILITIES(3)

NAME
-------------------------------------------------

::

          keyctl_capabilities - Query subsystem capabilities


---------------------------------------------------------

::

          #include <keyutils.h>

          long keyctl_capabilities(unsigned char *buffer, size_t buflen);


---------------------------------------------------------------

::

          keyctl_capabilities() queries the keyrings subsystem in the
          kernel to ask about its capabilities and fills in the array in
          the buffer with bits that indicate the presence or absence of
          specific features in the keyrings subsystem.

          The function returns the amount of data the kernel has available,
          irrespective of the amount of buffer space available.  If the
          buffer is shorter than the data, a short copy will be made; if
          the buffer is larger than the data, the excess space will be
          cleared.

          If this operation is not available in the kernel, the keyutils
          library will emulate it as best it can and the capability bit
          that indicates if the kernel operation is available will be
          cleared.

          In buffer[0], the following capabilities exist:

          KEYCTL_CAPS0_CAPABILITIES
                 This is set if the kernel supports this operation and
                 cleared otherwise.  If it is cleared, the rest of the
                 flags are emulated.

          KEYCTL_CAPS0_PERSISTENT_KEYRINGS
                 This is set if the kernel supports persistent keyrings and
                 cleared otherwise.  See keyctl_get_persistent(3).

          KEYCTL_CAPS0_DIFFIE_HELLMAN
                 This is set if the kernel supports Diffie-Hellman
                 calculation and cleared otherwise.  See
                 keyctl_dh_compute(3).

          KEYCTL_CAPS0_PUBLIC_KEY
                 This is set if the kernel supports public-key operations
                 and cleared otherwise.  See keyctl_pkey_query(3).

          KEYCTL_CAPS0_BIG_KEY
                 This is set if the kernel supports the big_key key type
                 and cleared otherwise.

          KEYCTL_CAPS0_INVALIDATE
                 This is set if the kernel supports key invalidation and
                 cleared otherwise.  See keyctl_invalidate(3).

          KEYCTL_CAPS0_RESTRICT_KEYRING
                 This is set if the kernel supports restrictions on
                 keyrings and cleared otherwise.  See
                 keyctl_restrict_keyring(3).

          KEYCTL_CAPS0_MOVE
                 This is set if the kernel supports the move key operation
                 and cleared otherwise.  See keyctl_move(3).

          In buffer[1], the following capabilities exist:

          KEYCTL_CAPS1_NS_KEYRING_NAME
                 This is set if the keyring names are segregated according
                 to the user-namespace in which a keyring is created.

          KEYCTL_CAPS1_NS_KEY_TAG
                 This is set if a key or keyring may get tagged with a
                 namespace, thereby allowing multiple keys with the same
                 type and description, but different namespace tags, to
                 coexist within the same keyring.  Tagging may be automatic
                 depending on the key type.  Only network-namespace tagging
                 is currently used.


-----------------------------------------------------------------

::

          On success keyctl_capabilities() returns the size of the data it
          has available, irrespective of the size of the buffer.  On error,
          the value -1 will be returned and errno will have been set to an
          appropriate error.


-----------------------------------------------------

::

          EFAULT The buffer cannot be written to.


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

   Linux                          30 May 2019        KEYCTL_CAPABILITIES(3)

--------------

Pages that refer to this page: `keyctl(3) <../man3/keyctl.3.html>`__

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
