.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

lttng-gen-tp(1) — Linux manual page
===================================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `OPTIONS <#OPTIONS>`__ \|         |                                   |
| `ENVIRONMENT VARI                 |                                   |
| ABLES <#ENVIRONMENT_VARIABLES>`__ |                                   |
| \| `EXIT STATUS <#EXIT_STATUS>`__ |                                   |
| \| `BUGS <#BUGS>`__ \|            |                                   |
| `RESOURCES <#RESOURCES>`__ \|     |                                   |
| `COPYRIGHTS <#COPYRIGHTS>`__ \|   |                                   |
| `AUTHOR <#AUTHOR>`__ \|           |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   LTTNG-GEN-TP(1)               LTTng Manual               LTTNG-GEN-TP(1)

NAME
-------------------------------------------------

::

          lttng-gen-tp - Generate LTTng-UST tracepoint provider code


---------------------------------------------------------

::

          lttng-gen-tp [--verbose] [--output=FILE.c]
                       [--output=FILE.h] [--output=FILE.o] TEMPLATE


---------------------------------------------------------------

::

          The lttng-gen-tp tool simplifies the generation of LTTng-UST
          tracepoint provider files. It takes a simple template file,
          TEMPLATE, and generates the necessary C code to use the defined
          tracepoints in your application. See the Template file format
          section below for more information about the format of TEMPLATE.

          Currently, lttng-gen-tp can generate the .h, .c, and .o files
          associated with your tracepoint provider. The generated .h file
          can be included directly in your application. You can let lttng-
          gen-tp generate the .o file or compile the .c file yourself. See
          lttng-ust(3) for more information about compiling LTTng-UST
          tracepoint providers.

          By default, lttng-gen-tp generates the .h, .c, and .o files,
          their basename being the basename of TEMPLATE. You can generate
          one or more specific file types with the --output option,
          repeated if needed.

      Template file format
          The template file, which usually has the .tp extension, contains
          a list of TRACEPOINT_EVENT() definitions and other optional
          definition entries, like TRACEPOINT_LOGLEVEL(). See lttng-ust(3)
          for the complete list of available definitions.

          The TRACEPOINT_EVENT() definitions are written as you would write
          them in an LTTng-UST template provider header file. C comments
          are supported (/* */ and //), as well as lines starting with #.

              Note
              The provider name (the first argument of TRACEPOINT_EVENT())
              must be the same in all the TRACEPOINT_EVENT() macros of
              TEMPLATE.

          Here’s an example:

              TRACEPOINT_EVENT(
                  // Tracepoint provider name
                  my_provider,

                  // Tracepoint/event name
                  my_event,

                  // Tracepoint arguments (input)
                  TP_ARGS(char *, text),

                  // Tracepoint/event fields (output)
                  TP_FIELDS(
                      ctf_string(message, text)
                  )
              )


-------------------------------------------------------

::

          -o, --output=FILE
              Do not generate default files: generate FILE.

              The extension of FILE determines what is generated, amongst
              .h, .c, and .o. This option can be used more than one time to
              generate different file types.

          -v, --verbose
              Increase verbosity.

          -h, --help
              Show command help.


-----------------------------------------------------------------------------------

::

          CC
              C compiler to use. Default: cc, then gcc if cc is not found.
              This option is only relevant when generating the .o file.

          CFLAGS
              Flags and options passed directly to the compiler ($CC). This
              option is only relevant when generating the .o file.


---------------------------------------------------------------

::

          0
              Success

          Non-zero
              Error


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

          lttng-gen-tp is part of the LTTng-UST project.

          lttng-gen-tp is distributed under the GNU General Public License,
          version 2 <http://www.gnu.org/licenses/old-
          licenses/gpl-2.0.en.html>. See the COPYING
          <https://github.com/lttng/lttng-ust/blob/v2.10.6/COPYING> file
          for more details.


-----------------------------------------------------

::

          lttng-gen-tp was originally written by Yannick Brosseau
          <mailto:yannick.brosseau@gmail.com>. It is currently maintained
          by Mathieu Desnoyers <mailto:mathieu.desnoyers@efficios.com>.


---------------------------------------------------------

::

          lttng-ust(3)

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

   LTTng 2.10.6                   10/17/2019                LTTNG-GEN-TP(1)

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
