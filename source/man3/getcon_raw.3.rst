.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

getcon(3) — Linux manual page
=============================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `RETURN VALUE <#RETURN_VALUE>`__  |                                   |
| \| `NOTES <#NOTES>`__ \|          |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   getcon(3)               SELinux API documentation              getcon(3)

NAME
-------------------------------------------------

::

          getcon, getprevcon, getpidcon - get SELinux security context of a
          process

          freecon, freeconary - free memory associated with SELinux
          security contexts

          getpeercon - get security context of a peer socket

          setcon - set current security context of a process


---------------------------------------------------------

::

          #include <selinux/selinux.h>

          int getcon(char **context);

          int getcon_raw(char **context);

          int getprevcon(char **context);

          int getprevcon_raw(char **context);

          int getpidcon(pid_t pid, char **context);

          int getpidcon_raw(pid_t pid, char **context);

          int getpeercon(int fd, char **context);

          int getpeercon_raw(int fd, char **context);

          void freecon(char *con);

          void freeconary(char **con);

          int setcon(const char *context);

          int setcon_raw(const char *context);


---------------------------------------------------------------

::

          getcon()
                 retrieves the context of the current process, which must
                 be free'd with freecon().

          getprevcon()
                 same as getcon but gets the context before the last exec.

          getpidcon()
                 returns the process context for the specified PID, which
                 must be free'd with freecon().

          getpeercon()
                 retrieves the context of the peer socket, which must be
                 free'd with freecon().

          freecon()
                 frees the memory allocated for a security context.

                 If con is NULL, no operation is performed.

          freeconary()
                 frees the memory allocated for a context array.

                 If con is NULL, no operation is performed.

          setcon()
                 sets the current security context of the process to a new
                 value.  Note that use of this function requires that the
                 entire application be trusted to maintain any desired
                 separation between the old and new security contexts,
                 unlike exec-based transitions performed via setexeccon(3).
                 When possible, decompose your application and use
                 setexeccon(3) and execve(3) instead.

                 Since access to file descriptors is revalidated upon use
                 by SELinux, the new context must be explicitly authorized
                 in the policy to use the descriptors opened by the old
                 context if that is desired.  Otherwise, attempts by the
                 process to use any existing descriptors (including stdin,
                 stdout, and stderr) after performing the setcon() will
                 fail.

                 A multi-threaded application can perform a setcon() prior
                 to creating any child threads, in which case all of the
                 child threads will inherit the new context.  However,
                 prior to Linux 2.6.28, setcon() would fail if there are
                 any other threads running in the same process since this
                 would yield an inconsistency among the security contexts
                 of threads sharing the same memory space.  Since Linux
                 2.6.28, setcon() is permitted for threads within a multi-
                 threaded process if the new security context is bounded by
                 the old security context, where the bounded relation is
                 defined through typebounds statements in the policy and
                 guarantees that the new security context has a subset of
                 the permissions of the old security context.

                 If the process was being ptraced at the time of the
                 setcon() operation, ptrace permission will be revalidated
                 against the new context and the setcon() will fail if it
                 is not allowed by policy.

          *_raw()
                 getcon_raw(), getprevcon_raw(), getpidcon_raw(),
                 getpeercon_raw() and setcon_raw() behave identically to
                 their non-raw counterparts but do not perform context
                 translation.


-----------------------------------------------------------------

::

          On error -1 is returned with errno set.  On success 0 is
          returned.


---------------------------------------------------

::

          The retrieval functions might return success and set *context to
          NULL if and only if SELinux is not enabled.


---------------------------------------------------------

::

          selinux(8), setexeccon(3)

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

   russell@coker.com.au        21 December 2011                   getcon(3)

--------------

Pages that refer to this page:
`avc_context_to_sid(3) <../man3/avc_context_to_sid.3.html>`__, 
`getexeccon(3) <../man3/getexeccon.3.html>`__, 
`getfilecon(3) <../man3/getfilecon.3.html>`__, 
`getfscreatecon(3) <../man3/getfscreatecon.3.html>`__, 
`getkeycreatecon(3) <../man3/getkeycreatecon.3.html>`__, 
`get_ordered_context_list(3) <../man3/get_ordered_context_list.3.html>`__, 
`getsockcreatecon(3) <../man3/getsockcreatecon.3.html>`__, 
`matchmediacon(3) <../man3/matchmediacon.3.html>`__, 
`matchpathcon(3) <../man3/matchpathcon.3.html>`__, 
`matchpathcon_checkmatches(3) <../man3/matchpathcon_checkmatches.3.html>`__, 
`security_class_to_string(3) <../man3/security_class_to_string.3.html>`__, 
`security_compute_av(3) <../man3/security_compute_av.3.html>`__, 
`selabel_lookup(3) <../man3/selabel_lookup.3.html>`__, 
`selabel_lookup_best_match(3) <../man3/selabel_lookup_best_match.3.html>`__, 
`selinux_lsetfilecon_default(3) <../man3/selinux_lsetfilecon_default.3.html>`__, 
`selinux_set_callback(3) <../man3/selinux_set_callback.3.html>`__, 
`setfilecon(3) <../man3/setfilecon.3.html>`__, 
`set_matchpathcon_flags(3) <../man3/set_matchpathcon_flags.3.html>`__, 
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
