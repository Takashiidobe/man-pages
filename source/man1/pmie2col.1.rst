.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

pmie2col(1) — Linux manual page
===============================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `OPTIONS <#OPTIONS>`__ \|         |                                   |
| `EXAMPLES <#EXAMPLES>`__ \|       |                                   |
| `PCP                              |                                   |
| ENVIRONMENT <#PCP_ENVIRONMENT>`__ |                                   |
| \| `SEE ALSO <#SEE_ALSO>`__ \|    |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   PMIE2COL(1)              General Commands Manual             PMIE2COL(1)

NAME
-------------------------------------------------

::

          pmie2col - convert pmie output to multi-column format


---------------------------------------------------------

::

          pmie2col [-?]  [-d delimiter] [-p precision] [-w width]


---------------------------------------------------------------

::

          pmie2col is a simple tool that converts output from pmie(1) into
          regular column format.  Each column is 7 characters wide (by
          default, may be changed with the -w option) with a single space
          between columns.  That single space can be substituted with an
          alternate delimiter using the -d option (this is useful for
          importing the data into a spreadsheet, for example).

          The precision of the tabulated values from pmie can be specified
          with the -p option (default is 2 decimal places).  This option
          can and will override any width setting in order to present the
          requested precision.

          The pmie(1) configuration must follow these rules:

          (1)    Each pmie(1) expression is of the form ``NAME = expr;''.
                 NAME will be used as the column heading, and must contain
                 no white space, although special characters can be escaped
                 by enclosing NAME in single quotes.

          (2)    The ``expr'' must be a valid pmie(1) expression that
                 produces a singular value.

          In addition, pmie(1) must be run with the -v command line option.

          It is also possible to use the -e command line to pmie(1) and
          output lines will be prefixed by a timestamp.


-------------------------------------------------------

::

          The available command line options are:

          -d char, --delimiter=char
               Use char as output delimiter.

          -p N, --precision=N
               Use n as output floating point precision.

          -w N, --width=N
               Use n as output column width.

          -?, --help
               Display usage message and exit.


---------------------------------------------------------

::

          Given this pmie(1) configuration file (config):

               loadav = kernel.all.load #'1 minute';
               '%usr' = kernel.all.cpu.user;
               '%sys' = kernel.all.cpu.sys;
               '%wio' = kernel.all.cpu.wait.total;
               '%idle' = kernel.all.cpu.idle;
               'max-iops' = max_inst(disk.dev.total);

          Then this command pipeline:

               $ pmie -v -t 5 <config | pmie2col -w 8

          Produces output like this:

                  loadav     %usr     %sys     %wio    %idle max-iops
                    0.21        ?        ?        ?        ?        ?
                    0.36     0.49     0.03     0.18     0.29    25.40
                    0.49     0.41     0.10     0.36     0.13    51.00
                    0.69     0.49     0.10     0.05     0.37    43.20
                    0.71     0.39     0.08     0.04     0.49    14.00
                    0.83     0.63     0.15     0.00     0.21    32.30
                    1.09     0.60     0.02     0.10     0.27    47.00
                    0.92     0.01     0.00     0.00     0.99     2.40


-----------------------------------------------------------------------

::

          Environment variables with the prefix PCP_ are used to
          parameterize the file and directory names used by PCP.  On each
          installation, the file /etc/pcp.conf contains the local values
          for these variables.  The $PCP_CONF variable may be used to
          specify an alternative configuration file, as described in
          pcp.conf(5).


---------------------------------------------------------

::

          PCPIntro(1) and pmie(1).

COLOPHON
---------------------------------------------------------

::

          This page is part of the PCP (Performance Co-Pilot) project.
          Information about the project can be found at 
          ⟨http://www.pcp.io/⟩.  If you have a bug report for this manual
          page, send it to pcp@groups.io.  This page was obtained from the
          project's upstream Git repository
          ⟨https://github.com/performancecopilot/pcp.git⟩ on 2021-08-27.
          (At that time, the date of the most recent commit that was found
          in the repository was 2021-08-27.)  If you discover any rendering
          problems in this HTML version of the page, or you believe there
          is a better or more up-to-date source for the page, or you have
          corrections or improvements to the information in this COLOPHON
          (which is not part of the original manual page), send a mail to
          man-pages@man7.org

   Performance Co-Pilot               PCP                       PMIE2COL(1)

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
