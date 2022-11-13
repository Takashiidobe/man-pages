.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

semanage-ibpkey(8) — Linux manual page
======================================

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

   semanage-ibpkey(8)                                    semanage-ibpkey(8)

NAME
-------------------------------------------------

::

          semanage-ibpkey - SELinux Policy Management ibpkey mapping tool


---------------------------------------------------------

::

          semanage ibpkey [-h] [-n] [-N] [-S STORE] [ --add -t TYPE -x
          SUBNET_PREFIX -r RANGE ibpkey_name | ibpkey_range | --delete -x
          SUBNET_PREFIX ibpkey_name | ibpkey_range | --deleteall |
          --extract | --list [-C] | --modify -t TYPE -x SUBNET_PREFIX -r
          RANGE ibpkey_name | ibpkey_range ]


---------------------------------------------------------------

::

          semanage is used to configure certain elements of SELinux policy
          without requiring modification to or recompilation from policy
          sources.  semanage ibpkey controls the ibpkey number to ibpkey
          type definitions.


-------------------------------------------------------

::

          -h, --help
                 show this help message and exit

          -n, --noheading
                 Do not print heading when listing the specified object
                 type

          -N, --noreload
                 Do not reload policy after commit

          -S STORE, --store STORE
                 Select an alternate SELinux Policy Store to manage

          -C, --locallist
                 List local customizations

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

          -t TYPE, --type TYPE
                 SELinux type for the object

          -r RANGE, --range RANGE
                 MLS/MCS Security Range (MLS/MCS Systems only) SELinux
                 Range for SELinux login mapping defaults to the SELinux
                 user record range. SELinux Range for SELinux user defaults
                 to s0.

          -x SUBNET_PREFIX, --subnet_prefix SUBNET_PREFIX
                 Subnet prefix for the specified pkey or range of pkeys.


-------------------------------------------------------

::

          List all ibpkey definitions
          # semanage ibpkey -l
          Label pkey 0x8FFF (limited membership default pkey) as a default pkey type
          # semanage ibpkey -a -t default_ibpkey_t -x fe80:: 0x8FFF


---------------------------------------------------------

::

          selinux(8), semanage(8)


-----------------------------------------------------

::

          This man page was written by Daniel Jurgens
          <danielj@mellanox.com>

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

                                   20170508              semanage-ibpkey(8)

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
