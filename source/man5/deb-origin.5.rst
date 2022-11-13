.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

deb-origin(5) — Linux manual page
=================================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `FIELDS <#FIELDS>`__ \|           |                                   |
| `EXAMPLE <#EXAMPLE>`__ \|         |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   deb-origin(5)                  dpkg suite                  deb-origin(5)

NAME
-------------------------------------------------

::

          deb-origin - Vendor-specific information files


---------------------------------------------------------

::

          /usr/local/etc/dpkg/origins/filename


---------------------------------------------------------------

::

          The files in /usr/local/etc/dpkg/origins can provide information
          about various vendors who are providing Debian packages.

          They contain a number of fields, or comments when the line starts
          with ‘#’.  Each field begins with a tag, such as Vendor or
          Parent, followed by a colon and the body of the field. Fields are
          delimited only by field tags. In other words, field text may be
          multiple lines in length, but the tools will join lines when
          processing the body of the field.

          The file should be named according to the vendor name.  The usual
          convention is to name the vendor file using the vendor name in
          all lowercase, but some variation is permitted.  Namely, spaces
          are mapped to dashes (‘-’), and the file can have the same casing
          as the value in Vendor field, or it can be capitalized.


-----------------------------------------------------

::

          Vendor: vendor-name (required)
                 The value of this field determines the vendor name.

          Vendor-URL: vendor-url
                 The value of this field determines the vendor URL.

          Bugs: bug-url
                 The value of this field determines the type and address of
                 the bug tracking system used by this vendor. It can be a
                 mailto URL or a debbugs URL (e.g.,
                 debbugs://bugs.debian.org/).

          Parent: vendor-name
                 The value of this field determines the vendor name of the
                 vendor that this vendor derives from.


-------------------------------------------------------

::

          Vendor: Debian
          Vendor-URL: https://www.debian.org/
          Bugs: debbugs://bugs.debian.org


---------------------------------------------------------

::

          dpkg-vendor(1)

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

   1.19.6-2-g6e42d5               2019-03-25                  deb-origin(5)

--------------

Pages that refer to this page:
`dpkg-vendor(1) <../man1/dpkg-vendor.1.html>`__, 
`deb822(5) <../man5/deb822.5.html>`__

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
