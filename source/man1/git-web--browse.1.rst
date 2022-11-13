.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

git-web--browse(1) — Linux manual page
======================================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `OPTIONS <#OPTIONS>`__ \|         |                                   |
| `CONFIGURATION VARIAB             |                                   |
| LES <#CONFIGURATION_VARIABLES>`__ |                                   |
| \|                                |                                   |
| `NOTE ABOUT KON                   |                                   |
| QUEROR <#NOTE_ABOUT_KONQUEROR>`__ |                                   |
| \| `GIT <#GIT>`__ \|              |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   GIT-WEB--BROWSE(1)             Git Manual             GIT-WEB--BROWSE(1)

NAME
-------------------------------------------------

::

          git-web--browse - Git helper script to launch a web browser


---------------------------------------------------------

::

          git web--browse [<options>] <url|file>...


---------------------------------------------------------------

::

          This script tries, as much as possible, to display the URLs and
          FILEs that are passed as arguments, as HTML pages in new tabs on
          an already opened web browser.

          The following browsers (or commands) are currently supported:

          •   firefox (this is the default under X Window when not using
              KDE)

          •   iceweasel

          •   seamonkey

          •   iceape

          •   chromium (also supported as chromium-browser)

          •   google-chrome (also supported as chrome)

          •   konqueror (this is the default under KDE, see Note about
              konqueror below)

          •   opera

          •   w3m (this is the default outside graphical environments)

          •   elinks

          •   links

          •   lynx

          •   dillo

          •   open (this is the default under Mac OS X GUI)

          •   start (this is the default under MinGW)

          •   cygstart (this is the default under Cygwin)

          •   xdg-open

          Custom commands may also be specified.


-------------------------------------------------------

::

          -b <browser>, --browser=<browser>
              Use the specified browser. It must be in the list of
              supported browsers.

          -t <browser>, --tool=<browser>
              Same as above.

          -c <conf.var>, --config=<conf.var>
              CONF.VAR is looked up in the Git config files. If it’s set,
              then its value specifies the browser that should be used.


---------------------------------------------------------------------------------------

::

      CONF.VAR (from -c option) and web.browser
          The web browser can be specified using a configuration variable
          passed with the -c (or --config) command-line option, or the
          web.browser configuration variable if the former is not used.

      browser.<tool>.path
          You can explicitly provide a full path to your preferred browser
          by setting the configuration variable browser.<tool>.path. For
          example, you can configure the absolute path to firefox by
          setting browser.firefox.path. Otherwise, git web--browse assumes
          the tool is available in PATH.

      browser.<tool>.cmd
          When the browser, specified by options or configuration
          variables, is not among the supported ones, then the
          corresponding browser.<tool>.cmd configuration variable will be
          looked up. If this variable exists then git web--browse will
          treat the specified tool as a custom command and will use a shell
          eval to run the command with the URLs passed as arguments.


---------------------------------------------------------------------------------

::

          When konqueror is specified by a command-line option or a
          configuration variable, we launch kfmclient to try to open the
          HTML man page on an already opened konqueror in a new tab if
          possible.

          For consistency, we also try such a trick if
          browser.konqueror.path is set to something like
          A_PATH_TO/konqueror. That means we will try to launch
          A_PATH_TO/kfmclient instead.

          If you really want to use konqueror, then you can use something
          like the following:

                      [web]
                              browser = konq

                      [browser "konq"]
                              cmd = A_PATH_TO/konqueror

      Note about git-config --global
          Note that these configuration variables should probably be set
          using the --global flag, for example like this:

              $ git config --global web.browser firefox

          as they are probably more user specific than repository specific.
          See git-config(1) for more information about this.


-----------------------------------------------

::

          Part of the git(1) suite

COLOPHON
---------------------------------------------------------

::

          This page is part of the git (Git distributed version control
          system) project.  Information about the project can be found at
          ⟨http://git-scm.com/⟩.  If you have a bug report for this manual
          page, see ⟨http://git-scm.com/community⟩.  This page was obtained
          from the project's upstream Git repository
          ⟨https://github.com/git/git.git⟩ on 2021-08-27.  (At that time,
          the date of the most recent commit that was found in the
          repository was 2021-08-24.)  If you discover any rendering
          problems in this HTML version of the page, or you believe there
          is a better or more up-to-date source for the page, or you have
          corrections or improvements to the information in this COLOPHON
          (which is not part of the original manual page), send a mail to
          man-pages@man7.org

   Git 2.33.0.69.gc420321         08/27/2021             GIT-WEB--BROWSE(1)

--------------

Pages that refer to this page:
`git-config(1) <../man1/git-config.1.html>`__, 
`git-help(1) <../man1/git-help.1.html>`__, 
`git-instaweb(1) <../man1/git-instaweb.1.html>`__

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
