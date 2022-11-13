.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

service_seusers(5) — Linux manual page
======================================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `FILE FORMAT <#FILE_FORMAT>`__ \| |                                   |
| `EXAMPLES <#EXAMPLES>`__ \|       |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   service_seusers(5)        SELinux configuration       service_seusers(5)

NAME
-------------------------------------------------

::

          service_seusers - The SELinux GNU/Linux user and service to
          SELinux user mapping configuration files


---------------------------------------------------------------

::

          These are optional files that allow services to define an SELinux
          user when authenticating via SELinux-aware login applications
          such as PAM(8).

          There is one file for each GNU/Linux user name that will be
          required to run a service with a specific SELinux user name.

          The path for each configuration file is formed by the path
          returned by selinux_policy_root(3) with /logins/username appended
          (where username is a file representing the GNU/Linux user name).
          The default services directory is located at:
                 /etc/selinux/{SELINUXTYPE}/logins

          Where {SELINUXTYPE} is the entry from the selinux configuration
          file config (see selinux_config(5)).

          getseuser(3) reads this file to map services to an SELinux user.


---------------------------------------------------------------

::

          Each line within the username file is formatted as follows with
          each component separated by a colon:
                 service:seuser[:range]

          Where:
                 service
                        The service name used by the application.
                 seuser
                        The SELinux user name.
                 range
                        The range for MCS/MLS policies.


---------------------------------------------------------

::

          Example 1 - for the 'root' user:
                 # ./logins/root
                 ipa:user_u:s0
                 this_service:unconfined_u:s0

          Example 2 - for GNU/Linux user 'rch':
                 # ./logins/rch
                 ipa:unconfined_u:s0
                 that_service:unconfined_u:s0


---------------------------------------------------------

::

          selinux(8), PAM(8), selinux_policy_root(3), getseuser(3),
          selinux_config(5)

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

   Security Enhanced Linux        28-Nov-2011            service_seusers(5)

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
