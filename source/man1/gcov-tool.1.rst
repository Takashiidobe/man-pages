.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

gcov-tool(1) — Linux manual page
================================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `OPTIONS <#OPTIONS>`__ \|         |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `COPYRIGHT <#COPYRIGHT>`__ \|     |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   GCOV-TOOL(1)                       GNU                      GCOV-TOOL(1)

NAME
-------------------------------------------------

::

          gcov-tool - offline gcda profile processing tool


---------------------------------------------------------

::

          gcov-tool [-v|--version] [-h|--help]

          gcov-tool merge [merge-options] directory1 directory2
               [-o|--output directory]
               [-v|--verbose]
               [-w|--weight w1,w2]

          gcov-tool rewrite [rewrite-options] directory
               [-n|--normalize long_long_value]
               [-o|--output directory]
               [-s|--scale float_or_simple-frac_value]
               [-v|--verbose]

          gcov-tool overlap [overlap-options] directory1 directory2
               [-f|--function]
               [-F|--fullname]
               [-h|--hotonly]
               [-o|--object]
               [-t|--hot_threshold] float
               [-v|--verbose]


---------------------------------------------------------------

::

          gcov-tool is an offline tool to process gcc's gcda profile files.

          Current gcov-tool supports the following functionalities:

          *   merge two sets of profiles with weights.

          *   read one set of profile and rewrite profile contents. One can
              scale or normalize the count values.

          Examples of the use cases for this tool are:

          *   Collect the profiles for different set of inputs, and use
              this tool to merge them. One can specify the weight to factor
              in the relative importance of each input.

          *   Rewrite the profile after removing a subset of the gcda
              files, while maintaining the consistency of the summary and
              the histogram.

          *   It can also be used to debug or libgcov code as the tools
              shares the majority code as the runtime library.

          Note that for the merging operation, this profile generated
          offline may contain slight different values from the online
          merged profile. Here are a list of typical differences:

          *   histogram difference: This offline tool recomputes the
              histogram after merging the counters. The resulting
              histogram, therefore, is precise. The online merging does not
              have this capability -- the histogram is merged from two
              histograms and the result is an approximation.

          *   summary checksum difference: Summary checksum uses a CRC32
              operation. The value depends on the link list order of gcov-
              info objects. This order is different in gcov-tool from that
              in the online merge. It's expected to have different summary
              checksums. It does not really matter as the compiler does not
              use this checksum anywhere.

          *   value profile counter values difference: Some counter values
              for value profile are runtime dependent, like heap addresses.
              It's normal to see some difference in these kind of counters.


-------------------------------------------------------

::

          -h
          --help
              Display help about using gcov-tool (on the standard output),
              and exit without doing any further processing.

          -v
          --version
              Display the gcov-tool version number (on the standard
              output), and exit without doing any further processing.

          merge
              Merge two profile directories.

              -o directory
              --output directory
                  Set the output profile directory. Default output
                  directory name is merged_profile.

              -v
              --verbose
                  Set the verbose mode.

              -w w1,w2
              --weight w1,w2
                  Set the merge weights of the directory1 and directory2,
                  respectively. The default weights are 1 for both.

          rewrite
              Read the specified profile directory and rewrite to a new
              directory.

              -n long_long_value
              --normalize <long_long_value>
                  Normalize the profile. The specified value is the max
                  counter value in the new profile.

              -o directory
              --output directory
                  Set the output profile directory. Default output name is
                  rewrite_profile.

              -s float_or_simple-frac_value
              --scale float_or_simple-frac_value
                  Scale the profile counters. The specified value can be in
                  floating point value, or simple fraction value form, such
                  1, 2, 2/3, and 5/3.

              -v
              --verbose
                  Set the verbose mode.

          overlap
              Compute the overlap score between the two specified profile
              directories.  The overlap score is computed based on the arc
              profiles. It is defined as the sum of min (p1_counter[i] /
              p1_sum_all, p2_counter[i] / p2_sum_all), for all arc counter
              i, where p1_counter[i] and p2_counter[i] are two matched
              counters and p1_sum_all and p2_sum_all are the sum of counter
              values in profile 1 and profile 2, respectively.

              -f
              --function
                  Print function level overlap score.

              -F
              --fullname
                  Print full gcda filename.

              -h
              --hotonly
                  Only print info for hot objects/functions.

              -o
              --object
                  Print object level overlap score.

              -t float
              --hot_threshold <float>
                  Set the threshold for hot counter value.

              -v
              --verbose
                  Set the verbose mode.


---------------------------------------------------------

::

          gpl(7), gfdl(7), fsf-funding(7), gcc(1), gcov(1) and the Info
          entry for gcc.


-----------------------------------------------------------

::

          Copyright (c) 2014-2019 Free Software Foundation, Inc.

          Permission is granted to copy, distribute and/or modify this
          document under the terms of the GNU Free Documentation License,
          Version 1.3 or any later version published by the Free Software
          Foundation; with the Invariant Sections being "GNU General Public
          License" and "Funding Free Software", the Front-Cover texts being
          (a) (see below), and with the Back-Cover Texts being (b) (see
          below).  A copy of the license is included in the gfdl(7) man
          page.

          (a) The FSF's Front-Cover Text is:

               A GNU Manual

          (b) The FSF's Back-Cover Text is:

               You have freedom to copy and modify this GNU Manual, like GNU
               software.  Copies published by the Free Software Foundation raise
               funds for GNU development.

COLOPHON
---------------------------------------------------------

::

          This page is part of the gcc (GNU Compiler Collection) project.
          Information about the project can be found at 
          ⟨http://gcc.gnu.org/⟩.  If you have a bug report for this manual
          page, see ⟨http://gcc.gnu.org/bugs/⟩.  This page was obtained
          from the tarball gcc-9.4.0.tar.gz fetched from
          ⟨ftp://ftp.gwdg.de/pub/misc/gcc/releases/⟩ on 2021-08-27.  If you
          discover any rendering problems in this HTML version of the page,
          or you believe there is a better or more up-to-date source for
          the page, or you have corrections or improvements to the
          information in this COLOPHON (which is not part of the original
          manual page), send a mail to man-pages@man7.org

   gcc-9.4.0                      2021-06-01                   GCOV-TOOL(1)

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
