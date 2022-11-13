.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

iowatcher(1) — Linux manual page
================================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `OPTIONS <#OPTIONS>`__ \|         |                                   |
| `GRAPHS <#GRAPHS>`__ \|           |                                   |
| `EXAMPLES <#EXAMPLES>`__ \|       |                                   |
| `AUTHORS <#AUTHORS>`__ \|         |                                   |
| `COPYRIGHT <#COPYRIGHT>`__ \|     |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   iowatcher(1)                  User Commands                 iowatcher(1)

NAME
-------------------------------------------------

::

          iowatcher - Create visualizations from blktrace results


---------------------------------------------------------

::

          iowatcher [options] [--] [program arguments ...]


---------------------------------------------------------------

::

          iowatcher graphs the results of a blktrace run.  It can graph the
          result of an existing blktrace, start a new blktrace, or start a
          new blktrace and a benchmark run.  It can then create an image or
          movie of the IO from a given trace.  iowatcher can produce either
          SVG files or movies in mp4 format (with ffmpeg) or ogg format
          (with png2theora).


-------------------------------------------------------

::

          --help Print a brief usage summary.

          -d, --device device
                 Controls which device you are tracing.  You can only trace
                 one device at a time for now.  It is sent directly to
                 blktrace, and only needed when you are making a new trace.

          -D, --blktrace-destination destination
                 Destination for blktrace.

          -p, --prog
                 Run a program while blktrace is run. The program and its
                 arguments must be specified after all other options.  Note
                 that this option previously required the program to be
                 given as a single argument but it now tells iowatcher to
                 expect extra arguments which it should be run during the
                 trace.

          --     End option parsing. If --prog is specified, everything
                 after -- is the program to be run. This can be useful if
                 the program name could otherwise be mistaken for an
                 option.

          -K, --keep-movie-svgs
                 Keep the SVG files generated for movie mode.

          -t, --trace path
                 Specify the name of the file or directory in which
                 blktrace output is located.  iowatcher uses a dump from
                 blkparse, so this option tries to guess the name of the
                 corresponding per-CPU blktrace data files if the dump file
                 doesn't already exist.  To add multiple traces to a given
                 graph, you can specify --trace more than once.  If path is
                 a directory, iowatcher will use the name of the directory
                 as the base name of the dump file and all trace files
                 found inside the directory will be processed.

          -l, --label label
                 Sets a label in the graph for a trace file.  The labels
                 are added in the same order as the trace files.

          -m, --movie [style]
                 Create a movie.  The file format depends on the extension
                 used in the -o file option.  If you specify an .ogv or
                 .ogg extension, the result will be Ogg Theora video, if
                 png2theora is available.  If you use an .mp4 extension,
                 the result will be an mp4 video if ffmpeg is available.
                 You can use any other extension, but the end result will
                 be an mp4.  The accepted style values are spindle for a
                 circular disc-like effect (default) or rect for a
                 rectangular graph style.

          -T, --title title
                 Set a title to be placed at the top of the graph.

          -o, --output file
                 Output filename for the SVG image or video. The video
                 format used will depend on the file name extension. See
                 --movie for details.

          -r, --rolling seconds
                 Control the duration for the rolling average.  iowatcher
                 tries to smooth out bumpy graphs by averaging the current
                 second with seconds from the past.  Larger numbers here
                 give you flatter graphs.

          -h, --height height
                 Set the height of each graph

          -w, --width width
                 Set the width of each graph

          -c, --columns columns
                 Number of columns in graph output

          -x, --xzoom min:max
                 Limit processed time range to min:max.

          -y, --yzoom min:max
                 Limit processed sectors to min:max.

          -a, --io-plot-action action
                 Plot action (one of Q, D, or C) in the IO graph.

          -P, --per-process-io
                 Distinguish between processes in the IO graph.

          -O, --only-graph graph
                 Add a single graph to the output (see section GRAPHS for
                 options).  By default all graphs are included. Use -O to
                 generate only the required graphs.  -O may be used more
                 than once.

          -N, --no-graph type
                 Remove a single graph from the output (see section GRAPHS
                 for options).  This option may be used more than once.


-----------------------------------------------------

::

          Values accepted by the -O and -N options are:

             io, tput, latency, queue_depth, iops, cpu-sys, cpu-io, cpu-
          irq, cpu-user, cpu-soft


---------------------------------------------------------

::

          Generate graph from the existing trace.dump:

                 # iowatcher -t trace

          Skip the IO graph:

                 # iowatcher -t trace.dump -o trace.svg -N io

          Only graph tput and latency:

                 # iowatcher -t trace.dump -o trace.svg -O tput -O latency

          Generate a graph from two runs, and label them:

                 # iowatcher -t ext4.dump -t xfs.dump -l Ext4 -l XFS -o
                 trace.svg

          Run a fio benchmark and store the trace in trace.dump, add a
          title to the top, use /dev/sda for blktrace:

                 # iowatcher -d /dev/sda -t trace.dump -T 'Fio Benchmark'
                 -p fio some_job_file

          Make a movie from an existing trace:

                 # iowatcher -t trace --movie -o trace.mp4


-------------------------------------------------------

::

          iowatcher was created and is maintained by Chris Mason.

          This man page was largely written by Andrew Price based on
          Chris's original README.


-----------------------------------------------------------

::

          This program is free software; you can redistribute it and/or
          modify it under the terms of the GNU General Public License v2 as
          published by the Free Software Foundation.

          This program is distributed in the hope that it will be useful,
          but WITHOUT ANY WARRANTY; without even the implied warranty of
          MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
          General Public License for more details.

          You should have received a copy of the GNU General Public License
          along with this program; if not, write to the Free Software
          Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA
          02110-1301 USA


---------------------------------------------------------

::

          blktrace(8), blkparse(1), fio(1), mpstat(1)

COLOPHON
---------------------------------------------------------

::

          This page is part of the blktrace (Linux block layer I/O tracer)
          project.  Information about the project can be found at [unknown
          -- if you know, please contact man-pages@man7.org] It is not
          known how to report bugs for this man page; if you know, please
          send a mail to man-pages@man7.org.  This page was obtained from
          the project's upstream Git repository
          ⟨http://git.kernel.org/cgit/linux/kernel/git/axboe/blktrace.git/⟩
          on 2021-08-27.  (At that time, the date of the most recent commit
          that was found in the repository was 2021-06-28.)  If you
          discover any rendering problems in this HTML version of the page,
          or you believe there is a better or more up-to-date source for
          the page, or you have corrections or improvements to the
          information in this COLOPHON (which is not part of the original
          manual page), send a mail to man-pages@man7.org

   iowatcher                      April 2014                   iowatcher(1)

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
