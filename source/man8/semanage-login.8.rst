.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

semanage-login(8) — Linux manual page
=====================================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `OPTIONS <#OPTIONS>`__ \|         |                                   |
| `EXAMPLE <#EXAMPLE>`__ \|         |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `AUTHOR <#AUTHOR>`__ \|           |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   semanage-login(8)                                      semanage-login(8)

NAME
-------------------------------------------------

::

          semanage-login - SELinux Policy Management linux user to SELinux
          User mapping tool


---------------------------------------------------------

::

          semanage login [-h] [-n] [-N] [-S STORE] [ --add -s SEUSER -r
          RANGE LOGIN | --delete LOGIN | --deleteall | --extract | --list
          [-C] | --modify -s SEUSER -r RANGE LOGIN ]


---------------------------------------------------------------

::

          semanage is used to configure certain elements of SELinux policy
          without requiring modification to or recompilation from policy
          sources.  semanage login controls the mapping between a Linux
          User and the SELinux User.  It can be used to turn  on confined
          users.  For example you could define that a particular user or
          group of users will login to a system as the user_u user.  Prefix
          the group name with a '%' sign to indicate a group name.


-------------------------------------------------------

::

          -h, --help
                 show this help message and exit

          -n, --noheading
                 Do not print heading when listing the specified object
                 type

          -N, --noreload
                 Do not reload policy after commit

          -C, --locallist
                 List local customizations

          -S STORE, --store STORE
                 Select an alternate SELinux Policy Store to manage

          -a, --add
                 Add a record of the specified object type

          -d, --delete
                 Delete a record of the specified object type

          -m, --modify
                 Modify a record of the specified object type

          -l, --list
                 List records of the specified object type

          -E, --extract
                 Extract customizable commands, for use within a
                 transaction

          -D, --deleteall
                 Remove all local customizations

          -s SEUSER, --seuser SEUSER
                 SELinux user name

          -r RANGE, --range RANGE
                 MLS/MCS Security Range (MLS/MCS Systems only) SELinux
                 Range for SELinux login mapping defaults to the SELinux
                 user record range. SELinux Range for SELinux user defaults
                 to s0.


-------------------------------------------------------

::

          Modify the default user on the system to the guest_u user
          # semanage login -m -s guest_u __default__
          Assign gijoe user on an MLS machine  a range and to the staff_u user
          # semanage login -a -s staff_u -rSystemLow-Secret gijoe
          Assign all users in the engineering group to the staff_u user
          # semanage login -a -s staff_u %engineering


---------------------------------------------------------

::

          selinux(8), semanage(8), semanage-user(8)


-----------------------------------------------------

::

          This man page was written by Daniel Walsh <dwalsh@redhat.com>

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

                                   20130617               semanage-login(8)

--------------

Pages that refer to this page:
`semanage(8) <../man8/semanage.8.html>`__, 
`semanage-user(8) <../man8/semanage-user.8.html>`__

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
