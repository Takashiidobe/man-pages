.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

showkey(1) — Linux manual page
==============================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `OPTIONS <#OPTIONS>`__ \|         |                                   |
| `2.6 KERNELS <#2.6_KERNELS>`__ \| |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   SHOWKEY(1)               General Commands Manual              SHOWKEY(1)

NAME
-------------------------------------------------

::

          showkey - examine the codes sent by the keyboard


---------------------------------------------------------

::

          showkey [-h|--help] [-a|--ascii] [-s|--scancodes] [-k|--keycodes]
          [-V|--version]


---------------------------------------------------------------

::

          showkey prints to standard output either the scan codes or the
          keycode or the `ascii' code of each key pressed.  In the first
          two modes the program runs until 10 seconds have elapsed since
          the last key press or release event, or until it receives a
          suitable signal, like SIGTERM, from another process.  In `ascii'
          mode the program terminates when the user types ^D.

          When in scancode dump mode, showkey prints in hexadecimal format
          each byte received from the keyboard to the standard output. A
          new line is printed when an interval of about 0.1 seconds occurs
          between the bytes received, or when the internal receive buffer
          fills up. This can be used to determine roughly, what byte
          sequences the keyboard sends at once on a given key press. The
          scan code dumping mode is primarily intended for debugging the
          keyboard driver or other low level interfaces. As such it
          shouldn't be of much interest to the regular end-user. However,
          some modern keyboards have keys or buttons that produce scancodes
          to which the kernel does not associate a keycode, and, after
          finding out what these are, the user can assign keycodes with
          setkeycodes(8).

          When in the default keycode dump mode, showkey prints to the
          standard output the keycode number or each key pressed or
          released. The kind of the event, press or release, is also
          reported.  Keycodes are numbers assigned by the kernel to each
          individual physical key. Every key has always only one associated
          keycode number, whether the keyboard sends single or multiple
          scan codes when pressing it. Using showkey in this mode, you can
          find out what numbers to use in your personalized keymap files.

          When in `ascii' dump mode, showkey prints to the standard output
          the decimal, octal, and hexadecimal value(s) of the key pressed,
          according to he present keymap.


-------------------------------------------------------

::

          -h --help
                 showkey prints to the standard error output its version
                 number, a compile option and a short usage message, then
                 exits.

          -s --scancodes
                 Starts showkey in scan code dump mode.

          -k --keycodes
                 Starts showkey in keycode dump mode. This is the default,
                 when no command line options are present.

          -a --ascii
                 Starts showkey in `ascii' dump mode.

          -V --version
                 showkey prints version number and exits.


---------------------------------------------------------------

::

          In 2.6 kernels key codes lie in the range 1-255, instead of
          1-127.  Key codes larger than 127 are returned as three bytes of
          which the low order 7 bits are: zero, bits 13-7, and bits 6-0 of
          the key code.  The high order bits are: 0/1 for make/break, 1, 1.

          In 2.6 kernels raw mode, or scancode mode, is not very raw at
          all.  Scan codes are first translated to key codes, and when
          scancodes are desired, the key codes are translated back. Various
          transformations are involved, and there is no guarantee at all
          that the final result corresponds to what the keyboard hardware
          did send. So, if you want to know the scan codes sent by various
          keys it is better to boot a 2.4 kernel. Since 2.6.9 there also is
          the boot option atkbd.softraw=0 that tells the 2.6 kernel to
          return the actual scan codes.


---------------------------------------------------------

::

          loadkeys(1), dumpkeys(1), keymaps(5), setkeycodes(8)

COLOPHON
---------------------------------------------------------

::

          This page is part of the kbd (Linux keyboard tools) project.
          Information about the project can be found at 
          ⟨http://www.kbd-project.org/⟩.  If you have a bug report for this
          manual page, send it to kbd@lists.altlinux.org.  This page was
          obtained from the project's upstream Git repository
          ⟨https://github.com/legionus/kbd.git⟩ on 2021-08-27.  (At that
          time, the date of the most recent commit that was found in the
          repository was 2021-07-04.)  If you discover any rendering
          problems in this HTML version of the page, or you believe there
          is a better or more up-to-date source for the page, or you have
          corrections or improvements to the information in this COLOPHON
          (which is not part of the original manual page), send a mail to
          man-pages@man7.org

   kbd                            1 Feb 1998                     SHOWKEY(1)

--------------

Pages that refer to this page:
`loadkeys(1) <../man1/loadkeys.1.html>`__, 
`keymaps(5) <../man5/keymaps.5.html>`__, 
`setkeycodes(8) <../man8/setkeycodes.8.html>`__

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
