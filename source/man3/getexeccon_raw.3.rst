.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

getexeccon(3) — Linux manual page
=================================

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

   getexeccon(3)           SELinux API documentation          getexeccon(3)

NAME
-------------------------------------------------

::

          getexeccon, setexeccon - get or set the SELinux security context
          used for executing a new process

          rpm_execcon - run a helper for rpm in an appropriate security
          context


---------------------------------------------------------

::

          #include <selinux/selinux.h>

          int getexeccon(char **context);

          int getexeccon_raw(char **context);

          int setexeccon(char *context);

          int setexeccon_raw(char *context);

          int setexecfilecon(const char *filename, const char
          *fallback_type);

          int rpm_execcon(unsigned int verified, const char *filename, char
          *const argv[] , char *const envp[]);


---------------------------------------------------------------

::

          getexeccon() retrieves the context used for executing a new
          process.  This returned context should be freed with freecon(3)
          if non-NULL.  getexeccon() sets *context to NULL if no exec
          context has been explicitly set by the program (i.e. using the
          default policy behavior).

          setexeccon() sets the context used for the next execve(2) call.
          NULL can be passed to setexeccon() to reset to the default policy
          behavior.  The exec context is automatically reset after the next
          execve(2), so a program doesn't need to explicitly sanitize it
          upon startup.

          setexeccon() can be applied prior to library functions that
          internally perform an execve(2), e.g.  execl*(3), execv*(3),
          popen(3), in order to set an exec context for that operation.

          getexeccon_raw() and setexeccon_raw() behave identically to their
          non-raw counterparts but do not perform context translation.

          Note: Signal handlers that perform an execve(2) must take care to
          save, reset, and restore the exec context to avoid unexpected
          behavior.

          setexecfilecon() sets the context used for the next execve(2)
          call, based on the policy for the filename, and falling back to a
          new context with a fallback_type in case there is no transition.

          rpm_execcon() is deprecated; please use setexecfilecon() in
          conjunction with execve(2) in all new code. This function runs a
          helper for rpm in an appropriate security context.  The verified
          parameter should contain the return code from the signature
          verification (0 == ok, 1 == notfound, 2 == verifyfail, 3 ==
          nottrusted, 4 == nokey), although this information is not yet
          used by the function.  The function determines the proper
          security context for the helper based on policy, sets the exec
          context accordingly, and then executes the specified filename
          with the provided argument and environment arrays.


-----------------------------------------------------------------

::

          On error -1 is returned.

          On success getexeccon(), setexeccon() and setexecfilecon() return
          0.  rpm_execcon() only returns upon errors, as it calls
          execve(2).


---------------------------------------------------------

::

          selinux(8), freecon(3), getcon(3)

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

   russell@coker.com.au         1 January 2004                getexeccon(3)

--------------

Pages that refer to this page: `getcon(3) <../man3/getcon.3.html>`__, 
`getfscreatecon(3) <../man3/getfscreatecon.3.html>`__, 
`getkeycreatecon(3) <../man3/getkeycreatecon.3.html>`__, 
`systemd.exec(5) <../man5/systemd.exec.5.html>`__

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
