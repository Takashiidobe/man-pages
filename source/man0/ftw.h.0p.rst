.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

ftw.h(0p) — Linux manual page
=============================

+-----------------------------------+-----------------------------------+
| `PROLOG <#PROLOG>`__ \|           |                                   |
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `APPLICAT                         |                                   |
| ION USAGE <#APPLICATION_USAGE>`__ |                                   |
| \| `RATIONALE <#RATIONALE>`__ \|  |                                   |
| `FUTURE D                         |                                   |
| IRECTIONS <#FUTURE_DIRECTIONS>`__ |                                   |
| \| `SEE ALSO <#SEE_ALSO>`__ \|    |                                   |
| `COPYRIGHT <#COPYRIGHT>`__        |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   ftw.h(0P)               POSIX Programmer's Manual              ftw.h(0P)


-----------------------------------------------------

::

          This manual page is part of the POSIX Programmer's Manual.  The
          Linux implementation of this interface may differ (consult the
          corresponding Linux manual page for details of Linux behavior),
          or the interface may not be implemented on Linux.

NAME
-------------------------------------------------

::

          ftw.h — file tree traversal


---------------------------------------------------------

::

          #include <ftw.h>


---------------------------------------------------------------

::

          The <ftw.h> header shall define the FTW structure, which shall
          include at least the following members:

              int  base
              int  level

          The <ftw.h> header shall define the following symbolic constants
          for use as values of the third argument to the application-
          supplied function that is passed as the second argument to ftw()
          and nftw():

          FTW_F         Non-directory file.

          FTW_D         Directory.

          FTW_DNR       Directory without read permission.

          FTW_DP        Directory with subdirectories visited.

          FTW_NS        Unknown type; stat() failed.

          FTW_SL        Symbolic link.

          FTW_SLN       Symbolic link that names a nonexistent file.

          The <ftw.h> header shall define the following symbolic constants
          for use as values of the fourth argument to nftw():

          FTW_PHYS      Physical walk, does not follow symbolic links.
                        Otherwise, nftw() follows links but does not walk
                        down any path that crosses itself.

          FTW_MOUNT     The walk does not cross a mount point.

          FTW_DEPTH     All subdirectories are visited before the directory
                        itself.

          FTW_CHDIR     The walk changes to each directory before reading
                        it.

          The following shall be declared as functions and may also be
          defined as macros. Function prototypes shall be provided.

              int ftw(const char *, int (*)(const char *, const struct stat *,
                  int), int);
              int nftw(const char *, int (*)(const char *, const struct stat *,
                  int, struct FTW *), int, int);

          The <ftw.h> header shall define the stat structure and the
          symbolic names for st_mode and the file type test macros as
          described in <sys/stat.h>.

          Inclusion of the <ftw.h> header may also make visible all symbols
          from <sys/stat.h>.

          The following sections are informative.


---------------------------------------------------------------------------

::

          None.


-----------------------------------------------------------

::

          None.


---------------------------------------------------------------------------

::

          None.


---------------------------------------------------------

::

          sys_stat.h(0p)

          The System Interfaces volume of POSIX.1‐2017, ftw(3p), nftw(3p)


-----------------------------------------------------------

::

          Portions of this text are reprinted and reproduced in electronic
          form from IEEE Std 1003.1-2017, Standard for Information
          Technology -- Portable Operating System Interface (POSIX), The
          Open Group Base Specifications Issue 7, 2018 Edition, Copyright
          (C) 2018 by the Institute of Electrical and Electronics
          Engineers, Inc and The Open Group.  In the event of any
          discrepancy between this version and the original IEEE and The
          Open Group Standard, the original IEEE and The Open Group
          Standard is the referee document. The original Standard can be
          obtained online at http://www.opengroup.org/unix/online.html .

          Any typographical or formatting errors that appear in this page
          are most likely to have been introduced during the conversion of
          the source files to man page format. To report such errors, see
          https://www.kernel.org/doc/man-pages/reporting_bugs.html .

   IEEE/The Open Group               2017                         ftw.h(0P)

--------------

Pages that refer to this page: `ftw(3p) <../man3/ftw.3p.html>`__, 
`nftw(3p) <../man3/nftw.3p.html>`__

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
