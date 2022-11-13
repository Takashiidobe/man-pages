.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

grolj4(1) — Linux manual page
=============================

+-----------------------------------+-----------------------------------+
| `Name <#Name>`__ \|               |                                   |
| `Synopsis <#Synopsis>`__ \|       |                                   |
| `Description <#Description>`__ \| |                                   |
| `Options <#Options>`__ \|         |                                   |
| `Environment <#Environment>`__ \| |                                   |
| `Files <#Files>`__ \|             |                                   |
| `Bugs <#Bugs>`__ \|               |                                   |
| `See also <#See_also>`__ \|       |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   grolj4(1)                General Commands Manual               grolj4(1)


-------------------------------------------------

::

          grolj4 - groff output driver for HP LaserJet 4 family printers


---------------------------------------------------------

::

          grolj4 [-l] [-c num-copies] [-d [n]] [-F font-directory]
                 [-p paper-size] [-w line-width] [file ...]

          grolj4 --help

          grolj4 -v
          grolj4 --version


---------------------------------------------------------------

::

          grolj4 is a driver for groff that produces output in PCL5 format
          suitable for an HP LaserJet 4 printer.

          There is an additional drawing command available:

          \D'R dh dv'
                 Draw a rule (solid black rectangle), with one corner at
                 the current position, and the diagonally opposite corner
                 at the current position +(dh,dv).  Afterwards the current
                 position will be at the opposite corner.  This generates a
                 PCL fill rectangle command, and so will work on printers
                 that do not support HPGL/2 unlike the other \D commands.


-------------------------------------------------------

::

          --help displays a usage message, while -v and --version show
          version information; all exit afterward.

          -c num-copies
                 Print num-copies copies of each page.

          -l     Print the document with a landscape orientation.

          -d [n] Use duplex mode n: 1 is long-side binding; 2 is short-side
                 binding; default is 1.

          -p paper-size
                 Set the paper size to paper-size, which must be one of
                 letter, legal, executive, a4, com10, monarch, c5, b5, dl.

          -w line-width
                 Set the default line thickness to line-width thousandths
                 of an em.  If this option isn't specified, the line
                 thickness defaults to 0.04 em.

          -F font-directory
                 Prepend directory font-directory/devname to the search
                 path for font and device description files; name is the
                 name of the device, usually lj4.

          The following four commands are available additionally in the
          font description files:

          pclweight N
                 The integer value N must be in the range -7 to +7; default
                 is 0.

          pclstyle N
                 The integer value N must be in the range 0 to 32767;
                 default is 0.

          pclproportional N
                 A boolean flag which can be either 0 or 1; default is 0.

          pcltypeface N
                 The integer value N must be in the range 0 to 65535;
                 default is 0.


---------------------------------------------------------------

::

          GROFF_FONT_PATH
                 A list of directories in which to seek the selected output
                 device's directory of device and font description files.
                 See troff(1) and groff_font(5).


---------------------------------------------------

::

          /usr/local/share/groff/1.23.0/font/devlj4/DESC
                 Device description file.

          /usr/local/share/groff/1.23.0/font/devlj4/F
                 Font description file for font F.

          /usr/local/share/groff/1.23.0/tmac/lj4.tmac
                 Macros for use with grolj4.


-------------------------------------------------

::

          Small dots.


---------------------------------------------------------

::

          lj4_font(5), groff(1), troff(1), groff_out(5), groff_font(5),
          groff_char(7)

COLOPHON
---------------------------------------------------------

::

          This page is part of the groff (GNU troff) project.  Information
          about the project can be found at 
          ⟨http://www.gnu.org/software/groff/⟩.  If you have a bug report
          for this manual page, see ⟨http://www.gnu.org/software/groff/⟩.
          This page was obtained from the project's upstream Git repository
          ⟨https://git.savannah.gnu.org/git/groff.git⟩ on 2021-08-27.  (At
          that time, the date of the most recent commit that was found in
          the repository was 2021-08-23.)  If you discover any rendering
          problems in this HTML version of the page, or you believe there
          is a better or more up-to-date source for the page, or you have
          corrections or improvements to the information in this COLOPHON
          (which is not part of the original manual page), send a mail to
          man-pages@man7.org

   groff 1.23.0.rc1.654-4e1db-dir1t9yAugust 2021                    grolj4(1)

--------------

Pages that refer to this page: `groff(1) <../man1/groff.1.html>`__, 
`grolbp(1) <../man1/grolbp.1.html>`__, 
`hpftodit(1) <../man1/hpftodit.1.html>`__, 
`lj4_font(5) <../man5/lj4_font.5.html>`__

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
