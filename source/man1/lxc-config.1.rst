.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

lxc-config(1) — Linux manual page
=================================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `OPTIONS <#OPTIONS>`__ \|         |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `AUTHOR <#AUTHOR>`__ \|           |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   LXC-CONFIG(1)                                              LXC-CONFIG(1)

NAME
-------------------------------------------------

::

          lxc-config - query LXC system configuration


---------------------------------------------------------

::

          lxc-config [ -l ]  [ item ]


---------------------------------------------------------------

::

          lxc-config queries the lxc system configuration and lets you list
          all valid keys or query individual keys for their value.


-------------------------------------------------------

::

          -l     List all supported keys.

          item   Query the value of the specified key.


---------------------------------------------------------

::

          lxc(7), lxc-create(1), lxc-copy(1), lxc-destroy(1), lxc-start(1),
          lxc-stop(1), lxc-execute(1), lxc-console(1), lxc-monitor(1),
          lxc-wait(1), lxc-cgroup(1), lxc-ls(1), lxc-info(1),
          lxc-freeze(1), lxc-unfreeze(1), lxc-attach(1), lxc.conf(5)


-----------------------------------------------------

::

          Stéphane Graber <stgraber@ubuntu.com>

COLOPHON
---------------------------------------------------------

::

          This page is part of the lxc (Linux containers) project.
          Information about the project can be found at 
          ⟨http://linuxcontainers.org/⟩.  If you have a bug report for this
          manual page, send it to lxc-devel@lists.linuxcontainers.org.
          This page was obtained from the project's upstream Git repository
          ⟨git://github.com/lxc/lxc⟩ on 2021-08-27.  (At that time, the
          date of the most recent commit that was found in the repository
          was 2021-08-26.)  If you discover any rendering problems in this
          HTML version of the page, or you believe there is a better or
          more up-to-date source for the page, or you have corrections or
          improvements to the information in this COLOPHON (which is not
          part of the original manual page), send a mail to
          man-pages@man7.org

                                  2021-08-26                  LXC-CONFIG(1)

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
