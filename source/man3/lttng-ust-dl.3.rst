.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

lttng-ust-dl(3) — Linux manual page
===================================

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

          lttng-ust-dl - Dynamic linker tracing (LTTng-UST helper)


---------------------------------------------------------

::

          Launch your application by preloading liblttng-ust-dl.so:

          $ LD_PRELOAD=liblttng-ust-dl.so my-app


---------------------------------------------------------------

::

          When the liblttng-ust-dl.so library is preloaded before a given
          application starts, it causes all calls to dlopen(3) and
          dlclose(3) in said application to be traced with LTTng-UST (see
          lttng-ust(3)).

          See lttng(1) to learn more about how to control LTTng tracing
          sessions.

              Important
              This LTTng-UST helper can also emit shared library
              load/unload events (see Shared library load/unload tracking
              in lttng-ust(3)). You should NOT use the event records
              generated by this LTTng-UST helper (prefixed with
              lttng_ust_dl:) to track the loading and unloading of shared
              libraries, especially in situations where a dynamically
              loaded library loads its own dependencies. Instead, do
              preload liblttng-ust-dl.so, but use the shared library
              load/unload event records, which are more reliable, for your
              tracking analysis.

          The following LTTng-UST events are available when using this
          library.

          lttng_ust_dl:dlopen
              Emitted when dlopen(3) is called.

              Fields:

              ┌───────────────┬──────────────────────────┐
              │Field name     │ Description              │
              ├───────────────┼──────────────────────────┤
              │baddr          │ Base address of loaded   │
              │               │ library.                 │
              ├───────────────┼──────────────────────────┤
              │memsz          │ Size of loaded library   │
              │               │ in memory.               │
              ├───────────────┼──────────────────────────┤
              │flags          │ Flags passed to          │
              │               │ dlopen(3).               │
              ├───────────────┼──────────────────────────┤
              │path           │ Path to loaded library   │
              │               │ file.                    │
              ├───────────────┼──────────────────────────┤
              │has_build_id   │ Whether or not the       │
              │               │ loaded library has a     │
              │               │ build ID. If this field  │
              │               │ is 1, you can expect     │
              │               │ that an                  │
              │               │ lttng_ust_dl:build_id    │
              │               │ event record follows     │
              │               │ this one (not            │
              │               │ necessarily immediately  │
              │               │ after).                  │
              ├───────────────┼──────────────────────────┤
              │has_debug_link │ Whether or not the       │
              │               │ loaded library has debug │
              │               │ link information. If     │
              │               │ this field is 1, you can │
              │               │ expect that an           │
              │               │ lttng_ust_dl:debug_link  │
              │               │ event record follows     │
              │               │ this one (not            │
              │               │ necessarily immediately  │
              │               │ after).                  │
              └───────────────┴──────────────────────────┘

          lttng_ust_dl:dlmopen
              Emitted when dlmopen(3) is called.

              Fields:

              ┌───────────────┬──────────────────────────┐
              │Field name     │ Description              │
              ├───────────────┼──────────────────────────┤
              │baddr          │ Base address of loaded   │
              │               │ library.                 │
              ├───────────────┼──────────────────────────┤
              │memsz          │ Size of loaded library   │
              │               │ in memory.               │
              ├───────────────┼──────────────────────────┤
              │nsid           │ ID of the namespace in   │
              │               │ which the library is     │
              │               │ loaded (as passed to     │
              │               │ dlmopen(3)).             │
              ├───────────────┼──────────────────────────┤
              │flags          │ Flags passed to          │
              │               │ dlmopen(3).              │
              ├───────────────┼──────────────────────────┤
              │path           │ Path to loaded library   │
              │               │ file.                    │
              ├───────────────┼──────────────────────────┤
              │has_build_id   │ Whether or not the       │
              │               │ loaded library has a     │
              │               │ build ID. If this field  │
              │               │ is 1, you can expect     │
              │               │ that an                  │
              │               │ lttng_ust_dl:build_id    │
              │               │ event record follows     │
              │               │ this one (not            │
              │               │ necessarily immediately  │
              │               │ after).                  │
              ├───────────────┼──────────────────────────┤
              │has_debug_link │ Whether or not the       │
              │               │ loaded library has debug │
              │               │ link information. If     │
              │               │ this field is 1, you can │
              │               │ expect that an           │
              │               │ lttng_ust_dl:debug_link  │
              │               │ event record follows     │
              │               │ this one (not            │
              │               │ necessarily immediately  │
              │               │ after).                  │
              └───────────────┴──────────────────────────┘

          lttng_ust_dl:dlclose
              Emitted when dlclose(3) is called.

              Fields:

              ┌───────────┬────────────────────────┐
              │Field name │ Description            │
              ├───────────┼────────────────────────┤
              │baddr      │ Base address of loaded │
              │           │ library.               │
              └───────────┴────────────────────────┘

          lttng_ust_dl:debug_link
              Emitted when debug link information is found when loading a
              library with dlopen(3). See Debugging Information in Separate
              Files <https://sourceware.org/gdb/onlinedocs/gdb/Separate-
              Debug-Files.html> for more information about debug links.

              Fields:

              ┌───────────┬────────────────────────┐
              │Field name │ Description            │
              ├───────────┼────────────────────────┤
              │baddr      │ Base address of loaded │
              │           │ library.               │
              ├───────────┼────────────────────────┤
              │filename   │ Debug link file name.  │
              ├───────────┼────────────────────────┤
              │crc        │ Debug link file’s CRC. │
              └───────────┴────────────────────────┘

          lttng_ust_dl:build_id
              Emitted when a build ID is found when loading a library with
              dlopen(3). See Debugging Information in Separate Files
              <https://sourceware.org/gdb/onlinedocs/gdb/Separate-Debug-
              Files.html> for more information about build IDs.

              Fields:

              ┌───────────┬────────────────────────┐
              │Field name │ Description            │
              ├───────────┼────────────────────────┤
              │baddr      │ Base address of loaded │
              │           │ library.               │
              ├───────────┼────────────────────────┤
              │build_id   │ Build ID.              │
              └───────────┴────────────────────────┘


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

          lttng-ust(3), dlopen(3), lttng(1)

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
`lttng-ust(3) <../man3/lttng-ust.3.html>`__, 
`babeltrace2-filter.lttng-utils.debug-info(7) <../man7/babeltrace2-filter.lttng-utils.debug-info.7.html>`__

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
