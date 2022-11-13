.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

des_crypt(3) — Linux manual page
================================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `RETURN VALUE <#RETURN_VALUE>`__  |                                   |
| \| `VERSIONS <#VERSIONS>`__ \|    |                                   |
| `ATTRIBUTES <#ATTRIBUTES>`__ \|   |                                   |
| `                                 |                                   |
| CONFORMING TO <#CONFORMING_TO>`__ |                                   |
| \| `SEE ALSO <#SEE_ALSO>`__ \|    |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   DES_CRYPT(3)            Linux Programmer's Manual           DES_CRYPT(3)

NAME
-------------------------------------------------

::

          des_crypt, ecb_crypt, cbc_crypt, des_setparity, DES_FAILED - fast
          DES encryption


---------------------------------------------------------

::

          #include <rpc/des_crypt.h>

          int ecb_crypt(char *key, char *data, unsigned int datalen,
                        unsigned int mode);
          int cbc_crypt(char *key, char *data, unsigned int datalen,
                        unsigned int mode, char *ivec);

          void des_setparity(char *key);

          int DES_FAILED(int status);


---------------------------------------------------------------

::

          ecb_crypt() and cbc_crypt() implement the NBS DES (Data
          Encryption Standard).  These routines are faster and more general
          purpose than crypt(3).  They also are able to utilize DES
          hardware if it is available.  ecb_crypt() encrypts in ECB
          (Electronic Code Book) mode, which encrypts blocks of data
          independently.  cbc_crypt() encrypts in CBC (Cipher Block
          Chaining) mode, which chains together successive blocks.  CBC
          mode protects against insertions, deletions, and substitutions of
          blocks.  Also, regularities in the clear text will not appear in
          the cipher text.

          Here is how to use these routines.  The first argument, key, is
          the 8-byte encryption key with parity.  To set the key's parity,
          which for DES is in the low bit of each byte, use
          des_setparity().  The second argument, data, contains the data to
          be encrypted or decrypted.  The third argument, datalen, is the
          length in bytes of data, which must be a multiple of 8.  The
          fourth argument, mode, is formed by ORing together some things.
          For the encryption direction OR in either DES_ENCRYPT or
          DES_DECRYPT.  For software versus hardware encryption, OR in
          either DES_HW or DES_SW.  If DES_HW is specified, and there is no
          hardware, then the encryption is performed in software and the
          routine returns DESERR_NOHWDEVICE.  For cbc_crypt(), the argument
          ivec is the 8-byte initialization vector for the chaining.  It is
          updated to the next initialization vector upon return.


-----------------------------------------------------------------

::

          DESERR_NONE
                 No error.

          DESERR_NOHWDEVICE
                 Encryption succeeded, but done in software instead of the
                 requested hardware.

          DESERR_HWERROR
                 An error occurred in the hardware or driver.

          DESERR_BADPARAM
                 Bad argument to routine.

          Given a result status stat, the macro DES_FAILED(stat) is false
          only for the first two statuses.


---------------------------------------------------------

::

          These functions were added to glibc in version 2.1.

          Because they employ the DES block cipher, which is no longer
          considered secure, ecb_crypt(), ecb_crypt(), crypt_r(), and
          des_setparity() were removed in glibc 2.28.  Applications should
          switch to a modern cryptography library, such as libgcrypt.


-------------------------------------------------------------

::

          For an explanation of the terms used in this section, see
          attributes(7).

          ┌──────────────────────────────────────┬───────────────┬─────────┐
          │Interface                             │ Attribute     │ Value   │
          ├──────────────────────────────────────┼───────────────┼─────────┤
          │ecb_crypt(), cbc_crypt(),             │ Thread safety │ MT-Safe │
          │des_setparity()                       │               │         │
          └──────────────────────────────────────┴───────────────┴─────────┘


-------------------------------------------------------------------

::

          4.3BSD.  Not in POSIX.1.


---------------------------------------------------------

::

          des(1), crypt(3), xcrypt(3)

COLOPHON
---------------------------------------------------------

::

          This page is part of release 5.13 of the Linux man-pages project.
          A description of the project, information about reporting bugs,
          and the latest version of this page, can be found at
          https://www.kernel.org/doc/man-pages/.

                                  2021-03-22                   DES_CRYPT(3)

--------------

Pages that refer to this page: `encrypt(3) <../man3/encrypt.3.html>`__, 
`xcrypt(3) <../man3/xcrypt.3.html>`__

--------------

`Copyright and license for this manual
page <../man3/des_crypt.3.license.html>`__

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
