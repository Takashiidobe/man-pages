.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

babeltrace2-filter.lttng-utils.debug-info(7) — Linux manual page
================================================================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `INITIALIZATION PARAMETER         |                                   |
| S <#INITIALIZATION_PARAMETERS>`__ |                                   |
| \| `PORTS <#PORTS>`__ \|          |                                   |
| `BUGS <#BUGS>`__ \|               |                                   |
| `RESOURCES <#RESOURCES>`__ \|     |                                   |
| `AUTHORS <#AUTHORS>`__ \|         |                                   |
| `COPYRIGHT <#COPYRIGHT>`__ \|     |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   BABELTRACE2-FILTER()                                BABELTRACE2-FILTER()

NAME
-------------------------------------------------

::

          babeltrace2-filter.lttng-utils.debug-info - Babeltrace 2's
          debugging information filter component class for LTTng traces


---------------------------------------------------------------

::

          A Babeltrace 2 filter.lttng-utils.debug-info message iterator
          creates and emits copies of upstream messages, augmenting LTTng
          event messages with debugging information when it’s available and
          possible.

              Messages without
              debugging information
                |
                |  +----------------------------+
                |  | flt.lttng-utils.debug-info |
                |  |                            |
                '->@ in                     out @--> Messages with
                   +----------------------------+    debugging information

          See babeltrace2-intro(7) to learn more about the Babeltrace 2
          project and its core concepts.

          A filter.lttng-utils.debug-info message iterator uses the LTTng
          state dump events as well as the event common context’s ip
          (instruction pointer) and vpid (process ID) fields to locate and
          read the corresponding debugging information. The message
          iterator can find the extra debugging information in an
          executable file or in a directory containing debugging
          information which the compiler creates.

          The new LTTng events (copies of the original ones with added
          debugging information) contain, when possible, a new event common
          context’s structure field (besides the ip field) named debug_info
          by default (you can use the debug-info-field-name parameter to
          choose another name). This structure field contains the following
          fields:

          bin [string]
              Executable path or name followed with @ADDR or +ADDR, where
              ADDR is the address (hexadecimal) where it was loaded while
              being traced.

              @ADDR means ADDR is an absolute address, and +ADDR means ADDR
              is a relative address.

              Examples: my-program@0x4b7fdd23, my-program+0x18d7c.

          func [string]
              Function name followed with +OFFSET, where OFFSET is the
              offset (hexadecimal) from the beginning of the function
              symbol in the executable file.

              Example: load_user_config+0x194.

          src [string]
              Source file path or name followed with :LINE, where LINE is
              the line number in this source file at which the event
              occurred.

              Example: user-config.c:1025.

          Any of the previous fields can be an empty string if the
          debugging information was not available for the analyzed original
          LTTng event.

          A filter.lttng-utils.debug-info message iterator systematically
          copies the upstream messages, but it only augments compatible
          LTTng event classes. This means that the message iterator copies
          messages of non-LTTng trace (see “LTTng prerequisites”) without
          alteration.

      Compile an executable for debugging information analysis
          With GCC or Clang, you need to compile the program or library
          source files in debug mode with the -g option. This option makes
          the compiler generate debugging information in the operating
          system’s native format. This format is recognized by a
          filter.lttng-utils.debug-info component: it can translate the
          instruction pointer field of an event’s common context to a
          source file and line number, along with the name of the
          surrounding function.

              Important
              This component class only supports the debugging information
              in DWARF format, version 2 or later. Use the -gdwarf or
              -gdwarf-VERSION (where VERSION is the DWARF version) compiler
              options to explicitly generate DWARF debugging information.

          If you don’t compile the executable’s source files with the -g
          option or with an equivalent option, no DWARF information is
          available: the message iterator uses ELF symbols from the
          executable file instead. In this case, the events that the
          message iterator creates do not contain the source file and line
          number (see the src field), but only the name of the nearest
          function symbol with an offset in bytes to the location in the
          executable from which the LTTng event occurred (see the func
          field).

          If the executable file has neither ELF symbols nor DWARF
          information, the filter.lttng-utils.debug-info message iterator
          cannot map the event to its source location: the message iterator
          still copies the upstream messages but without altering them.

      LTTng prerequisites
          A filter.lttng-utils.debug-info message iterator can only analyze
          user space events which LTTng (see <https://lttng.org>) 2.8.0 or
          later generates.

          To get debugging information for LTTng-UST events which occur in
          executables and libraries which the system’s loader loads (what
          you can see with ldd(1)):

           1. Add the ip and vpid context fields to user space event
              records:

                  $ lttng add-context --userspace --type=ip --type=vpid

              See lttng-add-context(1) for more details.

           2. Enable the LTTng-UST state dump events:

                  $ lttng enable-event --userspace 'lttng_ust_statedump:*'

              See lttng-enable-event(1) and lttng-ust(3) for more details.

          To get debugging information for LTTng-UST events which occur in
          dynamically loaded objects, for example plugins:

           1. Do the previous steps (add context fields and enable the
              LTTng-UST state dump events).

           2. Enable the LTTng-UST dynamic linker tracing helper events:

                  $ lttng enable-event --userspace 'lttng_ust_dl:*'

              See lttng-ust-dl(3) for more details.

           3. When you are ready to trace, start your application with the
              LD_PRELOAD environment variable set to liblttng-ust-dl.so:

                  $ LD_PRELOAD=liblttng-ust-dl.so my-app

      Separate debugging information
          You can store DWARF debugging information outside the executable
          itself, whether it is to reduce the executable’s file size or
          simply to facilitate sharing the debugging information.

          This is usually achieved via one of two mechanisms, namely build
          ID and debug link. Their use and operation is described in the
          Debugging Information in Separate Files (see
          <https://sourceware.org/gdb/onlinedocs/gdb/Separate-Debug-
          Files.html>) section of GDB’s documentation.

          A filter.lttng-utils.debug-info message iterator can find
          separate debugging information files automatically, as long as
          they meet the requirements stated in this manual page.

          The debugging information lookup order is the same as GDB’s,
          namely:

           1. Within the executable file itself.

           2. Through the build ID method in the /usr/lib/debug/.build-id
              directory.

           3. In the various possible debug link locations.

          The message iterator uses the first debugging information file
          that it finds.

          You can use the debug-info-dir initialization parameter to
          override the default /usr/lib/debug directory used in the build
          ID and debug link methods.

              Note
              It is currently not possible to make this component search
              for debugging information in multiple directories.

      Target prefix
          The debugging information analysis that a filter.lttng-
          utils.debug-info message iterator performs uses the paths to the
          executables as collected during tracing as the default mechanism
          to resolve DWARF and ELF information.

          If the trace was recorded on a separate machine, however, you can
          use the target-prefix parameter to specify a prefix directory,
          that is, the root of the target file system.

          For example, if an instrumented executable’s path is /usr/bin/foo
          on the target system, you can place this file at
          /home/user/target/usr/bin/foo on the system on which you use a
          filter.lttng-utils.debug-info component. In this case, the target
          prefix to use is /home/user/target.


-------------------------------------------------------------------------------------------

::

          debug-info-dir=DIR [optional string]
              Use DIR as the directory from which to load debugging
              information with the build ID and debug link methods instead
              of /usr/lib/debug.

          debug-info-field-name=NAME [optional string]
              Name the debugging information structure field in the common
              context of the created events NAME instead of the default
              debug_info.

          full-path=yes [optional boolean]
              Use the full path when writing the executable name (bin) and
              source file name (src) fields in the debug_info context field
              of the created events.

          target-prefix=DIR [optional string]
              Use DIR as the root directory of the target file system
              instead of /.


---------------------------------------------------

::

              +----------------------------+
              | flt.lttng-utils.debug-info |
              |                            |
              @ in                     out @
              +----------------------------+

      Input
          in
              Single input port.

      Output
          out
              Single output port.


-------------------------------------------------

::

          If you encounter any issue or usability problem, please report it
          on the Babeltrace bug tracker (see
          <https://bugs.lttng.org/projects/babeltrace>).


-----------------------------------------------------------

::

          The Babeltrace project shares some communication channels with
          the LTTng project (see <https://lttng.org/>).

          •   Babeltrace website (see <https://babeltrace.org/>)

          •   Mailing list (see <https://lists.lttng.org>) for support and
              development: lttng-dev@lists.lttng.org

          •   IRC channel (see <irc://irc.oftc.net/lttng>): #lttng on
              irc.oftc.net

          •   Bug tracker (see
              <https://bugs.lttng.org/projects/babeltrace>)

          •   Git repository (see
              <https://git.efficios.com/?p=babeltrace.git>)

          •   GitHub project (see <https://github.com/efficios/babeltrace>)

          •   Continuous integration (see
              <https://ci.lttng.org/view/Babeltrace/>)

          •   Code review (see
              <https://review.lttng.org/q/project:babeltrace>)


-------------------------------------------------------

::

          The Babeltrace 2 project is the result of hard work by many
          regular developers and occasional contributors.

          The current project maintainer is Jérémie Galarneau
          <mailto:jeremie.galarneau@efficios.com>.


-----------------------------------------------------------

::

          This component class is part of the Babeltrace 2 project.

          Babeltrace is distributed under the MIT license (see
          <https://opensource.org/licenses/MIT>).


---------------------------------------------------------

::

          babeltrace2-intro(7), babeltrace2-plugin-lttng-utils(7),
          lttng(1), lttng-add-context(1)

COLOPHON
---------------------------------------------------------

::

          This page is part of the babeltrace (trace read and write
          libraries and a trace converter) project.  Information about the
          project can be found at ⟨http://www.efficios.com/babeltrace⟩.  If
          you have a bug report for this manual page, send it to
          lttng-dev@lists.lttng.org.  This page was obtained from the
          project's upstream Git repository
          ⟨git://git.efficios.com/babeltrace.git⟩ on 2021-08-27.  (At that
          time, the date of the most recent commit that was found in the
          repository was 2021-08-20.)  If you discover any rendering
          problems in this HTML version of the page, or you believe there
          is a better or more up-to-date source for the page, or you have
          corrections or improvements to the information in this COLOPHON
          (which is not part of the original manual page), send a mail to
          man-pages@man7.org

                                                       BABELTRACE2-FILTER()

--------------

Pages that refer to this page:
`babeltrace2(1) <../man1/babeltrace2.1.html>`__, 
`babeltrace2-convert(1) <../man1/babeltrace2-convert.1.html>`__, 
`babeltrace2-plugin-lttng-utils(7) <../man7/babeltrace2-plugin-lttng-utils.7.html>`__

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
