.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

rename(1) — Linux manual page
=============================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `OPTIONS <#OPTIONS>`__ \|         |                                   |
| `WARNING <#WARNING>`__ \|         |                                   |
| `INTERA                           |                                   |
| CTIVE MODE <#INTERACTIVE_MODE>`__ |                                   |
| \| `EXIT STATUS <#EXIT_STATUS>`__ |                                   |
| \| `EXAMPLES <#EXAMPLES>`__ \|    |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `RE                               |                                   |
| PORTING BUGS <#REPORTING_BUGS>`__ |                                   |
| \|                                |                                   |
| `AVAILABILITY <#AVAILABILITY>`__  |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   RENAME(1)                     User Commands                    RENAME(1)

NAME
-------------------------------------------------

::

          rename - rename files


---------------------------------------------------------

::

          rename [options] expression replacement file...


---------------------------------------------------------------

::

          rename will rename the specified files by replacing the first
          occurrence of expression in their name by replacement.


-------------------------------------------------------

::

          -s, --symlink
              Do not rename a symlink but its target.

          -v, --verbose
              Show which files were renamed, if any.

          -n, --no-act
              Do not make any changes; add --verbose to see what would be
              made.

          -a, --all
              Replace all occurrences of expression rather than only the
              first one.

          -l, --last
              Replace the last occurrence of expression rather than the
              first one.

          -o, --no-overwrite
              Do not overwrite existing files. When --symlink is active, do
              not overwrite symlinks pointing to existing targets.

          -i, --interactive
              Ask before overwriting existing files.

          -V, --version
              Display version information and exit.

          -h, --help
              Display help text and exit.


-------------------------------------------------------

::

          The renaming has no safeguards by default or without any one of
          the options --no-overwrite, --interactive or --no-act. If the
          user has permission to rewrite file names, the command will
          perform the action without any questions. For example, the result
          can be quite drastic when the command is run as root in the /lib
          directory. Always make a backup before running the command,
          unless you truly know what you are doing.


-------------------------------------------------------------------------

::

          As most standard utilities rename can be used with a terminal
          device (tty in short) in canonical mode, where the line is
          buffered by the tty and you press ENTER to validate the user
          input. If you put your tty in cbreak mode however, rename
          requires only a single key press to answer the prompt. To set
          cbreak mode, run for example:

              sh -c 'stty -icanon min 1; "$0" "$@"; stty icanon' rename -i from to files


---------------------------------------------------------------

::

          0
              all requested rename operations were successful

          1
              all rename operations failed

          2
              some rename operations failed

          4
              nothing was renamed

          64
              unanticipated error occurred


---------------------------------------------------------

::

          Given the files foo1, ..., foo9, foo10, ..., foo278, the commands

              rename foo foo00 foo?
              rename foo foo0 foo??

          will turn them into foo001, ..., foo009, foo010, ..., foo278. And

              rename .htm .html *.htm

          will fix the extension of your html files. Provide an empty
          string for shortening:

              rename '_with_long_name' '' file_with_long_name.*

          will remove the substring in the filenames.


---------------------------------------------------------

::

          mv(1)


---------------------------------------------------------------------

::

          For bug reports, use the issue tracker at
          https://github.com/karelzak/util-linux/issues.


-----------------------------------------------------------------

::

          The rename command is part of the util-linux package which can be
          downloaded from Linux Kernel Archive
          <https://www.kernel.org/pub/linux/utils/util-linux/>. This page
          is part of the util-linux (a random collection of Linux
          utilities) project. Information about the project can be found at
          ⟨https://www.kernel.org/pub/linux/utils/util-linux/⟩. If you have
          a bug report for this manual page, send it to
          util-linux@vger.kernel.org. This page was obtained from the
          project's upstream Git repository
          ⟨git://git.kernel.org/pub/scm/utils/util-linux/util-linux.git⟩ on
          2021-08-27. (At that time, the date of the most recent commit
          that was found in the repository was 2021-08-24.) If you discover
          any rendering problems in this HTML version of the page, or you
          believe there is a better or more up-to-date source for the page,
          or you have corrections or improvements to the information in
          this COLOPHON (which is not part of the original manual page),
          send a mail to man-pages@man7.org

   util-linux 2.37.294-0c7e       2021-08-19                      RENAME(1)

--------------

Pages that refer to this page: `rename(2) <../man2/rename.2.html>`__, 
`strverscmp(3) <../man3/strverscmp.3.html>`__

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
