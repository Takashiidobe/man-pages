.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

oprof_start(1) — Linux manual page
==================================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `ENVIRONMENT <#ENVIRONMENT>`__ \| |                                   |
| `FILES <#FILES>`__ \|             |                                   |
| `VERSION <#VERSION>`__ \|         |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   OPROF_START(1)           General Commands Manual          OPROF_START(1)

NAME
-------------------------------------------------

::

          oprof_start - A GUI interface for OProfile


---------------------------------------------------------

::

          oprof_start [ options ]


---------------------------------------------------------------

::

          The oprof_start application provides a GUI interface to control
          the operation of OProfile.  Running oprof_start requires root
          privileges and does not support operf due to oprof_start using
          the older opcontrol script.


---------------------------------------------------------------

::

          No special environment variables are recognised by oprof_start.


---------------------------------------------------

::

          /root/.oprofile/daemonrc
                 Configuration file for opcontrol

          /var/lib/oprofile/samples/
                 The location of the generated sample files.


-------------------------------------------------------

::

          This man page is current for oprofile-1.0.0git.


---------------------------------------------------------

::

          /usr/local/share/doc/oprofile/, oprofile(1)

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

   4th Berkeley Distribution   Sun 20 July 2014              OPROF_START(1)

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
