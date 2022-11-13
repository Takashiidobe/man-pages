.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

memusagestat(1) — Linux manual page
===================================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `OPTIONS <#OPTIONS>`__ \|         |                                   |
| `BUGS <#BUGS>`__ \|               |                                   |
| `EXAMPLES <#EXAMPLES>`__ \|       |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   MEMUSAGESTAT(1)         Linux programmer's manual        MEMUSAGESTAT(1)

NAME
-------------------------------------------------

::

          memusagestat - generate graphic from memory profiling data


---------------------------------------------------------

::

          memusagestat [option]... datafile [outfile]


---------------------------------------------------------------

::

          memusagestat creates a PNG file containing a graphical
          representation of the memory profiling data in the file datafile;
          that file is generated via the -d (or --data) option of
          memusage(1).

          The red line in the graph shows the heap usage (allocated memory)
          and the green line shows the stack usage.  The x-scale is either
          the number of memory-handling function calls or (if the -t option
          is specified) time.


-------------------------------------------------------

::

          -o file, --output=file
                 Name of the output file.

          -s string, --string=string
                 Use string as the title inside the output graph.

          -t, --time
                 Use time (rather than number of function calls) as the
                 scale for the X axis.

          -T, --total
                 Also draw a graph of total memory consumption.

          -x size, --x-size=size
                 Make the output graph size pixels wide.

          -y size, --y-size=size
                 Make the output graph size pixels high.

          -?, --help
                 Print a help message and exit.

          --usage
                 Print a short usage message and exit.

          -V, --version
                 Print version information and exit.


-------------------------------------------------

::

          To report bugs, see ⟨http://www.gnu.org/software/libc/bugs.html⟩


---------------------------------------------------------

::

          See memusage(1).


---------------------------------------------------------

::

          memusage(1), mtrace(1)

COLOPHON
---------------------------------------------------------

::

          This page is part of release 5.13 of the Linux man-pages project.
          A description of the project, information about reporting bugs,
          and the latest version of this page, can be found at
          https://www.kernel.org/doc/man-pages/.

   GNU                            2021-03-22                MEMUSAGESTAT(1)

--------------

Pages that refer to this page: `memusage(1) <../man1/memusage.1.html>`__

--------------

`Copyright and license for this manual
page <../man1/memusagestat.1.license.html>`__

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
