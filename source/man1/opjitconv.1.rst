.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

opjitconv(1) — Linux manual page
================================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `OPTIONS <#OPTIONS>`__ \|         |                                   |
| `VERSION <#VERSION>`__ \|         |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   OPJITCONV(1)             General Commands Manual            OPJITCONV(1)

NAME
-------------------------------------------------

::

          opjitconv - convert jit dump file to an ELF


---------------------------------------------------------

::

          opjitconv [ options ] [ [--debug | --non-root | --delete-jitdumps
          ] --session-dir=<dir> <starttime> <endtime> ]


---------------------------------------------------------------

::

          Convert a jit dump file to an ELF file


-------------------------------------------------------

::

          --debug
                 Print debugging information.

          --non-root
                 Use when opjitconv was invoked by a non-root user via
                 operf.

          --delete-jitdumps
                 Delete jitdump files owned by the user.

          --session-dir [dir]
                 Session directory where sample data is stored.

          --help / -h
                 Display brief usage message.


-------------------------------------------------------

::

          This man page is current for oprofile-1.5.0git.


---------------------------------------------------------

::

          oprofile(1)

COLOPHON
---------------------------------------------------------

::

          This page is part of the oprofile (a system-wide profiler for
          Linux) project.  Information about the project can be found at 
          ⟨http://oprofile.sourceforge.net/news/⟩.  If you have a bug report
          for this manual page, see
          ⟨http://oprofile.sourceforge.net/bugs/⟩.  This page was obtained
          from the project's upstream Git repository ⟨git clone
          git://git.code.sf.net/p/oprofile/oprofile⟩ on 2021-08-27.  (At
          that time, the date of the most recent commit that was found in
          the repository was 2021-03-10.)  If you discover any rendering
          problems in this HTML version of the page, or you believe there
          is a better or more up-to-date source for the page, or you have
          corrections or improvements to the information in this COLOPHON
          (which is not part of the original manual page), send a mail to
          man-pages@man7.org

   oprofile 1.5.0git          Fri 27 August 2021               OPJITCONV(1)

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
