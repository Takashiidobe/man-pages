.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

deb-changelog(5) — Linux manual page
====================================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `FILES <#FILES>`__ \|             |                                   |
| `EXAMPLES <#EXAMPLES>`__ \|       |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   deb-changelog(5)               dpkg suite               deb-changelog(5)

NAME
-------------------------------------------------

::

          deb-changelog - dpkg source packages' changelog file format


---------------------------------------------------------

::

          changelog


---------------------------------------------------------------

::

          Changes in the packaged version of a project are explained in the
          changelog file debian/changelog.  This includes modifications
          made in the source package compared to the upstream one as well
          as other changes and updates to the package.

          The format of the debian/changelog allows the package building
          tools to discover which version of the package is being built and
          find out other release-specific information.

          That format is a series of entries like this:

          package (version) distributions; metadata
                    [optional blank line(s), stripped]
            * change-details
              more-change-details
                    [blank line(s), included in output of dpkg-parsechangelog(1)]
            * even-more-change-details
                    [optional blank line(s), stripped]
           -- maintainer-name <email-address>  date

          package and version are the source package name and version
          number.

          distributions lists one or more space-separated distributions
          where this version should be installed when it is uploaded; it is
          copied to the Distribution field in the .changes file.

          metadata is a comma-separated list of keyword=value items.  The
          only keywords currently supported by dpkg are urgency and
          binary-only.  urgency's value is used for the Urgency field in
          the .changes file for the upload.  binary-only with a yes value,
          is used to denote that this changelog entry is for a binary-only
          non-maintainer upload (an automatic binary rebuild with the only
          change being the changelog entry).

          The change details may in fact be any series of lines starting
          with at least two spaces, but conventionally each change starts
          with an asterisk and a separating space and continuation lines
          are indented so as to bring them in line with the start of the
          text above.  Blank lines may be used here to separate groups of
          changes, if desired.

          If this upload resolves bugs recorded in the distribution bug
          tracking system, they may be automatically closed on the
          inclusion of this package into the distribution archive by
          including the string:
            Closes: Bug#nnnnn
          in the change details (the exact Perl regular expression is
          /closes:\s*(?:bug)?\#?\s?\d+(?:,\s*(?:bug)?\#?\s?\d+)*/i).  This
          information is conveyed via the Closes field in the .changes
          file.

          The maintainer name and email address used in the changelog
          should be the details of the person who prepared this release of
          the package.  They are not necessarily those of the uploader or
          usual package maintainer.  The information here will be copied to
          the Changed-By field in the .changes file, and then later might
          be used to send an acknowledgement when the upload has been
          installed in the distribution archive.

          The date has the following format (compatible and with the same
          semantics of RFC2822 and RFC5322, or what «date -R» generates):

                 day-of-week, dd month yyyy hh:mm:ss +zzzz

          where:

          day-of-week
                 Is one of: Mon, Tue, Wed, Thu, Fri, Sat, Sun.

          dd     Is a one- or two-digit day of the month (01-31).

          month  Is one of: Jan, Feb, Mar, Apr, May, Jun, Jul, Aug, Sep,
                 Oct, Nov, Dec.

          yyyy   Is the four-digit year (e.g. 2010).

          hh     Is the two-digit hour (00-23).

          mm     Is the two-digit minutes (00-59).

          ss     Is the two-digit seconds (00-60).

          [+-]zzzz
                 Is the time zone offset from Coordinated Universal Time
                 (UTC).  ‘+’ indicates that the time is ahead of (i.e.,
                 east of) UTC and ‘-’ indicates that the time is behind
                 (i.e., west of) UTC.  The first two digits indicate the
                 hour difference from UTC and the last two digits indicate
                 the number of additional minutes difference from UTC.  The
                 last two digits must be in the range 00-59.

          The first “title” line with the package name must start at the
          left hand margin.  The “trailer” line with the maintainer and
          date details must be preceded by exactly one space.  The
          maintainer details and the date must be separated by exactly two
          spaces.

          Any line that consists entirely (i.e., no leading whitespace) of
          # or /* */ style comments or RCS keywords.

          Vim modelines or Emacs local variables, and ancient changelog
          entries with other formats at the end of the file should be
          accepted and preserved on output, but their contents might be
          otherwise ignored and parsing stopped at that point.

          The entire changelog must be encoded in UTF-8.


---------------------------------------------------

::

          debian/changelog


---------------------------------------------------------

::

          dpkg (1.17.18) unstable; urgency=low

            [ Guillem Jover ]
            * Handle empty minimum versions when initializing dependency versions,
              as the code is mapping the minimum version 0 to '' to avoid outputting
              useless versions. Regression introduced in dpkg 1.17.17. Closes: #764929

            [ Updated programs translations ]
            * Catalan (Guillem Jover).

            [ Updated dselect translations ]
            * Catalan (Guillem Jover).
            * German (Sven Joachim).

           -- Guillem Jover <guillem@debian.org>  Sun, 12 Oct 2014 15:47:44 +0200


---------------------------------------------------------

::

          deb-version(7), deb-changes(5), dpkg-parsechangelog(1).

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

   1.19.6-2-g6e42d5               2019-03-25               deb-changelog(5)

--------------

Pages that refer to this page:
`dpkg-genchanges(1) <../man1/dpkg-genchanges.1.html>`__, 
`dpkg-gencontrol(1) <../man1/dpkg-gencontrol.1.html>`__, 
`dpkg-parsechangelog(1) <../man1/dpkg-parsechangelog.1.html>`__, 
`dpkg-source(1) <../man1/dpkg-source.1.html>`__, 
`deb-buildinfo(5) <../man5/deb-buildinfo.5.html>`__, 
`deb-changes(5) <../man5/deb-changes.5.html>`__

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
