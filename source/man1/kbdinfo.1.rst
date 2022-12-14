.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

kbdinfo(1) — Linux manual page
==============================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `OPTIONS <#OPTIONS>`__ \|         |                                   |
| `AUTHORS <#AUTHORS>`__ \|         |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   KBDINFO(1)               General Commands Manual              KBDINFO(1)

NAME
-------------------------------------------------

::

          kbdinfo - read information about keyboard state


---------------------------------------------------------

::

          kbdinfo [options] getmode [text|graphics]
          kbdinfo [options] gkbmode [raw|xlate|mediumraw|unicode]
          kbdinfo [options] gkbmeta [metabit|escprefix]
          kbdinfo [options] gkbled  [scrolllock|numlock|capslock]


---------------------------------------------------------------

::

          The utility allows you to read and check various parameters of
          the keyboard and virtual console.

          getmode  Get or check virtual console mode.

          gkbmode  Gets current keyboard mode.

                 raw    Raw (scancode) mode. These are the raw codes
                        generated by the keyboard.

                 mediumraw
                        Medium raw (scancode) mode. This is extended medium
                        raw mode, with keys above 127 encoded as 0, high 7
                        bits, low 7 bits, with the 0 bearing the 'up' flag
                        if needed. 0 is reserved, so this shouldn't
                        interfere with anything else. The two bytes after 0
                        will always have the up flag set not to interfere
                        with older applications. This allows for 16384
                        different keycodes, which should be enough.

                 xlate  Translate keycodes using keymap. These are the
                        codes generated via the current keysym mapping.

                 unicode
                        Unicode mode.

          gkbmeta  Gets meta key handling mode.

                 escprefix
                        Specifies if pressing the meta (alt) key generates
                        an ESC (\033) prefix followed by the keysym.

                 metabit
                        The keysym marked with the high bit set.

          gkbled   Get keyboard flags CapsLock, NumLock, ScrollLock (not
                   lights).

                 scrolllock
                        The scroll lock is down.

                 numlock
                        The num lock is down.

                 capslock
                        The caps lock is down.


-------------------------------------------------------

::

          -C, --console=DEV
                 the console device to be used;

          -V, --version
                 print version number;

          -h, --help
                 print this usage message.


-------------------------------------------------------

::

          Written by Alexey Gladkov.


---------------------------------------------------------

::

          kbdrate(1), setleds(1), kbd_mode(1)

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

   kbd                             June 2019                     KBDINFO(1)

--------------

Pages that refer to this page:
`setmetamode(1) <../man1/setmetamode.1.html>`__

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
