.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

setkeycodes(8) — Linux manual page
==================================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `THEORY <#THEORY>`__ \|           |                                   |
| `2.6 KERNELS <#2.6_KERNELS>`__ \| |                                   |
| `OPTIONS <#OPTIONS>`__ \|         |                                   |
| `BUGS <#BUGS>`__ \|               |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   SETKEYCODES(8)           System Manager's Manual          SETKEYCODES(8)

NAME
-------------------------------------------------

::

          setkeycodes - load kernel scancode-to-keycode mapping table
          entries


---------------------------------------------------------

::

          setkeycodes scancode keycode ...


---------------------------------------------------------------

::

          The setkeycodes command reads its arguments two at a time, each
          pair of arguments consisting of a scancode (given in hexadecimal)
          and a keycode (given in decimal). For each such pair, it tells
          the kernel keyboard driver to map the specified scancode to the
          specified keycode.

          This command is useful only for people with slightly unusual
          keyboards, that have a few keys which produce scancodes that the
          kernel does not recognize.


-----------------------------------------------------

::

          The usual PC keyboard produces a series of scancodes for each key
          press and key release. (Scancodes are shown by showkey -s, see
          showkey(1) ) The kernel parses this stream of scancodes, and
          converts it to a stream of keycodes (key press/release events).
          (Keycodes are shown by showkey.)  Apart from a few scancodes with
          special meaning, and apart from the sequence produced by the
          Pause key, and apart from shiftstate related scancodes, and apart
          from the key up/down bit, the stream of scancodes consists of
          unescaped scancodes xx (7 bits) and escaped scancodes e0 xx (8+7
          bits).  To these scancodes or scancode pairs, a corresponding
          keycode can be assigned (in the range 1-127).  For example, if
          you have a Macro key that produces e0 6f according to showkey(1),
          the command
                 setkeycodes e06f 112
          will assign the keycode 112 to it, and then loadkeys(1) can be
          used to define the function of this key.

          Some older kernels might hardwire a low scancode range to the
          equivalent keycodes; setkeycodes will fail when you try to remap
          these.


---------------------------------------------------------------

::

          In 2.6 kernels key codes lie in the range 1-255, instead of
          1-127.  (It might be best to confine oneself to the range 1-239.)

          In 2.6 kernels raw mode, or scancode mode, is not very raw at
          all.  The code returned by showkey -s will change after use of
          setkeycodes.  A kernel bug. See also showkey(1).


-------------------------------------------------------

::

          None.


-------------------------------------------------

::

          The keycodes of X have nothing to do with those of Linux.
          Unusual keys can be made visible under Linux, but not under X.


---------------------------------------------------------

::

          dumpkeys(1), loadkeys(1), showkey(1), getkeycodes(8)

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

   kbd                            8 Nov 1994                 SETKEYCODES(8)

--------------

Pages that refer to this page: `showkey(1) <../man1/showkey.1.html>`__, 
`getkeycodes(8) <../man8/getkeycodes.8.html>`__

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
