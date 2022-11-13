.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

kbd_mode(1) — Linux manual page
===============================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   KBD_MODE(1)              General Commands Manual             KBD_MODE(1)

NAME
-------------------------------------------------

::

          kbd_mode - report or set the keyboard mode


---------------------------------------------------------

::

          kbd_mode [ -a | -u | -k | -s ] [ -f ] [ -C CONSOLE ]


---------------------------------------------------------------

::

          Without argument, kbd_mode prints the current keyboard mode (RAW,
          MEDIUMRAW or XLATE).  With argument, it sets the keyboard mode as
          indicated:

          -s: scancode mode (RAW),

          -k: keycode mode (MEDIUMRAW),

          -a: ASCII mode (XLATE),

          -u: UTF-8 mode (UNICODE).

          Of course the "-a" is only traditional, and the code used can be
          any 8-bit character set.  With "-u" a 16-bit character set is
          expected, and these chars are transmitted to the kernel as 1, 2,
          or 3 bytes (following the UTF-8 coding).  In these latter two
          modes the key mapping defined by loadkeys(1) is used.

          kbd_mode operates on the console specified by the "-C" option; if
          there is none, the console associated with stdin is used.

          Warning: changing the keyboard mode, other than between ASCII and
          Unicode, will probably make your keyboard unusable. Set the "-f"
          option to force such changes.  This command is only meant for use
          (say via remote login) when some program left your keyboard in
          the wrong state.  Note that in some obsolete versions of this
          program the "-u" option was a synonym for "-s" and older versions
          of this program may not recognize the "-f" option.


---------------------------------------------------------

::

          loadkeys(1)

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

   kbd                            6 Apr 1994                    KBD_MODE(1)

--------------

Pages that refer to this page: `kbdinfo(1) <../man1/kbdinfo.1.html>`__, 
`loadkeys(1) <../man1/loadkeys.1.html>`__, 
`unicode_start(1) <../man1/unicode_start.1.html>`__, 
`unicode_stop(1) <../man1/unicode_stop.1.html>`__, 
`ioctl_console(2) <../man2/ioctl_console.2.html>`__

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
