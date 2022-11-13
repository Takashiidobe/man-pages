.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

lttng-ust-cyg-profile(3) — Linux manual page
============================================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
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

   LTTNG-UST-DL(3)               LTTng Manual               LTTNG-UST-DL(3)

NAME
-------------------------------------------------

::

          lttng-ust-cyg-profile - Function tracing (LTTng-UST helper)


---------------------------------------------------------

::

          Compile your application with compiler option -finstrument-
          functions.

          Launch your application by preloading liblttng-ust-cyg-profile-
          fast.so for fast function tracing:

          $ LD_PRELOAD=liblttng-ust-cyg-profile-fast.so my-app

          Launch your application by preloading liblttng-ust-cyg-profile.so
          for slower, more verbose function tracing:

          $ LD_PRELOAD=liblttng-ust-cyg-profile.so my-app


---------------------------------------------------------------

::

          When the liblttng-ust-cyg-profile.so or the liblttng-ust-cyg-
          profile-fast.so library is preloaded before a given application
          starts, all function entry and return points are traced by
          LTTng-UST (see lttng-ust(3)), provided said application was
          compiled with the -finstrument-functions compiler option.

          See lttng(1) to learn more about how to control LTTng tracing
          sessions.

          Function tracing with LTTng-UST comes in two flavors, each one
          providing a different trade-off between performance and
          robustness:

          liblttng-ust-cyg-profile-fast.so
              This is a lightweight variant that should only be used where
              it can be guaranteed that the complete event stream is
              recorded without any missing events. Any kind of duplicate
              information is left out.

              At each function entry, the address of the called function is
              recorded in an LTTng-UST event. Function exits are recorded
              as another, empty LTTng-UST event.

              See the Fast function tracing section below for the complete
              list of emitted events and their fields.

          liblttng-ust-cyg-profile.so
              This is a more robust variant which also works for use cases
              where events might get discarded, or not recorded from
              application startup. In these cases, the trace analyzer needs
              extra information to be able to reconstruct the program flow.

              At each function entry and exit, the address of the called
              function and the call site address are recorded in an
              LTTng-UST event.

              See the Verbose function tracing section below for the
              complete list of emitted events and their fields.

      Usage
          To use LTTng-UST function tracing, you need to make sure the
          sources of your application are compiled with the -finstrument-
          functions compiler option.

          It might be necessary to limit the number of source files where
          this option is used to prevent excessive amount of trace data to
          be generated at run time. Usually, there are additional compiler
          flags that allow you to specify a more fine-grained selection of
          function instrumentation.

          For each instrumented function, the executable will contain calls
          to profiling function hooks (after function entry, named
          __cyg_profile_func_enter(), and just before function exit, named
          __cyg_profile_func_exit()).

          By preloading (using the LD_PRELOAD environment variable) one of
          the provided shared libraries, these profiling hooks get defined
          to emit LTTng events (as described below).

              Note
              Using this feature can result in a massive amount of trace
              data to be generated by the instrumented application.
              Application run time is also considerably affected. Be
              careful on systems with limited resources.

      Fast function tracing
          The following LTTng-UST events are available when using liblttng-
          ust-cyg-profile-fast.so. Their log level is set to
          TRACE_DEBUG_FUNCTION.

          lttng_ust_cyg_profile_fast:func_entry
              Emitted when an application function is entered, or more
              specifically, when __cyg_profile_func_enter() is called.

              Fields:

              ┌───────────┬───────────────────┐
              │Field name │ Description       │
              ├───────────┼───────────────────┤
              │func_addr  │ Function address. │
              └───────────┴───────────────────┘

          lttng_ust_cyg_profile_fast:func_exit
              Emitted when an application function returns, or more
              specifically, when __cyg_profile_func_exit() is called.

              This event has no fields. Since the liblttng-ust-cyg-profile-
              fast.so library should only be used when it can be guaranteed
              that the complete event stream is recorded without any
              missing events, a per-thread, stack-based approach can be
              used on the trace analyzer side to match function entry and
              return events.

      Verbose function tracing
          The following LTTng-UST events are available when using liblttng-
          ust-cyg-profile.so. Their log level is set to
          TRACE_DEBUG_FUNCTION.

          lttng_ust_cyg_profile:func_entry
              Emitted when an application function is entered, or more
              specifically, when __cyg_profile_func_enter() is called.

              Fields:

              ┌───────────┬─────────────────────────┐
              │Field name │ Description             │
              ├───────────┼─────────────────────────┤
              │func_addr  │ Function address.       │
              ├───────────┼─────────────────────────┤
              │call_site  │ Address from which this │
              │           │ function was called.    │
              └───────────┴─────────────────────────┘

          lttng_ust_cyg_profile:func_exit
              Emitted when an application function returns, or more
              specifically, when __cyg_profile_func_exit() is called.

              Fields:

              ┌───────────┬─────────────────────────┐
              │Field name │ Description             │
              ├───────────┼─────────────────────────┤
              │func_addr  │ Function address.       │
              ├───────────┼─────────────────────────┤
              │call_site  │ Address from which this │
              │           │ function was called.    │
              └───────────┴─────────────────────────┘


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

          This library is part of the LTTng-UST project.

          This library is distributed under the GNU Lesser General Public
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

          lttng-ust(3), lttng(1), gcc(1), ld.so(8)

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

   LTTng 2.10.6                   10/17/2019                LTTNG-UST-DL(3)

--------------

Pages that refer to this page:
`lttng-ust(3) <../man3/lttng-ust.3.html>`__

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
