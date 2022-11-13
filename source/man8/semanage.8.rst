.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

semanage(8) — Linux manual page
===============================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `OPTIONS <#OPTIONS>`__ \|         |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `AUTHOR <#AUTHOR>`__ \|           |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   semanage(8)                                                  semanage(8)

NAME
-------------------------------------------------

::

          semanage - SELinux Policy Management tool


---------------------------------------------------------

::

          semanage
          {import,export,login,user,port,interface,module,node,fcontext,boolean,permissive,dontaudit,ibpkey,ibendport}
                          ...  positional arguments:

          import Import local customizations

          export Output local customizations

          login Manage login mappings between linux users and SELinux
          confined users

          user Manage SELinux confined users (Roles and levels for an
          SELinux user)

          port Manage network port type definitions

          interface Manage network interface type definitions

          module Manage SELinux policy modules

          node Manage network node type definitions

          fcontext Manage file context mapping definitions

          boolean Manage booleans to selectively enable functionality

          permissive Manage process type enforcement mode

          dontaudit Disable/Enable dontaudit rules in policy

          ibpkey Manage infiniband pkey type definitions

          ibendport Manage infiniband end port type definitions


---------------------------------------------------------------

::

          semanage is used to configure certain elements of SELinux policy
          without requiring modification to or recompilation from policy
          sources.  This includes the mapping from Linux usernames to
          SELinux user identities (which controls the initial security
          context assigned to Linux users when they login and bounds their
          authorized role set) as well as security context mappings for
          various kinds of objects, such as network ports, interfaces,
          infiniband pkeys and endports, and nodes (hosts) as well as the
          file context mapping. Note that the semanage login command deals
          with the mapping from Linux usernames (logins) to SELinux user
          identities, while the semanage user command deals with the
          mapping from SELinux user identities to authorized role sets.  In
          most cases, only the former mapping needs to be adjusted by the
          administrator; the latter is principally defined by the base
          policy and usually does not require modification.


-------------------------------------------------------

::

          -h, --help
                 List help information


---------------------------------------------------------

::

          selinux(8), semanage-boolean(8), semanage-dontaudit(8),
          semanage-export(8), semanage-fcontext(8), semanage-import(8),
          semanage-interface(8), semanage-login(8), semanage-module(8),
          semanage-node(8), semanage-permissive(8), semanage-port(8),
          semanage-user(8) semanage-ibkey(8), semanage-ibendport(8),


-----------------------------------------------------

::

          This man page was written by Daniel Walsh <dwalsh@redhat.com>
          and Russell Coker <rcoker@redhat.com>.
          Examples by Thomas Bleher <ThomasBleher@gmx.de>.  usage: semanage
          [-h]

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

                                   20100223                     semanage(8)

--------------

Pages that refer to this page:
`customizable_types(5) <../man5/customizable_types.5.html>`__, 
`semanage.conf(5) <../man5/semanage.conf.5.html>`__, 
`chcat(8) <../man8/chcat.8.html>`__, 
`genhomedircon(8) <../man8/genhomedircon.8.html>`__, 
`sefcontext_compile(8) <../man8/sefcontext_compile.8.html>`__, 
`selinux(8) <../man8/selinux.8.html>`__, 
`semanage-boolean(8) <../man8/semanage-boolean.8.html>`__, 
`semanage-dontaudit(8) <../man8/semanage-dontaudit.8.html>`__, 
`semanage-export(8) <../man8/semanage-export.8.html>`__, 
`semanage-fcontext(8) <../man8/semanage-fcontext.8.html>`__, 
`semanage-ibendport(8) <../man8/semanage-ibendport.8.html>`__, 
`semanage-ibpkey(8) <../man8/semanage-ibpkey.8.html>`__, 
`semanage-import(8) <../man8/semanage-import.8.html>`__, 
`semanage-interface(8) <../man8/semanage-interface.8.html>`__, 
`semanage-login(8) <../man8/semanage-login.8.html>`__, 
`semanage-module(8) <../man8/semanage-module.8.html>`__, 
`semanage-permissive(8) <../man8/semanage-permissive.8.html>`__, 
`semanage-port(8) <../man8/semanage-port.8.html>`__, 
`semanage-user(8) <../man8/semanage-user.8.html>`__, 
`sepolicy-network(8) <../man8/sepolicy-network.8.html>`__, 
`setsebool(8) <../man8/setsebool.8.html>`__, 
`system-config-selinux(8) <../man8/system-config-selinux.8.html>`__

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
