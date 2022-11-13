.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

key_setsecret(3) — Linux manual page
====================================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `RETURN VALUE <#RETURN_VALUE>`__  |                                   |
| \| `ATTRIBUTES <#ATTRIBUTES>`__   |                                   |
| \| `NOTES <#NOTES>`__ \|          |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   KEY_SETSECRET(3)        Linux Programmer's Manual       KEY_SETSECRET(3)

NAME
-------------------------------------------------

::

          key_decryptsession, key_encryptsession, key_setsecret,
          key_gendes, key_secretkey_is_set - interfaces to rpc keyserver
          daemon


---------------------------------------------------------

::

          #include <rpc/rpc.h>

          int key_decryptsession(char *remotename, des_block *deskey);
          int key_encryptsession(char *remotename, des_block *deskey);

          int key_gendes(des_block *deskey);

          int key_setsecret(char *key);
          int key_secretkey_is_set(void);


---------------------------------------------------------------

::

          The functions here are used within the RPC's secure
          authentication mechanism (AUTH_DES).  There should be no need for
          user programs to use this functions.

          The function key_decryptsession() uses the (remote) server
          netname and takes the DES key for decrypting.  It uses the public
          key of the server and the secret key associated with the
          effective UID of the calling process.

          The function key_encryptsession() is the inverse of
          key_decryptsession().  It encrypts the DES keys with the public
          key of the server and the secret key associated with the
          effective UID of the calling process.

          The function key_gendes() is used to ask the keyserver for a
          secure conversation key.

          The function key_setsecret() is used to set the key for the
          effective UID of the calling process.

          The function key_secretkey_is_set() can be used to determine
          whether a key has been set for the effective UID of the calling
          process.


-----------------------------------------------------------------

::

          These functions return 1 on success and 0 on failure.


-------------------------------------------------------------

::

          For an explanation of the terms used in this section, see
          attributes(7).

          ┌──────────────────────────────────────┬───────────────┬─────────┐
          │Interface                             │ Attribute     │ Value   │
          ├──────────────────────────────────────┼───────────────┼─────────┤
          │key_decryptsession(),                 │ Thread safety │ MT-Safe │
          │key_encryptsession(), key_gendes(),   │               │         │
          │key_setsecret(),                      │               │         │
          │key_secretkey_is_set()                │               │         │
          └──────────────────────────────────────┴───────────────┴─────────┘


---------------------------------------------------

::

          Note that we talk about two types of encryption here.  One is
          asymmetric using a public and secret key.  The other is
          symmetric, the 64-bit DES.

          These routines were part of the Linux/Doors-project, abandoned by
          now.


---------------------------------------------------------

::

          crypt(3)

COLOPHON
---------------------------------------------------------

::

          This page is part of release 5.13 of the Linux man-pages project.
          A description of the project, information about reporting bugs,
          and the latest version of this page, can be found at
          https://www.kernel.org/doc/man-pages/.

                                  2021-03-22               KEY_SETSECRET(3)

--------------

`Copyright and license for this manual
page <../man3/key_setsecret.3.license.html>`__

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
