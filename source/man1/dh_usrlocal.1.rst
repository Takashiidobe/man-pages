.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

dh_usrlocal(1) — Linux manual page
==================================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `OPTIONS <#OPTIONS>`__ \|         |                                   |
| `NOTES <#NOTES>`__ \|             |                                   |
| `CONFORMS TO <#CONFORMS_TO>`__ \| |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `AUTHOR <#AUTHOR>`__ \|           |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   DH_USRLOCAL(1)                  Debhelper                 DH_USRLOCAL(1)

NAME
-------------------------------------------------

::

          dh_usrlocal - migrate usr/local directories to maintainer scripts


---------------------------------------------------------

::

          dh_usrlocal [debhelper options] [-n]


---------------------------------------------------------------

::

          dh_usrlocal is a debhelper program that can be used for building
          packages that will provide a subdirectory in /usr/local when
          installed.

          It finds subdirectories of usr/local in the package build
          directory, and removes them, replacing them with maintainer
          script snippets (unless -n is used) to create the directories at
          install time, and remove them when the package is removed, in a
          manner compliant with Debian policy. These snippets are inserted
          into the maintainer scripts by dh_installdeb. See
          dh_installdeb(1) for an explanation of debhelper maintainer
          script snippets.

          When the DEB_RULES_REQUIRES_ROOT environment variable is not
          (effectively) binary-targets, the directories in /usr/local will
          be handled as if they were owned by root:root (see below).

          When the DEB_RULES_REQUIRES_ROOT environment variable has an
          effective value of binary-targets, the owners, groups and
          permissions will be preserved with the sole exception where the
          directory is owned by root:root.

          If a directory is owned by root:root, then ownership will be
          determined at install time.  The ownership and permission bits
          will either be root:root mode 0755 or root:staff mode 02775.  The
          actual choice depends on whether the system has
          /etc/staff-group-for-usr-local (as documented in the Debian
          Policy Manual §9.1.2 since version 4.1.4)


-------------------------------------------------------

::

          -n, --no-scripts
              Do not modify postinst/prerm scripts.


---------------------------------------------------

::

          Note that this command is not idempotent. dh_prep(1) should be
          called between invocations of this command. Otherwise, it may
          cause multiple instances of the same text to be added to
          maintainer scripts.


---------------------------------------------------------------

::

          Debian policy, version 2.2


---------------------------------------------------------

::

          debhelper(7)

          This program is a part of debhelper.


-----------------------------------------------------

::

          Andrew Stribblehill <ads@debian.org>

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

   13.0.1                         2020-05-16                 DH_USRLOCAL(1)

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
