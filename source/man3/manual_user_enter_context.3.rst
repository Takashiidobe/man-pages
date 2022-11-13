.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

get_ordered_context_list(3) — Linux manual page
===============================================

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

   get_ordered_context_list(3)      SELinux     get_ordered_context_list(3)

NAME
-------------------------------------------------

::

          get_ordered_context_list, get_ordered_context_list_with_level,
          get_default_context, get_default_context_with_level,
          get_default_context_with_role,
          get_default_context_with_rolelevel, query_user_context,
          manual_user_enter_context, get_default_role - determine SELinux
          context(s) for user sessions


---------------------------------------------------------

::

          #include <selinux/selinux.h>
          #include <selinux/get_context_list.h>

          int get_ordered_context_list(const char *user, const char
          *fromcon, char ***list);

          int get_ordered_context_list_with_level(const char *user, const
          char *level, const char *fromcon, char ***list);

          int get_default_context(const char *user, const char *fromcon,
          char **newcon);

          int get_default_context_with_level(const char *user, const char
          *level, const char *fromcon, char **newcon);

          int get_default_context_with_role(const char *user, const char
          *role, const char *fromcon, char **newcon);

          int get_default_context_with_rolelevel(const char *user, const
          char *role, const char *level, const char *fromcon, char
          **newcon);

          int query_user_context(char **list, char **newcon);

          int manual_user_enter_context(const char *user, char **newcon);

          int get_default_type(const char *role, char **type);


---------------------------------------------------------------

::

          This family of functions can be used to obtain either a
          prioritized list of all reachable security contexts for a given
          SELinux user or a single default (highest priority) context for a
          given SELinux user for use by login-like programs.  These
          functions takes a SELinux user identity that must be defined in
          the SELinux policy as their input, not a Linux username.  Most
          callers should typically first call getseuserbyname(3) to look up
          the SELinux user identity and level for a given Linux username
          and then invoke one of get_ordered_context_list_with_level() or
          get_default_context_with_level() with the returned SELinux user
          and level as inputs.

          get_ordered_context_list() obtains the list of contexts for the
          specified SELinux user identity that are reachable from the
          specified fromcon context based on the global
          /etc/selinux/{SELINUXTYPE}/contexts/default_contexts file and the
          per-user /etc/selinux/{SELINUXTYPE}/contexts/users/<username>
          file if it exists.  The fromcon parameter may be NULL to indicate
          that the current context should be used.  The function returns
          the number of contexts in the list, or -1 upon errors.  The list
          must be freed using the freeconary(3) function.

          get_ordered_context_list_with_level() invokes the
          get_ordered_context_list() function and applies the specified
          level.

          get_default_context() is the same as get_ordered_context_list()
          but only returns a single context which has to be freed with
          freecon(3).

          get_default_context_with_level() invokes the
          get_default_context() function and applies the specified level.

          get_default_context_with_role() is the same as
          get_default_context() but only returns a context with the
          specified role, returning -1 if no such context is reachable for
          the user.

          get_default_context_with_rolelevel() invokes the
          get_default_context_with_role() function and applies the
          specified level.

          query_user_context() takes a list of contexts, queries the user
          via stdin/stdout as to which context they want, and returns a new
          context as selected by the user (which has to be freed with
          freecon(3)).

          manual_user_enter_context() allows the user to manually enter a
          context as a fallback if a list of authorized contexts could not
          be obtained. Caller must free via freecon(3).

          get_default_type() Get the default type (domain) for role and set
          type to refer to it, which has to be freed with free.


-----------------------------------------------------------------

::

          get_ordered_context_list() and
          get_ordered_context_list_with_level() return the number of
          contexts in the list upon success or -1 upon errors.  The other
          functions return 0 for success or -1 for errors.


---------------------------------------------------------

::

          selinux(8), freeconary(3), freecon(3), security_compute_av(3),
          getseuserbyname(3)

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

   russell@coker.com.au         1 January 2004  get_ordered_context_list(3)

--------------

Pages that refer to this page:
`getseuserbyname(3) <../man3/getseuserbyname.3.html>`__, 
`security_compute_av(3) <../man3/security_compute_av.3.html>`__, 
`default_contexts(5) <../man5/default_contexts.5.html>`__, 
`default_type(5) <../man5/default_type.5.html>`__, 
`failsafe_context(5) <../man5/failsafe_context.5.html>`__, 
`user_contexts(5) <../man5/user_contexts.5.html>`__

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
