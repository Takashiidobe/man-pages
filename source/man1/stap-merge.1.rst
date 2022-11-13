.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

stap-merge(1) — Linux manual page
=================================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `OPTIONS <#OPTIONS>`__ \|         |                                   |
| `EXAMPLES <#EXAMPLES>`__ \|       |                                   |
| `FILES <#FILES>`__ \|             |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `BUGS <#BUGS>`__ \|               |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   STAP-MERGE(1)            General Commands Manual           STAP-MERGE(1)

NAME
-------------------------------------------------

::

          stap-merge - systemtap per-cpu binary merger


---------------------------------------------------------

::

          stap-merge [ OPTIONS ] [ INPUT FILENAMES ]


---------------------------------------------------------------

::

          The stap-merge executable applies when the -b option has been
          used while running a stap script.  The -b option will generate
          files per-cpu, based on the timestamp field. Then stap-merge will
          merge and sort through the per-cpu files based on the timestamp
          field.


-------------------------------------------------------

::

          The systemtap merge executable supports the following options.

          -v     Verbose mode, displays three extra fields per set of
                 collected data.

                 [cpunumber,sequencenumberofdata,thelengthofthedataset]

          -o OUTPUT_FILENAME

                 Specify the name of the file you would like the output to
                 be redirected into.  If this option is not specified than
                 the output will be pushed to standard out.


---------------------------------------------------------

::

                 $ stap -v -b -e 'probe syscall.open { printf("%s(%d) open\n",
                 execname(), pid()) }'

          This should result in several stpd_cpu files (each labled with a
          number representing which cpu the file was produced from).

                 $ stap-merge -v stpd_cpu0 stpd_cpu1

          Running the stap-merge program in the same directory as the stap
          script earlier in the example, will produce an ordered sequence
          of packets with the three part label for each set of data.  This
          result will be pushed through the standard output.  An output
          file could have been specified using the "-o" option.


---------------------------------------------------

::

          Important files and their corresponding paths can be located in
          the
                 stappaths (7) manual page.


---------------------------------------------------------

::

          stapprobes(3stap),
          stappaths(7),
          staprun(8),
          stapvars(3stap),
          stapex(3stap),
          stap-server(8),
          gdb(1)


-------------------------------------------------

::

          Use the Bugzilla link of the project web page or our mailing
          list.
          http://sourceware.org/systemtap/ ,<systemtap@sourceware.org>.

COLOPHON
---------------------------------------------------------

::

          This page is part of the systemtap (a tracing and live-system
          analysis tool) project.  Information about the project can be
          found at ⟨https://sourceware.org/systemtap/⟩.  If you have a bug
          report for this manual page, send it to systemtap@sourceware.org.
          This page was obtained from the project's upstream Git repository
          ⟨git://sourceware.org/git/systemtap.git⟩ on 2021-08-27.  (At that
          time, the date of the most recent commit that was found in the
          repository was 2021-08-26.)  If you discover any rendering
          problems in this HTML version of the page, or you believe there
          is a better or more up-to-date source for the page, or you have
          corrections or improvements to the information in this COLOPHON
          (which is not part of the original manual page), send a mail to
          man-pages@man7.org

                                                              STAP-MERGE(1)

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
