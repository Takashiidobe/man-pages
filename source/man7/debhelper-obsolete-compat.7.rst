.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

debhelper-obsolete-compat(7) — Linux manual page
================================================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `U                                |                                   |
| PGRADE LIST FOR COMPAT LEVELS <#U |                                   |
| PGRADE_LIST_FOR_COMPAT_LEVELS>`__ |                                   |
| \| `SEE ALSO <#SEE_ALSO>`__ \|    |                                   |
| `AUTHORS <#AUTHORS>`__ \|         |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   debhelper(7)                    Debhelper                   debhelper(7)

NAME
-------------------------------------------------

::

          debhelper-obsolete-compat - List of no longer supported compat
          levels


---------------------------------------------------------

::

          This document contains the upgrade guidelines from all compat
          levels which are no longer supported.  Accordingly it is mostly
          for historical purposes and to assist people upgrading from a
          non-supported compat level to a supported level.

          For upgrades from supported compat levels, please see
          debhelper(7).


-----------------------------------------------------------------------------------------------------

::

          The following is the list of now obsolete compat levels and their
          changes.

          v1  This is the original debhelper compatibility level, and so it
              is the default one. In this mode, debhelper will use
              debian/tmp as the package tree directory for the first binary
              package listed in the control file, while using
              debian/package for all other packages listed in the control
              file.

              This mode is deprecated.

          v2  In this mode, debhelper will consistently use debian/package
              as the package tree directory for every package that is
              built.

              This mode is deprecated.

          v3  This mode works like v2, with the following additions:

              -       Debhelper config files support globbing via * and ?,
                      when appropriate. To turn this off and use those
                      characters raw, just prefix with a backslash.

              -       dh_makeshlibs makes the postinst and postrm scripts
                      call ldconfig.

              -       Every file in etc/ is automatically flagged as a
                      conffile by dh_installdeb.

              This mode is deprecated.

          v4  Changes from v3 are:

              -       dh_makeshlibs -V will not include the Debian part of
                      the version number in the generated dependency line
                      in the shlibs file.

              -       You are encouraged to put the new ${misc:Depends}
                      into debian/control to supplement the
                      ${shlibs:Depends} field.

              -       dh_fixperms will make all files in bin/ directories
                      and in etc/init.d executable.

              -       dh_link will correct existing links to conform with
                      policy.

              This mode is deprecated.

          v5  This is the lowest supported compatibility level.

              Changes from v4 are:

              -       Comments are ignored in debhelper config files.

              -       dh_strip --dbg-package now specifies the name of a
                      package to put debugging symbols in, not the packages
                      to take the symbols from.

              -       dh_installdocs skips installing empty files.

              -       dh_install errors out if wildcards expand to nothing.


---------------------------------------------------------

::

          debhelper(7)


-------------------------------------------------------

::

          Niels Thykier <niels@thykier.net>

          Joey Hess

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

   13.0.1                         2020-05-16                   debhelper(7)

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
