.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

encrypt(3) — Linux manual page
==============================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `RETURN VALUE <#RETURN_VALUE>`__  |                                   |
| \| `ERRORS <#ERRORS>`__ \|        |                                   |
| `VERSIONS <#VERSIONS>`__ \|       |                                   |
| `ATTRIBUTES <#ATTRIBUTES>`__ \|   |                                   |
| `                                 |                                   |
| CONFORMING TO <#CONFORMING_TO>`__ |                                   |
| \| `NOTES <#NOTES>`__ \|          |                                   |
| `EXAMPLES <#EXAMPLES>`__ \|       |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   ENCRYPT(3)              Linux Programmer's Manual             ENCRYPT(3)

NAME
-------------------------------------------------

::

          encrypt, setkey, encrypt_r, setkey_r - encrypt 64-bit messages


---------------------------------------------------------

::

          #define _XOPEN_SOURCE       /* See feature_test_macros(7) */
          #include <unistd.h>

          void encrypt(char block[64], int edflag);

          #define _XOPEN_SOURCE       /* See feature_test_macros(7) */
          #include <stdlib.h>

          void setkey(const char *key);

          #define _GNU_SOURCE         /* See feature_test_macros(7) */
          #include <crypt.h>

          void setkey_r(const char *key, struct crypt_data *data);
          void encrypt_r(char *block, int edflag, struct crypt_data *data);

          Each of these requires linking with -lcrypt.


---------------------------------------------------------------

::

          These functions encrypt and decrypt 64-bit messages.  The
          setkey() function sets the key used by encrypt().  The key
          argument used here is an array of 64 bytes, each of which has
          numerical value 1 or 0.  The bytes key[n] where n=8*i-1 are
          ignored, so that the effective key length is 56 bits.

          The encrypt() function modifies the passed buffer, encoding if
          edflag is 0, and decoding if 1 is being passed.  Like the key
          argument, also block is a bit vector representation of the actual
          value that is encoded.  The result is returned in that same
          vector.

          These two functions are not reentrant, that is, the key data is
          kept in static storage.  The functions setkey_r() and encrypt_r()
          are the reentrant versions.  They use the following structure to
          hold the key data:

              struct crypt_data {
                  char keysched[16 * 8];
                  char sb0[32768];
                  char sb1[32768];
                  char sb2[32768];
                  char sb3[32768];
                  char crypt_3_buf[14];
                  char current_salt[2];
                  long current_saltbits;
                  int  direction;
                  int  initialized;
              };

          Before calling setkey_r() set data->initialized to zero.


-----------------------------------------------------------------

::

          These functions do not return any value.


-----------------------------------------------------

::

          Set errno to zero before calling the above functions.  On
          success, errno is unchanged.

          ENOSYS The function is not provided.  (For example because of
                 former USA export restrictions.)


---------------------------------------------------------

::

          Because they employ the DES block cipher, which is no longer
          considered secure, crypt(), crypt_r(), setkey(), and setkey_r()
          were removed in glibc 2.28.  Applications should switch to a
          modern cryptography library, such as libgcrypt.


-------------------------------------------------------------

::

          For an explanation of the terms used in this section, see
          attributes(7).

          ┌─────────────────────────┬───────────────┬──────────────────────┐
          │Interface                │ Attribute     │ Value                │
          ├─────────────────────────┼───────────────┼──────────────────────┤
          │encrypt(), setkey()      │ Thread safety │ MT-Unsafe race:crypt │
          ├─────────────────────────┼───────────────┼──────────────────────┤
          │encrypt_r(), setkey_r()  │ Thread safety │ MT-Safe              │
          └─────────────────────────┴───────────────┴──────────────────────┘


-------------------------------------------------------------------

::

          encrypt(), setkey(): POSIX.1-2001, POSIX.1-2008, SUS, SVr4.

          The functions encrypt_r() and setkey_r() are GNU extensions.


---------------------------------------------------

::

      Availability in glibc
          See crypt(3).

      Features in glibc
          In glibc 2.2, these functions use the DES algorithm.


---------------------------------------------------------

::

          #define _XOPEN_SOURCE
          #include <stdio.h>
          #include <stdlib.h>
          #include <unistd.h>
          #include <crypt.h>

          int
          main(void)
          {
              char key[64];
              char orig[9] = "eggplant";
              char buf[64];
              char txt[9];

              for (int i = 0; i < 64; i++) {
                  key[i] = rand() & 1;
              }

              for (int i = 0; i < 8; i++) {
                  for (int j = 0; j < 8; j++) {
                      buf[i * 8 + j] = orig[i] >> j & 1;
                  }
                  setkey(key);
              }
              printf("Before encrypting: %s\n", orig);

              encrypt(buf, 0);
              for (int i = 0; i < 8; i++) {
                  for (int j = 0, txt[i] = '\0'; j < 8; j++) {
                      txt[i] |= buf[i * 8 + j] << j;
                  }
                  txt[8] = '\0';
              }
              printf("After encrypting:  %s\n", txt);

              encrypt(buf, 1);
              for (int i = 0; i < 8; i++) {
                  for (int j = 0, txt[i] = '\0'; j < 8; j++) {
                      txt[i] |= buf[i * 8 + j] << j;
                  }
                  txt[8] = '\0';
              }
              printf("After decrypting:  %s\n", txt);
              exit(EXIT_SUCCESS);
          }


---------------------------------------------------------

::

          cbc_crypt(3), crypt(3), ecb_crypt(3),

COLOPHON
---------------------------------------------------------

::

          This page is part of release 5.13 of the Linux man-pages project.
          A description of the project, information about reporting bugs,
          and the latest version of this page, can be found at
          https://www.kernel.org/doc/man-pages/.

                                  2021-03-22                     ENCRYPT(3)

--------------

Pages that refer to this page: `crypt(3) <../man3/crypt.3.html>`__

--------------

`Copyright and license for this manual
page <../man3/encrypt.3.license.html>`__

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
