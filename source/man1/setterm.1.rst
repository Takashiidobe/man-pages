.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

setterm(1) — Linux manual page
==============================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `OPTIONS <#OPTIONS>`__ \|         |                                   |
| `                                 |                                   |
| COMPATIBILITY <#COMPATIBILITY>`__ |                                   |
| \| `BUGS <#BUGS>`__ \|            |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `RE                               |                                   |
| PORTING BUGS <#REPORTING_BUGS>`__ |                                   |
| \|                                |                                   |
| `AVAILABILITY <#AVAILABILITY>`__  |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   SETTERM(1)                    User Commands                   SETTERM(1)

NAME
-------------------------------------------------

::

          setterm - set terminal attributes


---------------------------------------------------------

::

          setterm [options]


---------------------------------------------------------------

::

          setterm writes to standard output a character string that will
          invoke the specified terminal capabilities. Where possible
          terminfo is consulted to find the string to use. Some options
          however (marked "virtual consoles only" below) do not correspond
          to a terminfo(5) capability. In this case, if the terminal type
          is "con" or "linux" the string that invokes the specified
          capabilities on the PC Minix virtual console driver is output.
          Options that are not implemented by the terminal are ignored.


-------------------------------------------------------

::

          For boolean options (on or off), the default is on.

          Below, an 8-color can be black, red, green, yellow, blue,
          magenta, cyan, or white.

          A 16-color can be an 8-color, or grey, or bright followed by red,
          green, yellow, blue, magenta, cyan, or white.

          The various color options may be set independently, at least on
          virtual consoles, though the results of setting multiple modes
          (for example, --underline and --half-bright) are
          hardware-dependent.

          The optional arguments require '=' (equals sign) and not space
          between the option and the argument. For example
          --option=argument.

          --appcursorkeys on|off
              Sets Cursor Key Application Mode on or off. When on, ESC O A,
              ESC O B, etc. will be sent for the cursor keys instead of ESC
              [ A, ESC [ B, etc. See the vi and Cursor-Keys section of the
              Text-Terminal-HOWTO for how this can cause problems for vi
              users. Virtual consoles only.

          --append console_number
              Like --dump, but appends to the snapshot file instead of
              overwriting it. Only works if no --dump options are given.

          --background 8-color|default
              Sets the background text color.

          --blank[=0-60|force|poke]
              Sets the interval of inactivity, in minutes, after which the
              screen will be automatically blanked (using APM if
              available). Without an argument, it gets the blank status
              (returns which vt was blanked, or zero for an unblanked vt).
              Virtual consoles only.

              The force argument keeps the screen blank even if a key is
              pressed.

              The poke argument unblanks the screen.

          --bfreq[=number]
              Sets the bell frequency in Hertz. Without an argument, it
              defaults to 0. Virtual consoles only.

          --blength[=0-2000]
              Sets the bell duration in milliseconds. Without an argument,
              it defaults to 0. Virtual consoles only.

          --blink on|off
              Turns blink mode on or off. Except on a virtual console,
              --blink off turns off all attributes (bold, half-brightness,
              blink, reverse).

          --bold on|off
              urns bold (extra bright) mode on or off. Except on a virtual
              console, --bold off turns off all attributes (bold,
              half-brightness, blink, reverse).

          --clear[=all|rest]
              Without an argument or with the argument all, the entire
              screen is cleared and the cursor is set to the home position,
              just like clear(1) does. With the argument rest, the screen
              is cleared from the current cursor position to the end.

          --clrtabs[=tab1 tab2 tab3 ...]
              Clears tab stops from the given horizontal cursor positions,
              in the range 1-160. Without arguments, it clears all tab
              stops. Virtual consoles only.

          --cursor on|off
              Turns the terminal’s cursor on or off.

          --default
              Sets the terminal’s rendering options to the default values.

          --dump[=console_number]
              Writes a snapshot of the virtual console with the given
              number to the file specified with the --file option,
              overwriting its contents; the default is screen.dump. Without
              an argument, it dumps the current virtual console. This
              overrides --append.

          --file filename
              Sets the snapshot file name for any --dump or --append
              options on the same command line. If this option is not
              present, the default is screen.dump in the current directory.
              A path name that exceeds the system maximum will be
              truncated, see PATH_MAX from linux/limits.h for the value.

          --foreground 8-color|default
              Sets the foreground text color.

          --half-bright on|off
              Turns dim (half-brightness) mode on or off. Except on a
              virtual console, --half-bright off turns off all attributes
              (bold, half-brightness, blink, reverse).

          --hbcolor [bright] 16-color
              Sets the color for half-bright characters.

          --initialize
              Displays the terminal initialization string, which typically
              sets the terminal’s rendering options, and other attributes
              to the default values.

          --inversescreen on|off
              Swaps foreground and background colors for the whole screen.

          --linewrap on|off
              Makes the terminal continue on a new line when a line is
              full.

          --msg on|off
              Enables or disables the sending of kernel printk() messages
              to the console. Virtual consoles only.

          --msglevel 0-8
              Sets the console logging level for kernel printk() messages.
              All messages strictly more important than this will be
              printed, so a logging level of 0 has the same effect as --msg
              on and a logging level of 8 will print all kernel messages.
              klogd(8) may be a more convenient interface to the logging of
              kernel messages.

              Virtual consoles only.

          --powerdown[=0-60]
              Sets the VESA powerdown interval in minutes. Without an
              argument, it defaults to 0 (disable powerdown). If the
              console is blanked or the monitor is in suspend mode, then
              the monitor will go into vsync suspend mode or powerdown mode
              respectively after this period of time has elapsed.

          --powersave mode
              Valid values for mode are:

              vsync|on
                  Puts the monitor into VESA vsync suspend mode.

              hsync
                  Puts the monitor into VESA hsync suspend mode.

              powerdown
                  Puts the monitor into VESA powerdown mode.

              off
                  Turns monitor VESA powersaving features.

          --regtabs[=1-160]
              Clears all tab stops, then sets a regular tab stop pattern,
              with one tab every specified number of positions. Without an
              argument, it defaults to 8. Virtual consoles only.

          --repeat on|off
              Turns keyboard repeat on or off. Virtual consoles only.

          --reset
              Displays the terminal reset string, which typically resets
              the terminal to its power-on state.

          --resize
              Reset terminal size by assessing maximum row and column. This
              is useful when actual geometry and kernel terminal driver are
              not in sync. Most notable use case is with serial consoles,
              that do not use ioctl(3p) but just byte streams and breaks.

          --reverse on|off
              Turns reverse video mode on or off. Except on a virtual
              console, --reverse off turns off all attributes (bold,
              half-brightness, blink, reverse).

          --store
              Stores the terminal’s current rendering options (foreground
              and background colors) as the values to be used at
              reset-to-default. Virtual consoles only.

          --tabs[=tab1 tab2 tab3 ...]
              Sets tab stops at the given horizontal cursor positions, in
              the range 1-160. Without arguments, it shows the current tab
              stop settings.

          --term terminal_name
              Overrides the TERM environment variable.

          --ulcolor [bright] 16-color
              Sets the color for underlined characters. Virtual consoles
              only.

          --underline on|off
              Turns underline mode on or off.

          --version
              Displays version information and exits.

          --help
              Displays a help text and exits.


-------------------------------------------------------------------

::

          Since version 2.25 setterm has support for long options with two
          hyphens, for example --help, beside the historical long options
          with a single hyphen, for example -help. In scripts it is better
          to use the backward-compatible single hyphen rather than the
          double hyphen. Currently there are no plans nor good reasons to
          discontinue single-hyphen compatibility.


-------------------------------------------------

::

          Differences between the Minix and Linux versions are not
          documented.


---------------------------------------------------------

::

          stty(1), tput(1), tty(4), terminfo(5)


---------------------------------------------------------------------

::

          For bug reports, use the issue tracker at
          https://github.com/karelzak/util-linux/issues.


-----------------------------------------------------------------

::

          The setterm command is part of the util-linux package which can
          be downloaded from Linux Kernel Archive
          <https://www.kernel.org/pub/linux/utils/util-linux/>. This page
          is part of the util-linux (a random collection of Linux
          utilities) project. Information about the project can be found at
          ⟨https://www.kernel.org/pub/linux/utils/util-linux/⟩. If you have
          a bug report for this manual page, send it to
          util-linux@vger.kernel.org. This page was obtained from the
          project's upstream Git repository
          ⟨git://git.kernel.org/pub/scm/utils/util-linux/util-linux.git⟩ on
          2021-08-27. (At that time, the date of the most recent commit
          that was found in the repository was 2021-08-24.) If you discover
          any rendering problems in this HTML version of the page, or you
          believe there is a better or more up-to-date source for the page,
          or you have corrections or improvements to the information in
          this COLOPHON (which is not part of the original manual page),
          send a mail to man-pages@man7.org

   util-linux 2.37.85-637cc       2021-04-02                     SETTERM(1)

--------------

Pages that refer to this page: `termios(3) <../man3/termios.3.html>`__, 
`console_codes(4) <../man4/console_codes.4.html>`__, 
`termio(7) <../man7/termio.7.html>`__

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
