.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

keyctl_instantiate(3) — Linux manual page
=========================================

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

   KEYCTL_INSTANTIATE(3)  Linux Key Management Calls  KEYCTL_INSTANTIATE(3)

NAME
-------------------------------------------------

::

          keyctl_assume_authority, keyctl_instantiate,
          keyctl_instantiate_iov, keyctl_reject, keyctl_negate - key
          instantiation functions


---------------------------------------------------------

::

          #include <keyutils.h>

          long keyctl_assume_authority(key_serial_t key);

          long keyctl_instantiate(key_serial_t key, const void *payload,
          size_t plen, key_serial_t keyring);

          long keyctl_instantiate_iov(key_serial_t key,
          const struct iovec *payload_iov, unsigned ioc,
          key_serial_t keyring);

          long keyctl_negate(key_serial_t key, unsigned timeout,
          key_serial_t keyring);

          long keyctl_reject(key_serial_t key, unsigned timeout,
          unsigned error, key_serial_t keyring);


---------------------------------------------------------------

::

          keyctl_assume_authority() assumes the authority for the calling
          thread to deal with and instantiate the specified uninstantiated
          key.

          The calling thread must have the appropriate authorisation key
          resident in one of its keyrings for this to succeed, and that
          authority must not have been revoked.

          The authorising key is allocated by request_key() when it needs
          to invoke userspace to generate a key for the requesting process.
          This is then attached to one of the keyrings of the userspace
          process to which the task of instantiating the key is given:

                 requester -> request_key() -> instantiator

          Calling this function modifies the way request_key() works when
          called thereafter by the calling (instantiator) thread; once the
          authority is assumed, the keyrings of the initial process are
          added to the search path, using the initial process's UID, GID,
          groups and security context.

          If a thread has multiple instantiations to deal with, it may call
          this function to change the authorisation key currently in
          effect.  Supplying a zero key de-assumes the currently assumed
          authority.

          NOTE!  This is a per-thread setting and not a per-process setting
          so that a multithreaded process can be used to instantiate
          several keys at once.

          keyctl_instantiate() instantiates the payload of an
          uninstantiated key from the data specified.  payload and plen
          specify the data for the new payload.  payload may be NULL and
          plen may be zero if the key type permits that.  The key type may
          reject the data if it's in the wrong format or in some other way
          invalid.

          keyctl_instantiate_iov() is similar, but the data is passed in an
          array of iovec structs instead of in a flat buffer.  payload_iov
          points to the base of the array and ioc indicates how many
          elements there are.  payload_iov may be NULL or ioc may be zero
          to indicate that no data is being supplied.

          keyctl_reject() marks a key as negatively instantiated and sets
          the expiration timer on it.  timeout specifies the lifetime of
          the key in seconds.  error specifies the error to be returned
          when a search hits the key (this is typically EKEYREJECTED,
          EKEYREVOKED or EKEYEXPIRED).  Note that keyctl_reject() falls
          back to keyctl_negate() if the kernel does not support it.

          keyctl_negate() as keyctl_reject() with an error code of ENOKEY.

          Only a key for which authority has been assumed may be
          instantiated or negatively instantiated, and once instantiated,
          the authorisation key will be revoked and the requesting process
          will be able to resume.

          The destination keyring, if given, is assumed to belong to the
          initial requester, and not the instantiating process.  Therefore,
          the special keyring IDs refer to the requesting process's
          keyrings, not the caller's, and the requester's UID, etc. will be
          used to access them.

          The destination keyring can be zero if no extra link is desired.

          The requester, not the caller, must have write permission on the
          destination for a link to be made there.


-----------------------------------------------------------------

::

          On success keyctl_instantiate() returns 0.  On error, the value
          -1 will be returned and errno will have been set to an
          appropriate error.


-----------------------------------------------------

::

          ENOKEY The key or keyring specified is invalid.

          EKEYEXPIRED
                 The keyring specified has expired.

          EKEYREVOKED
                 The key or keyring specified had been revoked, or the
                 authorisation has been revoked.

          EINVAL The payload data was invalid.

          ENOMEM Insufficient memory to store the new payload or to expand
                 the destination keyring.

          EDQUOT The key quota for the key's user would be exceeded by
                 increasing the size of the key to accommodate the new
                 payload or the key quota for the keyring's user would be
                 exceeded by expanding the destination keyring.

          EACCES The key exists, but is not writable by the requester.


-------------------------------------------------------

::

          This is a library function that can be found in libkeyutils.
          When linking, -lkeyutils should be specified to the linker.


---------------------------------------------------------

::

          keyctl(1), add_key(2), keyctl(2), request_key(2), keyctl(3),
          keyrings(7), keyutils(7), request-key(8)

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

   Linux                          4 May 2006          KEYCTL_INSTANTIATE(3)

--------------

Pages that refer to this page: `keyctl(2) <../man2/keyctl.2.html>`__, 
`request_key(2) <../man2/request_key.2.html>`__, 
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
