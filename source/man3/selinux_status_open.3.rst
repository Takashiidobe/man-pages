.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

selinux_status_open(3) — Linux manual page
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

   selinux_status_open(3)  SELinux API documentation selinux_status_open(3)

NAME
-------------------------------------------------

::

          selinux_status_open, selinux_status_close,
          selinux_status_updated, selinux_status_getenforce,
          selinux_status_policyload and selinux_status_deny_unknown -
          reference the SELinux kernel status without invocation of system
          calls


---------------------------------------------------------

::

          #include <selinux/avc.h>

          int selinux_status_open(int fallback);

          void selinux_status_close(void);

          int selinux_status_updated(void);

          int selinux_status_getenforce(void);

          int selinux_status_policyload(void);

          int selinux_status_deny_unknown(void);


---------------------------------------------------------------

::

          Linux 2.6.37 or later provides a SELinux kernel status page;
          being mostly placed on /sys/fs/selinux/status entry. It enables
          userspace applications to mmap this page with read-only mode,
          then it informs some status without system call invocations.

          In some cases that a userspace application tries to apply heavy
          frequent access control; such as row-level security in databases,
          it will face unignorable cost to communicate with kernel space to
          check invalidation of userspace avc.

          These functions provides applications a way to know some kernel
          events without system-call invocation or worker thread for
          monitoring.

          selinux_status_open() tries to open(2) /sys/fs/selinux/status and
          mmap(2) it in read-only mode. The file-descriptor and pointer to
          the page shall be stored internally; Don't touch them directly.
          Set 1 on the fallback argument to handle a case of older kernels
          without kernel status page support.  In this case, this function
          tries to open a netlink socket using avc_netlink_open(3) and
          overwrite corresponding callbacks (setenforce and policyload).
          Thus, we need to pay attention to the interaction with these
          interfaces, when fallback mode is enabled.

          selinux_status_close() unmap the kernel status page and close its
          file descriptor, or close the netlink socket if fallbacked.

          selinux_status_updated() processes status update events. There
          are two kinds of status updates.  setenforce events will change
          the effective enforcing state used within the AVC, and policyload
          events will result in a cache flush.

          This function returns 0 if there have been no updates since the
          last call, 1 if there have been updates since the last call, or
          -1 on error.

          selinux_status_getenforce() returns 0 if SELinux is running in
          permissive mode, 1 if enforcing mode, or -1 on error.  Same as
          security_getenforce(3) except with or without system call
          invocation.

          selinux_status_policyload() returns times of policy reloaded on
          the running system, or -1 on error.  Note that it is not a
          reliable value on fallback-mode until it receive the first event
          message via netlink socket.  Thus, don't use this value to know
          actual times of policy reloaded.

          selinux_status_deny_unknown() returns 0 if SELinux treats policy
          queries on undefined object classes or permissions as being
          allowed, 1 if such queries are denied, or -1 on error.

          Also note that these interfaces are not thread-safe, so you have
          to protect them from concurrent calls using exclusive locks when
          multiple threads are performing.


-----------------------------------------------------------------

::

          selinux_status_open() returns 0 or 1 on success. 1 means we are
          ready to use these interfaces, but netlink socket was opened as
          fallback instead of the kernel status page.  On error, -1 shall
          be returned.

          Any other functions with a return value shall return its
          characteristic value as described above, or -1 on errors.


---------------------------------------------------------

::

          mmap(2), avc_netlink_open(3), security_getenforce(3),
          security_deny_unknown(3)

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

   kaigai@ak.jp.nec.com         22 January 2011      selinux_status_open(3)

--------------

Pages that refer to this page:
`avc_init(3) <../man3/avc_init.3.html>`__, 
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
