.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

newrole(1) — Linux manual page
==============================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `EXAMPLE <#EXAMPLE>`__ \|         |                                   |
| `FILES <#FILES>`__ \|             |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `AUTHORS <#AUTHORS>`__ \|         |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   NEWROLE(1)                         NSA                        NEWROLE(1)

NAME
-------------------------------------------------

::

          newrole - run a shell with a new SELinux role


---------------------------------------------------------

::

          newrole [-r|--role] ROLE [-t|--type] TYPE [-l|--level]
          [-p|--preserve-environment] LEVEL [-- [ARGS]...]


---------------------------------------------------------------

::

          Run a new shell in a new context.  The new context is derived
          from the old context in which newrole is originally executed.  If
          the -r or --role option is specified, then the new context will
          have the role specified by ROLE.  If the -t or --type option is
          specified, then the new context will have the type (domain)
          specified by TYPE.  If a role is specified, but no type is
          specified, the default type is derived from the specified role.
          If the -l or --level option is specified, then the new context
          will have the sensitivity level specified by LEVEL.  If LEVEL is
          a range, the new context will have the sensitivity level and
          clearance specified by that range.  If the -p or --preserve-
          environment option is specified, the shell with the new SELinux
          context will preserve environment variables, otherwise a new
          minimal environment is created.

          Additional arguments ARGS may be provided after a -- option, in
          which case they are supplied to the new shell.  In particular, an
          argument of -- -c will cause the next argument to be treated as a
          command by most command interpreters.

          If a command argument is specified to newrole and the command
          name is found in /etc/selinux/newrole_pam.conf, then the pam
          service name listed in that file for the command will be used
          rather than the normal newrole pam configuration.  This allows
          for per-command pam configuration when invoked via newrole, e.g.
          to skip the interactive re-authentication phase.

          The new shell will be the shell specified in the user's entry in
          the /etc/passwd file.

          The -V or --version shows the current version of newrole


-------------------------------------------------------

::

          Changing role:
             # id -Z
             staff_u:staff_r:staff_t:SystemLow-SystemHigh
             # newrole -r sysadm_r
             # id -Z
             staff_u:sysadm_r:sysadm_t:SystemLow-SystemHigh

          Changing sensitivity only:
             # id -Z
             staff_u:sysadm_r:sysadm_t:Unclassified-SystemHigh
             # newrole -l Secret
             # id -Z
             staff_u:sysadm_r:sysadm_t:Secret-SystemHigh

          Changing sensitivity and clearance:
             # id -Z
             staff_u:sysadm_r:sysadm_t:Unclassified-SystemHigh
             # newrole -l Secret-Secret
             # id -Z
             staff_u:sysadm_r:sysadm_t:Secret

          Running a program in a given role or level:
             # newrole -r sysadm_r -- -c "/path/to/app arg1 arg2..."
             # newrole -l Secret -- -c "/path/to/app arg1 arg2..."


---------------------------------------------------

::

          /etc/passwd - user account information
          /etc/shadow - encrypted passwords and age information
          /etc/selinux/<policy>/contexts/default_type - default types for
          roles
          /etc/selinux/<policy>/contexts/securetty_types - securetty types
          for level changes
          /etc/selinux/newrole_pam.conf - optional mapping of commands to
          separate pam service names


---------------------------------------------------------

::

          runcon(1)


-------------------------------------------------------

::

          Anthony Colatrella
          Tim Fraser
          Steve Grubb <sgrubb@redhat.com>
          Darrel Goeddel <DGoeddel@trustedcs.com>
          Michael Thompson <mcthomps@us.ibm.com>
          Dan Walsh <dwalsh@redhat.com>

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

   Security Enhanced Linux       October 2000                    NEWROLE(1)

--------------

Pages that refer to this page:
`default_type(5) <../man5/default_type.5.html>`__, 
`securetty_types(5) <../man5/securetty_types.5.html>`__, 
`run_init(8) <../man8/run_init.8.html>`__

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
