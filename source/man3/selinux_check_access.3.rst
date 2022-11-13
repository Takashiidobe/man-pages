.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

security_compute_av(3) — Linux manual page
==========================================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `RETURN VALUE <#RETURN_VALUE>`__  |                                   |
| \| `SEE ALSO <#SEE_ALSO>`__ \|    |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   security_compute_av(3)  SELinux API documentation security_compute_av(3)

NAME
-------------------------------------------------

::

          security_compute_av, security_compute_av_flags,
          security_compute_create, security_compute_create_name,
          security_compute_relabel, security_compute_member,
          security_compute_user, security_validatetrans,
          security_get_initial_context - query the SELinux policy database
          in the kernel


---------------------------------------------------------

::

          #include <selinux/selinux.h>

          int security_compute_av(char *scon, char *tcon, security_class_t
          tclass, access_vector_t requested, struct av_decision *avd);

          int security_compute_av_raw(char *scon, char *tcon,
          security_class_t tclass, access_vector_t requested, struct
          av_decision *avd);

          int security_compute_av_flags(char *scon, char *tcon,
          security_class_t tclass, access_vector_t requested, struct
          av_decision *avd);

          int security_compute_av_flags_raw(char *scon, char *tcon,
          security_class_t tclass, access_vector_t requested, struct
          av_decision *avd);

          int security_compute_create(char *scon, char *tcon,
          security_class_t tclass, char **newcon);

          int security_compute_create_raw(char *scon, char *tcon,
          security_class_t tclass, char **newcon);

          int security_compute_create_name(char *scon, char *tcon,
          security_class_t tclass, const char *objname, char **newcon);

          int security_compute_create_name_raw(char *scon, char *tcon,
          security_class_t tclass, const char *objname, char **newcon);

          int security_compute_relabel(char *scon, char *tcon,
          security_class_t tclass, char **newcon);

          int security_compute_relabel_raw(char *scon, char *tcon,
          security_class_t tclass, char **newcon);

          int security_compute_member(char *scon, char *tcon,
          security_class_t tclass, char **newcon);

          int security_compute_member_raw(char *scon, char *tcon,
          security_class_t tclass, char **newcon);

          int security_compute_user(char *scon, const char *username, char
          ***con);

          int security_compute_user_raw(char *scon, const char *username,
          char ***con);

          int security_validatetrans(char *scon, const char *tcon,
          security_class_t tclass, char *newcon);

          int security_validatetrans_raw(char *scon, const char *tcon,
          security_class_t tclass, char *newcon);

          int security_get_initial_context(const char *name, char **con);

          int security_get_initial_context_raw(const char *name, char
          **con);

          int selinux_check_access(const char *scon, const char *tcon,
          const char *class, const char *perm, void *auditdata);

          int selinux_check_passwd_access(access_vector_t requested);

          int checkPasswdAccess(access_vector_t requested);


---------------------------------------------------------------

::

          This family of functions is used to obtain policy decisions from
          the SELinux kernel security server (policy engine).  In general,
          direct use of security_compute_av() and its variant interfaces is
          discouraged in favor of using selinux_check_access() since the
          latter automatically handles the dynamic mapping of class and
          permission names to their policy values, initialization and use
          of the Access Vector Cache (AVC), and proper handling of per-
          domain and global permissive mode and allow_unknown.

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

          security_compute_av() queries whether the policy permits the
          source context scon to access the target context tcon via class
          tclass with the requested access vector.  The decision is
          returned in avd.

          security_compute_av_flags() is identical to security_compute_av
          but additionally sets the flags field of avd.  Currently one flag
          is supported: SELINUX_AVD_FLAGS_PERMISSIVE, which indicates the
          decision is computed on a permissive domain.

          security_compute_create() is used to compute a context to use for
          labeling a new object in a particular class based on a SID pair.

          security_compute_create_name() is identical to
          security_compute_create() but also takes name of the new object
          in creation as an argument.  When TYPE_TRANSITION rule on the
          given class and a SID pair has object name extension, we shall be
          able to obtain a correct newcon according to the security policy.
          Note that this interface is only supported on the linux 2.6.40 or
          later.  In the older kernel, the object name will be simply
          ignored.

          security_compute_relabel() is used to compute the new context to
          use when relabeling an object, it is used in the pam_selinux.so
          source and the newrole source to determine the correct label for
          the tty at login time, but can be used for other things.

          security_compute_member() is used to compute the context to use
          when labeling a polyinstantiated object instance.

          security_compute_user() is used to determine the set of user
          contexts that can be reached from a source context. This function
          is deprecated; use get_ordered_context_list(3) instead.

          security_validatetrans() is used to determine if a transition
          from scon to newcon using tcon as the object is valid for object
          class tclass. This checks against the mlsvalidatetrans and
          validatetrans constraints in the loaded policy. Returns 0 if
          allowed, and -1 if an error occurred with errno set.

          security_get_initial_context() is used to get the context of a
          kernel initial security identifier specified by name

          security_compute_av_raw(), security_compute_av_flags_raw(),
          security_compute_create_raw(),
          security_compute_create_name_raw(),
          security_compute_relabel_raw(), security_compute_member_raw(),
          security_compute_user_raw() security_validatetrans_raw() and
          security_get_initial_context_raw() behave identically to their
          non-raw counterparts but do not perform context translation.

          selinux_check_access() is used to check if the source context has
          the access permission for the specified class on the target
          context.

          selinux_check_passwd_access() is used to check for a permission
          in the passwd class.  selinux_check_passwd_access() uses
          getprevcon(3) for the source and target security contexts.

          checkPasswdAccess() is a deprecated alias of the
          selinux_check_passwd_access() function.


-----------------------------------------------------------------

::

          Returns zero on success or -1 on error.


---------------------------------------------------------

::

          string_to_security_class(3), string_to_av_perm(3),
          selinux_set_callback(3), selinux_set_mapping(3), getprevcon(3),
          get_ordered_context_list(3), selinux(8)

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

   russell@coker.com.au         1 January 2004       security_compute_av(3)

--------------

Pages that refer to this page:
`avc_add_callback(3) <../man3/avc_add_callback.3.html>`__, 
`avc_compute_create(3) <../man3/avc_compute_create.3.html>`__, 
`avc_has_perm(3) <../man3/avc_has_perm.3.html>`__, 
`avc_init(3) <../man3/avc_init.3.html>`__, 
`avc_open(3) <../man3/avc_open.3.html>`__, 
`get_ordered_context_list(3) <../man3/get_ordered_context_list.3.html>`__, 
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
