.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

manpath(1) — Linux manual page
==============================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `OPTIONS <#OPTIONS>`__ \|         |                                   |
| `ENVIRONMENT <#ENVIRONMENT>`__ \| |                                   |
| `FILES <#FILES>`__ \|             |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `AUTHOR <#AUTHOR>`__ \|           |                                   |
| `BUGS <#BUGS>`__ \|               |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   MANPATH(1)                 Manual pager utils                 MANPATH(1)

NAME
-------------------------------------------------

::

          manpath - determine search path for manual pages


---------------------------------------------------------

::

          manpath [-qgdc?V] [-m system[,...]] [-C file]


---------------------------------------------------------------

::

          If $MANPATH is set, manpath will simply display its contents and
          issue a warning.  If not, manpath will determine a suitable
          manual page hierarchy search path and display the results.

          The colon-delimited path is determined using information gained
          from the man-db configuration file – (/usr/local/etc/man_db.conf)
          and the user's environment.


-------------------------------------------------------

::

          -q, --quiet
                 Do not issue warnings.

          -d, --debug
                 Print debugging information.

          -c, --catpath
                 Produce a catpath as opposed to a manpath.  Once the
                 manpath is determined, each path element is converted to
                 its relative catpath.

          -g, --global
                 Produce a manpath consisting of all paths named as
                 "global" within the man-db configuration file.

          -m system[,...], --systems=system[,...]
                 If this system has access to other operating system's
                 manual hierarchies, this option can be used to include
                 them in the output of manpath.  To include NewOS's manual
                 page hierarchies use the option -m NewOS.

                 The system specified can be a combination of comma
                 delimited operating system names.  To include the native
                 operating system's manual page hierarchies, the system
                 name man must be included in the argument string.  This
                 option will override the $SYSTEM environment variable.

          -C file, --config-file=file
                 Use this user configuration file rather than the default
                 of ~/.manpath.

          -?, --help
                 Print a help message and exit.

          --usage
                 Print a short usage message and exit.

          -V, --version
                 Display version information.


---------------------------------------------------------------

::

          MANPATH
                 If $MANPATH is set, manpath displays its value rather than
                 determining it on the fly.  If $MANPATH is prefixed by a
                 colon, then the value of the variable is appended to the
                 list determined from the content of the configuration
                 files.  If the colon comes at the end of the value in the
                 variable, then the determined list is appended to the
                 content of the variable.  If the value of the variable
                 contains a double colon (::), then the determined list is
                 inserted in the middle of the value, between the two
                 colons.

          SYSTEM If $SYSTEM is set, it will have the same effect as if it
                 had been specified as the argument to the -m option.


---------------------------------------------------

::

          /usr/local/etc/man_db.conf
                 man-db configuration file.


---------------------------------------------------------

::

          apropos(1), man(1), whatis(1)


-----------------------------------------------------

::

          Wilf. (G.Wilford@ee.surrey.ac.uk).
          Fabrizio Polacco (fpolacco@debian.org).
          Colin Watson (cjwatson@debian.org).


-------------------------------------------------

::

          https://savannah.nongnu.org/bugs/?group=man-db

COLOPHON
---------------------------------------------------------

::

          This page is part of the man-db (manual pager suite) project.
          Information about the project can be found at 
          ⟨http://www.nongnu.org/man-db/⟩.  If you have a bug report for
          this manual page, send it to man-db-devel@nongnu.org.  This page
          was obtained from the project's upstream Git repository
          ⟨https://git.savannah.gnu.org/r/man-db.git⟩ on 2021-08-27.  (At
          that time, the date of the most recent commit that was found in
          the repository was 2021-07-11.)  If you discover any rendering
          problems in this HTML version of the page, or you believe there
          is a better or more up-to-date source for the page, or you have
          corrections or improvements to the information in this COLOPHON
          (which is not part of the original manual page), send a mail to
          man-pages@man7.org

   2.9.4                          2021-02-08                     MANPATH(1)

--------------

Pages that refer to this page: `groffer(1) <../man1/groffer.1.html>`__, 
`man(1) <../man1/man.1.html>`__

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
