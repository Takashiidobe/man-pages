.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

deb-symbols(5) — Linux manual page
==================================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `EXAMPLES <#EXAMPLES>`__ \|       |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   deb-symbols(5)                 dpkg suite                 deb-symbols(5)

NAME
-------------------------------------------------

::

          deb-symbols - Debian's extended shared library information file


---------------------------------------------------------

::

          symbols


---------------------------------------------------------------

::

          The symbol files are shipped in Debian binary packages, and its
          format is a subset of the template symbol files used by
          dpkg-gensymbols(1) in Debian source packages.

          The format for an extended shared library dependency information
          entry in these files is:

          library-soname main-dependency-template
          [| alternative-dependency-template]
          [...]
          [* field-name: field-value]
          [...]
           symbol minimal-version [id-of-dependency-template]

          The library-soname is exactly the value of the SONAME field as
          exported by objdump(1). A dependency-template is a dependency
          where #MINVER# is dynamically replaced either by a version check
          like “(>= minimal-version)” or by nothing (if an unversioned
          dependency is deemed sufficient).

          Each exported symbol (listed as name@version, with version being
          “Base” if the library is not versioned) is associated to a
          minimal-version of its dependency template (the main dependency
          template is always used and will end up being combined with the
          dependency template referenced by id-of-dependency-template if
          present). The first alternative dependency template is numbered
          1, the second one 2, etc.

          Each entry for a library can also have some fields of meta-
          information.  Those fields are stored on lines starting with an
          asterisk. Currently, the only valid fields are:

          Build-Depends-Package
                 It indicates the name of the “-dev” package associated to
                 the library and is used by dpkg-shlibdeps to make sure
                 that the dependency generated is at least as strict as the
                 corresponding build dependency (since dpkg 1.14.13).

          Ignore-Blacklist-Groups
                 It indicates what blacklist groups should be ignored, as a
                 whitespace separated list, so that the symbols contained
                 in those groups get included in the output file (since
                 dpkg 1.17.6).  This should only be necessary for toolchain
                 packages providing those blacklisted symbols. The
                 available groups are system dependent, for ELF and GNU-
                 based systems these are aeabi and gomp.


---------------------------------------------------------

::

      Simple symbols file
          libftp.so.3 libftp3 #MINVER#
           DefaultNetbuf@Base 3.1-1-6
           FtpAccess@Base 3.1-1-6
           [...]

      Advanced symbols file
          libGL.so.1 libgl1
          | libgl1-mesa-glx #MINVER#
          * Build-Depends-Package: libgl1-mesa-dev
           publicGlSymbol@Base 6.3-1
           [...]
           implementationSpecificSymbol@Base 6.5.2-7 1
           [...]


---------------------------------------------------------

::

          https://wiki.debian.org/Projects/ImprovedDpkgShlibdeps 
          dpkg-shlibdeps(1), dpkg-gensymbols(1).

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

   1.19.6-2-g6e42d5               2019-03-25                 deb-symbols(5)

--------------

Pages that refer to this page:
`dpkg-gensymbols(1) <../man1/dpkg-gensymbols.1.html>`__, 
`dpkg-shlibdeps(1) <../man1/dpkg-shlibdeps.1.html>`__, 
`deb(5) <../man5/deb.5.html>`__, 
`deb-shlibs(5) <../man5/deb-shlibs.5.html>`__

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
