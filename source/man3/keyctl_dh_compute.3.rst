.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

keyctl_dh_compute(3) — Linux manual page
========================================

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

   KEYCTL_DH_COMPUTE(3)   Linux Key Management Calls   KEYCTL_DH_COMPUTE(3)

NAME
-------------------------------------------------

::

          keyctl_dh_compute - Compute a Diffie-Hellman shared secret or
          public key
          keyctl_dh_compute_kdf - Derive key from a Diffie-Hellman shared
          secret


---------------------------------------------------------

::

          #include <keyutils.h>

          long keyctl_dh_compute(key_serial_t private, key_serial_t prime,
          key_serial_t base, char *buffer, size_t buflen);

          long keyctl_dh_compute_alloc(key_serial_t private,
          key_serial_t prime, key_serial_t base, void **_buffer);

          long keyctl_dh_compute_kdf(key_serial_t private, key_serial_t prime,
          key_serial_t base, char *hashname, char *otherinfo,
          size_t otherinfolen, char *buffer, size_t buflen);


---------------------------------------------------------------

::

          keyctl_dh_compute() computes a Diffie-Hellman public key or
          shared secret.  That computation is:

                 base ^ private ( mod prime )

          When base is a key containing the shared generator value, the
          remote public key is computed.  When base is a key containing the
          remote public key, the shared secret is computed.

          base, private, and prime must all refer to user-type keys
          containing the parameters for the computation.  Each of these
          keys must grant the caller read permission in order for them to
          be used.

          buffer and buflen specify the buffer into which the computed
          result will be placed.  buflen may be zero, in which case the
          buffer is not used and the minimum buffer length is fetched.

          keyctl_dh_compute_alloc() is similar to keyctl_dh_compute()
          except that it allocates a buffer big enough to hold the payload
          data and places the data in it.  If successful, a pointer to the
          buffer is placed in *_buffer.  The caller must free the buffer.

          keyctl_dh_compute_kdf() derives a key from a Diffie-Hellman
          shared secret according to the protocol specified in SP800-56A.
          The Diffie-Hellman computation is based on the same primitives as
          discussed for keyctl_dh_compute().

          To implement the protocol of SP800-56A base is a key containing
          the remote public key to compute the Diffie-Hellman shared
          secret. That shared secret is post-processed with a key
          derivation function.

          The hashname specifies the Linux kernel crypto API name for a
          hash that shall be used for the key derivation function, such as
          sha256.  The hashname must be a NULL terminated string.  See
          /proc/crypto for available hashes on the system.

          Following the specification of SP800-56A section 5.8.1.2 the
          otherinfo parameter may be provided. The format of the OtherInfo
          field is defined by the caller. The caller may also specify NULL
          as a valid argument when no OtherInfo data shall be processed.
          The length of the otherinfo parameter is specified with
          otherinfolen and is restricted to a maximum length by the kernel.

          The KDF returns the requested number of bytes specified with the
          genlen or the buflen parameter depending on the invoked function.

          buffer and buflen specify the buffer into which the computed
          result will be placed.


-----------------------------------------------------------------

::

          On success keyctl_dh_compute() returns the amount of data placed
          into the buffer when buflen is non-zero.  When buflen is zero,
          the minimum buffer length to hold the data is returned.

          On success keyctl_dh_compute_alloc() returns the amount of data
          in the buffer.

          On error, both functions set errno to an appropriate code and
          return the value -1.


-----------------------------------------------------

::

          ENOKEY One of the keys specified is invalid or not readable.

          EINVAL The buffer pointer is invalid or buflen is too small.

          EOPNOTSUPP
                 One of the keys was not a valid user key.

          EMSGSIZE
                 When using keyctl_dh_compute_kdf(), the size of either
                 otherinfolen or buflen is too big.


-------------------------------------------------------

::

          This is a library function that can be found in libkeyutils.
          When linking, -lkeyutils should be specified to the linker.


---------------------------------------------------------

::

          keyctl(1),
          keyctl(2),
          keyctl(3),
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

   Linux                          07 Apr 2016          KEYCTL_DH_COMPUTE(3)

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
