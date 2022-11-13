.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

keyctl_pkey_query(3) — Linux manual page
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

   KEYCTL_PKEY_QUERY(3)   Linux Key Management Calls   KEYCTL_PKEY_QUERY(3)

NAME
-------------------------------------------------

::

          keyctl_pkey_query - Query public key parameters


---------------------------------------------------------

::

          #include <keyutils.h>

          long keyctl_pkey_query(key_serial_t key, const char *info,
                                 struct keyctl_pkey_query *result);


---------------------------------------------------------------

::

          keyctl_pkey_query() queries the public key parameters associated
          with a kernel key that supports these operations (typically
          asymmetric-type).  The caller must have search permission on the
          target key to be able to query its parameters.

          When invoking the function, key indicates the key to be queried,
          info points to a space- or tab-separated string of "key[=value]"
          parameters and result points to a buffer in which the result will
          be placed.

          The parameters that can be used in the info parameter string are
          dependent on the type of key.  Parameters can specify such things
          as encoding types (such as "enc=pkcs1"); see asymmetric-key(7)
          for more information.

          If successful, the result is written into the following struct:

              struct keyctl_pkey_query {
                      unsigned int    supported_ops;
                      unsigned int    key_size;
                      unsigned short  max_data_size;
                      unsigned short  max_sig_size;
                      unsigned short  max_enc_size;
                      unsigned short  max_dec_size;
              };

          The supported_ops field contains a bitmask of the following
          constants:

              KEYCTL_SUPPORTS_ENCRYPT
              KEYCTL_SUPPORTS_DECRYPT
              KEYCTL_SUPPORTS_SIGN
              KEYCTL_SUPPORTS_VERIFY

          indicating what operations are supported and thus which of the
          other keyctl_pkey_*() operations can be used with this key.

          The key_size field indicates the number of bits in the key size
          and the max_data_size, max_sig_size, max_enc_size and
          max_dec_size fields indicate the maximum sizes in bytes of a blob
          of data to be signed, a signature blob, a blob to be encrypted
          and a blob to be decrypted respectively.


-----------------------------------------------------------------

::

          On success keyctl_pkey_query() returns 0.  On error, the value -1
          will be returned and errno will have been set to an appropriate
          error.


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
          keyctl_pkey_encrypt(3), keyctl_pkey_sign(3), asymmetric-key(7),
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

   Linux                          8 Nov 2018           KEYCTL_PKEY_QUERY(3)

--------------

Pages that refer to this page: `keyctl(3) <../man3/keyctl.3.html>`__, 
`keyctl_pkey_encrypt(3) <../man3/keyctl_pkey_encrypt.3.html>`__, 
`keyctl_pkey_sign(3) <../man3/keyctl_pkey_sign.3.html>`__, 
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
