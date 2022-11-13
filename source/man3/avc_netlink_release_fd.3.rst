.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

avc_netlink_loop(3) — Linux manual page
=======================================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `RETURN VALUE <#RETURN_VALUE>`__  |                                   |
| \| `AUTHOR <#AUTHOR>`__ \|        |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   avc_netlink_loop(3)     SELinux API documentation    avc_netlink_loop(3)

NAME
-------------------------------------------------

::

          avc_netlink_open, avc_netlink_close, avc_netlink_acquire_fd,
          avc_netlink_release_fd, avc_netlink_check_nb, avc_netlink_loop -
          SELinux netlink processing


---------------------------------------------------------

::

          #include <selinux/selinux.h>
          #include <selinux/avc.h>

          int avc_netlink_open(int blocking);

          void avc_netlink_close(void);

          int avc_netlink_acquire_fd(void);

          void avc_netlink_release_fd(void);

          void avc_netlink_loop(void);

          int avc_netlink_check_nb(void);


---------------------------------------------------------------

::

          These functions enable applications to handle notification of
          SELinux events via netlink.  The userspace AVC normally checks
          for netlink messages on each call to avc_has_perm(3).
          Applications may wish to override this behavior and check for
          notification separately, for example in a select(2) loop.  These
          functions also permit netlink monitoring without requiring a call
          to avc_open(3).

          avc_netlink_open() opens a netlink socket to receive SELinux
          notifications.  The socket descriptor is stored internally; use
          avc_netlink_acquire_fd(3) to take ownership of it in application
          code.  The blocking argument controls whether the O_NONBLOCK flag
          is set on the socket descriptor.  avc_open(3) calls this function
          internally, specifying non-blocking behavior.

          avc_netlink_close() closes the netlink socket.  This function is
          called automatically by avc_destroy(3).

          avc_netlink_acquire_fd() returns the netlink socket descriptor
          number and informs the userspace AVC not to check the socket
          descriptor automatically on calls to avc_has_perm(3).  If no such
          socket descriptor exists, avc_netlink_acquire_fd(3) will first
          call avc_netlink_open(3) and then return the resulting fd.

          avc_netlink_release_fd() returns control of the netlink socket to
          the userspace AVC, re-enabling automatic processing of
          notifications.

          avc_netlink_check_nb() checks the netlink socket for pending
          messages and processes them.  Callbacks for policyload and
          enforcing changes will be called; see selinux_set_callback(3).
          This function does not block.

          avc_netlink_loop() enters a loop blocking on the netlink socket
          and processing messages as they are received.  This function will
          not return unless an error occurs on the socket, in which case
          the socket is closed.


-----------------------------------------------------------------

::

          avc_netlink_acquire_fd() returns a non-negative file descriptor
          number on success.  Other functions with a return value return
          zero on success.  On error, -1 is returned and errno is set
          appropriately.


-----------------------------------------------------

::

          Originally KaiGai Kohei. Updated by Mike Palmiotto
          <mike.palmiotto@crunchydata.com>


---------------------------------------------------------

::

          avc_open(3), selinux_set_callback(3), selinux(8)

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

                                  30 Mar 2009           avc_netlink_loop(3)

--------------

Pages that refer to this page:
`avc_netlink_loop(3) <../man3/avc_netlink_loop.3.html>`__, 
`selinux_set_callback(3) <../man3/selinux_set_callback.3.html>`__, 
`selinux_status_open(3) <../man3/selinux_status_open.3.html>`__

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
