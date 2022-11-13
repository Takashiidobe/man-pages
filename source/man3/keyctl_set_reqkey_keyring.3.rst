.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

keyctl_set_reqkey_keyring(3) — Linux manual page
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

   KEYCTL_SET_REQKEY_KEYRING(3) Key Management CallsL_SET_REQKEY_KEYRING(3)

NAME
-------------------------------------------------

::

          keyctl_set_reqkey_keyring - set the implicit destination keyring


---------------------------------------------------------

::

          #include <keyutils.h>

          long keyctl_set_reqkey_keyring(int reqkey_defl);


---------------------------------------------------------------

::

          keyctl_set_reqkey_keyring() sets the default destination for
          implicit key requests for the current thread and returns the old
          setting.

          After this operation has been issued, keys acquired by implicit
          key requests, such as might be performed by open() on an AFS or
          NFS filesystem, will be linked by default to the specified
          keyring by this function.

          The valid values of reqkey_defl are:

          KEY_REQKEY_DEFL_NO_CHANGE
                 This makes no change to the current setting.

          KEY_REQKEY_DEFL_THREAD_KEYRING
                 This makes the thread-specific keyring the default
                 destination.

          KEY_REQKEY_DEFL_PROCESS_KEYRING
                 This makes the process-specific keyring the default
                 destination.

          KEY_REQKEY_DEFL_SESSION_KEYRING
                 This makes the session keyring the default destination.

          KEY_REQKEY_DEFL_USER_KEYRING
                 This makes the UID-specific keyring the default
                 destination.

          KEY_REQKEY_DEFL_USER_SESSION_KEYRING
                 This makes the UID-specific session keyring the default
                 destination.

          KEY_REQKEY_DEFL_DEFAULT
                 This selects the default behaviour which is to use the
                 thread-specific keyring if there is one, otherwise the
                 process-specific keyring if there is one, otherwise the
                 session keyring if there is one, otherwise the UID-
                 specific session keyring.

          This setting is inherited across fork() and exec().


-----------------------------------------------------------------

::

          On success keyctl_set_reqkey_keyring() returns the serial number
          of the keyring which was the previous default for the current
          thread.  On error, the value -1 will be returned and errno will
          have been set to an appropriate error.


-----------------------------------------------------

::

          EINVAL The value of reqkey_defl is invalid.


-------------------------------------------------------

::

          This is a library function that can be found in libkeyutils.
          When linking, -lkeyutils should be specified to the linker.


---------------------------------------------------------

::

          keyctl(1), add_key(2), keyctl(2), request_key(2), keyctl(3),
          keyutils(7), keyrings(7), request-key(8)

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

   Linux                          4 May 2006   KEYCTL_SET_REQKEY_KEYRING(3)

--------------

Pages that refer to this page: `keyctl(2) <../man2/keyctl.2.html>`__, 
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
