.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

semodule(8) — Linux manual page
===============================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `MODES <#MODES>`__ \|             |                                   |
| `OPTIONS <#OPTIONS>`__ \|         |                                   |
| `EXAMPLE <#EXAMPLE>`__ \|         |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `AUTHORS <#AUTHORS>`__ \|         |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   SEMODULE(8)                        NSA                       SEMODULE(8)

NAME
-------------------------------------------------

::

          semodule - Manage SELinux policy modules.


---------------------------------------------------------

::

          semodule [option]... MODE...


---------------------------------------------------------------

::

          semodule is the tool used to manage SELinux policy modules,
          including installing, upgrading, listing and removing modules.
          semodule may also be used to force a rebuild of policy from the
          module store and/or to force a reload of policy without
          performing any other transaction.  semodule acts on module
          packages created by semodule_package.  Conventionally, these
          files have a .pp suffix (policy package), although this is not
          mandated in any way.


---------------------------------------------------

::

          -R, --reload
                 force a reload of policy

          -B, --build
                 force a rebuild of policy (also reloads unless -n is used)

          -D, --disable_dontaudit
                 Temporarily remove dontaudits from policy.  Reverts
                 whenever policy is rebuilt

          -i,--install=MODULE_PKG
                 install/replace a module package

          -u,--upgrade=MODULE_PKG
                 deprecated, alias for --install

          -b,--base=MODULE_PKG
                 deprecated, alias for --install

          -r,--remove=MODULE_NAME
                 remove existing module at desired priority (defaults to -X
                 400)

          -l[KIND],--list-modules[=KIND]
                 display list of installed modules (other than base)

          KIND:

          standard
                 list highest priority, enabled, non-base modules

          full   list all modules

          -X,--priority=PRIORITY
                 set priority for following operations (1-999)

          -e,--enable=MODULE_NAME
                 enable module

          -d,--disable=MODULE_NAME
                 disable module

          -E,--extract=MODULE_PKG
                 Extract a module from the store as an HLL or CIL file to
                 the current directory.  A module is extracted as HLL by
                 default. The name of the module written is <module-
                 name>.<lang_ext>


-------------------------------------------------------

::

          -s,--store
                 name of the store to operate on

          -n,--noreload,-N
                 do not reload policy after commit

          -h,--help
                 prints help message and quit

          -P,--preserve_tunables
                 Preserve tunables in policy

          -C,--ignore-module-cache
                 Recompile CIL modules built from HLL files

          -p,--path
                 Use an alternate path for the policy root

          -S,--store-path
                 Use an alternate path for the policy store root

          -v,--verbose
                 be verbose

          -c,--cil
                 Extract module as a CIL file. This only affects the
                 --extract option and only modules listed in --extract
                 after this option.

          -H,--hll
                 Extract module as an HLL file. This only affects the
                 --extract option and only modules listed in --extract
                 after this option.


-------------------------------------------------------

::

          # Install or replace a base policy package.
          $ semodule -b base.pp
          # Install or replace a non-base policy package.
          $ semodule -i httpd.pp
          # Install or replace all non-base modules in the current directory.
          # This syntax can be used with -i/u/r/E, but no other option can be entered after the module names
          $ semodule -i *.pp
          # Install or replace all modules in the current directory.
          $ ls *.pp | grep -Ev "base.pp|enableaudit.pp" | xargs /usr/sbin/semodule -b base.pp -i
          # List non-base modules.
          $ semodule -l
          # List all modules including priorities
          $ semodule -lfull
          # Remove a module at priority 100
          $ semodule -X 100 -r wireshark
          # Turn on all AVC Messages for which SELinux currently is "dontaudit"ing.
          $ semodule -DB
          # Turn "dontaudit" rules back on.
          $ semodule -B
          # Disable a module (all instances of given module across priorities will be disabled).
          $ semodule -d alsa
          # Install a module at a specific priority.
          $ semodule -X 100 -i alsa.pp
          # List all modules.
          $ semodule --list=full
          # Set an alternate path for the policy root
          $ semodule -B -p "/tmp"
          # Set an alternate path for the policy store root
          $ semodule -B -S "/tmp/var/lib/selinux"
          # Write the HLL version of puppet and the CIL version of wireshark
          # modules at priority 400 to the current working directory
          $ semodule -X 400 --hll -E puppet --cil -E wireshark


---------------------------------------------------------

::

          checkmodule(8), semodule_package(8)


-------------------------------------------------------

::

          This manual page was written by Dan Walsh <dwalsh@redhat.com>.
          The program was written by Karl MacMillan <kmacmillan@tresys.com>, Joshua Brindle <jbrindle@tresys.com>, Jason Tang <jtang@tresys.com>

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

   Security Enhanced Linux         Nov 2005                     SEMODULE(8)

--------------

Pages that refer to this page:
`selabel_file(5) <../man5/selabel_file.5.html>`__, 
`genhomedircon(8) <../man8/genhomedircon.8.html>`__, 
`semanage-module(8) <../man8/semanage-module.8.html>`__

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
