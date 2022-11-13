.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

deb-version(7) — Linux manual page
==================================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `NOTES <#NOTES>`__ \|             |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   deb-version(7)                 dpkg suite                 deb-version(7)

NAME
-------------------------------------------------

::

          deb-version - Debian package version number format


---------------------------------------------------------

::

          [epoch:]upstream-version[-debian-revision]


---------------------------------------------------------------

::

          Version numbers as used for Debian binary and source packages
          consist of three components. These are:

          epoch  This is a single (generally small) unsigned integer.  It
                 may be omitted, in which case zero is assumed.  If it is
                 omitted then the upstream-version may not contain any
                 colons.

                 It is provided to allow mistakes in the version numbers of
                 older versions of a package, and also a package's previous
                 version numbering schemes, to be left behind.

          upstream-version
                 This is the main part of the version number.  It is
                 usually the version number of the original (“upstream”)
                 package from which the .deb file has been made, if this is
                 applicable.  Usually this will be in the same format as
                 that specified by the upstream author(s); however, it may
                 need to be reformatted to fit into the package management
                 system's format and comparison scheme.

                 The comparison behavior of the package management system
                 with respect to the upstream-version is described below.
                 The upstream-version portion of the version number is
                 mandatory.

                 The upstream-version may contain only alphanumerics (“A-
                 Za-z0-9”) and the characters . + - : ~ (full stop, plus,
                 hyphen, colon, tilde) and should start with a digit.  If
                 there is no debian-revision then hyphens are not allowed;
                 if there is no epoch then colons are not allowed.

          debian-revision
                 This part of the version number specifies the version of
                 the Debian package based on the upstream version.  It may
                 contain only alphanumerics and the characters + . ~ (plus,
                 full stop, tilde) and is compared in the same way as the
                 upstream-version is.

                 It is optional; if it isn't present then the upstream-
                 version may not contain a hyphen.  This format represents
                 the case where a piece of software was written
                 specifically to be turned into a Debian package, and so
                 there is only one “debianization” of it and therefore no
                 revision indication is required.

                 It is conventional to restart the debian-revision at ‘1’
                 each time the upstream-version is increased.

                 Dpkg will break the version number apart at the last
                 hyphen in the string (if there is one) to determine the
                 upstream-version and debian-revision. The absence of a
                 debian-revision compares earlier than the presence of one
                 (but note that the debian-revision is the least
                 significant part of the version number).

      Sorting algorithm
          The upstream-version and debian-revision parts are compared by
          the package management system using the same algorithm:

          The strings are compared from left to right.

          First the initial part of each string consisting entirely of non-
          digit characters is determined.  These two parts (one of which
          may be empty) are compared lexically.  If a difference is found
          it is returned.  The lexical comparison is a comparison of ASCII
          values modified so that all the letters sort earlier than all the
          non-letters and so that a tilde sorts before anything, even the
          end of a part.  For example, the following parts are in sorted
          order: ‘~~’, ‘~~a’, ‘~’, the empty part, ‘a’.

          Then the initial part of the remainder of each string which
          consists entirely of digit characters is determined.  The
          numerical values of these two parts are compared, and any
          difference found is returned as the result of the comparison.
          For these purposes an empty string (which can only occur at the
          end of one or both version strings being compared) counts as
          zero.

          These two steps (comparing and removing initial non-digit strings
          and initial digit strings) are repeated until a difference is
          found or both strings are exhausted.

          Note that the purpose of epochs is to allow us to leave behind
          mistakes in version numbering, and to cope with situations where
          the version numbering scheme changes.  It is not intended to cope
          with version numbers containing strings of letters which the
          package management system cannot interpret (such as ‘ALPHA’ or
          ‘pre-’), or with silly orderings.


---------------------------------------------------

::

          The tilde character and its special sorting properties were
          introduced in dpkg 1.10 and some parts of the dpkg build scripts
          only gained support for it later in the 1.10.x series.


---------------------------------------------------------

::

          deb-control(5), deb(5), dpkg(1)

COLOPHON
---------------------------------------------------------

::

          This page is part of the dpkg (Debian Package Manager) project.
          Information about the project can be found at 
          ⟨https://wiki.debian.org/Teams/Dpkg/⟩.  If you have a bug report
          for this manual page, see
          ⟨http://bugs.debian.org/cgi-bin/pkgreport.cgi?src=dpkg⟩.  This
          page was obtained from the project's upstream Git repository
          ⟨https://salsa.debian.org/dpkg-team/dpkg.git⟩ on 2021-08-27.  (At
          that time, the date of the most recent commit that was found in
          the repository was 2021-06-17.)  If you discover any rendering
          problems in this HTML version of the page, or you believe there
          is a better or more up-to-date source for the page, or you have
          corrections or improvements to the information in this COLOPHON
          (which is not part of the original manual page), send a mail to
          man-pages@man7.org

   1.19.6-2-g6e42d5               2019-03-25                 deb-version(7)

--------------

Pages that refer to this page:
`deb-buildinfo(5) <../man5/deb-buildinfo.5.html>`__, 
`deb-changelog(5) <../man5/deb-changelog.5.html>`__, 
`deb-changes(5) <../man5/deb-changes.5.html>`__, 
`deb-control(5) <../man5/deb-control.5.html>`__, 
`deb-src-control(5) <../man5/deb-src-control.5.html>`__, 
`dsc(5) <../man5/dsc.5.html>`__

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
