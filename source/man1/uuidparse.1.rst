.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

uuidparse(1) — Linux manual page
================================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `OUTPUT <#OUTPUT>`__ \|           |                                   |
| `OPTIONS <#OPTIONS>`__ \|         |                                   |
| `AUTHORS <#AUTHORS>`__ \|         |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `RE                               |                                   |
| PORTING BUGS <#REPORTING_BUGS>`__ |                                   |
| \|                                |                                   |
| `AVAILABILITY <#AVAILABILITY>`__  |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   UUIDPARSE(1)                  User Commands                 UUIDPARSE(1)

NAME
-------------------------------------------------

::

          uuidparse - a utility to parse unique identifiers


---------------------------------------------------------

::

          uuidparse [options] uuid


---------------------------------------------------------------

::

          This command will parse unique identifier inputs from either
          command line arguments or standard input. The inputs are
          white-space separated.


-----------------------------------------------------

::

      Variants
          ┌──────────┬──────────────────────────┐
          │          │                          │
          │NCS       │ Network Computing System │
          │          │ identifier. These were   │
          │          │ the original UUIDs.      │
          ├──────────┼──────────────────────────┤
          │          │                          │
          │DCE       │ The Open Software        │
          │          │ Foundation’s (OSF)       │
          │          │ Distributed Computing    │
          │          │ Environment UUIDs.       │
          ├──────────┼──────────────────────────┤
          │          │                          │
          │Microsoft │ Microsoft Windows        │
          │          │ platform globally unique │
          │          │ identifier (GUID).       │
          ├──────────┼──────────────────────────┤
          │          │                          │
          │other     │ Unknown variant. Usually │
          │          │ invalid input data.      │
          └──────────┴──────────────────────────┘

      Types
          ┌───────────┬──────────────────────────┐
          │           │                          │
          │nil        │ Special type for zero in │
          │           │ type file.               │
          ├───────────┼──────────────────────────┤
          │           │                          │
          │time-based │ The DCE time based.      │
          ├───────────┼──────────────────────────┤
          │           │                          │
          │DCE        │ The DCE time and MAC     │
          │           │ Address.                 │
          ├───────────┼──────────────────────────┤
          │           │                          │
          │name-based │ RFC 4122 md5sum hash.    │
          ├───────────┼──────────────────────────┤
          │           │                          │
          │random     │ RFC 4122 random.         │
          ├───────────┼──────────────────────────┤
          │           │                          │
          │sha1-based │ RFC 4122 sha-1 hash.     │
          ├───────────┼──────────────────────────┤
          │           │                          │
          │unknown    │ Unknown type. Usually    │
          │           │ invalid input data.      │
          └───────────┴──────────────────────────┘


-------------------------------------------------------

::

          -J, --json
              Use JSON output format.

          -n, --noheadings
              Do not print a header line.

          -o, --output
              Specify which output columns to print. Use --help to get a
              list of all supported columns.

          -r, --raw
              Use the raw output format.

          -V, --version
              Display version information and exit.

          -h, --help
              Display help text and exit.


-------------------------------------------------------

::

          Sami Kerola <kerolasa@iki.fi>


---------------------------------------------------------

::

          uuidgen(1), libuuid(3), RFC 4122
          <https://tools.ietf.org/html/rfc4122>


---------------------------------------------------------------------

::

          For bug reports, use the issue tracker at
          https://github.com/karelzak/util-linux/issues.


-----------------------------------------------------------------

::

          The uuidparse command is part of the util-linux package which can
          be downloaded from Linux Kernel Archive
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

   util-linux 2.37.85-637cc       2021-04-02                   UUIDPARSE(1)

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
