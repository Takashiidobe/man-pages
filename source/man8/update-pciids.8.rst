.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

update-pciids(8) — Linux manual page
====================================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `OPTIONS <#OPTIONS>`__ \|         |                                   |
| `FILES <#FILES>`__ \|             |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `AUTHOR <#AUTHOR>`__ \|           |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   update-pciids(8)            The PCI Utilities           update-pciids(8)

NAME
-------------------------------------------------

::

          update-pciids - download new version of the PCI ID list


---------------------------------------------------------

::

          update-pciids [-q]


---------------------------------------------------------------

::

          update-pciids fetches the current version of the pci.ids file
          from the primary distribution site and installs it.

          This utility requires curl, wget or lynx to be installed. If gzip
          or bzip2 are available, it automatically downloads the compressed
          version of the list.


-------------------------------------------------------

::

          -q     Be quiet and do not report anything except errors.


---------------------------------------------------

::

          /usr/local/share/pci.ids
                 Here we install the new list.


---------------------------------------------------------

::

          lspci(8), setpci(8)


-----------------------------------------------------

::

          The PCI Utilities are maintained by Martin Mares <mj@ucw.cz>.

COLOPHON
---------------------------------------------------------

::

          This page is part of the pciutils (PCI utilities) project.
          Information about the project can be found at 
          ⟨http://mj.ucw.cz/sw/pciutils/⟩.  If you have a bug report for
          this manual page, send it to linux-pci@vger.kernel.org.  This
          page was obtained from the project's upstream Git repository
          ⟨git://git.kernel.org/pub/scm/utils/pciutils/pciutils.git⟩ on
          2021-08-27.  (At that time, the date of the most recent commit
          that was found in the repository was 2020-12-06.)  If you
          discover any rendering problems in this HTML version of the page,
          or you believe there is a better or more up-to-date source for
          the page, or you have corrections or improvements to the
          information in this COLOPHON (which is not part of the original
          manual page), send a mail to man-pages@man7.org

   pciutils-3.6.4               25 January 2020            update-pciids(8)

--------------

Pages that refer to this page: `pci.ids(5) <../man5/pci.ids.5.html>`__, 
`pcilib(7) <../man7/pcilib.7.html>`__, 
`lspci(8) <../man8/lspci.8.html>`__

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
