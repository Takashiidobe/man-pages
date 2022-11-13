.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

filecap(8) — Linux manual page
==============================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `OPTIONS <#OPTIONS>`__ \|         |                                   |
| `EXAMPLES <#EXAMPLES>`__ \|       |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `AUTHOR <#AUTHOR>`__ \|           |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   FILECAP:(8)          System Administration Utilities         FILECAP:(8)

NAME
-------------------------------------------------

::

          filecap - a program to see capabilities


---------------------------------------------------------

::

          filecap [ -a | -d | /dir | /dir/file [cap1 cap2 ...] ]


---------------------------------------------------------------

::

          filecap is a program that prints out a report of programs with
          file based capabilities. If a file is not in the report or there
          is no report at all, no capabilities were found. For expedience,
          the default is to check only the directories in the PATH
          environmental variable. If the -a command line option is given,
          then all directories will be checked. If a directory is passed,
          it will recursively check that directory. If a path to a file is
          given, it will only check that file. If a file is given followed
          by capabilities, then the capabilities are written to the file.


-------------------------------------------------------

::

          -a     This tells the program to show all capabilities starting
                 from the / directory. Normally the PATH environmental
                 variable is used to show you capabilities on files you are
                 likely to execute.

          -d     This dumps all capabilities for reference.


---------------------------------------------------------

::

          To check file capabilities in $PATH:
          filecap

          To check file capabilities of whole system:
          filecap -a

          To check file capabilities recursively in a directory:
          filecap /usr

          To check file capabilities of a specific program:
          filecap /bin/passwd

          To list all possible capabilities:
          filecap -d

          To set a file capability on a specific program:
          filecap /bin/ping net_raw net_admin

          To remove file capabilities on a specific program:
          filecap /bin/ping none


---------------------------------------------------------

::

          pscap(8), netcap(8), capabilities(7).


-----------------------------------------------------

::

          Steve Grubb

COLOPHON
---------------------------------------------------------

::

          This page is part of the libcap-ng (capabilities commands and
          library (NG)) project.  Information about the project can be
          found at ⟨https://people.redhat.com/sgrubb/libcap-ng/⟩.  It is
          not known how to report bugs for this man page; if you know,
          please send a mail to man-pages@man7.org.  This page was obtained
          from the tarball libcap-ng-0.8.2.tar.gz fetched from
          ⟨https://people.redhat.com/sgrubb/libcap-ng/index.html⟩ on
          2021-08-27.  If you discover any rendering problems in this HTML
          version of the page, or you believe there is a better or more up-
          to-date source for the page, or you have corrections or
          improvements to the information in this COLOPHON (which is not
          part of the original manual page), send a mail to
          man-pages@man7.org

   Red Hat                         Aug 2018                     FILECAP:(8)

--------------

Pages that refer to this page:
`capabilities(7) <../man7/capabilities.7.html>`__, 
`captest(8) <../man8/captest.8.html>`__, 
`netcap(8) <../man8/netcap.8.html>`__, 
`pscap(8) <../man8/pscap.8.html>`__

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
