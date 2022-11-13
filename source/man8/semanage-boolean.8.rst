.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

semanage-boolean(8) — Linux manual page
=======================================

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

   semanage-boolean(8)                                  semanage-boolean(8)

NAME
-------------------------------------------------

::

          semanage-boolean - SELinux Policy Management boolean tool


---------------------------------------------------------

::

          semanage boolean [-h] [-n] [-N] [-S STORE] [ --extract |
          --deleteall | --list [-C] | --modify ( --on | --off ) boolean ]


---------------------------------------------------------------

::

          semanage is used to configure certain elements of SELinux policy
          without requiring modification to or recompilation from policy
          sources.  semanage boolean command controls the settings of
          booleans in SELinux policy.  booleans are if-then-else rules
          written in SELinux Policy.  They can be used to customize the way
          that SELinux Policy rules effect a confined domain.


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

          -m, --modify
                 Modify a record of the specified object type

          -l, --list
                 List records of the specified object type

          -E, --extract
                 Extract customizable commands, for use within a
                 transaction

          -D, --deleteall
                 Remove all local customizations

          -1, --on
                 Enable the boolean

          -0, --off
                 Disable the boolean


-------------------------------------------------------

::

          Turn on the apache can send mail boolean
          # semanage boolean -m --on httpd_can_sendmail

          List customized booleans
          # semanage boolean -l -C


---------------------------------------------------------

::

          selinux(8), semanage(8), setsebool(8), getsebool(8)


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

                                   20130617             semanage-boolean(8)

--------------

Pages that refer to this page: `semanage(8) <../man8/semanage.8.html>`__

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
