.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

opreport(1) — Linux manual page
===============================

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

   OPREPORT(1)              General Commands Manual             OPREPORT(1)

NAME
-------------------------------------------------

::

          opreport - produce symbol or binary image summaries


---------------------------------------------------------

::

          opreport [ options ] [profile specification]


---------------------------------------------------------------

::

          opreport outputs binary image summaries, or per-symbol data, from
          OProfile profiling sessions. See oprofile(1) for how to write
          profile specifications.


-------------------------------------------------------

::

          --accumulated / -a
                 Accumulate sample and percentage counts in the symbol
                 list.

          --debug-info / -g
                 Show source file and line for each symbol.

          --demangle / -D none|smart|normal
                 none: no demangling. normal: use default demangler
                 (default) smart: use pattern-matching to make C++ symbol
                 demangling more readable.

          --callgraph / -c
                 Show call graph information if available.

          --details / -d
                 Show per-instruction details for all selected symbols.

          --exclude-dependent / -x
                 Do not include application-specific images for libraries,
                 kernel modules and the kernel. This option only makes
                 sense if the profile session used --separate.

          --exclude-symbols / -e [symbols]
                 Exclude all the symbols in the given comma-separated list.

          --global-percent / -%
                 Make all percentages relative to the whole profile.

          --help / -? / --usage
                 Show help message.

          --image-path / -p [paths]
                 Comma-separated list of additional paths to search for
                 binaries.  This is needed to find modules in kernels 2.6
                 and upwards.

          --root / -R [path]
                 A path to a filesystem to search for additional binaries.

          --include-symbols / -i [symbols]
                 Only include symbols in the given comma-separated list.

          --long-filenames / -f
                 Output full paths instead of basenames.

          --merge / -m [lib,cpu,tid,tgid,unitmask,all]
                 Merge any profiles separated in a --separate session.

          --no-header / -n
                 Don't output a header detailing profiling parameters.

          --output-file / -o [file]
                 Output to the given file instead of stdout.

          --reverse-sort / -r
                 Reverse the sort from the default.

          --session-dir=dir_path
                 Use sample database from the specified directory dir_path
                 instead of the default location. If --session-dir is not
                 specified, then opreport will search for samples in
                 <current_dir>/oprofile_data first. If that directory does
                 not exist, the standard session-dir of /var/lib/oprofile
                 is used.

          --show-address / -w
                 Show each symbol's VMA address.

          --sort / -s [vma,sample,symbol,debug,image]
                 Sort the list of symbols by, respectively, symbol address,
                 number of samples, symbol name, debug filename and line
                 number, binary image filename.

          --symbols / -l
                 List per-symbol information instead of a binary image
                 summary.
                 Usually, the total of all per-symbols samples for a given
                 binary image equals the summary count for the binary image
                 (shown by running opreport with no options).  However,
                 it's possible for some sample addresses to fall outside
                 the range of any symbols for a given binary image.  In
                 such cases, the total number of per-symbols samples for
                 the binary image may be less than the summary count for
                 the image. Running opreport with the --verbose=debug
                 option will display an informational message when this
                 difference is detected.  This difference is typically very
                 small and can be ignored.

          --threshold / -t [percentage]
                 Only output data for symbols that have more than the given
                 percentage of total samples. For profiles using multiple
                 events, if the threshold is reached for any event, then
                 all sample data for the symbol is shown.

          --verbose / -V [options]
                 Give verbose debugging output.

          --version / -v
                 Show version.

          --xml / -X
                 Generate XML output.


---------------------------------------------------------------

::

          No special environment variables are recognized by opreport.


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

   4th Berkeley Distribution  Fri 27 August 2021                OPREPORT(1)

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
