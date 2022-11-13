.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

abilint(1) — Linux manual page
==============================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `INVOCATION <#INVOCATION>`__ \|   |                                   |
| `OPTIONS <#OPTIONS>`__ \|         |                                   |
| `AUTHOR <#AUTHOR>`__ \|           |                                   |
| `COPYRIGHT <#COPYRIGHT>`__ \|     |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   ABILINT(1)                     Libabigail                     ABILINT(1)

NAME
-------------------------------------------------

::

          abilint - validate an abigail ABI representation

          abilint parses the native XML representation of an ABI as emitted
          by abidw.  Once it has parsed the XML representation of the ABI,
          abilint builds and in-memory model from it.  It then tries to
          save it back to an XML form, to standard output.  If that
          read-write operation succeeds chances are the input XML ABI
          representation is meaningful.

          Note that the main intent of this tool to help debugging issues
          in the underlying Libabigail library.

          Note also that abilint can also read an ELF input file, build the
          in-memory model for its ABI, and serialize that model back into
          XML to standard output.  In that case, the ELF input file must be
          accompanied with its debug information in the DWARF format.


-------------------------------------------------------------

::

             abilint [options] [<abi-file1>]


-------------------------------------------------------

::

             • --help

               Display a short help message and exits.

             • --version | -v

               Display the version of the program and exit.

             • --debug-info-dir <path>

               When reading an ELF input file which debug information is
               split out into a separate file, this options tells abilint
               where to find that separate debug information file.

               Note that path must point to the root directory under which
               the debug information is arranged in a tree-like manner.
               Under Red Hat based systems, that directory is usually
               <root>/usr/lib/debug.

               Note also that this option is not mandatory for split debug
               information installed by your system's package manager
               because then abidiff knows where to find it.

             • --diff

               For XML inputs, perform a text diff between the input and
               the memory model saved back to disk.  This can help to spot
               issues in the handling of the XML format by the underlying
               Libabigail library.

             • --noout

               Do not display anything on standard output.  The return code
               of the command is the only way to know if the command
               succeeded.

             • --suppressions | suppr
               <path-to-suppression-specifications-file>

               Use a suppression specification file located at
               path-to-suppression-specifications-file.  Note that this
               option can appear multiple times on the command line.  In
               that case, all of the provided suppression specification
               files are taken into account.  ABI artifacts matched by the
               suppression specifications are suppressed from the output of
               this tool.

             • --headers-dir | --hd <headers-directory-path-1>

               Specifies where to find the public headers of the first
               shared library that the tool has to consider.  The tool will
               thus filter out types that are not defined in public
               headers.

             • --header-file | --hf <header-file-path>

               Specifies where to find one of the public headers of the abi
               file that the tool has to consider.  The tool will thus
               filter out types that are not defined in public headers.

             • --stdin | --

               Read the input content from standard input.

             • --tu

               Expect the input XML to represent a single translation unit.


-----------------------------------------------------

::

          Dodji Seketeli


-----------------------------------------------------------

::

          2014-2016, Red Hat, Inc.

COLOPHON
---------------------------------------------------------

::

          This page is part of the libabigail (ABI Generic Analysis and
          Instrumentation Library) project.  Information about the project
          can be found at ⟨https://sourceware.org/libabigail/⟩.  If you
          have a bug report for this manual page, see
          ⟨http://sourceware.org/bugzilla/enter_bug.cgi?product=libabigail⟩.
          This page was obtained from the project's upstream Git repository
          ⟨git://sourceware.org/git/libabigail.git⟩ on 2021-08-27.  (At
          that time, the date of the most recent commit that was found in
          the repository was 2021-08-11.)  If you discover any rendering
          problems in this HTML version of the page, or you believe there
          is a better or more up-to-date source for the page, or you have
          corrections or improvements to the information in this COLOPHON
          (which is not part of the original manual page), send a mail to
          man-pages@man7.org

                                 Aug 27, 2021                    ABILINT(1)

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
