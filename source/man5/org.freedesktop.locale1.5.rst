.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

org.freedesktop.locale1(5) — Linux manual page
==============================================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `INTRODUCTION <#INTRODUCTION>`__  |                                   |
| \|                                |                                   |
| `                                 |                                   |
| THE D-BUS API <#THE_D-BUS_API>`__ |                                   |
| \| `EXAMPLES <#EXAMPLES>`__ \|    |                                   |
| `VERSIONING <#VERSIONING>`__ \|   |                                   |
| `NOTES <#NOTES>`__ \|             |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   ORG.FREEDESKTOP.LOCALE1(5)rg.freedesktop.locale1G.FREEDESKTOP.LOCALE1(5)

NAME
-------------------------------------------------

::

          org.freedesktop.locale1 - The D-Bus interface of systemd-localed


-----------------------------------------------------------------

::

          systemd-localed.service(8) is a system service that can be used
          to control the system locale and keyboard mapping from user
          programs. This page describes the D-Bus interface.


-------------------------------------------------------------------

::

          The service exposes the following interfaces on the bus:

              node /org/freedesktop/locale1 {
                interface org.freedesktop.locale1 {
                  methods:
                    SetLocale(in  as locale,
                              in  b interactive);
                    SetVConsoleKeyboard(in  s keymap,
                                        in  s keymap_toggle,
                                        in  b convert,
                                        in  b interactive);
                    SetX11Keyboard(in  s layout,
                                   in  s model,
                                   in  s variant,
                                   in  s options,
                                   in  b convert,
                                   in  b interactive);
                  properties:
                    readonly as Locale = ['...', ...];
                    readonly s X11Layout = '...';
                    readonly s X11Model = '...';
                    readonly s X11Variant = '...';
                    readonly s X11Options = '...';
                    readonly s VConsoleKeymap = '...';
                    readonly s VConsoleKeymapToggle = '...';
                };
                interface org.freedesktop.DBus.Peer { ... };
                interface org.freedesktop.DBus.Introspectable { ... };
                interface org.freedesktop.DBus.Properties { ... };
              };

      Methods
          If you set a new system locale all old system locale settings
          will be dropped and the new settings will be saved to disk. The
          locale will also be passed to the system manager, and
          subsequently started daemons will inherit the new system locale.
          Note that already running daemons will not learn about the new
          value.

          The SetVConsoleKeyboard() method may be used to set the key
          mapping for the virtual console. Similarly, SetX11Keyboard() may
          be used to set the default key mapping of any X11 servers.

          Note that SetVConsoleKeyboard() instantly applies the new key
          mapping to the console, while SetX11Keyboard() simply sets a
          default that may be used by later sessions.

          The boolean argument convert may be set to optionally convert the
          console keyboard configuration to X11 keyboard mappings and vice
          versa. If true and SetVConsoleKeyboard() is used, the nearest X11
          keyboard setting for the chosen console setting is set. If true
          and SetX11Keyboard() is used, the nearest console keyboard
          setting for the chosen X11 setting is set. Hence, it is usually
          sufficient to call only one of the two functions.

          For graphical UIs that need to set the system keyboard mapping
          simply invoke SetX11Keyboard(), set convert=true and ignore
          SetVConsoleKeyboard().

          Use the empty string for the keymap parameters you wish not to
          set.

          The interactive boolean parameters can be used to control whether
          polkit[1] should interactively ask the user for authentication
          credentials if required.

      Signals
          Whenever the system locale or keymap is changed via the daemon,
          PropertyChanged signals are sent out to which clients can
          subscribe.

      Properties
          The system locale is shown in the Locale property. It is an array
          containing environment-variable-assignment-like strings. The
          following strings are known: LANG=, LC_CTYPE=, LC_NUMERIC=,
          LC_TIME=, LC_COLLATE=, LC_MONETARY=, LC_MESSAGES=, LC_PAPER=,
          LC_NAME=, LC_ADDRESS=, LC_TELEPHONE=, LC_MEASUREMENT=,
          LC_IDENTIFICATION=.

          The X11Layout, X11Model, X11Variant, and X11Options properties
          show values configurable with SetX11Keyboard() described above
          (or SetVConsoleKeyboard() with convert=true). The VConsoleKeymap
          and VConsoleKeymapToggle properties show values configurable with
          SetVConsoleKeyboard() (or SetX11Keyboard() with convert=true).

      Security
          Changing the system locale or keymap using this interface is
          authenticated via polkit. The polkit action for SetLocale() is
          org.freedesktop.locale1.set-locale. The polkit action for
          SetX11Keyboard() and SetVConsoleKeyboard() is
          org.freedesktop.locale1.set-keyboard.


---------------------------------------------------------

::

          Example 1. Introspect org.freedesktop.locale1 on the bus

              $ gdbus introspect --system \
                --dest org.freedesktop.locale1 \
                --object-path /org/freedesktop/locale1


-------------------------------------------------------------

::

          These D-Bus interfaces follow the usual interface versioning
          guidelines[2].


---------------------------------------------------

::

           1. polkit
              https://www.freedesktop.org/software/polkit/docs/latest/

           2. the usual interface versioning guidelines
              http://0pointer.de/blog/projects/versioning-dbus.html

COLOPHON
---------------------------------------------------------

::

          This page is part of the systemd (systemd system and service
          manager) project.  Information about the project can be found at
          ⟨http://www.freedesktop.org/wiki/Software/systemd⟩.  If you have
          a bug report for this manual page, see
          ⟨http://www.freedesktop.org/wiki/Software/systemd/#bugreports⟩.
          This page was obtained from the project's upstream Git repository
          ⟨https://github.com/systemd/systemd.git⟩ on 2021-08-27.  (At that
          time, the date of the most recent commit that was found in the
          repository was 2021-08-27.)  If you discover any rendering
          problems in this HTML version of the page, or you believe there
          is a better or more up-to-date source for the page, or you have
          corrections or improvements to the information in this COLOPHON
          (which is not part of the original manual page), send a mail to
          man-pages@man7.org

   systemd 249                                   ORG.FREEDESKTOP.LOCALE1(5)

--------------

Pages that refer to this page:
`systemd-localed.service(8) <../man8/systemd-localed.service.8.html>`__

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
