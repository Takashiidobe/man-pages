.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

avc_add_callback(3) — Linux manual page
=======================================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `SECU                             |                                   |
| RITY EVENTS <#SECURITY_EVENTS>`__ |                                   |
| \|                                |                                   |
| `RETURN VALUE <#RETURN_VALUE>`__  |                                   |
| \| `ERRORS <#ERRORS>`__ \|        |                                   |
| `NOTES <#NOTES>`__ \|             |                                   |
| `AUTHOR <#AUTHOR>`__ \|           |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   avc_add_callback(3)     SELinux API documentation    avc_add_callback(3)

NAME
-------------------------------------------------

::

          avc_add_callback - additional event notification for SELinux
          userspace object managers


---------------------------------------------------------

::

          #include <selinux/selinux.h>
          #include <selinux/avc.h>

          int avc_add_callback(int (*callback)(uint32_t event,
                                               security_id_t ssid,
                                               security_id_t tsid,
                                               security_class_t tclass,
                                               access_vector_t perms,
                                               access_vector_t
                                               *out_retained),
                               uint32_t events, security_id_t ssid,
                               security_id_t tsid, security_class_t tclass,
                               access_vector_t perms);


---------------------------------------------------------------

::

          avc_add_callback() is used to register callback functions on
          security events.  The purpose of this functionality is to allow
          userspace object managers to take additional action when a policy
          change, usually a policy reload, causes permissions to be granted
          or revoked.

          events is the bitwise-or of security events on which to register
          the callback; see SECURITY EVENTS below.

          ssid, tsid, tclass, and perms specify the source and target
          SID's, target class, and specific permissions that the callback
          wishes to monitor.  The special symbol SECSID_WILD may be passed
          as the source or target and will cause any SID to match.

          callback is the callback function provided by the userspace
          object manager.  The event argument indicates the security event
          which occurred; the remaining arguments are interpreted according
          to the event as described below.  The return value of the
          callback should be zero on success, -1 on error with errno set
          appropriately (but see RETURN VALUE below).


-----------------------------------------------------------------------

::

          In all cases below, ssid and/or tsid may be set to SECSID_WILD,
          indicating that the change applies to all source and/or target
          SID's.  Unless otherwise indicated, the out_retained parameter is
          unused.

          AVC_CALLBACK_GRANT
                 Previously denied permissions are now granted for ssid,
                 tsid with respect to tclass.  perms indicates the
                 permissions to grant.

          AVC_CALLBACK_TRY_REVOKE
                 Previously granted permissions are now conditionally
                 revoked for ssid, tsid with respect to tclass.  perms
                 indicates the permissions to revoke.  The callback should
                 set out_retained to the subset of perms which are retained
                 as migrated permissions.  Note that out_retained is
                 ignored if the callback returns -1.

          AVC_CALLBACK_REVOKE
                 Previously granted permissions are now unconditionally
                 revoked for ssid, tsid with respect to tclass.  perms
                 indicates the permissions to revoke.

          AVC_CALLBACK_RESET
                 Indicates that the cache was flushed.  The SID, class, and
                 permission arguments are unused and are set to NULL.

          AVC_CALLBACK_AUDITALLOW_ENABLE
                 The permissions given by perms should now be audited when
                 granted for ssid, tsid with respect to tclass.

          AVC_CALLBACK_AUDITALLOW_DISABLE
                 The permissions given by perms should no longer be audited
                 when granted for ssid, tsid with respect to tclass.

          AVC_CALLBACK_AUDITDENY_ENABLE
                 The permissions given by perms should now be audited when
                 denied for ssid, tsid with respect to tclass.

          AVC_CALLBACK_AUDITDENY_DISABLE
                 The permissions given by perms should no longer be audited
                 when denied for ssid, tsid with respect to tclass.


-----------------------------------------------------------------

::

          On success, avc_add_callback() returns zero.  On error, -1 is
          returned and errno is set appropriately.

          A return value of -1 from a callback is interpreted as a failed
          policy operation.  If such a return value is encountered, all
          remaining callbacks registered on the event are called.  In
          threaded mode, the netlink handler thread may then terminate and
          cause the userspace AVC to return EINVAL on all further
          permission checks until avc_destroy(3) is called.  In non-
          threaded mode, the permission check on which the error occurred
          will return -1 and the value of errno encountered to the caller.
          In both cases, a log message is produced and the kernel may be
          notified of the error.


-----------------------------------------------------

::

          ENOMEM An attempt to allocate memory failed.


---------------------------------------------------

::

          If the userspace AVC is running in threaded mode, callbacks
          registered via avc_add_callback() may be executed in the context
          of the netlink handler thread.  This will likely introduce
          synchronization issues requiring the use of locks.  See
          avc_init(3).

          Support for dynamic revocation and retained permissions is mostly
          unimplemented in the SELinux kernel module.  The only security
          event that currently gets exercised is AVC_CALLBACK_RESET.


-----------------------------------------------------

::

          Eamon Walsh <ewalsh@tycho.nsa.gov>


---------------------------------------------------------

::

          avc_init(3), avc_has_perm(3), avc_context_to_sid(3),
          avc_cache_stats(3), security_compute_av(3) selinux(8)

COLOPHON
---------------------------------------------------------

::

          This page is part of the selinux (Security-Enhanced Linux user-
          space libraries and tools) project.  Information about the
          project can be found at 
          ⟨https://github.com/SELinuxProject/selinux/wiki⟩.  If you have a
          bug report for this manual page, see
          ⟨https://github.com/SELinuxProject/selinux/wiki/Contributing⟩.
          This page was obtained from the project's upstream Git repository
          ⟨https://github.com/SELinuxProject/selinux⟩ on 2021-08-27.  (At
          that time, the date of the most recent commit that was found in
          the repository was 2021-08-23.)  If you discover any rendering
          problems in this HTML version of the page, or you believe there
          is a better or more up-to-date source for the page, or you have
          corrections or improvements to the information in this COLOPHON
          (which is not part of the original manual page), send a mail to
          man-pages@man7.org

                                  9 June 2004           avc_add_callback(3)

--------------

Pages that refer to this page:
`avc_cache_stats(3) <../man3/avc_cache_stats.3.html>`__, 
`avc_context_to_sid(3) <../man3/avc_context_to_sid.3.html>`__, 
`avc_has_perm(3) <../man3/avc_has_perm.3.html>`__, 
`avc_open(3) <../man3/avc_open.3.html>`__

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
