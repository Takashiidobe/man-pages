.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

yum-config-manager(1) — Linux manual page
=========================================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `OPTIONS <#OPTIONS>`__ \|         |                                   |
| `ADDITIONAL                       |                                   |
|  OPTIONS <#ADDITIONAL_OPTIONS>`__ |                                   |
| \| `EXAMPLES <#EXAMPLES>`__ \|    |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `AUTHORS <#AUTHORS>`__ \|         |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   yum-config-manager(1)                              yum-config-manager(1)

NAME
-------------------------------------------------

::

          yum-config-manager - manage yum configuration options and yum
          repositories


---------------------------------------------------------

::

          yum-config-manager [options] [section ...]


---------------------------------------------------------------

::

          yum-config-manager is a program that can manage main yum
          configuration options, toggle which repositories are enabled or
          disabled, and add new repositories.

          Unless --add-repo is used, the program will output the current
          configuration of the selected sections, and optionally save it
          back to the corresponding files.

          By default, if no positional arguments are specified, the program
          will select the [main] section and each enabled repository.  You
          can override this by specifying your own list of sections as
          arguments (these may also include disabled repositories).  A
          section can either be main or a repoid.


-------------------------------------------------------

::

          -h, --help
                 Display a help message, and then quit.

          --setopt=option=value
                 Set any config option in yum config or repo files. For
                 options in the global config just use:
                 --setopt=option=value for repo options use:
                 --setopt=repoid.option=value.  The latter form accepts
                 wildcards in repoid that will be expanded to the selected
                 sections.  If repoid contains no wildcard, it will
                 automatically be selected; this is useful if you are
                 addressing a disabled repo, in which case you don't have
                 to additionally pass it as an argument.

          --save Save the current options (useful with --setopt).

          --enable
                 Enable the specified repos (automatically saves). To
                 enable all repositories run "yum-config-manager --enable
                 \*".

          --disable
                 Disable the specified repos (automatically saves). To
                 disable all repositories run "yum-config-manager --disable
                 \*".

          --add-repo=ADDREPO
                 Add (and enable) the repo from the specified file or url.


-----------------------------------------------------------------------------

::

          Yum-config-manager inherits all other options from yum. See the
          yum(8) man page for more information.


---------------------------------------------------------

::

          Show the configuration of [main] and the repos foo and bar:

                 yum-config-manager main foo bar

          Enable the repos foo and bar:

                 yum-config-manager --enable foo bar

          Change a global option:

                 yum-config-manager --setopt=installonly_limit=5 --save

          Change a repo option of the repo foo (works even if foo is
          disabled):

                 yum-config-manager --setopt=foo.skip_if_unavailable=1
                 --save

          Change a repo option of more repos at once:

                 yum-config-manager --setopt=\*.skip_if_unavailable=1
                 --save foo bar baz

          Change a repo option of all the enabled repos:

                 yum-config-manager --setopt=\*.skip_if_unavailable=1
                 --save

          Change a repo option of all the configured (that is, enabled and
          disabled) repos:

                 yum-config-manager --setopt=\*.skip_if_unavailable=1
                 --save \*


---------------------------------------------------------

::

          yum.conf(5)
          http://yum.baseurl.org/


-------------------------------------------------------

::

          See the Authors file included with this program.

COLOPHON
---------------------------------------------------------

::

          This page is part of the yum-utils (Yum Package Manager
          utilities) project.  Information about the project can be found
          at ⟨https://github.com/rpm-software-management/yum⟩.  It is not
          known how to report bugs for this man page; if you know, please
          send a mail to man-pages@man7.org.  This page was obtained from
          the project's upstream Git repository
          ⟨https://github.com/rpm-software-management/yum-utils.git⟩ on
          2021-08-27.  (At that time, the date of the most recent commit
          that was found in the repository was 2020-03-11.)  If you
          discover any rendering problems in this HTML version of the page,
          or you believe there is a better or more up-to-date source for
          the page, or you have corrections or improvements to the
          information in this COLOPHON (which is not part of the original
          manual page), send a mail to man-pages@man7.org

                                13 January 2013       yum-config-manager(1)

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
