.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

cap_get_proc(3) — Linux manual page
===================================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `RETURN VALUE <#RETURN_VALUE>`__  |                                   |
| \|                                |                                   |
| `                                 |                                   |
| CONFORMING TO <#CONFORMING_TO>`__ |                                   |
| \| `NOTES <#NOTES>`__ \|          |                                   |
| `EXAMPLE <#EXAMPLE>`__ \|         |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   CAP_GET_PROC(3)         Linux Programmer's Manual        CAP_GET_PROC(3)

NAME
-------------------------------------------------

::

          cap_get_proc, cap_set_proc, capgetp, cap_get_bound,
          cap_drop_bound, cap_get_ambient, cap_set_ambient,
          cap_reset_ambient, cap_get_secbits, cap_set_secbits,
          cap_get_mode, cap_set_mode, cap_mode_name, cap_get_pid,
          cap_setuid, cap_prctl, cap_prctlw, cap_setgroups - capability
          manipulation on processes


---------------------------------------------------------

::

          #include <sys/capability.h>

          cap_t cap_get_proc(void);
          int cap_set_proc(cap_t cap_p);

          int cap_get_bound(cap_value_t cap);
          CAP_IS_SUPPORTED(cap_value_t cap);

          int cap_drop_bound(cap_value_t cap);
          int cap_get_ambient(cap_value_t cap);
          int cap_set_ambient(cap_value_t cap, cap_flag_value_t value);
          int cap_reset_ambient(void);
          CAP_AMBIENT_SUPPORTED();

          unsigned cap_get_secbits(void);
          int cap_set_secbits(unsigned bits);
          cap_mode_t cap_get_mode(void);
          const char *cap_mode_name(cap_mode_t mode);
          int cap_prctl(long int pr_cmd, long int arg1, long int arg2,
                     long int arg3, long int arg4, long int arg5);
          int cap_prctlw(long int pr_cmd, long int arg1, long int arg2,
                      long int arg3, long int arg4, long int arg5);
          int cap_set_mode(cap_mode_t mode);

          #include <sys/types.h>

          cap_t cap_get_pid(pid_t pid);
          int cap_setuid(uid_t uid);
          int cap_setgroups(gid_t gid, size_t ngroups, const gid_t groups);

          Link with -lcap.


---------------------------------------------------------------

::

          cap_get_proc() allocates a capability state in working storage,
          sets its state to that of the calling process, and returns a
          pointer to this newly created capability state.  The caller
          should free any releasable memory, when the capability state in
          working storage is no longer required, by calling cap_free() with
          the cap_t as an argument.

          cap_set_proc() sets the values for all capability flags for all
          capabilities to the capability state identified by cap_p.  The
          new capability state of the process will be completely determined
          by the contents of cap_p upon successful return from this
          function.  If any flag in cap_p is set for any capability not
          currently permitted for the calling process, the function will
          fail, and the capability state of the process will remain
          unchanged.

          cap_get_pid() returns cap_t, see cap_init(3), with the process
          capabilities of the process indicated by pid.  (If pid is 0, then
          the calling process's capabilities are returned.)  This
          information can also be obtained from the /proc/<pid>/status
          file.

          cap_get_bound() with a cap as an argument returns the current
          value of this bounding set capability flag in effect for the
          calling process. This operation is unprivileged. Note, a macro
          function CAP_IS_SUPPORTED(cap_value_t cap) is provided that
          evaluates to true (1) if the system supports the specified
          capability, cap.  If the system does not support the capability,
          this function returns 0. This macro works by testing for an error
          condition with cap_get_bound().

          cap_drop_bound() can be used to lower the specified bounding set
          capability, cap.  To complete successfully, the prevailing
          effective capability set must have a raised CAP_SETPCAP.

          cap_get_ambient() returns the prevailing value of the specified
          ambient capability, or -1 if the capability is not supported by
          the running kernel.  A macro CAP_AMBIENT_SUPPORTED() uses this
          function to determine if ambient capabilities are supported by
          the kernel.

          cap_set_ambient() sets the specified ambient capability to a
          specific value. To complete successfully, the prevailing
          effective capability set must have a raised CAP_SETPCAP.
          Further, to raise a specific ambient capability the inheritable
          and permitted sets of the calling process must contain the
          specified capability, and raised ambient bits will only be
          retained as long as this remains true.

          cap_reset_ambient() resets all of the ambient capabilities for
          the calling process to their lowered value. To complete
          successfully, the prevailing effective capability set must have a
          raised CAP_SETPCAP.  Note, the ambient set is intended to operate
          in a legacy environment where the application has limited
          awareness of capabilities in general. Executing a file with
          associated filesystem capabilities, the kernel will implicitly
          reset the ambient set of the process. Also, changes to the
          inheritable set by the program code without explicitly fixing up
          the ambient set can also drop ambient bits.

          cap_get_secbits() returns the securebits of the calling process.
          These bits affect the way in which the calling process implements
          things like setuid-root fixup and ambient capabilities.

          cap_set_secbits() attempts to modify the securebits of the
          calling process. Note CAP_SETPCAP must be in the effective
          capability set for this to be effective. Some settings lock the
          sub-states of the securebits, so attempts to set values may be
          denied by the kernel even when the CAP_SETPCAP capability is
          raised.

          To help manage the complexity of the securebits, libcap provides
          a combined securebit and capability set concept called a libcap
          mode.  cap_get_mode() attempts to summarize the prevailing
          security environment in the form of a numerical cap_mode_t value.
          A text representation of the mode can be obtained via the
          cap_mode_name() function. The vast majority of combinations of
          these values are not well defined in terms of a libcap mode, and
          for these states cap_get_mode() returns (cap_mode_t)0 which
          cap_get_name() identifies as ``UNCERTAIN''.  Supported modes are:
          CAP_MODE_NOPRIV, CAP_MODE_PURE1E_INIT and CAP_MODE_PURE1E.

          cap_prctl() can be used to read state via the prctl() system
          call.

          cap_prctlw() can be used to write state via the prctl() system
          call.

          cap_set_mode() can be used to set the desired mode. The permitted
          capability CAP_SETPCAP is required for this function to succeed.

          cap_setuid() is a convenience function for the setuid(2) system
          call. Where cap_setuid() arranges for the right effective
          capability to be raised in order to perform the system call, and
          also arranges to preserve the availability of permitted
          capabilities after the uid has changed. Following this call all
          effective capabilities are lowered.

          cap_setgroups() is a convenience function for performing both
          setgid(2) and setgroups(2) calls in one call. The cap_setgroups()
          call raises the right effective capability for the duration of
          the call, and empties the effective capability set before
          returning.


-----------------------------------------------------------------

::

          The functions cap_get_proc() and cap_get_pid() return a non-NULL
          value on success, and NULL on failure.

          The function cap_get_bound() returns -1 if the requested
          capability is unknown, otherwise the return value reflects the
          current state of that capability in the prevailing bounding set.
          Note, a macro function,

          The all of the setting functions such as cap_set_proc() and
          cap_drop_bound() return zero for success, and -1 on failure.

          On failure, errno is set to EINVAL, EPERM, or ENOMEM.


-------------------------------------------------------------------

::

          cap_set_proc() and cap_get_proc() are specified in the withdrawn
          POSIX.1e draft specification.  cap_get_pid() is a Linux
          extension.


---------------------------------------------------

::

          Neither glibc, nor the Linux kernel honors POSIX semantics for
          setting capabilities and securebits in the presence of pthreads.
          That is, changing capability sets, by default, only affect the
          running thread. To be meaningfully secure, however, the
          capability sets should be mirrored by all threads within a common
          program because threads are not memory isolated. As a workaround
          for this, libcap is packaged with a separate POSIX semantics
          system call library: libpsx.  If your program uses POSIX threads,
          to achieve meaningful POSIX semantics capability manipulation,
          you should link your program with:

          ld ... -lcap -lpsx -lpthread --wrap=pthread_create

          or,

          gcc ... -lcap -lpsx -lpthread -Wl,-wrap,pthread_create

          When linked this way, due to linker magic, libcap uses
          psx_syscall(3) and psx_syscall6(3) to perform state setting
          system calls. Notably, this also ensures that cap_prctlw() can be
          used to ensure process control bits are shared over all threads
          of a single process.

      capgetp() and capsetp()
          The library also supports the deprecated functions:

          int capgetp(pid_t pid, cap_t cap_d);

          int capsetp(pid_t pid, cap_t cap_d);

          capgetp() attempts to obtain the capabilities of some other
          process; storing the capabilities in a pre-allocated cap_d.  See
          cap_init() for information on allocating an empty capability set.
          This function is deprecated; you should use cap_get_pid().

          capsetp() attempts to set the capabilities of the calling process
          or of some other process(es), pid.  Note that setting
          capabilities of another process is only possible on older kernels
          that do not provide VFS support for setting file capabilities.
          See capset(2) for information on which kernels provide such
          support.

          If pid is positive it refers to a specific process;  if it is
          zero, it refers to the calling process; -1 refers to all
          processes other than the calling process and process '1'
          (typically init(8)); other negative values refer to the -pid
          process group.

          In order to use this function, the kernel must support it and the
          calling process must have CAP_SETPCAP raised in its Effective
          capability set. The capabilities set in the target process(es)
          are those contained in cap_d.

          Kernels that support filesystem capabilities redefine the
          semantics of CAP_SETPCAP and on such systems, capsetp() will
          always fail for any target not equal to the calling process.
          capsetp() returns zero for success, and -1 on failure.

          On kernels where it is (was) supported, capsetp() should be used
          with care.  It existed, primarily, to overcome an early lack of
          support for capabilities in the filesystems supported by Linux.
          Note that on older kernels where capsetp() could be used to set
          the capabilities of another process, the only processes that had
          CAP_SETPCAP available to them by default were processes started
          as kernel threads.  (Typically this includes init(8), kflushd and
          kswapd.) A kernel recompilation was needed to modify this
          default.


-------------------------------------------------------

::

          The code segment below raises the CAP_FOWNER and CAP_SETFCAP
          effective capabilities for the caller:

              ...
              cap_t caps;
              const cap_value_t cap_list[2] = {CAP_FOWNER, CAP_SETFCAP};

              if (!CAP_IS_SUPPORTED(CAP_SETFCAP))
                  /* handle error */

              caps = cap_get_proc();
              if (caps == NULL)
                  /* handle error */;

              if (cap_set_flag(caps, CAP_EFFECTIVE, 2, cap_list, CAP_SET) == -1)
                  /* handle error */;

              if (cap_set_proc(caps) == -1)
                  /* handle error */;

              if (cap_free(caps) == -1)
                  /* handle error */;
              ...

          Alternatively, to completely drop privilege in a program launched
          setuid-root but wanting to run as a specific user ID etc. in such
          a way that neither it, nor any of its children can acquire
          privilege again:

              ...
              uid_t nobody = 65534;
              const gid_t groups[] = {65534};

              if (cap_setgroups(groups[0], 1, groups) != 0)
                  /* handle error */;
              if (cap_setuid(nobody) != 0)
                  /* handle error */;

              /*
               * privilege is still available here
               */

              if (cap_set_mode(CAP_MODE_NOPRIV) != 0)
                  /* handle error */
              ...

          Note, the above sequence can be performed by the capsh tool as
          follows:

          sudo /sbin/capsh --user=nobody --mode=NOPRIV --print

          where --print displays the resulting privilege state.


---------------------------------------------------------

::

          libcap(3), libpsx(3), capsh(1), cap_clear(3), cap_copy_ext(3),
          cap_from_text(3), cap_get_file(3), cap_init(3), psx_syscall(3),
          capabilities(7).

COLOPHON
---------------------------------------------------------

::

          This page is part of the libcap (capabilities commands and
          library) project.  Information about the project can be found at
          ⟨https://git.kernel.org/pub/scm/libs/libcap/libcap.git/⟩.  If you
          have a bug report for this manual page, send it to
          morgan@kernel.org (please put "libcap" in the Subject line).
          This page was obtained from the project's upstream Git repository
          ⟨https://git.kernel.org/pub/scm/libs/libcap/libcap.git/⟩ on
          2021-08-27.  (At that time, the date of the most recent commit
          that was found in the repository was 2021-08-25.)  If you
          discover any rendering problems in this HTML version of the page,
          or you believe there is a better or more up-to-date source for
          the page, or you have corrections or improvements to the
          information in this COLOPHON (which is not part of the original
          manual page), send a mail to man-pages@man7.org

                                  2021-03-06                CAP_GET_PROC(3)

--------------

Pages that refer to this page: `capsh(1) <../man1/capsh.1.html>`__, 
`capget(2) <../man2/capget.2.html>`__, 
`prctl(2) <../man2/prctl.2.html>`__, 
`cap_clear(3) <../man3/cap_clear.3.html>`__, 
`cap_copy_ext(3) <../man3/cap_copy_ext.3.html>`__, 
`cap_from_text(3) <../man3/cap_from_text.3.html>`__, 
`cap_get_file(3) <../man3/cap_get_file.3.html>`__, 
`cap_iab(3) <../man3/cap_iab.3.html>`__, 
`cap_init(3) <../man3/cap_init.3.html>`__, 
`cap_launch(3) <../man3/cap_launch.3.html>`__, 
`libcap(3) <../man3/libcap.3.html>`__, 
`capabilities(7) <../man7/capabilities.7.html>`__

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
