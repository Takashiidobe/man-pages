.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

sepolicy(8) — Linux manual page
===============================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `OPTIONS <#OPTIONS>`__ \|         |                                   |
| `AUTHOR <#AUTHOR>`__ \|           |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   sepolicy(8)                                                  sepolicy(8)

NAME
-------------------------------------------------

::

          sepolicy - SELinux Policy Inspection tool


---------------------------------------------------------

::

          sepolicy [-h] [-P policy_path ]
          {booleans,communicate,generate,interface,manpage,network,transition}
          OPTIONS

          Arguments:

          booleans
          Query SELinux policy to see description of booleans
          sepolicy-boolean(8)

          communicate
          Query SELinux policy to see if domains can communicate with each
          other sepolicy-communicate(8)

          generate
          Generate SELinux Policy module template sepolicy-generate(8)

          gui
          Launch Graphical User Interface for SELinux Policy, requires
          policycoreutils-gui package.  sepolicy-gui(8)

          interface
          Print SELinux Policy interface information sepolicy-interface(8)

          manpage
          Generate SELinux man pages sepolicy-manpage(8)

          network
          Query SELinux policy network information sepolicy-network(8)

          transition
          Query SELinux Policy to see how a source process domain can
          transition to the target process domain sepolicy-transition(8)


---------------------------------------------------------------

::

          sepolicy is a tools set that will query the installed SELinux
          policy and generate useful reports, man pages, or even new policy
          modules.  See the argument specific man pages for options and
          descriptions.


-------------------------------------------------------

::

          -P, --policy
                 Alternate policy to analyze. (Defaults to currently
                 installed policy /sys/fs/selinux/policy)

          -h, --help
                 Display help message


-----------------------------------------------------

::

          This man page was written by Daniel Walsh <dwalsh@redhat.com>


---------------------------------------------------------

::

          selinux(8), sepolicy-booleans(8), sepolicy-communicate(8),
          sepolicy-generate(8),sepolicy-gui(8), sepolicy-interface(8),
           sepolicy-network(8), sepolicy-manpage(8), sepolicy-transition(8)

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

                                   20121005                     sepolicy(8)

--------------

Pages that refer to this page: `selinux(8) <../man8/selinux.8.html>`__, 
`selinux-polgengui(8) <../man8/selinux-polgengui.8.html>`__, 
`sepolicy-booleans(8) <../man8/sepolicy-booleans.8.html>`__, 
`sepolicy-communicate(8) <../man8/sepolicy-communicate.8.html>`__, 
`sepolicy-generate(8) <../man8/sepolicy-generate.8.html>`__, 
`sepolicy-gui(8) <../man8/sepolicy-gui.8.html>`__, 
`sepolicy-interface(8) <../man8/sepolicy-interface.8.html>`__, 
`sepolicy-manpage(8) <../man8/sepolicy-manpage.8.html>`__, 
`sepolicy-network(8) <../man8/sepolicy-network.8.html>`__, 
`sepolicy-transition(8) <../man8/sepolicy-transition.8.html>`__

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
