.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

wrudf(1) — Linux manual page
============================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `AVAILABILITY <#AVAILABILITY>`__  |                                   |
| \| `SEE ALSO <#SEE_ALSO>`__ \|    |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   wrudf(1)                 General Commands Manual                wrudf(1)

NAME
-------------------------------------------------

::

          wrudf - Maintain a UDF filesystem.


---------------------------------------------------------

::

          wrudf device
          wrudf --help | -help | -h


---------------------------------------------------------------

::

          wrudf provides an interactive shell with operations on existing
          UDF filesystem: cp, rm, mkdir, rmdir, ls, cd.

      COMMANDS
          cp     copy

          rm     remove

          mkdir  make directory

          rmdir  remove directory

          lsc    list files (Compact disc version)

          lsh    list files (Hard disc version)

          cdc    change working directory (Compact disc)

          cdh    change working directory (Hard disc)

          quit   quit wrudf

          exit   quit wrudf


-----------------------------------------------------------------

::

          wrudf is part of the udftools package and is available from
          https://github.com/pali/udftools/.


---------------------------------------------------------

::

          cdrwtool(1), mkudffs(8), pktsetup(8)

COLOPHON
---------------------------------------------------------

::

          This page is part of the udftools (Linux tools for UDF
          filesystems and DVD/CD-R(W) drives) project.  Information about
          the project can be found at ⟨https://github.com/pali/udftools⟩.
          If you have a bug report for this manual page, see
          ⟨https://github.com/pali/udftools/issues⟩.  This page was
          obtained from the project's upstream Git repository
          ⟨https://github.com/pali/udftools.git⟩ on 2021-08-27.  (At that
          time, the date of the most recent commit that was found in the
          repository was 2021-08-14.)  If you discover any rendering
          problems in this HTML version of the page, or you believe there
          is a better or more up-to-date source for the page, or you have
          corrections or improvements to the information in this COLOPHON
          (which is not part of the original manual page), send a mail to
          man-pages@man7.org

   Linux Reference Manual          udftools                        wrudf(1)

--------------

Pages that refer to this page: `udfinfo(1) <../man1/udfinfo.1.html>`__, 
`mkudffs(8) <../man8/mkudffs.8.html>`__, 
`udflabel(8) <../man8/udflabel.8.html>`__

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
