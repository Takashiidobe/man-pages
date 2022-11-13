.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

avc_has_perm(3) — Linux manual page
===================================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `ENTRY                            |                                   |
| REFERENCES <#ENTRY_REFERENCES>`__ |                                   |
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

   avc_has_perm(3)         SELinux API documentation        avc_has_perm(3)

NAME
-------------------------------------------------

::

          avc_has_perm, avc_has_perm_noaudit, avc_audit, avc_entry_ref_init
          - obtain and audit SELinux access decisions


---------------------------------------------------------

::

          #include <selinux/selinux.h>
          #include <selinux/avc.h>

          void avc_entry_ref_init(struct avc_entry_ref *aeref);

          int avc_has_perm(security_id_t ssid, security_id_t tsid,
                           security_class_t tclass, access_vector_t
                           requested,
                           struct avc_entry_ref *aeref, void *auditdata);

          int avc_has_perm_noaudit(security_id_t ssid, security_id_t tsid,
                           security_class_t tclass, access_vector_t
                           requested,
                           struct avc_entry_ref *aeref, struct av_decision
                           *avd);

          void avc_audit(security_id_t ssid, security_id_t tsid,
                         security_class_t tclass, access_vector_t
                         requested,
                         struct av_decision *avd, int result, void
                         *auditdata);


---------------------------------------------------------------

::

          Direct use of these functions is generally discouraged in favor
          of the higher level interface selinux_check_access(3) since the
          latter automatically handles the dynamic mapping of class and
          permission names to their policy values and proper handling of
          allow_unknown.

          When using any of the functions that take policy integer values
          for classes or permissions as inputs, use
          string_to_security_class(3) and string_to_av_perm(3) to map the
          class and permission names to their policy values.  These values
          may change across a policy reload, so they should be re-acquired
          on every use or using a SELINUX_CB_POLICYLOAD callback set via
          selinux_set_callback(3).

          An alternative approach is to use selinux_set_mapping(3) to
          create a mapping from class and permission index values used by
          the application to the policy values, thereby allowing the
          application to pass its own fixed constants for the classes and
          permissions to these functions and internally mapping them on
          demand.  However, this also requires setting up a callback as
          above to address policy reloads.

          avc_entry_ref_init() initializes an avc_entry_ref structure; see
          ENTRY REFERENCES below.  This function may be implemented as a
          macro.

          avc_has_perm() checks whether the requested permissions are
          granted for subject SID ssid and target SID tsid, interpreting
          the permissions based on tclass and updating aeref, if non-NULL,
          to refer to a cache entry with the resulting decision.  The
          granting or denial of permissions is audited in accordance with
          the policy.  The auditdata parameter is for supplemental
          auditing; see avc_audit() below.

          avc_has_perm_noaudit() behaves as avc_has_perm() without
          producing an audit message.  The access decision is returned in
          avd and can be passed to avc_audit() explicitly.

          avc_audit() produces an audit message for the access query
          represented by ssid, tsid, tclass, and requested, with a decision
          represented by avd.  Pass the value returned by
          avc_has_perm_noaudit() as result.  The auditdata parameter is
          passed to the user-supplied func_audit callback and can be used
          to add supplemental information to the audit message; see
          avc_init(3).


-------------------------------------------------------------------------

::

          Entry references can be used to speed cache performance for
          repeated queries on the same subject and target.  The userspace
          AVC will check the aeref argument, if supplied, before searching
          the cache on a permission query.  After a query is performed,
          aeref will be updated to reference the cache entry for that
          query.  A subsequent query on the same subject and target will
          then have the decision at hand without having to walk the cache.

          After declaring an avc_entry_ref structure, use
          avc_entry_ref_init() to initialize it before passing it to
          avc_has_perm() or avc_has_perm_noaudit() for the first time.
          Using an uninitialized structure will produce undefined behavior.


-----------------------------------------------------------------

::

          If requested permissions are granted, zero is returned.  If
          requested permissions are denied or an error occurred, -1 is
          returned and errno is set appropriately.

          In permissive mode, zero will be returned and errno unchanged
          even if permissions were denied.  avc_has_perm() will still
          produce an audit message in this case.


-----------------------------------------------------

::

          EACCES A requested permission was denied.

          EINVAL The tclass and/or the security contexts referenced by ssid
                 and tsid are not recognized by the currently loaded
                 policy.

          ENOMEM An attempt to allocate memory failed.


---------------------------------------------------

::

          Internal errors encountered by the userspace AVC may cause
          certain values of errno to be returned unexpectedly.  For
          example, netlink socket errors may produce EACCES or EINVAL.
          Make sure that userspace object managers are granted appropriate
          access to netlink by the policy.


-----------------------------------------------------

::

          Originally Eamon Walsh.  Updated by Stephen Smalley
          <sds@tycho.nsa.gov>


---------------------------------------------------------

::

          selinux_check_access(3), string_to_security_class(3),
          string_to_av_perm(3), selinux_set_callback(3),
          selinux_set_mapping(3), avc_init(3), avc_context_to_sid(3),
          avc_cache_stats(3), avc_add_callback(3), security_compute_av(3),
          selinux(8)

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

                                  27 May 2004               avc_has_perm(3)

--------------

Pages that refer to this page:
`avc_add_callback(3) <../man3/avc_add_callback.3.html>`__, 
`avc_cache_stats(3) <../man3/avc_cache_stats.3.html>`__, 
`avc_context_to_sid(3) <../man3/avc_context_to_sid.3.html>`__, 
`avc_init(3) <../man3/avc_init.3.html>`__, 
`avc_netlink_loop(3) <../man3/avc_netlink_loop.3.html>`__, 
`avc_open(3) <../man3/avc_open.3.html>`__, 
`selinux_set_callback(3) <../man3/selinux_set_callback.3.html>`__, 
`selinux_set_mapping(3) <../man3/selinux_set_mapping.3.html>`__

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
