.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

keyctl_describe(3) — Linux manual page
======================================

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

   KEYCTL_DESCRIBE(3)     Linux Key Management Calls     KEYCTL_DESCRIBE(3)

NAME
-------------------------------------------------

::

          keyctl_describe - describe a key


---------------------------------------------------------

::

          #include <keyutils.h>

          long keyctl_describe(key_serial_t key, char *buffer,
          size_tbuflen);

          long keyctl_describe_alloc(key_serial_t key, char **_buffer);


---------------------------------------------------------------

::

          keyctl_describe() describes the attributes of a key as a NUL-
          terminated string.

          The caller must have view permission on a key to be able to get a
          description of it.

          buffer and buflen specify the buffer into which the key
          description will be placed.  If the buffer is too small, the full
          size of the description will be returned, and no copy will take
          place.

          keyctl_describe_alloc() is similar to keyctl_describe() except
          that it allocates a buffer big enough to hold the description and
          places the description in it.  If successful, A pointer to the
          buffer is placed in *_buffer.  The caller must free the buffer.

          The description will be a string of format:

                 “%s;%d;%d;%08x;%s”

          where the arguments are: key type name, key UID, key GID, key
          permissions mask and key description.

          NOTE!  The key description will not contain any semicolons, so
          that should be separated out by working backwards from the end of
          the string.  This permits extra information to be inserted before
          it by later versions of the kernel simply by inserting more
          semicolon-terminated substrings.


-----------------------------------------------------------------

::

          On success keyctl_describe() returns the amount of data placed
          into the buffer.  If the buffer was too small, then the size of
          buffer required will be returned, but no data will be
          transferred.  On error, the value -1 will be returned and errno
          will have been set to an appropriate error.

          On success keyctl_describe_alloc() returns the amount of data in
          the buffer, less the NUL terminator.  On error, the value -1 will
          be returned and errno will have been set to an appropriate error.


-----------------------------------------------------

::

          ENOKEY The key specified is invalid.

          EKEYEXPIRED
                 The key specified has expired.

          EKEYREVOKED
                 The key specified had been revoked.

          EACCES The key exists, but is not viewable by the calling
                 process.


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

   Linux                          4 May 2006             KEYCTL_DESCRIBE(3)

--------------

Pages that refer to this page: `keyctl(2) <../man2/keyctl.2.html>`__, 
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
