.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

checkpolicy(8) — Linux manual page
==================================

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

   CHECKPOLICY(8)           System Manager's Manual          CHECKPOLICY(8)

NAME
-------------------------------------------------

::

          checkpolicy - SELinux policy compiler


---------------------------------------------------------

::

          checkpolicy [-b[F]] [-C] [-d] [-U handle_unknown
          (allow,deny,reject)] [-M] [-c policyvers] [-o output_file|-] [-S]
          [-t target_platform (selinux,xen)] [-V] [input_file]


---------------------------------------------------------------

::

          This manual page describes the checkpolicy command.

          checkpolicy is a program that checks and compiles a SELinux
          security policy configuration into a binary representation that
          can be loaded into the kernel.  If no input file name is
          specified, checkpolicy will attempt to read from policy.conf or
          policy, depending on whether the -b flag is specified.


-------------------------------------------------------

::

          -b,--binary
                 Read an existing binary policy file rather than a source
                 policy.conf file.

          -F,--conf
                 Write policy.conf file rather than binary policy file. Can
                 only be used with binary policy file.

          -C,--cil
                 Write CIL policy file rather than binary policy file.

          -d,--debug
                 Enter debug mode after loading the policy.

          -U,--handle-unknown <action>
                 Specify how the kernel should handle unknown classes or
                 permissions (deny, allow or reject).

          -M,--mls
                 Enable the MLS policy when checking and compiling the
                 policy.

          -c policyvers
                 Specify the policy version, defaults to the latest.

          -o,--output filename
                 Write a policy file (binary, policy.conf, or CIL policy)
                 to the specified filename. If - is given as filename,
                 write it to standard output.

          -S,--sort
                 Sort ocontexts before writing out the binary policy. This
                 option makes output of checkpolicy consistent with binary
                 policies created by semanage and secilc.

          -t,--target
                 Specify the target platform (selinux or xen).

          -O,--optimize
                 Optimize the final kernel policy (remove redundant rules).

          -E,--werror
                 Treat warnings as errors

          -V,--version
                 Show version information.

          -h,--help
                 Show usage information.


---------------------------------------------------------

::

          SELinux Reference Policy documentation at
          https://github.com/SELinuxProject/refpolicy/wiki


-----------------------------------------------------

::

          This manual page was written by Árpád Magosányi
          <mag@bunuel.tii.matav.hu>, and edited by Stephen Smalley
          <sds@tycho.nsa.gov>.  The program was written by Stephen Smalley
          <sds@tycho.nsa.gov>.

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

                                                             CHECKPOLICY(8)

--------------

Pages that refer to this page:
`restorecon(8) <../man8/restorecon.8.html>`__, 
`setfiles(8) <../man8/setfiles.8.html>`__

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
