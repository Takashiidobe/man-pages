.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

selinux_set_callback(3) — Linux manual page
===========================================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `RETURN VALUE <#RETURN_VALUE>`__  |                                   |
| \| `ERRORS <#ERRORS>`__ \|        |                                   |
| `AUTHOR <#AUTHOR>`__ \|           |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   selinux_set_callback(3) SELinux API documentationselinux_set_callback(3)

NAME
-------------------------------------------------

::

          selinux_set_callback - userspace SELinux callback facilities


---------------------------------------------------------

::

          #include <selinux/selinux.h>

          void selinux_set_callback(int type, union selinux_callback
          callback);


---------------------------------------------------------------

::

          selinux_set_callback() sets the callback indicated by type to the
          value of callback, which should be passed as a function pointer
          cast to type union selinux_callback.

          All callback functions should return a negative value with errno
          set appropriately on error.

          The available values for type are:

          SELINUX_CB_LOG
                 int (*func_log) (int type, const char *fmt, ...);

                 This callback is used for logging and should process the
                 printf(3) style fmt string and arguments as appropriate.
                 The type argument indicates the type of message and will
                 be set to one of the following:

                 SELINUX_ERROR

                 SELINUX_WARNING

                 SELINUX_INFO

                 SELINUX_AVC

                 SELINUX_POLICYLOAD

                 SELINUX_SETENFORCE

                 SELINUX_ERROR, SELINUX_WARNING, and SELINUX_INFO indicate
                 standard log severity levels and are not auditable
                 messages.

                 The SELINUX_AVC, SELINUX_POLICYLOAD, and
                 SELINUX_SETENFORCE message types can be audited with
                 AUDIT_USER_AVC, AUDIT_USER_MAC_POLICY_LOAD, and
                 AUDIT_USER_MAC_STATUS values from libaudit, respectively.
                 If they are not audited, SELINUX_AVC should be considered
                 equivalent to SELINUX_ERROR; similarly, SELINUX_POLICYLOAD
                 and SELINUX_SETENFORCE should be considered equivalent to
                 SELINUX_INFO.

          SELINUX_CB_AUDIT
                 int (*func_audit) (void *auditdata, security_class_t cls,
                                    char *msgbuf, size_t msgbufsize);

                 This callback is used for supplemental auditing in AVC
                 messages.  The auditdata and cls arguments are the values
                 passed to avc_has_perm(3).  A human-readable
                 interpretation should be printed to msgbuf using no more
                 than msgbufsize characters.

          SELINUX_CB_VALIDATE
                 int (*func_validate) (char **ctx);

                 This callback is used for context validation.  The
                 callback may optionally modify the input context by
                 setting the target of the ctx pointer to a new context.
                 In this case, the old value should be freed with
                 freecon(3).  The value of errno should be set to EINVAL to
                 indicate an invalid context.

          SELINUX_CB_SETENFORCE
                 int (*func_setenforce) (int enforcing);

                 This callback is invoked when the system enforcing state
                 changes.  The enforcing argument indicates the new value
                 and is set to 1 for enforcing mode, and 0 for permissive
                 mode.

          SELINUX_CB_POLICYLOAD
                 int (*func_policyload) (int seqno);

                 This callback is invoked when the system security policy
                 is reloaded.  The seqno argument is the current sequential
                 number of the policy generation in the system.


-----------------------------------------------------------------

::

          None.


-----------------------------------------------------

::

          None.


-----------------------------------------------------

::

          Eamon Walsh <ewalsh@tycho.nsa.gov>


---------------------------------------------------------

::

          selabel_open(3), avc_init(3), avc_netlink_open(3), selinux(8)

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

                                  20 Jun 2007       selinux_set_callback(3)

--------------

Pages that refer to this page:
`avc_has_perm(3) <../man3/avc_has_perm.3.html>`__, 
`avc_init(3) <../man3/avc_init.3.html>`__, 
`avc_netlink_loop(3) <../man3/avc_netlink_loop.3.html>`__, 
`avc_open(3) <../man3/avc_open.3.html>`__, 
`security_compute_av(3) <../man3/security_compute_av.3.html>`__, 
`selabel_lookup(3) <../man3/selabel_lookup.3.html>`__, 
`selabel_lookup_best_match(3) <../man3/selabel_lookup_best_match.3.html>`__, 
`selabel_open(3) <../man3/selabel_open.3.html>`__, 
`selabel_partial_match(3) <../man3/selabel_partial_match.3.html>`__, 
`selabel_stats(3) <../man3/selabel_stats.3.html>`__, 
`selinux_restorecon(3) <../man3/selinux_restorecon.3.html>`__, 
`selinux_restorecon_xattr(3) <../man3/selinux_restorecon_xattr.3.html>`__, 
`selinux_set_mapping(3) <../man3/selinux_set_mapping.3.html>`__, 
`selabel_db(5) <../man5/selabel_db.5.html>`__, 
`selabel_file(5) <../man5/selabel_file.5.html>`__, 
`selabel_media(5) <../man5/selabel_media.5.html>`__, 
`selabel_x(5) <../man5/selabel_x.5.html>`__

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
