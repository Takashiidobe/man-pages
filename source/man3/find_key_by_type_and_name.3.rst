.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

find_key_by_type_and_name(3) — Linux manual page
================================================

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

   FIND_KEY_BY_TYPE_AND_NAME(3)ux Key Utility Calls_KEY_BY_TYPE_AND_NAME(3)

NAME
-------------------------------------------------

::

          find_key_by_type_and_name - find a key by type and name


---------------------------------------------------------

::

          #include <keyutils.h>

          key_serial_t find_key_by_type_and_name(const char *type,
              const char *description, key_serial_t destringid);


---------------------------------------------------------------

::

          find_key_by_type_and_name() searches for a key with the given
          type and exact description, firstly in the thread, process and
          session keyrings to which a process is subscribed and secondly in
          /proc/keys.

          If a key is found, and destringid is not 0 and specifies a
          keyring, then the found key will be linked into it.


-----------------------------------------------------------------

::

          The function returns the ID of the key if a key was found or -1
          otherwise.


-----------------------------------------------------

::

          ENOKEY No key was found or the keyring specified is invalid.

          EKEYEXPIRED
                 The key or keyring have expired.

          EKEYREVOKED
                 The key or keyring have been revoked.

          EACCES The key is not accessible or keyring exists, but is not
                 writable by the calling process.


-------------------------------------------------------

::

          When linking, -lkeyutils should be specified to the linker.


---------------------------------------------------------

::

          request_key(2), keyctl(3), keyrings(7)

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

   Linux                          10 Sep 2013  FIND_KEY_BY_TYPE_AND_NAME(3)

--------------

Pages that refer to this page: `keyctl(3) <../man3/keyctl.3.html>`__

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
