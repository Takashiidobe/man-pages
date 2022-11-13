.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

guards(1) — Linux manual page
=============================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `AUTHOR <#AUTHOR>`__ \|           |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   GUARDS(1)          User Contributed Perl Documentation         GUARDS(1)

NAME
-------------------------------------------------

::

          guards - select from a list of files guarded by conditions


---------------------------------------------------------

::

          guards [--prefix=dir] [--path=dir1:dir2:...] [--default=<0|1>]
          [--check|--list] [--invert-match] [--with-guards]
          [--config=<file>] symbol ...


---------------------------------------------------------------

::

          The script reads a configuration file that may contain so-called
          guards, file names, and comments, and writes those file names
          that satisfy all guards to standard output. The script takes a
          list of symbols as its arguments. Each line in the configuration
          file is processed separately. Lines may start with a number of
          guards. The following guards are defined:

              +xxx Include the file(s) on this line if the symbol xxx is
              defined.

              -xxx Exclude the file(s) on this line if the symbol xxx is
              defined.

              +!xxx Include the file(s) on this line if the symbol xxx is
              not defined.

              -!xxx Exclude the file(s) on this line if the symbol xxx is
              not defined.

              - Exclude this file. Used to avoid spurious --check messages.

          The guards are processed left to right. The last guard that
          matches determines if the file is included. If no guard is
          specified, the --default setting determines if the file is
          included.

          If no configuration file is specified, the script reads from
          standard input.

          The --check option is used to compare the specification file
          against the file system. If files are referenced in the
          specification that do not exist, or if files are not enlisted in
          the specification file warnings are printed. The --path option
          can be used to specify which directory or directories to scan.
          Multiple directories are separated by a colon (":") character.
          The --prefix option specifies the location of the files.
          Alternatively, the --path=@<file> syntax can be used to specify a
          file from which the file names will be read.

          Use --list to list all files independent of any rules. Use
          --invert-match to list only the excluded patches. Use
          --with-guards to also include all inclusion and exclusion rules.


-----------------------------------------------------

::

          Andreas Gruenbacher <agruen@suse.de>, SUSE Labs

COLOPHON
---------------------------------------------------------

::

          This page is part of the quilt (tool to manage series of patches)
          project.  Information about the project can be found at 
          ⟨http://savannah.nongnu.org/projects/quilt⟩.  If you have a bug
          report for this manual page, see
          ⟨http://savannah.nongnu.org/bugs/?group=quilt⟩.  This page was
          obtained from the project's upstream Git repository
          ⟨git://git.savannah.nongnu.org/quilt.git⟩ on 2021-08-27.  (At
          that time, the date of the most recent commit that was found in
          the repository was 2021-06-10.)  If you discover any rendering
          problems in this HTML version of the page, or you believe there
          is a better or more up-to-date source for the page, or you have
          corrections or improvements to the information in this COLOPHON
          (which is not part of the original manual page), send a mail to
          man-pages@man7.org

   perl v5.32.1                   2021-08-26                      GUARDS(1)

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
