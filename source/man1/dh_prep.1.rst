.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

dh_prep(1) — Linux manual page
==============================

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

   DH_PREP(1)                      Debhelper                     DH_PREP(1)

NAME
-------------------------------------------------

::

          dh_prep - perform cleanups in preparation for building a binary
          package


---------------------------------------------------------

::

          dh_prep [debhelper options] [-Xitem]


---------------------------------------------------------------

::

          dh_prep is a debhelper program that performs some file cleanups
          in preparation for building a binary package. (This is what
          dh_clean -k used to do.) It removes the package build
          directories, debian/tmp, and some temp files that are generated
          when building a binary package.

          It is typically run at the top of the binary-arch and binary-
          indep targets, or at the top of a target such as install that
          they depend on.


-------------------------------------------------------

::

          -Xitem --exclude=item
              Exclude files that contain item anywhere in their filename
              from being deleted, even if they would normally be deleted.
              You may use this option multiple times to build up a list of
              things to exclude.


---------------------------------------------------------

::

          debhelper(7)

          This program is a part of debhelper.


-----------------------------------------------------

::

          Joey Hess <joeyh@debian.org>

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

   13.0.1                         2020-05-16                     DH_PREP(1)

--------------

Pages that refer to this page:
`dh_clean(1) <../man1/dh_clean.1.html>`__, 
`dh_installcatalogs(1) <../man1/dh_installcatalogs.1.html>`__, 
`dh_installemacsen(1) <../man1/dh_installemacsen.1.html>`__, 
`dh_installinit(1) <../man1/dh_installinit.1.html>`__, 
`dh_installinitramfs(1) <../man1/dh_installinitramfs.1.html>`__, 
`dh_installmodules(1) <../man1/dh_installmodules.1.html>`__, 
`dh_installsystemd(1) <../man1/dh_installsystemd.1.html>`__, 
`dh_installsystemduser(1) <../man1/dh_installsystemduser.1.html>`__, 
`dh_installsysusers(1) <../man1/dh_installsysusers.1.html>`__, 
`dh_installtmpfiles(1) <../man1/dh_installtmpfiles.1.html>`__, 
`dh_installudev(1) <../man1/dh_installudev.1.html>`__, 
`dh_installwm(1) <../man1/dh_installwm.1.html>`__, 
`dh_systemd_enable(1) <../man1/dh_systemd_enable.1.html>`__, 
`dh_systemd_start(1) <../man1/dh_systemd_start.1.html>`__, 
`dh_ucf(1) <../man1/dh_ucf.1.html>`__, 
`dh_usrlocal(1) <../man1/dh_usrlocal.1.html>`__, 
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
