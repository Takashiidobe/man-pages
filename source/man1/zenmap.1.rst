.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

zenmap(1) — Linux manual page
=============================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `OPTI                             |                                   |
| ONS SUMMARY <#OPTIONS_SUMMARY>`__ |                                   |
| \|                                |                                   |
| `ENVIRONMENT VARI                 |                                   |
| ABLES <#ENVIRONMENT_VARIABLES>`__ |                                   |
| \| `BUGS <#BUGS>`__ \|            |                                   |
| `HISTORY <#HISTORY>`__ \|         |                                   |
| `AUTHORS <#AUTHORS>`__ \|         |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   ZENMAP(1)                Zenmap Reference Guide                ZENMAP(1)

NAME
-------------------------------------------------

::

          zenmap - Graphical Nmap frontend and results viewer


---------------------------------------------------------

::

          zenmap [options] [results file]


---------------------------------------------------------------

::

          Zenmap is a multi-platform graphical Nmap frontend and results
          viewer. Zenmap aims to make Nmap easy for beginners to use while
          giving experienced Nmap users advanced features. Frequently used
          scans can be saved as profiles to make them easy to run
          repeatedly. A command creator allows interactive creation of Nmap
          command lines. Scan results can be saved and viewed later. Saved
          scan results can be compared with one another to see how they
          differ. The results of recent scans are stored in a searchable
          database.

          This man page only describes the few Zenmap command-line options
          and some critical notes. A much more detailed Zenmap User's Guide
          is available at https://nmap.org/book/zenmap.html . Other
          documentation and information is available from the Zenmap web
          page at https://nmap.org/zenmap/ .


-----------------------------------------------------------------------

::

          -f, --file results file
              Open the given results file for viewing. The results file may
              be an Nmap XML output file (.xml, as produced by nmap -oX) or
              a Umit scan results file (.usr). This option may be given
              more than once.

          -h, --help
              Show a help message and exit.

          -n, --nmap Nmap command line
              Run the given Nmap command within the Zenmap interface. After
              -n or --nmap, every remaining command line argument is read
              as the command line to execute. This means that -n or --nmap
              must be given last, after any other options. Note that the
              command line must include the nmap executable name: zenmap -n
              nmap -sS target.

          -p, --profile profile
              Start with the given profile selected. The profile name is
              just a string: "Regular scan". If combined with -t, begin a
              scan with the given profile against the specified target.

          -t, --target target
              Start with the given target. If combined with -p, begin a
              scan with the given profile against the specified target.

          -v, --verbose
              Increase verbosity (of Zenmap, not Nmap). This option may be
              given multiple times to get even more verbosity.

          Any other arguments are taken to be the names of results files to
          open.


-----------------------------------------------------------------------------------

::

          ZENMAP_DEVELOPMENT
              Set ZENMAP_DEVELOPMENT to disable automatic crash reporting.


-------------------------------------------------

::

          Like their authors, Nmap and Zenmap aren’t perfect. But you can
          help make them better by sending bug reports or even writing
          patches. If Nmap or Zenmap doesn’t behave the way you expect,
          first upgrade to the latest version available from
          https://nmap.org . If the problem persists, do some research to
          determine whether it has already been discovered and addressed.
          Try Googling the error message or browsing the nmap-dev archives
          at http://seclists.org/ . Read this full manual page as well. If
          nothing comes of this, mail a bug report to <dev@nmap.org>.
          Please include everything you have learned about the problem, as
          well as what version of Zenmap you are running and what operating
          system version it is running on. Problem reports and Zenmap usage
          questions sent to dev@nmap.org are far more likely to be answered
          than those sent to Fyodor directly.

          Code patches to fix bugs are even better than bug reports. Basic
          instructions for creating patch files with your changes are
          available at https://svn.nmap.org/nmap/HACKING . Patches may be
          sent to nmap-dev (recommended) or to Fyodor directly.


-------------------------------------------------------

::

          Zenmap was originally derived from Umit, an Nmap GUI created
          during the Google-sponsored Nmap Summer of Code in 2005 and 2006.
          The primary author of Umit was Adriano Monteiro Marques. When
          Umit was modified and integrated into Nmap in 2007, it was
          renamed Zenmap.


-------------------------------------------------------

::

      Nmap
          Fyodor <fyodor@nmap.org> (http://insecure.org )

          Hundreds of people have made valuable contributions to Nmap over
          the years. These are detailed in the CHANGELOG file which is
          distributed with Nmap and also available from
          https://nmap.org/changelog.html .

      Umit
          Zenmap is derived from the Umit Nmap frontend, which was started
          by Adriano Monteiro Marques as an Nmap/Google Summer of Code
          project (<py.adriano@gmail.com>, http://www.umitproject.org ).

COLOPHON
---------------------------------------------------------

::

          This page is part of the nmap (a network scanner) project.
          Information about the project can be found at ⟨http://nmap.org/⟩.
          If you have a bug report for this manual page, send it to
          dev@nmap.org.  This page was obtained from the project's upstream
          Git mirror of the Subversion repository
          ⟨https://github.com/nmap/nmap⟩ on 2021-08-27.  (At that time, the
          date of the most recent commit that was found in the repository
          was 2021-08-25.)  If you discover any rendering problems in this
          HTML version of the page, or you believe there is a better or
          more up-to-date source for the page, or you have corrections or
          improvements to the information in this COLOPHON (which is not
          part of the original manual page), send a mail to
          man-pages@man7.org

   Zenmap                         08/06/2021                      ZENMAP(1)

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
