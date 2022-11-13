.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

keyctl_read(3) — Linux manual page
==================================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `READIN                           |                                   |
| G KEYRINGS <#READING_KEYRINGS>`__ |                                   |
| \|                                |                                   |
| `RETURN VALUE <#RETURN_VALUE>`__  |                                   |
| \| `ERRORS <#ERRORS>`__ \|        |                                   |
| `LINKING <#LINKING>`__ \|         |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   KEYCTL_READ(3)         Linux Key Management Calls         KEYCTL_READ(3)

NAME
-------------------------------------------------

::

          keyctl_read - read a key


---------------------------------------------------------

::

          #include <keyutils.h>

          long keyctl_read(key_serial_t key, char *buffer, size_t buflen);

          long keyctl_read_alloc(key_serial_t key, void **_buffer);


---------------------------------------------------------------

::

          keyctl_read() reads the payload of a key if the key type supports
          it.

          The caller must have read permission on a key to be able to read
          it.

          buffer and buflen specify the buffer into which the payload data
          will be placed.  If the buffer is too small, then the full size
          of the payload will be returned, and the contents of the buffer
          may be overwritten in some undefined way.

          keyctl_read_alloc() is similar to keyctl_read() except that it
          allocates a buffer big enough to hold the payload data and places
          the data in it.  If successful, a pointer to the buffer is placed
          in *_buffer.  The caller must free the buffer.

          keyctl_read_alloc() adds a NUL character after the data it
          retrieves, though this is not counted in the size value it
          returns.


-------------------------------------------------------------------------

::

          This call can be used to list the contents of a keyring.  The
          data is presented to the user as an array of key_serial_t values,
          each of which corresponds to a key to which the keyring holds a
          link.

          The size of the keyring will be sizeof(key_serial_t) multiplied
          by the number of keys.  The size of key_serial_t is invariant
          across different word sizes, though the byte-ordering is as
          appropriate for the kernel.


-----------------------------------------------------------------

::

          On success keyctl_read() returns the amount of data placed into
          the buffer.  If the buffer was too small, then the size of buffer
          required will be returned, and the contents of the buffer may
          have been overwritten in some undefined way.

          On success keyctl_read_alloc() returns the amount of data in the
          buffer.

          On error, both functions set errno to an appropriate code and
          return the value -1.


-----------------------------------------------------

::

          ENOKEY The key specified is invalid.

          EKEYEXPIRED
                 The key specified has expired.

          EKEYREVOKED
                 The key specified had been revoked.

          EACCES The key exists, but is not readable by the calling
                 process.

          EOPNOTSUPP
                 The key type does not support reading of the payload data.


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

   Linux                          21 Feb 2014                KEYCTL_READ(3)

--------------

Pages that refer to this page: `keyctl(2) <../man2/keyctl.2.html>`__, 
`request_key(2) <../man2/request_key.2.html>`__, 
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
