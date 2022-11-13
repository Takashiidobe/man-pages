.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

git-instaweb(1) — Linux manual page
===================================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `OPTIONS <#OPTIONS>`__ \|         |                                   |
| `                                 |                                   |
| CONFIGURATION <#CONFIGURATION>`__ |                                   |
| \| `SEE ALSO <#SEE_ALSO>`__ \|    |                                   |
| `GIT <#GIT>`__ \|                 |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   GIT-INSTAWEB(1)                Git Manual                GIT-INSTAWEB(1)

NAME
-------------------------------------------------

::

          git-instaweb - Instantly browse your working repository in gitweb


---------------------------------------------------------

::

          git instaweb [--local] [--httpd=<httpd>] [--port=<port>]
                         [--browser=<browser>]
          git instaweb [--start] [--stop] [--restart]


---------------------------------------------------------------

::

          A simple script to set up gitweb and a web server for browsing
          the local repository.


-------------------------------------------------------

::

          -l, --local
              Only bind the web server to the local IP (127.0.0.1).

          -d, --httpd
              The HTTP daemon command-line that will be executed.
              Command-line options may be specified here, and the
              configuration file will be added at the end of the
              command-line. Currently apache2, lighttpd, mongoose, plackup,
              python and webrick are supported. (Default: lighttpd)

          -m, --module-path
              The module path (only needed if httpd is Apache). (Default:
              /usr/lib/apache2/modules)

          -p, --port
              The port number to bind the httpd to. (Default: 1234)

          -b, --browser
              The web browser that should be used to view the gitweb page.
              This will be passed to the git web--browse helper script
              along with the URL of the gitweb instance. See
              git-web--browse(1) for more information about this. If the
              script fails, the URL will be printed to stdout.

          start, --start
              Start the httpd instance and exit. Regenerate configuration
              files as necessary for spawning a new instance.

          stop, --stop
              Stop the httpd instance and exit. This does not generate any
              of the configuration files for spawning a new instance, nor
              does it close the browser.

          restart, --restart
              Restart the httpd instance and exit. Regenerate configuration
              files as necessary for spawning a new instance.


-------------------------------------------------------------------

::

          You may specify configuration in your .git/config

              [instaweb]
                      local = true
                      httpd = apache2 -f
                      port = 4321
                      browser = konqueror
                      modulePath = /usr/lib/apache2/modules

          If the configuration variable instaweb.browser is not set,
          web.browser will be used instead if it is defined. See
          git-web--browse(1) for more information about this.


---------------------------------------------------------

::

          gitweb(1)


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

   Git 2.33.0.69.gc420321         08/27/2021                GIT-INSTAWEB(1)

--------------

Pages that refer to this page: `git(1) <../man1/git.1.html>`__, 
`git-config(1) <../man1/git-config.1.html>`__, 
`gitweb(1) <../man1/gitweb.1.html>`__, 
`gitweb.conf(5) <../man5/gitweb.conf.5.html>`__, 
`giteveryday(7) <../man7/giteveryday.7.html>`__

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
