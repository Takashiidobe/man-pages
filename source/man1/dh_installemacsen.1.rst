.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

dh_installemacsen(1) — Linux manual page
========================================

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

   DH_INSTALLEMACSEN(1)            Debhelper           DH_INSTALLEMACSEN(1)

NAME
-------------------------------------------------

::

          dh_installemacsen - register an Emacs add on package


---------------------------------------------------------

::

          dh_installemacsen [debhelper options] [-n] [--priority=n]
          [--flavor=foo]


---------------------------------------------------------------

::

          dh_installemacsen is a debhelper program that is responsible for
          installing files used by the Debian emacsen-common package into
          package build directories.

          It also automatically generates the preinst postinst and prerm
          commands needed to register a package as an Emacs add on package.
          The commands are added to the maintainer scripts by
          dh_installdeb. See dh_installdeb(1) for an explanation of how
          this works.


---------------------------------------------------

::

          debian/package.emacsen-compat
              Installed into usr/lib/emacsen-common/packages/compat/package
              in the package build directory.

          debian/package.emacsen-install
              Installed into
              usr/lib/emacsen-common/packages/install/package in the
              package build directory.

          debian/package.emacsen-remove
              Installed into usr/lib/emacsen-common/packages/remove/package
              in the package build directory.

          debian/package.emacsen-startup
              Installed into etc/emacs/site-start.d/50package.el in the
              package build directory. Use --priority to use a different
              priority than 50.


-------------------------------------------------------

::

          -n, --no-scripts
              Do not modify postinst/prerm scripts.

          --priority=n
              Sets the priority number of a site-start.d file. Default is
              50.

          --flavor=foo
              Sets the flavor a site-start.d file will be installed in.
              Default is emacs, alternatives include xemacs and emacs20.


---------------------------------------------------

::

          Note that this command is not idempotent. dh_prep(1) should be
          called between invocations of this command. Otherwise, it may
          cause multiple instances of the same text to be added to
          maintainer scripts.


---------------------------------------------------------

::

          debhelper(7)
          "usr/share/doc/emacsen-common/debian-emacs-policy.gz"

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

   13.0.1                         2020-05-16           DH_INSTALLEMACSEN(1)

--------------

Pages that refer to this page:
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
