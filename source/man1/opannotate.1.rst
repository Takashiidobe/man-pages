.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

opannotate(1) — Linux manual page
=================================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `OPTIONS <#OPTIONS>`__ \|         |                                   |
| `ENVIRONMENT <#ENVIRONMENT>`__ \| |                                   |
| `FILES <#FILES>`__ \|             |                                   |
| `VERSION <#VERSION>`__ \|         |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   OPANNOTATE(1)            General Commands Manual           OPANNOTATE(1)

NAME
-------------------------------------------------

::

          opannotate - produce source or assembly annotated with profile
          data


---------------------------------------------------------

::

          opannotate [ options ] [profile specification]


---------------------------------------------------------------

::

          opannotate outputs annotated source and/or assembly from profile
          data of an OProfile session. See oprofile(1) for how to write
          profile specifications.


-------------------------------------------------------

::

          --assembly / -a
                 Output annotated assembly. The binary file to be annotated
                 does not need full debugging information to use this
                 option, but symbol information is required. Without symbol
                 information, opannotate will silently refuse to annotate
                 the binary.  If this option is combined with --source,
                 then mixed source / assembly annotations are output.

          --demangle / -D none|smart|normal
                 none: no demangling. normal: use default demangler
                 (default) smart: use pattern-matching to make C++ symbol
                 demangling more readable.

          --exclude-dependent / -x
                 Do not include application-specific images for libraries,
                 kernel modules and the kernel. This option only makes
                 sense if the profile session used --separate.

          --exclude-file [files]
                 Exclude all files in the given comma-separated list of
                 glob patterns. This option is supported solely with the
                 --source option. It can be used to filter out source files
                 in the output using the following types of specifications:

                 • filenames (basename -- i.e., no path)

                 • filename glob specifications (all files whose base
                   filename matches the given pattern)

                 • directory segments (all source files located in the
                   specified directory; e.g. "libio")

                 • directory segment glob specifications (e.g., "libi*")

          --exclude-symbols / -e [symbols]
                 Exclude all the symbols in the given comma-separated list.

          --help / -? / --usage
                 Show help message.

          --image-path / -p [paths]
                 Comma-separated list of additional paths to search for
                 binaries.  This is needed to find modules in kernels 2.6
                 and upwards.

          --root / -R [path]
                 A path to a filesystem to search for additional binaries.

          --include-file [files]
                 Only include files in the given comma-separated list of
                 glob patterns.  The same rules apply for this option as
                 for the --exclude-file option.

          --merge / -m [lib,cpu,tid,tgid,unitmask,all]
                 Merge any profiles separated in a --separate session.

          --include-symbols / -i [symbols]
                 Only include symbols in the given comma-separated list.

          --objdump-params [params]
                 Pass the given parameters as extra values when calling
                 objdump.  If more than one option is to be passed to
                 objdump, the parameters must be enclosed in a quoted
                 string.

                 An example of where this option is useful is when your
                 toolchain does not automatically recognize instructions
                 that are specific to your processor.  For example, on IBM
                 POWER7/RHEL 6, objdump must be told that a binary file may
                 have POWER7-specific instructions. The opannotate option
                 to show the POWER7-specific instructions is:
                    --objdump-params=-Mpower7

                 The opannotate option to show the POWER7-specific
                 instructions, the source code (--source) and the line
                 numbers (-l) would be:
                    --objdump-params="-Mpower7 -l --source"

          --output-dir / -o [dir]
                 Output directory. This makes opannotate output one
                 annotated file for each source file. This option can't be
                 used in conjunction with --assembly.

          --search-dirs / -d [paths]
                 Comma-separated list of paths to search for source files.
                 You may need to use this option when the debug information
                 for an image contains relative paths.

          --base-dirs / -b [paths]
                 Comma-separated list of paths to strip from debug source
                 files, prior to looking for them in --search-dirs.

          --session-dir=dir_path
                 Use sample database from the specified directory dir_path
                 instead of the default location. If --session-dir is not
                 specified, then opannotate will search for samples in
                 <current_dir>/oprofile_data first. If that directory does
                 not exist, the standard session-dir of /var/lib/oprofile
                 is used.

          --source / -s
                 Output annotated source. This requires debugging
                 information to be available for the binaries.

          --threshold / -t [percentage]
                 For annotated assembly, only output data for symbols that
                 have more than the given percentage of total samples. For
                 profiles using multiple events, if the threshold is
                 reached for any event, then all sample data for the symbol
                 is shown.

                 For annotated source, only output data for source files
                 that have more than the given percentage of total samples.
                 For profiles using multiple events, if the threshold is
                 reached for any event, then all sample data for the source
                 file is shown.

          --verbose / -V [options]
                 Give verbose debugging output.

          --version / -v
                 Show version.


---------------------------------------------------------------

::

          No special environment variables are recognised by opannotate.


---------------------------------------------------

::

          <session_dir>/samples
                 The location of the generated sample files.


-------------------------------------------------------

::

          This man page is current for oprofile-1.5.0git.


---------------------------------------------------------

::

          /usr/local/share/doc/oprofile/, oprofile(1)

COLOPHON
---------------------------------------------------------

::

          This page is part of the oprofile (a system-wide profiler for
          Linux) project.  Information about the project can be found at 
          ⟨http://oprofile.sourceforge.net/news/⟩.  If you have a bug report
          for this manual page, see
          ⟨http://oprofile.sourceforge.net/bugs/⟩.  This page was obtained
          from the project's upstream Git repository ⟨git clone
          git://git.code.sf.net/p/oprofile/oprofile⟩ on 2021-08-27.  (At
          that time, the date of the most recent commit that was found in
          the repository was 2021-03-10.)  If you discover any rendering
          problems in this HTML version of the page, or you believe there
          is a better or more up-to-date source for the page, or you have
          corrections or improvements to the information in this COLOPHON
          (which is not part of the original manual page), send a mail to
          man-pages@man7.org

   4th Berkeley Distribution  Fri 27 August 2021              OPANNOTATE(1)

--------------

Pages that refer to this page: `operf(1) <../man1/operf.1.html>`__, 
`oprofile(1) <../man1/oprofile.1.html>`__

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
