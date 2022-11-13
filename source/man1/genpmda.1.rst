.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

genpmda(1) — Linux manual page
==============================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `OPTIONS <#OPTIONS>`__ \|         |                                   |
| `PCP                              |                                   |
| ENVIRONMENT <#PCP_ENVIRONMENT>`__ |                                   |
| \| `SEE ALSO <#SEE_ALSO>`__ \|    |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   GENPMDA(1)               General Commands Manual              GENPMDA(1)

NAME
-------------------------------------------------

::

          genpmda - Performance Co-Pilot PMDA Generator


---------------------------------------------------------

::

          genpmda [-dv] [-D domain] [-n pmns] [-o dir] [-s stdpmid] [-t
          topdir] -c config -i IAM


---------------------------------------------------------------

::

          genpmda is a rapid application development tool for creating new
          Performance Metrics Domain Agents, see PMDA(3).  It provides a
          very easy and efficient way to extend the Performance Co-pilot
          (PCP) with new performance metrics without needing to understand
          the low level details of how PMDAs are constructed.

          genpmda reads a config file containing an augmented Performance
          Metrics Name Space, see PMNS(5), and automatically generates
          virtually all of the source code to implement a fully functional
          PMDA, including the Makefile, name space, support scripts for
          configuring the new PMDA, and the metrics help text.  Fairly
          simple PMDAs can be automatically generated from the config file
          without writing any additional code.  More complicated PMDAs,
          e.g. containing multiple instance domains, require only the
          refresh methods for the instance domains to be written manually.

          An example of the config file format accepted by genpmda is given
          below.


-------------------------------------------------------

::

          Required options:

          -c config
               input config file, see example below

          -i IAM
               PMDA name IAM, should appear in stdpmid or the -D option
               must be used to specify a domain.

          Other options:

          -d   generate an Install script for a daemon PMDA (default is
               DSO)

          -D domain
               use domain number in the generated pmns and domain.h (if -s
               is not given)

          -n pmns
               use pmns as root of the namespace (default matches -i flag)

          -o dir
               use dir for generated source code, default ./generated

          -s stdpmid
               path to stdpmid (default ../../pmns/stdpmid)

          -t topdir
               use topdir in generated GNUmakefile, default ../../..

          -v   print verbose messages about what genpmda is doing.

          Example:
              Generate an "example" PMDA using domain 99:

              genpmda -D 99 -v -i EXAMPLE -c example.conf

          Here is example.conf config file (for the required -c option):

               example {
                   metric
               }

               example.metric {
                   ##  metric            string
                   ##  pmid              EXAMPLE:CLUSTER:0
                   ##  indom             PM_INDOM_NULL
                   ##  type              PM_TYPE_STRING
                   ##  units             PMDA_PMUNITS(0,0,0,0,0,0)
                   ##  semantics         PM_SEM_DISCRETE
                   ##  briefhelptext     one line help text for example.metric.string
                   ##  helptext          long help text for example.metric.string
                   ##  helptext          This is the second line of the long help text
                   ##  helptext          and this is the third line.
                   ##  fetch             function example_string_fetch_callback
                   ##  code              atom->cp = "hello world";
                   ##  code              return 1;
                   ##  endmetric
               }


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

          pmcd(1), PMDA(3), pcp.conf(5), pcp.env(5) and PMNS(5).

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

   Performance Co-Pilot               PCP                        GENPMDA(1)

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
