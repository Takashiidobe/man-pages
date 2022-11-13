.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

ovs-bugtool(8) — Linux manual page
==================================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `COLLECTION                       |                                   |
|  OPTIONS <#COLLECTION_OPTIONS>`__ |                                   |
| \|                                |                                   |
| `OU                               |                                   |
| TPUT OPTIONS <#OUTPUT_OPTIONS>`__ |                                   |
| \|                                |                                   |
| `                                 |                                   |
| OTHER OPTIONS <#OTHER_OPTIONS>`__ |                                   |
| \| `EXAMPLES <#EXAMPLES>`__ \|    |                                   |
| `BUGS <#BUGS>`__ \|               |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   ovs-bugtool(8)             Open vSwitch Manual            ovs-bugtool(8)

NAME
-------------------------------------------------

::

          ovs-bugtool - Open vSwitch bug reporting utility


---------------------------------------------------------

::

          ovs-bugtool


---------------------------------------------------------------

::

          Generates a debug bundle with useful information about Open
          vSwitch on this system and places it in /var/log/ovs-bugtool.


-----------------------------------------------------------------------------

::

          These options influence what categories of data ovs-bugtool
          collects.

          --entries=list
                 Collect the capabilities specified in the comma-separated
                 list.

          --all  Collect all available capabilities.

          --ovs  In addition to Open vSwitch configuration and status,
                 ovs-bugtool can collect a variety of relevant system
                 information.  This option limits collection to Open
                 vSwitch-specific categories.

          --log-days=days
                 Include the logs with last modification time in the
                 previous days days in the debug bundle. The number of log
                 files included has a big impact on the eventual bundle
                 size. The default value is 20 days.

          -y
          --yestoall
                 Answer yes to all prompts.

          --capabilities
                 Writes the categories that ovs-bugtool can collect on
                 stdout in XML, then exits.


---------------------------------------------------------------------

::

          These options influence the format and destination of ovs-bugtool
          output.

          --output=filetype
                 Generates a debug bundle with the specified file type.
                 Options include tar, tar.gz, tar.bz2, and zip.

          --outfile=file
                 Write output to file.  Mutually exclusive with --outfd.

          --outfd=fd
                 Write output to file descriptor fd.  This option must be
                 used with --output=tar.

          --unlimited
                 Do not exclude files which are too large. Also skip
                 checking free disk space.  By default up to 90 percent of
                 the free disk space can be used.

          --debug
                 Print verbose debugging output.


-------------------------------------------------------------------

::

          -s
          --silent
                 Suppress most output to stdout.

          --help Print a summary of ovs-bugtool usage to stdout, then exit.


---------------------------------------------------------

::

          Here's a collection of some commonly useful options:

          ovs-bugtool -y -s --output=tar.gz --outfile=/var/log/bugtool-
          report.tgz


-------------------------------------------------

::

          ovs-bugtool makes many assumptions about file locations and the
          availability of system utilities.  It has been tested on Debian
          and Red Hat and derived distributions.  On other distributions it
          is likely to be less useful.

COLOPHON
---------------------------------------------------------

::

          This page is part of the Open vSwitch (a distributed virtual
          multilayer switch) project.  Information about the project can be
          found at ⟨http://openvswitch.org/⟩.  If you have a bug report for
          this manual page, send it to bugs@openvswitch.org.  This page was
          obtained from the project's upstream Git repository
          ⟨https://github.com/openvswitch/ovs.git⟩ on 2021-08-27.  (At that
          time, the date of the most recent commit that was found in the
          repository was 2021-08-20.)  If you discover any rendering
          problems in this HTML version of the page, or you believe there
          is a better or more up-to-date source for the page, or you have
          corrections or improvements to the information in this COLOPHON
          (which is not part of the original manual page), send a mail to
          man-pages@man7.org

   Open vSwitch                     2.13.90                  ovs-bugtool(8)

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
