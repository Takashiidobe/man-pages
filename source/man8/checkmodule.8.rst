.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

checkmodule(8) — Linux manual page
==================================

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

   CHECKMODULE(8)           System Manager's Manual          CHECKMODULE(8)

NAME
-------------------------------------------------

::

          checkmodule - SELinux policy module compiler


---------------------------------------------------------

::

          checkmodule [-h] [-b] [-C] [-m] [-M] [-U handle_unknown ] [-V]
          [-o output_file] [input_file]


---------------------------------------------------------------

::

          This manual page describes the checkmodule command.

          checkmodule is a program that checks and compiles a SELinux
          security policy module into a binary representation.  It can
          generate either a base policy module (default) or a non-base
          policy module (-m option); typically, you would build a non-base
          policy module to add to an existing module store that already has
          a base module provided by the base policy.  Use semodule_package
          to combine this module with its optional file contexts to create
          a policy package, and then use semodule to install the module
          package into the module store and load the resulting policy.


-------------------------------------------------------

::

          -b,--binary
                 Read an existing binary policy module file rather than a
                 source policy module file.  This option is a
                 development/debugging aid.

          -C,--cil
                 Write CIL policy file rather than binary policy file.

          -E,--werror
                 Treat warnings as errors

          -h,--help
                 Print usage.

          -m     Generate a non-base policy module.

          -M,--mls
                 Enable the MLS/MCS support when checking and compiling the
                 policy module.

          -V,--version
                 Show policy versions created by this program.

          -o,--output filename
                 Write a binary policy module file to the specified
                 filename.  Otherwise, checkmodule will only check the
                 syntax of the module source file and will not generate a
                 binary module at all.

          -U,--handle-unknown <action>
                 Specify how the kernel should handle unknown classes or
                 permissions (deny, allow or reject).

          -c policyvers
                 Specify the policy version, defaults to the latest.


-------------------------------------------------------

::

          # Build a MLS/MCS-enabled non-base policy module.
          $ checkmodule -M -m httpd.te -o httpd.mod


---------------------------------------------------------

::

          semodule(8), semodule_package(8) SELinux Reference Policy
          documentation at https://github.com/SELinuxProject/refpolicy/wiki


-----------------------------------------------------

::

          This manual page was copied from the checkpolicy man page written
          by Árpád Magosányi <mag@bunuel.tii.matav.hu>, and edited by Dan
          Walsh <dwalsh@redhat.com>.  The program was written by Stephen
          Smalley <sds@tycho.nsa.gov>.

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

                                                             CHECKMODULE(8)

--------------

Pages that refer to this page: `semodule(8) <../man8/semodule.8.html>`__

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
