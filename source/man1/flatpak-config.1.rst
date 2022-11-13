.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

flatpak-config(1) — Linux manual page
=====================================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `OPTIONS <#OPTIONS>`__ \|         |                                   |
| `EXAMPLES <#EXAMPLES>`__ \|       |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   FLATPAK CONFIG(1)            flatpak config            FLATPAK CONFIG(1)

NAME
-------------------------------------------------

::

          flatpak-config - Manage configuration


---------------------------------------------------------

::

          flatpak config [OPTION...]

          flatpak config [OPTION...] --set KEY VALUE

          flatpak config [OPTION...] --unset|--get KEY


---------------------------------------------------------------

::

          The flatpak config command shows or modifies the configuration of
          a flatpak installation. The following keys are supported:

          languages
              The languages that are included when installing Locale
              extensions. The value is a semicolon-separated list of
              two-letter language codes, or one of the special values * or
              all. If this key is unset, flatpak defaults to including the
              extra-languages key and the current locale.

          extra-languages
              This key is used when languages is not set, and it defines
              extra locale extensions on top of the system configured
              languages. The value is a semicolon-separated list of locale
              identifiers (language, optional locale, optional codeset,
              optional modifier) as documented by setlocale(3) (for
              example, en;en_DK;zh_HK.big5hkscs;uz_UZ.utf8@cyrillic).

          For configuration of individual remotes, see
          flatpak-remote-modify(1). For configuration of individual
          applications, see flatpak-override(1).


-------------------------------------------------------

::

          The following options are understood:

          -h, --help
              Show help options and exit.

          --list
              Print all keys and their values.

          --set
              Set key KEY to VALUE.

          --unset
              Unset key KEY.

          --get
              Print value of KEY.

          --user
              Configure per-user installation.

          --system
              Configure system-wide installation.

          --installation=NAME
              Configure the system-wide installation specified by NAME
              among those defined in /etc/flatpak/installations.d/. Using
              --installation=default is equivalent to using --system.

          -v, --verbose
              Print debug information during command processing.

          --ostree-verbose
              Print OSTree debug information during command processing.


---------------------------------------------------------

::

          $ flatpak config --set languages "sv;en;fi"


---------------------------------------------------------

::

          flatpak(1), flatpak-remote-modify(1), flatpak-override(1)

COLOPHON
---------------------------------------------------------

::

          This page is part of the flatpak (a tool for building and
          distributing desktop applications on Linux) project.  Information
          about the project can be found at ⟨http://flatpak.org/⟩.  It is
          not known how to report bugs for this man page; if you know,
          please send a mail to man-pages@man7.org.  This page was obtained
          from the project's upstream Git repository
          ⟨https://github.com/flatpak/flatpak⟩ on 2021-08-27.  (At that
          time, the date of the most recent commit that was found in the
          repository was 2021-08-26.)  If you discover any rendering
          problems in this HTML version of the page, or you believe there
          is a better or more up-to-date source for the page, or you have
          corrections or improvements to the information in this COLOPHON
          (which is not part of the original manual page), send a mail to
          man-pages@man7.org

   flatpak                                                FLATPAK CONFIG(1)

--------------

Pages that refer to this page: `flatpak(1) <../man1/flatpak.1.html>`__

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
