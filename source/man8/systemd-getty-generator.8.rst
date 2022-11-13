.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

systemd-getty-generator(8) — Linux manual page
==============================================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `NOTES <#NOTES>`__ \|             |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   SYSTEMD-GETTY-GENERATOR(8)ystemd-getty-generatorSTEMD-GETTY-GENERATOR(8)

NAME
-------------------------------------------------

::

          systemd-getty-generator - Generator for enabling getty instances
          on the console


---------------------------------------------------------

::

          /usr/lib/systemd/system-generators/systemd-getty-generator


---------------------------------------------------------------

::

          systemd-getty-generator is a generator that automatically
          instantiates serial-getty@.service on the kernel console(s), if
          they can function as ttys and are not provided by the virtual
          console subsystem. It will also instantiate serial-getty@.service
          instances for virtualizer consoles, if execution in a virtualized
          environment is detected. If execution in a container environment
          is detected, it will instead enable console-getty.service for
          /dev/console, and container-getty@.service instances for
          additional container pseudo TTYs as requested by the container
          manager (see Container Interface[1]). This should ensure that the
          user is shown a login prompt at the right place, regardless of
          which environment the system is started in. For example, it is
          sufficient to redirect the kernel console with a kernel command
          line argument such as console= to get both kernel messages and a
          getty prompt on a serial TTY. See kernel-parameters.txt[2] for
          more information on the console= kernel parameter.

          systemd-getty-generator implements systemd.generator(7).

          Further information about configuration of gettys can be found in
          systemd for Administrators, Part XVI: Gettys on Serial Consoles
          (and Elsewhere)[3].


---------------------------------------------------------

::

          systemd(1), agetty(8)


---------------------------------------------------

::

           1. Container
                  Interface
              https://systemd.io/CONTAINER_INTERFACE

           2. kernel-parameters.txt
              https://www.kernel.org/doc/Documentation/admin-guide/kernel-parameters.txt

           3. systemd for Administrators, Part XVI: Gettys on Serial
              Consoles (and Elsewhere)
              http://0pointer.de/blog/projects/serial-console.html

COLOPHON
---------------------------------------------------------

::

          This page is part of the systemd (systemd system and service
          manager) project.  Information about the project can be found at
          ⟨http://www.freedesktop.org/wiki/Software/systemd⟩.  If you have
          a bug report for this manual page, see
          ⟨http://www.freedesktop.org/wiki/Software/systemd/#bugreports⟩.
          This page was obtained from the project's upstream Git repository
          ⟨https://github.com/systemd/systemd.git⟩ on 2021-08-27.  (At that
          time, the date of the most recent commit that was found in the
          repository was 2021-08-27.)  If you discover any rendering
          problems in this HTML version of the page, or you believe there
          is a better or more up-to-date source for the page, or you have
          corrections or improvements to the information in this COLOPHON
          (which is not part of the original manual page), send a mail to
          man-pages@man7.org

   systemd 249                                   SYSTEMD-GETTY-GENERATOR(8)

--------------

Pages that refer to this page:
`systemd.generator(7) <../man7/systemd.generator.7.html>`__

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
