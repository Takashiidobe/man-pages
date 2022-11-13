.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

look(1) — Linux manual page
===========================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `OPTIONS <#OPTIONS>`__ \|         |                                   |
| `ENVIRONMENT <#ENVIRONMENT>`__ \| |                                   |
| `FILES <#FILES>`__ \|             |                                   |
| `HISTORY <#HISTORY>`__ \|         |                                   |
| `EXAMPLES <#EXAMPLES>`__ \|       |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `RE                               |                                   |
| PORTING BUGS <#REPORTING_BUGS>`__ |                                   |
| \|                                |                                   |
| `AVAILABILITY <#AVAILABILITY>`__  |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   LOOK(1)                       User Commands                      LOOK(1)

NAME
-------------------------------------------------

::

          look - display lines beginning with a given string


---------------------------------------------------------

::

          look [options] string [file]


---------------------------------------------------------------

::

          The look utility displays any lines in file which contain string.
          As look performs a binary search, the lines in file must be
          sorted (where sort(1) was given the same options -d and/or -f
          that look is invoked with).

          If file is not specified, the file /usr/share/dict/words is used,
          only alphanumeric characters are compared and the case of
          alphabetic characters is ignored.


-------------------------------------------------------

::

          -a, --alternative
              Use the alternative dictionary file.

          -d, --alphanum
              Use normal dictionary character set and order, i.e., only
              blanks and alphanumeric characters are compared. This is on
              by default if no file is specified.

              Note that blanks have been added to dictionary character set
              for compatibility with sort -d command since version 2.28.

          -f, --ignore-case
              Ignore the case of alphabetic characters. This is on by
              default if no file is specified.

          -t, --terminate character
              Specify a string termination character, i.e., only the
              characters in string up to and including the first occurrence
              of character are compared.

          -V, --version
              Display version information and exit.

          -h, --help
              Display help text and exit.

          The look utility exits 0 if one or more lines were found and
          displayed, 1 if no lines were found, and >1 if an error occurred.


---------------------------------------------------------------

::

          WORDLIST
              Path to a dictionary file. The environment variable has
              greater priority than the dictionary path defined in FILES
              segment.


---------------------------------------------------

::

          /usr/share/dict/words
              the dictionary

          /usr/share/dict/web2
              the alternative dictionary


-------------------------------------------------------

::

          The look utility appeared in Version 7 AT&T Unix.


---------------------------------------------------------

::

              sort -d /etc/passwd -o /tmp/look.dict
              look -t: root:foobar /tmp/look.dict


---------------------------------------------------------

::

          grep(1), sort(1)


---------------------------------------------------------------------

::

          For bug reports, use the issue tracker at
          https://github.com/karelzak/util-linux/issues.


-----------------------------------------------------------------

::

          The look command is part of the util-linux package which can be
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

   util-linux 2.37.85-637cc       2021-04-02                        LOOK(1)

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
