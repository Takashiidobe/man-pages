.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

pci.ids(5) — Linux manual page
==============================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `INTRODUCTION <#INTRODUCTION>`__  |                                   |
| \|                                |                                   |
| `KEEPING THE LIST UP-TO-DATE      |                                   |
| <#KEEPING_THE_LIST_UP-TO-DATE>`__ |                                   |
| \| `FILE FORMAT <#FILE_FORMAT>`__ |                                   |
| \| `SEE ALSO <#SEE_ALSO>`__ \|    |                                   |
| `AUTHOR <#AUTHOR>`__ \|           |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   pci.ids(5)                  The PCI Utilities                 pci.ids(5)

NAME
-------------------------------------------------

::

          pci.ids - list of known identifiers related to PCI devices


-----------------------------------------------------------------

::

          Devices on the PCI bus are identified by a combination of a
          vendor ID (assigned by the PCI SIG) and device ID (assigned by
          the vendor). Both IDs are 16-bit integers and the device itself
          provides no translation to a human-readable string.

          In addition to the vendor and device, devices also report several
          other identifiers:

          •  Device class and subclass (two 8-bit numbers)

          •  Programming interface (8-bit number, meaning specific for the
             subclass)

          •  Subsystem, which identifies the assembly in which the device
             is contained.  A typical example is an Ethernet add-in card:
             the device is the Ethernet controller chip, while the card
             plays the role of the subsystem. Subsystems have their vendor
             ID (from the same namespace as device vendors) and subsystem
             ID. Generally, the meaning of the subsystem ID depends on the
             device, but there are cases in which a single subsystem ID is
             used for many devices - e.g., laptop motherboards.

             The PCI utilities use the pci.ids file to translate all these
             numeric IDs to strings.


-----------------------------------------------------------------------------------------------

::

          The pci.ids file is generated from the PCI ID database, which is
          maintained at ⟨https://pci-ids.ucw.cz/⟩.  If you find any IDs
          missing from the list, please contribute them to the database.

          You can use the update-pciids command to download the current
          version of the list.

          Alternatively, you can use lspci -q to query the database online.


---------------------------------------------------------------

::

          The pci.ids file is a text file in plain ASCII, interpreted line
          by line.  Lines starting with the hash sign are treated as
          comments are ignored.  Comments regarding a specific entry are
          written immediately before the entry.

          Vendor entries start with a 4-digit hexadecimal vendor ID,
          followed by one or more spaces, and the name of the vendor
          extending to the end of the line.

          Device entries are placed below the vendor entry. Each device
          entry consists of a single TAB character, a 4-digit hexadecimal
          device ID, followed by one or more spaces, and the name of the
          device extending to the end of the line.

          Subsystem entries are placed below the device entry. They start
          with two TAB characters, a 4-digit hexadecimal vendor ID (which
          must be defined elsewhere in the list), a single space, a 4-digit
          hexadecimal subsystem ID, one or more spaces, and the name of the
          subsystem extending to the end of the line.

          Class entries consist of "C", one space, 2-digit hexadecimal
          class ID, one or more spaces, and the name of the class.
          Subclasses are placed below the corresponding class, indented by
          a single TAB, followed by a 2-digit hexadecimal subclass ID, one
          or more spaces, and the name of the subclass.  Programming
          interfaces are below the subclass, indented by two TABs, followed
          by a 2-digit hexadecimal prog-if ID, one or more spaces, and the
          name.

          There can be device-independent subsystem IDs, although the web
          interface of the database does not support them yet. They start
          with a subsystem vendor line consisting of "S", one space, and a
          4-digit hexadecimal vendor ID (which must correspond to an
          already listed vendor). Subsystems follow on subsequent lines,
          each indented by one TAB, followed by a 4-digit hexadecimal
          subsystem ID, one or more spaces, and the name of the subsystem.

          To ensure extensibility of the format, lines starting with an
          unrecognized letter followed by a single space are ignored and so
          are all following TAB-indented lines.


---------------------------------------------------------

::

          lspci(8), update-pciids(8), pcilib(7)


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

   pciutils-3.6.4               25 January 2020                  pci.ids(5)

--------------

Pages that refer to this page: `pcilib(7) <../man7/pcilib.7.html>`__, 
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
