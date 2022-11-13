.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

add_key(2) — Linux manual page
==============================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `RETURN VALUE <#RETURN_VALUE>`__  |                                   |
| \| `ERRORS <#ERRORS>`__ \|        |                                   |
| `VERSIONS <#VERSIONS>`__ \|       |                                   |
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

   ADD_KEY(2)             Linux Key Management Calls             ADD_KEY(2)

NAME
-------------------------------------------------

::

          add_key - add a key to the kernel's key management facility


---------------------------------------------------------

::

          #include <keyutils.h>

          key_serial_t add_key(const char *type, const char *description,
                               const void *payload, size_t plen,
                               key_serial_t keyring);

          Note: There is no glibc wrapper for this system call; see NOTES.


---------------------------------------------------------------

::

          add_key() creates or updates a key of the given type and
          description, instantiates it with the payload of length plen,
          attaches it to the nominated keyring, and returns the key's
          serial number.

          The key may be rejected if the provided data is in the wrong
          format or it is invalid in some other way.

          If the destination keyring already contains a key that matches
          the specified type and description, then, if the key type
          supports it, that key will be updated rather than a new key being
          created; if not, a new key (with a different ID) will be created
          and it will displace the link to the extant key from the keyring.

          The destination keyring serial number may be that of a valid
          keyring for which the caller has write permission.
          Alternatively, it may be one of the following special keyring
          IDs:

          KEY_SPEC_THREAD_KEYRING
                 This specifies the caller's thread-specific keyring
                 (thread-keyring(7)).

          KEY_SPEC_PROCESS_KEYRING
                 This specifies the caller's process-specific keyring
                 (process-keyring(7)).

          KEY_SPEC_SESSION_KEYRING
                 This specifies the caller's session-specific keyring
                 (session-keyring(7)).

          KEY_SPEC_USER_KEYRING
                 This specifies the caller's UID-specific keyring
                 (user-keyring(7)).

          KEY_SPEC_USER_SESSION_KEYRING
                 This specifies the caller's UID-session keyring
                 (user-session-keyring(7)).

      Key types
          The key type is a string that specifies the key's type.
          Internally, the kernel defines a number of key types that are
          available in the core key management code.  Among the types that
          are available for user-space use and can be specified as the type
          argument to add_key() are the following:

          "keyring"
                 Keyrings are special key types that may contain links to
                 sequences of other keys of any type.  If this interface is
                 used to create a keyring, then payload should be NULL and
                 plen should be zero.

          "user" This is a general purpose key type whose payload may be
                 read and updated by user-space applications.  The key is
                 kept entirely within kernel memory.  The payload for keys
                 of this type is a blob of arbitrary data of up to 32,767
                 bytes.

          "logon" (since Linux 3.3)
                 This key type is essentially the same as "user", but it
                 does not permit the key to read.  This is suitable for
                 storing payloads that you do not want to be readable from
                 user space.

          This key type vets the description to ensure that it is qualified
          by a "service" prefix, by checking to ensure that the description
          contains a ':' that is preceded by other characters.

          "big_key" (since Linux 3.13)
                 This key type is similar to "user", but may hold a payload
                 of up to 1 MiB.  If the key payload is large enough, then
                 it may be stored encrypted in tmpfs (which can be swapped
                 out) rather than kernel memory.

          For further details on these key types, see keyrings(7).


-----------------------------------------------------------------

::

          On success, add_key() returns the serial number of the key it
          created or updated.  On error, -1 is returned and errno is set to
          indicate the error.


-----------------------------------------------------

::

          EACCES The keyring wasn't available for modification by the user.

          EDQUOT The key quota for this user would be exceeded by creating
                 this key or linking it to the keyring.

          EFAULT One or more of type, description, and payload points
                 outside process's accessible address space.

          EINVAL The size of the string (including the terminating null
                 byte) specified in type or description exceeded the limit
                 (32 bytes and 4096 bytes respectively).

          EINVAL The payload data was invalid.

          EINVAL type was "logon" and the description was not qualified
                 with a prefix string of the form "service:".

          EKEYEXPIRED
                 The keyring has expired.

          EKEYREVOKED
                 The keyring has been revoked.

          ENOKEY The keyring doesn't exist.

          ENOMEM Insufficient memory to create a key.

          EPERM  The type started with a period ('.').  Key types that
                 begin with a period are reserved to the implementation.

          EPERM  type was "keyring" and the description started with a
                 period ('.').  Keyrings with descriptions (names) that
                 begin with a period are reserved to the implementation.


---------------------------------------------------------

::

          This system call first appeared in Linux 2.6.10.


-------------------------------------------------------------------

::

          This system call is a nonstandard Linux extension.


---------------------------------------------------

::

          Glibc does not provide a wrapper for this system call.  A wrapper
          is provided in the libkeyutils library.  (The accompanying
          package provides the <keyutils.h> header file.)  When employing
          the wrapper in that library, link with -lkeyutils.


---------------------------------------------------------

::

          The program below creates a key with the type, description, and
          payload specified in its command-line arguments, and links that
          key into the session keyring.  The following shell session
          demonstrates the use of the program:

              $ ./a.out user mykey "Some payload"
              Key ID is 64a4dca
              $ grep '64a4dca' /proc/keys
              064a4dca I--Q---    1 perm 3f010000  1000  1000 user    mykey: 12

      Program source

          #include <sys/types.h>
          #include <keyutils.h>
          #include <stdint.h>
          #include <stdio.h>
          #include <stdlib.h>
          #include <string.h>

          int
          main(int argc, char *argv[])
          {
              key_serial_t key;

              if (argc != 4) {
                  fprintf(stderr, "Usage: %s type description payload\n",
                          argv[0]);
                  exit(EXIT_FAILURE);
              }

              key = add_key(argv[1], argv[2], argv[3], strlen(argv[3]),
                          KEY_SPEC_SESSION_KEYRING);
              if (key == -1) {
                  perror("add_key");
                  exit(EXIT_FAILURE);
              }

              printf("Key ID is %jx\n", (uintmax_t) key);

              exit(EXIT_SUCCESS);
          }


---------------------------------------------------------

::

          keyctl(1), keyctl(2), request_key(2), keyctl(3), keyrings(7),
          keyutils(7), persistent-keyring(7), process-keyring(7),
          session-keyring(7), thread-keyring(7), user-keyring(7),
          user-session-keyring(7)

          The kernel source files Documentation/security/keys/core.rst and
          Documentation/keys/request-key.rst (or, before Linux 4.13, in the
          files Documentation/security/keys.txt and
          Documentation/security/keys-request-key.txt).

COLOPHON
---------------------------------------------------------

::

          This page is part of release 5.13 of the Linux man-pages project.
          A description of the project, information about reporting bugs,
          and the latest version of this page, can be found at
          https://www.kernel.org/doc/man-pages/.

   Linux                          2021-08-27                     ADD_KEY(2)

--------------

Pages that refer to this page: `keyctl(2) <../man2/keyctl.2.html>`__, 
`request_key(2) <../man2/request_key.2.html>`__, 
`syscalls(2) <../man2/syscalls.2.html>`__, 
`keyctl(3) <../man3/keyctl.3.html>`__, 
`keyctl_capabilities(3) <../man3/keyctl_capabilities.3.html>`__, 
`keyctl_chown(3) <../man3/keyctl_chown.3.html>`__, 
`keyctl_clear(3) <../man3/keyctl_clear.3.html>`__, 
`keyctl_describe(3) <../man3/keyctl_describe.3.html>`__, 
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
`keyctl_revoke(3) <../man3/keyctl_revoke.3.html>`__, 
`keyctl_search(3) <../man3/keyctl_search.3.html>`__, 
`keyctl_session_to_parent(3) <../man3/keyctl_session_to_parent.3.html>`__, 
`keyctl_setperm(3) <../man3/keyctl_setperm.3.html>`__, 
`keyctl_set_reqkey_keyring(3) <../man3/keyctl_set_reqkey_keyring.3.html>`__, 
`keyctl_set_timeout(3) <../man3/keyctl_set_timeout.3.html>`__, 
`keyctl_update(3) <../man3/keyctl_update.3.html>`__, 
`keyctl_watch_key(3) <../man3/keyctl_watch_key.3.html>`__, 
`proc(5) <../man5/proc.5.html>`__, 
`asymmetric-key(7) <../man7/asymmetric-key.7.html>`__, 
`keyrings(7) <../man7/keyrings.7.html>`__, 
`keyutils(7) <../man7/keyutils.7.html>`__

--------------

`Copyright and license for this manual
page <../man2/add_key.2.license.html>`__

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
