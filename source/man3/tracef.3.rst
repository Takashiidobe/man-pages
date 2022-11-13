.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

tracef(3) — Linux manual page
=============================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `EXAMPLE <#EXAMPLE>`__ \|         |                                   |
| `LIMITATIONS <#LIMITATIONS>`__ \| |                                   |
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

   TRACEF(3)                     LTTng Manual                     TRACEF(3)

NAME
-------------------------------------------------

::

          tracef - LTTng-UST printf(3)-like interface


---------------------------------------------------------

::

          #include <lttng/tracef.h>

          #define tracef(fmt, ...)

          Link with -llttng-ust.


---------------------------------------------------------------

::

          The LTTng-UST tracef() API allows you to trace your application
          with the help of a simple printf(3)-like macro. The fmt argument
          is passed directly to the fmt parameter of vasprintf(3), as well
          as the optional parameters following fmt.

          To use tracef(), include <lttng/tracef.h> where you need it, and
          link your application with liblttng-ust. See the EXAMPLE section
          below for a complete usage example.

          Once your application is instrumented with tracef() calls and
          ready to run, use lttng-enable-event(1) to enable the
          lttng_ust_tracef:* event.

          The tracef() events contain a single field, named msg, which is
          the formatted string output.

          If you need to attach a specific log level to a tracef() call,
          use tracelog(3) instead.

          See also the LIMITATIONS section below for important limitations
          to consider when using tracef().


-------------------------------------------------------

::

          Here’s a usage example of tracef():

              #include <stdlib.h>
              #include <lttng/tracef.h>

              int main(void)
              {
                  int i;

                  for (i = 0; i < 25; i++) {
                      tracef("my message: %s, this integer: %d", "a message", i);
                  }

                  return EXIT_SUCCESS;
              }

          This C source file, saved as app.c, can be compiled into a
          program like this:

              $ cc -o app app.c -llttng-ust

          You can create an LTTng tracing session, enable the tracef()
          events, and start the created tracing session like this:

              $ lttng create my-session
              $ lttng enable-event --userspace 'lttng_ust_tracef:*'
              $ lttng start

          Next, start the program to be traced:

              $ ./app

          Finally, stop the tracing session, and inspect the recorded
          events:

              $ lttng stop
              $ lttng view


---------------------------------------------------------------

::

          The tracef() utility macro was developed to make user space
          tracing super simple, albeit with notable disadvantages compared
          to custom, full-fledged tracepoint providers:

          •   All generated events have the same provider/event names.

          •   There’s no static type checking.

          •   The only event field with user data you actually get, named
              msg, is a string potentially containing the values you passed
              to the macro using your own format. This also means that you
              cannot use filtering using a custom expression at run time
              because there are no isolated fields.

          •   Since tracef() uses C standard library’s vasprintf(3)
              function in the background to format the strings at run time,
              its expected performance is lower than using custom
              tracepoint providers with typed fields, which do not require
              a conversion to a string.

          •   Generally, a string containing the textual representation of
              the user data fields is not as compact as binary fields in
              the resulting trace.

          Thus, tracef() is useful for quick prototyping and debugging, but
          should not be considered for any permanent/serious application
          instrumentation.

          See lttng-ust(3) to learn more about custom tracepoint providers.


-------------------------------------------------

::

          If you encounter any issue or usability problem, please report it
          on the LTTng bug tracker <https://bugs.lttng.org/projects/lttng-
          ust>.


-----------------------------------------------------------

::

          •   LTTng project website <http://lttng.org>

          •   LTTng documentation <http://lttng.org/docs>

          •   Git repositories <http://git.lttng.org>

          •   GitHub organization <http://github.com/lttng>

          •   Continuous integration <http://ci.lttng.org/>

          •   Mailing list <http://lists.lttng.org> for support and
              development: lttng-dev@lists.lttng.org

          •   IRC channel <irc://irc.oftc.net/lttng>: #lttng on
              irc.oftc.net


-------------------------------------------------------------

::

          This macro is part of the LTTng-UST project.

          This macro is distributed under the GNU Lesser General Public
          License, version 2.1 <http://www.gnu.org/licenses/old-
          licenses/lgpl-2.1.en.html>. See the COPYING
          <https://github.com/lttng/lttng-ust/blob/v2.10.6/COPYING> file
          for more details.


-----------------------------------------------------

::

          Thanks to Ericsson for funding this work, providing real-life use
          cases, and testing.

          Special thanks to Michel Dagenais and the DORSAL laboratory
          <http://www.dorsal.polymtl.ca/> at École Polytechnique de
          Montréal for the LTTng journey.


-------------------------------------------------------

::

          LTTng-UST was originally written by Mathieu Desnoyers, with
          additional contributions from various other people. It is
          currently maintained by Mathieu Desnoyers
          <mailto:mathieu.desnoyers@efficios.com>.


---------------------------------------------------------

::

          tracelog(3), lttng-ust(3), lttng(1), printf(3)

COLOPHON
---------------------------------------------------------

::

          This page is part of the LTTng-UST (    LTTng Userspace Tracer)
          project.  Information about the project can be found at 
          ⟨http://lttng.org/⟩.  It is not known how to report bugs for this
          man page; if you know, please send a mail to man-pages@man7.org.
          This page was obtained from the tarball lttng-ust-2.11.0.tar.bz2
          fetched from ⟨https://lttng.org/files/lttng-ust/⟩ on 2019-11-19.
          If you discover any rendering problems in this HTML version of
          the page, or you believe there is a better or more up-to-date
          source for the page, or you have corrections or improvements to
          the information in this COLOPHON (which is not part of the
          original manual page), send a mail to man-pages@man7.org

   LTTng 2.10.6                   10/17/2019                      TRACEF(3)

--------------

Pages that refer to this page:
`lttng-ust(3) <../man3/lttng-ust.3.html>`__, 
`tracelog(3) <../man3/tracelog.3.html>`__

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
