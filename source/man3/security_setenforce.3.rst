.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

security_getenforce(3) — Linux manual page
==========================================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   security_getenforce(3)  SELinux API documentation security_getenforce(3)

NAME
-------------------------------------------------

::

          security_getenforce, security_setenforce, security_deny_unknown,
          security_reject_unknown, security_get_checkreqprot - get or set
          the enforcing state of SELinux


---------------------------------------------------------

::

          #include <selinux/selinux.h>

          int security_getenforce(void);

          int security_setenforce(int value);

          int security_deny_unknown(void);

          int security_reject_unknown(void);

          int security_get_checkreqprot(void);


---------------------------------------------------------------

::

          security_getenforce() returns 0 if SELinux is running in
          permissive mode, 1 if it is running in enforcing mode, and -1 on
          error.

          security_setenforce() sets SELinux to enforcing mode if the value
          1 is passed in, and sets it to permissive mode if 0 is passed in.
          On success 0 is returned, on error -1 is returned.

          security_deny_unknown() returns 0 if SELinux treats policy
          queries on undefined object classes or permissions as being
          allowed, 1 if such queries are denied, and -1 on error.

          security_reject_unknown() returns 1 if the current policy was
          built with handle-unknown=reject and SELinux would reject loading
          it, if it did not define all kernel object classes and
          permissions. In this state, when selinux_set_mapping() and
          selinux_check_access() are used with an undefined userspace class
          or permission, an error is returned and errno is set to EINVAL.

          It returns 0 if the current policy was built with handle-
          unknown=allow or handle-unknown=deny. In this state, policy
          queries are treated according to security_deny_unknown().  -1 is
          returned on error.

          security_get_checkreqprot() can be used to determine whether
          SELinux is configured to check the protection requested by the
          application or the actual protection that will be applied by the
          kernel (including the effects of READ_IMPLIES_EXEC) on mmap and
          mprotect calls.  It returns 0 if SELinux checks the actual
          protection, 1 if it checks the requested protection, and -1 on
          error.


---------------------------------------------------------

::

          selinux(8)

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

   russell@coker.com.au         1 January 2004       security_getenforce(3)

--------------

Pages that refer to this page:
`security_disable(3) <../man3/security_disable.3.html>`__, 
`security_load_policy(3) <../man3/security_load_policy.3.html>`__, 
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
