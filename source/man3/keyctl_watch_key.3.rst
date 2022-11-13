.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

keyctl_watch_key(3) — Linux manual page
=======================================

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

   KEYCTL_GRANT_PERMISSION(3)ux Key Management CallsCTL_GRANT_PERMISSION(3)

NAME
-------------------------------------------------

::

          keyctl_watch_key - Watch for changes to a key


---------------------------------------------------------

::

          #include <keyutils.h>

          long keyctl_watch_key(key_serial_t key,
                                int watch_queue_fd
                                int watch_id);


---------------------------------------------------------------

::

          keyctl_watch_key() sets or removes a watch on key.

          watch_id specifies the ID for a watch that will be included in
          notification messages.  It can be between 0 and 255 to add a key;
          it should be -1 to remove a key.

          watch_queue_fd is a file descriptor attached to a watch_queue
          device instance.  Multiple openings of a device provide separate
          instances.  Each device instance can only have one watch on any
          particular key.

      Notification Record
          Key-specific notification messages that the kernel emits into the
          buffer have the following format:

              struct key_notification {
                   struct watch_notification watch;
                   __u32     key_id;
                   __u32     aux;
              };

          The watch.type field will be set to WATCH_TYPE_KEY_NOTIFY and the
          watch.subtype field will contain one of the following constants,
          indicating the event that occurred and the watch_id passed to
          keyctl_watch_key() will be placed in watch.info in the ID field.
          The following events are defined:

          NOTIFY_KEY_INSTANTIATED
                 This indicates that a watched key got instantiated or
                 negatively instantiated.  key_id indicates the key that
                 was instantiated and aux is unused.

          NOTIFY_KEY_UPDATED
                 This indicates that a watched key got updated or
                 instantiated by update.  key_id indicates the key that was
                 updated and aux is unused.

          NOTIFY_KEY_LINKED
                 This indicates that a key got linked into a watched
                 keyring.  key_id indicates the keyring that was modified
                 aux indicates the key that was added.

          NOTIFY_KEY_UNLINKED
                 This indicates that a key got unlinked from a watched
                 keyring.  key_id indicates the keyring that was modified
                 aux indicates the key that was removed.

          NOTIFY_KEY_CLEARED
                 This indicates that a watched keyring got cleared.  key_id
                 indicates the keyring that was cleared and aux is unused.

          NOTIFY_KEY_REVOKED
                 This indicates that a watched key got revoked.  key_id
                 indicates the key that was revoked and aux is unused.

          NOTIFY_KEY_INVALIDATED
                 This indicates that a watched key got invalidated.  key_id
                 indicates the key that was invalidated and aux is unused.

          NOTIFY_KEY_SETATTR
                 This indicates that a watched key had its attributes
                 (owner, group, permissions, timeout) modified.  key_id
                 indicates the key that was modified and aux is unused.

      Removal Notification
          When a watched key is garbage collected, all of its watches are
          automatically destroyed and a notification is delivered to each
          watcher.  This will normally be an extended notification of the
          form:

              struct watch_notification_removal {
                   struct watch_notification watch;
                   __u64     id;
              };

          The watch.type field will be set to WATCH_TYPE_META and the
          watch.subtype field will contain WATCH_META_REMOVAL_NOTIFICATION.
          If the extended notification is given, then the length will be 2
          units, otherwise it will be 1 and only the header will be
          present.

          The watch_id passed to keyctl_watch_key() will be placed in
          watch.info in the ID field.

          If the extension is present, id will be set to the ID of the
          destroyed key.


-----------------------------------------------------------------

::

          On success keyctl_watch_key() returns 0 .  On error, the value -1
          will be returned and errno will have been set to an appropriate
          error.


-----------------------------------------------------

::

          ENOKEY The specified key does not exist.

          EKEYEXPIRED
                 The specified key has expired.

          EKEYREVOKED
                 The specified key has been revoked.

          EACCES The named key exists, but does not grant view permission
                 to the calling process.

          EBUSY  The specified key already has a watch on it for that
                 device instance (add only).

          EBADSLT
                 The specified key doesn't have a watch on it (removal
                 only).


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

   Linux                          28 Aug 2019    KEYCTL_GRANT_PERMISSION(3)

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
