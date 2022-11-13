.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

dh_installinitramfs(1) — Linux manual page
==========================================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `FILES <#FILES>`__ \|             |                                   |
| `OPTIONS <#OPTIONS>`__ \|         |                                   |
| `NOTES <#NOTES>`__ \|             |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `AUTHOR <#AUTHOR>`__ \|           |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   DH_INSTALLINITRAMFS(1)          Debhelper         DH_INSTALLINITRAMFS(1)

NAME
-------------------------------------------------

::

          dh_installinitramfs - install initramfs hooks and setup
          maintscripts


---------------------------------------------------------

::

          dh_installinitramfs [debhelper options] [-n]


---------------------------------------------------------------

::

          dh_installinitramfs is a debhelper program that is responsible
          for installing Debian package provided initramfs hooks.

          If dh_installinitramfs installs or detects one or more initramfs
          hooks in the package, then it also automatically generates the
          noawait trigger update-initframfs command needed to interface
          with the Debian initramfs system.  This trigger is inserted into
          the packaging by dh_installdeb(1).


---------------------------------------------------

::

          debian/package.initramfs-hook
              Assumed to be an initramfs hook that will be installed into
              usr/share/initramfs-tools/hooks/package in the package build
              directory. See HOOK SCRIPTS in initramfs-tools(8) for more
              information about initramfs hooks.


-------------------------------------------------------

::

          -n, --no-scripts
              Do not add the update-initramfs trigger even if it seems like
              the package might need it.  The option is called --no-scripts
              for historical reasons as dh_installinitramfs would
              previously generate maintainer scripts that called update-
              initramfs -u.

              Use this option, if you need to interface with the update-
              initramfs system that is not satisfied by the noawait trigger
              (e.g. because you need the extra guarantees and head-aches of
              a await trigger).


---------------------------------------------------

::

          Note that this command is not idempotent. dh_prep(1) should be
          called between invocations of this command. Otherwise, it may
          cause multiple instances of the same text to be added to triggers
          file.


---------------------------------------------------------

::

          debhelper(7) update-initramfs(8) initramfs-tools(8)

          This program is a part of debhelper.


-----------------------------------------------------

::

          Niels Thykier <niels@thykier.net>

COLOPHON
---------------------------------------------------------

::

          This page is part of the debhelper (helper programs for
          debian/rules) project.  Information about the project can be
          found at [unknown -- if you know, please contact man-
          pages@man7.org] If you have a bug report for this manual page,
          send it to submit@bugs.debian.org.  This page was obtained from
          the project's upstream Git repository
          ⟨https://salsa.debian.org/debian/debhelper.git⟩ on 2021-08-27.
          (At that time, the date of the most recent commit that was found
          in the repository was 2021-08-24.)  If you discover any rendering
          problems in this HTML version of the page, or you believe there
          is a better or more up-to-date source for the page, or you have
          corrections or improvements to the information in this COLOPHON
          (which is not part of the original manual page), send a mail to
          man-pages@man7.org

   13.0.1                         2020-05-16         DH_INSTALLINITRAMFS(1)

--------------

Pages that refer to this page: `dh(1) <../man1/dh.1.html>`__, 
`debhelper(7) <../man7/debhelper.7.html>`__

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
