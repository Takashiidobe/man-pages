.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

arptables-nft-save(8) — Linux manual page
=========================================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `AUTHOR <#AUTHOR>`__ \|           |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   ARPTABLES-SAVE(8)                                      ARPTABLES-SAVE(8)

NAME
-------------------------------------------------

::

          arptables-save - dump arptables rules to stdout (nft-based)


---------------------------------------------------------

::

          arptables-save [-M modprobe] [-c]

          arptables-save [-V]


---------------------------------------------------------------

::

          arptables-save is used to dump the contents of an ARP Table in
          easily parseable format to STDOUT. Use I/O-redirection provided
          by your shell to write to a file.

          -M, --modprobe modprobe_program
                 Specify the path to the modprobe program. By default,
                 arptables-save will inspect /proc/sys/kernel/modprobe to
                 determine the executable's path.

          -c, --counters
                 Include the current values of all packet and byte counters
                 in the output.

          -V, --version
                 Print version information and exit.


-----------------------------------------------------

::

          Jesper Dangaard Brouer <brouer@redhat.com>


---------------------------------------------------------

::

          arptables-restore(8), arptables(8)

COLOPHON
---------------------------------------------------------

::

          This page is part of the iptables (administer and maintain packet
          filter rules) project.  Information about the project can be
          found at ⟨http://www.netfilter.org/⟩.  If you have a bug report
          for this manual page, see ⟨http://bugzilla.netfilter.org/⟩.  This
          page was obtained from the project's upstream Git repository
          ⟨git://git.netfilter.org/iptables⟩ on 2021-08-27.  (At that time,
          the date of the most recent commit that was found in the
          repository was 2021-08-11.)  If you discover any rendering
          problems in this HTML version of the page, or you believe there
          is a better or more up-to-date source for the page, or you have
          corrections or improvements to the information in this COLOPHON
          (which is not part of the original manual page), send a mail to
          man-pages@man7.org

                                  March 2019              ARPTABLES-SAVE(8)

--------------

Pages that refer to this page:
`arptables-nft-restore(8) <../man8/arptables-nft-restore.8.html>`__

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
