.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

e4crypt(8) — Linux manual page
==============================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `COMMANDS <#COMMANDS>`__ \|       |                                   |
| `AUTHOR <#AUTHOR>`__ \|           |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   E4CRYPT(8)               System Manager's Manual              E4CRYPT(8)

NAME
-------------------------------------------------

::

          e4crypt - ext4 file system encryption utility


---------------------------------------------------------

::

          e4crypt add_key -S [ -k keyring ] [-v] [-q] [ -p pad ] [ path ...
          ]
          e4crypt new_session
          e4crypt get_policy path ...
          e4crypt set_policy [ -p pad ] policy path ...


---------------------------------------------------------------

::

          e4crypt performs encryption management for ext4 file systems.


---------------------------------------------------------

::

          e4crypt add_key [-vq] [-S salt ] [-k keyring ] [ -p pad ] [ path
          ... ]
                 Prompts the user for a passphrase and inserts it into the
                 specified keyring.  If no keyring is specified, e4crypt
                 will use the session keyring if it exists or the user
                 session keyring if it does not.

                 The salt argument is interpreted in a number of different
                 ways, depending on how its prefix value.  If the first two
                 characters are "s:", then the rest of the argument will be
                 used as an text string and used as the salt value.  If the
                 first two characters are "0x", then the rest of the
                 argument will be parsed as a hex string as used as the
                 salt.  If the first characters are "f:" then the rest of
                 the argument will be interpreted as a filename from which
                 the salt value will be read.  If the string begins with a
                 '/' character, it will similarly be treated as filename.
                 Finally, if the salt argument can be parsed as a valid
                 UUID, then the UUID value will be used as a salt value.

                 The keyring argument specifies the keyring to which the
                 key should be added.

                 The pad value specifies the number of bytes of padding
                 will be added to directory names for obfuscation purposes.
                 Valid pad values are 4, 8, 16, and 32.

                 If one or more directory paths are specified, e4crypt will
                 try to set the policy of those directories to use the key
                 just added by the add_key command.  If a salt was
                 explicitly specified, then it will be used to derive the
                 encryption key of those directories.  Otherwise a
                 directory-specific default salt will be used.

          e4crypt get_policy path ...
                 Print the policy for the directories specified on the
                 command line.

          e4crypt new_session
                 Give the invoking process (typically a shell) a new
                 session keyring, discarding its old session keyring.

          e4crypt set_policy [ -p pad ] policy path ...
                 Sets the policy for the directories specified on the
                 command line.  All directories must be empty to set the
                 policy; if the directory already has a policy established,
                 e4crypt will validate that the policy matches what was
                 specified.  A policy is an encryption key identifier
                 consisting of 16 hexadecimal characters.


-----------------------------------------------------

::

          Written by Michael Halcrow <mhalcrow@google.com>, Ildar Muslukhov
          <muslukhovi@gmail.com>, and Theodore Ts'o <tytso@mit.edu>


---------------------------------------------------------

::

          keyctl(1), mke2fs(8), mount(8).

COLOPHON
---------------------------------------------------------

::

          This page is part of the e2fsprogs (utilities for ext2/3/4
          filesystems) project.  Information about the project can be found
          at ⟨http://e2fsprogs.sourceforge.net/⟩.  It is not known how to
          report bugs for this man page; if you know, please send a mail to
          man-pages@man7.org.  This page was obtained from the project's
          upstream Git repository
          ⟨git://git.kernel.org/pub/scm/fs/ext2/e2fsprogs.git⟩ on
          2021-08-27.  (At that time, the date of the most recent commit
          that was found in the repository was 2021-08-22.)  If you
          discover any rendering problems in this HTML version of the page,
          or you believe there is a better or more up-to-date source for
          the page, or you have corrections or improvements to the
          information in this COLOPHON (which is not part of the original
          manual page), send a mail to man-pages@man7.org

   E2fsprogs version 1.46.4       August 2021                    E4CRYPT(8)

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
