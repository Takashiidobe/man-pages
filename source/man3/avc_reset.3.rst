.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

avc_open(3) — Linux manual page
===============================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `OPTIONS <#OPTIONS>`__ \|         |                                   |
| `KERNEL STA                       |                                   |
| TUS PAGE <#KERNEL_STATUS_PAGE>`__ |                                   |
| \|                                |                                   |
| `NETLINK NOTIFI                   |                                   |
| CATION <#NETLINK_NOTIFICATION>`__ |                                   |
| \|                                |                                   |
| `RETURN VALUE <#RETURN_VALUE>`__  |                                   |
| \| `AUTHOR <#AUTHOR>`__ \|        |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   avc_open(3)             SELinux API documentation            avc_open(3)

NAME
-------------------------------------------------

::

          avc_open, avc_destroy, avc_reset, avc_cleanup - userspace SELinux
          AVC setup and teardown


---------------------------------------------------------

::

          #include <selinux/selinux.h>
          #include <selinux/avc.h>

          int avc_open(struct selinux_opt *options, unsigned nopt);

          void avc_destroy(void);

          int avc_reset(void);

          void avc_cleanup(void);


---------------------------------------------------------------

::

          avc_open() initializes the userspace AVC and must be called
          before any other AVC operation can be performed.

          avc_destroy() destroys the userspace AVC, freeing all internal
          memory structures.  After this call has been made, avc_open()
          must be called again before any AVC operations can be performed.
          avc_destroy() also closes the SELinux status page, which might
          have been opened manually by selinux_status_open(3).

          avc_reset() flushes the userspace AVC, causing it to forget any
          cached access decisions.  The userspace AVC normally calls this
          function automatically when needed, see NETLINK NOTIFICATION
          below.

          avc_cleanup() attempts to free unused memory within the userspace
          AVC, but does not flush any cached access decisions.  Under
          normal operation, calling this function should not be necessary.


-------------------------------------------------------

::

          The userspace AVC obeys callbacks set via
          selinux_set_callback(3), in particular the logging and audit
          callbacks.

          The options which may be passed to avc_open() include the
          following:

          AVC_OPT_SETENFORCE
                 This option forces the userspace AVC into enforcing mode
                 if the option value is non-NULL; permissive mode
                 otherwise.  The system enforcing mode will be ignored.


-----------------------------------------------------------------------------

::

          Linux kernel version 2.6.37 supports the SELinux kernel status
          page, enabling userspace applications to mmap(2) SELinux status
          state in read-only mode to avoid system calls during the cache
          hit code path.

          avc_open() calls selinux_status_open(3) to initialize the selinux
          status state.

          avc_has_perm(3) and selinux_check_access(3) both check for status
          updates through calls to selinux_status_updated(3) at the start
          of each permission query and take the appropriate action.

          Two status types are currently implemented.  setenforce events
          will change the effective enforcing state used within the AVC,
          and policyload events will result in a cache flush.


---------------------------------------------------------------------------------

::

          In the event that the kernel status page is not successfully
          mmap(2)'ed the AVC will default to the netlink fallback
          mechanism, which opens a netlink socket for receiving status
          updates.  setenforce and policyload events will have the same
          results as for the status page implementation, but all status
          update checks will now require a system call.


-----------------------------------------------------------------

::

          Functions with a return value return zero on success.  On error,
          -1 is returned and errno is set appropriately.


-----------------------------------------------------

::

          Eamon Walsh <ewalsh@tycho.nsa.gov>


---------------------------------------------------------

::

          selinux(8), selinux_check_access(3), avc_has_perm(3),
          avc_context_to_sid(3), avc_cache_stats(3), avc_add_callback(3),
          selinux_status_open(3), selinux_status_updated(3),
          selinux_set_callback(3), security_compute_av(3)

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

                                  12 Jun 2008                   avc_open(3)

--------------

Pages that refer to this page:
`avc_add_callback(3) <../man3/avc_add_callback.3.html>`__, 
`avc_context_to_sid(3) <../man3/avc_context_to_sid.3.html>`__, 
`avc_init(3) <../man3/avc_init.3.html>`__, 
`avc_netlink_loop(3) <../man3/avc_netlink_loop.3.html>`__

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
