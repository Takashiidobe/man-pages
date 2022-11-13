.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

lttng-crash(1) — Linux manual page
==================================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `OPTIONS <#OPTIONS>`__ \|         |                                   |
| `EXIT STATUS <#EXIT_STATUS>`__ \| |                                   |
| `BUGS <#BUGS>`__ \|               |                                   |
| `RESOURCES <#RESOURCES>`__ \|     |                                   |
| `COPYRIGHTS <#COPYRIGHTS>`__ \|   |                                   |
| `THANKS <#THANKS>`__ \|           |                                   |
| `AUTHORS <#AUTHORS>`__ \|         |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   LTTNG-CRASH(1)                LTTng Manual                LTTNG-CRASH(1)

NAME
-------------------------------------------------

::

          lttng-crash - Recover and view LTTng 2 trace buffers in the event
          of a crash


---------------------------------------------------------

::

          lttng-crash [--extract=PATH | --viewer=VIEWER] [-v | -vv | -vvv]


---------------------------------------------------------------

::

          The Linux Trace Toolkit: next generation <https://lttng.org/> is
          an open source software package used for correlated tracing of
          the Linux kernel, user applications, and user libraries.

          LTTng consists of Linux kernel modules (for Linux kernel tracing)
          and dynamically loaded libraries (for user application and
          library tracing).

          The lttng-crash command-line tool is used to recover and view
          LTTng trace buffers in the event of a system crash.


-------------------------------------------------------

::

          -x PATH, --extract=PATH
              Extract recovered traces to path PATH; do not execute the
              trace viewer.

          -v, --verbose
              Increase verbosity.

              Three levels of verbosity are available, which are triggered
              by appending additional v letters to the option (that is, -vv
              and -vvv).

          -e VIEWER, --viewer=VIEWER
              Use trace viewer VIEWER to view the trace buffers.  VIEWER is
              the absolute path to the viewer command to use, and it can
              contain command arguments as well. The trace directory paths
              are passed to the VIEWER command as its last arguments.

              Default: babeltrace.

      Program information
          -h, --help
              Show help.

          -V, --version
              Show version.


---------------------------------------------------------------

::

          0
              Success

          1
              Error

          3
              Fatal error


-------------------------------------------------

::

          If you encounter any issue or usability problem, please report it
          on the LTTng bug tracker <https://bugs.lttng.org/projects/lttng-
          tools>.


-----------------------------------------------------------

::

          •   LTTng project website <https://lttng.org>

          •   LTTng documentation <https://lttng.org/docs>

          •   Git repositories <http://git.lttng.org>

          •   GitHub organization <http://github.com/lttng>

          •   Continuous integration <http://ci.lttng.org/>

          •   Mailing list <http://lists.lttng.org> for support and
              development: lttng-dev@lists.lttng.org

          •   IRC channel <irc://irc.oftc.net/lttng>: #lttng on
              irc.oftc.net


-------------------------------------------------------------

::

          This program is part of the LTTng-tools project.

          LTTng-tools is distributed under the GNU General Public License
          version 2 <http://www.gnu.org/licenses/old-
          licenses/gpl-2.0.en.html>. See the LICENSE
          <https://github.com/lttng/lttng-tools/blob/master/LICENSE> file
          for details.


-----------------------------------------------------

::

          Special thanks to Michel Dagenais and the DORSAL laboratory
          <http://www.dorsal.polymtl.ca/> at École Polytechnique de
          Montréal for the LTTng journey.

          Also thanks to the Ericsson teams working on tracing which helped
          us greatly with detailed bug reports and unusual test cases.


-------------------------------------------------------

::

          LTTng-tools was originally written by Mathieu Desnoyers, Julien
          Desfossez, and David Goulet. More people have since contributed
          to it.

          LTTng-tools is currently maintained by Jérémie Galarneau
          <mailto:jeremie.galarneau@efficios.com>.


---------------------------------------------------------

::

          lttng(1), lttng-sessiond(8), lttng-relayd(8), lttng-ust(3),
          babeltrace(1)

COLOPHON
---------------------------------------------------------

::

          This page is part of the LTTng-Tools (    LTTng tools) project.
          Information about the project can be found at 
          ⟨http://lttng.org/⟩.  It is not known how to report bugs for this
          man page; if you know, please send a mail to man-pages@man7.org.
          This page was obtained from the project's upstream Git repository
          ⟨git://git.lttng.org/lttng-tools.git⟩ on 2019-11-19.  (At that
          time, the date of the most recent commit that was found in the
          repository was 2019-11-14.)  If you discover any rendering
          problems in this HTML version of the page, or you believe there
          is a better or more up-to-date source for the page, or you have
          corrections or improvements to the information in this COLOPHON
          (which is not part of the original manual page), send a mail to
          man-pages@man7.org

   LTTng 2.12.0-pre               10/29/2018                 LTTNG-CRASH(1)

--------------

Pages that refer to this page: `lttng(1) <../man1/lttng.1.html>`__, 
`lttng-create(1) <../man1/lttng-create.1.html>`__, 
`babeltrace2-source.ctf.fs(7) <../man7/babeltrace2-source.ctf.fs.7.html>`__, 
`lttng-relayd(8) <../man8/lttng-relayd.8.html>`__, 
`lttng-sessiond(8) <../man8/lttng-sessiond.8.html>`__

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
