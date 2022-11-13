.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

keyctl_pkey_encrypt(3) — Linux manual page
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

   KEYCTL_PKEY_ENCRYPT(3) Linux Public-Key EncryptionKEYCTL_PKEY_ENCRYPT(3)

NAME
-------------------------------------------------

::

          keyctl_pkey_encrypt, keyctl_pkey_decrypt - Encrypt and decrypt
          data


---------------------------------------------------------

::

          #include <keyutils.h>

          long keyctl_pkey_encrypt(key_serial_t key, const char *info,
                                   const void *data, size_t data_len,
                                   void *enc, size_t enc_len);

          long keyctl_pkey_decrypt(key_serial_t key, const char *info,
                                   const void *enc, size_t enc_len,
                                   void *data, size_t data_len);


---------------------------------------------------------------

::

          keyctl_pkey_encrypt() asks the kernel to use the crypto material
          attached to a key to encrypt a blob of data and
          keyctl_pkey_decrypt() asks the kernel to use the key to reverse
          the operation and recover the original data.  Note that these
          operations may involve the kernel calling out to cryptographic
          hardware.  The caller must have search permission on a key to be
          able to use them in this manner.

          When invoking the function, key indicates the key that will
          provide the cryptographic material and info points to a space- or
          tab-separated string of "key[=value]" parameters that indicate
          things like encoding forms and passwords to unlock the key; see
          asymmetric-key(7) for more information.

          data and datalen indicate the address and size of the decrypted
          data buffer and enc and enclen indicate the address and size of
          the encrypted data buffer.  The encrypt function draws data from
          the decrypted data buffer and places the output into the
          encryption buffer.  The decrypt function does the reverse,
          drawing from the encryption buffer and writing into the data
          buffer.

          keyctl_pkey_query(2) can be called to find out how large the
          buffers need to be.

          Note that not all asymmetric-type keys will support these
          operations; further, the operations available may depend on which
          components of the key material are available: typically
          encryption only requires the public key, but decryption requires
          the private key as well.  Which operations are supported on a
          particular key can also be determined using the query function.


-----------------------------------------------------------------

::

          On success keyctl_pkey_encrypt() and keyctl_pkey_decrypt() return
          the amount of data written into the output buffer.  On error, the
          value -1 will be returned and errno will have been set to an
          appropriate error.


-----------------------------------------------------

::

          ENOKEY The key specified is invalid.

          EKEYEXPIRED
                 The key specified has expired.

          EKEYREVOKED
                 The key specified has been revoked.

          EACCES The key exists, but is not searchable by the calling
                 process.

          ENOPKG Some facility needed to complete the requested operation
                 is not available.  This is most probably a requested or
                 required digest or encryption algorithm.

          EFAULT Bad address.


-------------------------------------------------------

::

          This is a library function that can be found in libkeyutils.
          When linking, -lkeyutils should be specified to the linker.


---------------------------------------------------------

::

          keyctl(1), add_key(2), keyctl(2), keyctl(3),
          keyctl_pkey_query(3), keyctl_pkey_sign(3), keyrings(7),
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

   Linux                          8 Nov 2018         KEYCTL_PKEY_ENCRYPT(3)

--------------

Pages that refer to this page: `keyctl(3) <../man3/keyctl.3.html>`__, 
`keyctl_pkey_query(3) <../man3/keyctl_pkey_query.3.html>`__, 
`asymmetric-key(7) <../man7/asymmetric-key.7.html>`__

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
