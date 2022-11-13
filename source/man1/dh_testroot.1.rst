.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

dh_testroot(1) — Linux manual page
==================================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `AUTHOR <#AUTHOR>`__ \|           |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   DH_TESTROOT(1)                  Debhelper                 DH_TESTROOT(1)

NAME
-------------------------------------------------

::

          dh_testroot - ensure that a package is built with necessary level
          of root permissions


---------------------------------------------------------

::

          dh_testroot [debhelper options]


---------------------------------------------------------------

::

          dh_testroot is used to determine if the target is being run with
          suffient access to root(-like) features.

          The definition of sufficient access depends on whether the
          builder (the tool invoking the debian/rules target) supports the
          Rules-Requires-Root (R³) field.  If the builder supports R³, then
          it will set the environment variable DEB_RULES_REQUIRES_ROOT and
          dh_testroot will validate that the builder followed the minimum
          requirements for the given value of DEB_RULES_REQUIRES_ROOT.

          If the builder does not support Rules-Requires-Root, then it will
          not set the DEB_RULES_REQUIRES_ROOT environment variable.  This
          will in turn make dh_testroot (and the rest of debhelper) fall
          back to assuming that (fake)root is implied.

          The following is a summary of how dh_testroot behaves based on
          the DEB_RULES_REQUIRES_ROOT environment variable (leading and
          trailing whitespace in the variable is ignored).

          -   If unset, or set to "binary-targets", then dh_testroot
              asserts that it is run as root or under fakeroot(1).

          -   If set to "no", then dh_testroot returns successfully
              (without performing any additional checks).

          -   If set to any other value than the above, then dh_testroot
              asserts that it is either run as root (or under fakeroot(1))
              or the builder has provided the DEB_GAIN_ROOT_CMD environment
              variable (e.g. via dpkg-buildpackage -r).

          Please note that dh_testroot does not read the Rules-Requires-
          Root field.  Which implies that dh_testroot may produce incorrect
          result if the builder lies in DEB_RULES_REQUIRES_ROOT.  On the
          flip side, it also enables things like testing for what will
          happen when DEB_RULES_REQUIRES_ROOT is set to a given value.


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

   13.2.2                         2020-10-25                 DH_TESTROOT(1)

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
