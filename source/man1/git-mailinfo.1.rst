.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

git-mailinfo(1) — Linux manual page
===================================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `OPTIONS <#OPTIONS>`__ \|         |                                   |
| `GIT <#GIT>`__ \|                 |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   GIT-MAILINFO(1)                Git Manual                GIT-MAILINFO(1)

NAME
-------------------------------------------------

::

          git-mailinfo - Extracts patch and authorship from a single e-mail
          message


---------------------------------------------------------

::

          git mailinfo [-k|-b] [-u | --encoding=<encoding> | -n]
                         [--[no-]scissors] [--quoted-cr=<action>]
                         <msg> <patch>


---------------------------------------------------------------

::

          Reads a single e-mail message from the standard input, and writes
          the commit log message in <msg> file, and the patches in <patch>
          file. The author name, e-mail and e-mail subject are written out
          to the standard output to be used by git am to create a commit.
          It is usually not necessary to use this command directly. See
          git-am(1) instead.


-------------------------------------------------------

::

          -k
              Usually the program removes email cruft from the Subject:
              header line to extract the title line for the commit log
              message. This option prevents this munging, and is most
              useful when used to read back git format-patch -k output.

              Specifically, the following are removed until none of them
              remain:

              •   Leading and trailing whitespace.

              •   Leading Re:, re:, and :.

              •   Leading bracketed strings (between [ and ], usually
                  [PATCH]).

              Finally, runs of whitespace are normalized to a single ASCII
              space character.

          -b
              When -k is not in effect, all leading strings bracketed with
              [ and ] pairs are stripped. This option limits the stripping
              to only the pairs whose bracketed string contains the word
              "PATCH".

          -u
              The commit log message, author name and author email are
              taken from the e-mail, and after minimally decoding MIME
              transfer encoding, re-coded in the charset specified by
              i18n.commitEncoding (defaulting to UTF-8) by transliterating
              them. This used to be optional but now it is the default.

              Note that the patch is always used as-is without charset
              conversion, even with this flag.

          --encoding=<encoding>
              Similar to -u. But when re-coding, the charset specified here
              is used instead of the one specified by i18n.commitEncoding
              or UTF-8.

          -n
              Disable all charset re-coding of the metadata.

          -m, --message-id
              Copy the Message-ID header at the end of the commit message.
              This is useful in order to associate commits with mailing
              list discussions.

          --scissors
              Remove everything in body before a scissors line (e.g. "-- >8
              --"). The line represents scissors and perforation marks, and
              is used to request the reader to cut the message at that
              line. If that line appears in the body of the message before
              the patch, everything before it (including the scissors line
              itself) is ignored when this option is used.

              This is useful if you want to begin your message in a
              discussion thread with comments and suggestions on the
              message you are responding to, and to conclude it with a
              patch submission, separating the discussion and the beginning
              of the proposed commit log message with a scissors line.

              This can be enabled by default with the configuration option
              mailinfo.scissors.

          --no-scissors
              Ignore scissors lines. Useful for overriding
              mailinfo.scissors settings.

          --quoted-cr=<action>
              Action when processes email messages sent with base64 or
              quoted-printable encoding, and the decoded lines end with a
              CRLF instead of a simple LF.

              The valid actions are:

              •   nowarn: Git will do nothing when such a CRLF is found.

              •   warn: Git will issue a warning for each message if such a
                  CRLF is found.

              •   strip: Git will convert those CRLF to LF.

              The default action could be set by configuration option
              mailinfo.quotedCR. If no such configuration option has been
              set, warn will be used.

          <msg>
              The commit log message extracted from e-mail, usually except
              the title line which comes from e-mail Subject.

          <patch>
              The patch extracted from e-mail.


-----------------------------------------------

::

          Part of the git(1) suite

COLOPHON
---------------------------------------------------------

::

          This page is part of the git (Git distributed version control
          system) project.  Information about the project can be found at
          ⟨http://git-scm.com/⟩.  If you have a bug report for this manual
          page, see ⟨http://git-scm.com/community⟩.  This page was obtained
          from the project's upstream Git repository
          ⟨https://github.com/git/git.git⟩ on 2021-08-27.  (At that time,
          the date of the most recent commit that was found in the
          repository was 2021-08-24.)  If you discover any rendering
          problems in this HTML version of the page, or you believe there
          is a better or more up-to-date source for the page, or you have
          corrections or improvements to the information in this COLOPHON
          (which is not part of the original manual page), send a mail to
          man-pages@man7.org

   Git 2.33.0.69.gc420321         08/27/2021                GIT-MAILINFO(1)

--------------

Pages that refer to this page: `git(1) <../man1/git.1.html>`__, 
`git-am(1) <../man1/git-am.1.html>`__, 
`git-config(1) <../man1/git-config.1.html>`__, 
`git-quiltimport(1) <../man1/git-quiltimport.1.html>`__

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
