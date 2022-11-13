.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

sysctl.conf(5) — Linux manual page
==================================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `NOTES <#NOTES>`__ \|             |                                   |
| `EXAMPLE <#EXAMPLE>`__ \|         |                                   |
| `FILES <#FILES>`__ \|             |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `AUTHOR <#AUTHOR>`__ \|           |                                   |
| `RE                               |                                   |
| PORTING BUGS <#REPORTING_BUGS>`__ |                                   |
| \| `COLOPHON <#COLOPHON>`__       |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   SYSCTL.CONF(5)                File Formats                SYSCTL.CONF(5)

NAME
-------------------------------------------------

::

          sysctl.conf - sysctl preload/configuration file


---------------------------------------------------------------

::

          sysctl.conf is a simple file containing sysctl values to be read
          in and set by sysctl.  The syntax is simply as follows:

                 # comment
                 ; comment

                 token = value

          Note that blank lines are ignored, and whitespace before and
          after a token or value is ignored, although a value can contain
          whitespace within.  Lines which begin with a # or ; are
          considered comments and ignored.

          If a line begins with a single -, any attempts to set the value
          that fail will be ignored.


---------------------------------------------------

::

          As the /etc/sysctl.conf file is used to override default kernel
          parameter values, only a small number of parameters is predefined
          in the file.  Use /sbin/sysctl -a or follow sysctl(8) to list all
          possible parameters. The description of individual parameters can
          be found in the kernel documentation.


-------------------------------------------------------

::

                 # sysctl.conf sample
                 #
                   kernel.domainname = example.com
                 ; this one has a space which will be written to the sysctl!
                   kernel.modprobe = /sbin/mod probe


---------------------------------------------------

::

          /etc/sysctl.d/*.conf
          /run/sysctl.d/*.conf
          /usr/local/lib/sysctl.d/*.conf
          /usr/lib/sysctl.d/*.conf
          /lib/sysctl.d/*.conf
          /etc/sysctl.conf

          The paths where sysctl preload files usually exist.  See also
          sysctl option --system.


---------------------------------------------------------

::

          sysctl(8)


-----------------------------------------------------

::

          George Staikos ⟨staikos@0wned.org⟩


---------------------------------------------------------------------

::

          Please send bug reports to ⟨procps@freelists.org⟩

COLOPHON
---------------------------------------------------------

::

          This page is part of the procps-ng (/proc filesystem utilities)
          project.  Information about the project can be found at 
          ⟨https://gitlab.com/procps-ng/procps⟩.  If you have a bug report
          for this manual page, see
          ⟨https://gitlab.com/procps-ng/procps/blob/master/Documentation/bugs.md⟩.
          This page was obtained from the project's upstream Git repository
          ⟨https://gitlab.com/procps-ng/procps.git⟩ on 2021-08-27.  (At
          that time, the date of the most recent commit that was found in
          the repository was 2021-08-24.)  If you discover any rendering
          problems in this HTML version of the page, or you believe there
          is a better or more up-to-date source for the page, or you have
          corrections or improvements to the information in this COLOPHON
          (which is not part of the original manual page), send a mail to
          man-pages@man7.org

   procps-ng                      2020-06-04                 SYSCTL.CONF(5)

--------------

Pages that refer to this page:
`sysctl.d(5) <../man5/sysctl.d.5.html>`__, 
`sysctl(8) <../man8/sysctl.8.html>`__

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
