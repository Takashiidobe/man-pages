.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

oparchive(1) — Linux manual page
================================

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

   OPARCHIVE(1)             General Commands Manual            OPARCHIVE(1)

NAME
-------------------------------------------------

::

          oparchive - produce archive of oprofile data for offline analysis


---------------------------------------------------------

::

          oparchive [ options ] [profile specification] -o [directory]


---------------------------------------------------------------

::

          The oparchive utility is commonly used for collecting profile
          data on a "target" system for future offline analysis on a
          different ("host") machine.  oparchive creates a directory
          populated with executables, libraries, debuginfo files, and
          oprofile sample files. This directory can be tar'ed up and moved
          to another machine to be analyzed without further use of the
          target machine. Using opreport and other post-profiling tools
          against archived data requires the use of the archive:<archived-
          dir> specification. See oprofile(1) for how to write profile
          specifications.  A complete description of offline analysis can
          be found in the chapter titled Analyzing profile data on another
          system (oparchive) of the OProfile user manual. (See the user
          manual URL in the "SEE ALSO" section below.)


-------------------------------------------------------

::

          --help / -? / --usage
                 Show help message.

          --version / -v
                 Show version.

          --verbose / -V [options]
                 Give verbose debugging output.

          --session-dir=dir_path
                 Use sample database from the specified directory dir_path
                 instead of the default location. If --session-dir is not
                 specified, then oparchive will search for samples in
                 <current_dir>/oprofile_data first. If that directory does
                 not exist, the standard session-dir of /var/lib/oprofile
                 is used.

          --image-path / -p [paths]
                 Comma-separated list of additional paths to search for
                 binaries.  This is needed to find modules in kernels 2.6
                 and upwards.

          --root / -R [path]
                 A path to a filesystem to search for additional binaries.

          --output-directory / -o [directory]
                 Output to the given directory. There is no default. This
                 must be specified.

          --exclude-dependent / -x
                 Do not include application-specific images for libraries,
                 kernel modules and the kernel. This option only makes
                 sense if the profile session used --separate.

          --list-files / -l
                 Only list the files that would be archived, don't copy
                 them.


---------------------------------------------------------------

::

          No special environment variables are recognized by oparchive.


---------------------------------------------------

::

          <session_dir>/samples
                 The location of the generated sample files.


-------------------------------------------------------

::

          This man page is current for oprofile-1.5.0git.


---------------------------------------------------------

::

          file:///usr/local/share/doc/oprofile/oprofile.html#oparchive
          opimport(1)
          oprofile(1)

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

   4th Berkeley Distribution  Fri 27 August 2021               OPARCHIVE(1)

--------------

Pages that refer to this page: `oprofile(1) <../man1/oprofile.1.html>`__

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
