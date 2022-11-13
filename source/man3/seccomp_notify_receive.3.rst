.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

seccomp_notify_alloc(3) — Linux manual page
===========================================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `RETURN VALUE <#RETURN_VALUE>`__  |                                   |
| \| `NOTES <#NOTES>`__ \|          |                                   |
| `AUTHOR <#AUTHOR>`__ \|           |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   seccomp_notify_alloc(3) libseccomp Documentation seccomp_notify_alloc(3)

NAME
-------------------------------------------------

::

          seccomp_notify_alloc, seccomp_notify_free,
          seccomp_notify_receive, seccomp_notify_respond,
          seccomp_notify_id_valid, seccomp_notify_fd - Manage seccomp
          notifications


---------------------------------------------------------

::

          #include <seccomp.h>

          int seccomp_notify_alloc(struct seccomp_notif **req, struct seccomp_notif_resp **resp)
          void seccomp_notify_free(struct seccomp_notif *req, struct seccomp_notif_resp *resp)
          int seccomp_notify_receive(int fd, struct seccomp_notif *req)
          int seccomp_notify_respond(int fd, struct seccomp_notif_resp *resp)
          int seccomp_notify_id_valid(int fd, uint64_t id)
          int seccomp_notify_fd(const scmp_filter_ctx ctx)

          Link with -lseccomp.


---------------------------------------------------------------

::

          The seccomp_notify_alloc() function dynamically allocates enough
          memory for a seccomp notification and response. Note that one
          should always use these functions and not depend on the structure
          sizes in headers, since the size can vary depending on the kernel
          version. This function takes care to ask the kernel how big each
          structure should be, and allocates the right amount of memory.
          The seccomp_notify_free() function frees memory allocated by
          seccomp_notify_alloc().

          The seccomp_notify_receive() function receives a notification
          from a seccomp notify fd (obtained from seccomp_notify_fd()).

          The seccomp_notify_respond() function sends a response to a
          particular notification. The id field should be the same as the
          id from the request, so that the kernel knows which request this
          response corresponds to.

          The seccomp_notify_id_valid() function checks to see if the
          syscall from a particular notification request is still valid,
          i.e. if the task is still alive. See NOTES below for details on
          race conditions.

          The seccomp_notify_fd() returns the notification fd of a filter
          after it has been loaded.


-----------------------------------------------------------------

::

          The seccomp_notify_fd() returns the notification fd of the loaded
          filter, -1 if a notification fd has not yet been created, and
          -EINVAL if the filter context is invalid.

          The seccomp_notify_id_valid() returns 0 if the id is valid, and
          -ENOENT if it is not.

          The seccomp_notify_alloc(), seccomp_notify_receive(), and
          seccomp_notify_respond() functions return zero on success,  or
          one of the following error codes on failure:

          -ECANCELED
                 There was a system failure beyond the control of the
                 library, check the errno value for more information.

          -EFAULT
                 Internal libseccomp failure.

          -ENOMEM
                 The library was unable to allocate enough memory.

          -EOPNOTSUPP
                 The library doesn't support the particular operation.


---------------------------------------------------

::

          Care should be taken to avoid two different time of check/time of
          use errors.  First, after opening any resources relevant to the
          pid for a notification (e.g.  /proc/pid/mem for reading tracee
          memory to make policy decisions), applications should call
          seccomp_notify_id_valid() to make sure that the resources the
          application has opened correspond to the right pid, i.e. that the
          pid didn't die and a different task take its place.

          Second, the classic time of check/time of use issue with seccomp
          memory should also be avoided: applications should copy any
          memory they wish to use to make decisions from the tracee into
          its own address space before applying any policy decisions, since
          a multi-threaded tracee may edit the memory at any time,
          including after it's used to make a policy decision.

          A complete example of how to avoid these two races is available
          in the Linux Kernel source tree at /samples/seccomp/user-trap.c.


-----------------------------------------------------

::

          Tycho Andersen <tycho@tycho.ws>

COLOPHON
---------------------------------------------------------

::

          This page is part of the libseccomp (high-level API to the Linux
          Kernel's seccomp filter) project.  Information about the project
          can be found at ⟨https://github.com/seccomp/libseccomp⟩.  If you
          have a bug report for this manual page, see
          ⟨https://groups.google.com/d/forum/libseccomp⟩.  This page was
          obtained from the project's upstream Git repository
          ⟨https://github.com/seccomp/libseccomp⟩ on 2021-08-27.  (At that
          time, the date of the most recent commit that was found in the
          repository was 2021-08-25.)  If you discover any rendering
          problems in this HTML version of the page, or you believe there
          is a better or more up-to-date source for the page, or you have
          corrections or improvements to the information in this COLOPHON
          (which is not part of the original manual page), send a mail to
          man-pages@man7.org

   tycho@tycho.ws                 30 May 2020       seccomp_notify_alloc(3)

--------------

Pages that refer to this page:
`seccomp_init(3) <../man3/seccomp_init.3.html>`__, 
`seccomp_rule_add(3) <../man3/seccomp_rule_add.3.html>`__

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
