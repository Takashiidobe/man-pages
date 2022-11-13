.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

`Go to the version of this page provided by the dnf
project <yum-aliases.1.html>`__

--------------

yum-aliases(1) — Linux manual page
==================================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `Ex                               |                                   |
| planation of alias to final resul |                                   |
| t conversion <#Explanation_of_ali |                                   |
| as_to_final_result_conversion>`__ |                                   |
| \| `EXAMPLES <#EXAMPLES>`__ \|    |                                   |
| `AUTHORS <#AUTHORS>`__ \|         |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   yum-aliases(1)                                            yum-aliases(1)

NAME
-------------------------------------------------

::

          yum aliases plugin


---------------------------------------------------------

::

          yum [options] alias


---------------------------------------------------------------

::

          This plugin changes other commands in yum, much like the alias
          command in bash. There are a couple of notable differences from
          shell style aliases though. The alias command has three forms:
           * alias
           * alias command
           * alias command result

          The first form lists all current aliases with their final result,
          the second form looks up a "command" and shows it's final result
          or an error message. The last form creates a new alias.


---------------------------------------------------------------------------------------------------------------------------------------

::

          When you type an aliased command, like "yum --disableexcludes UPT
          lsu" using the default aliases, the yum-aliases plugin first
          takes the first "command", by skipping over any options, and then
          looks up the result (in this case "UPT" is converted to
          "--enablerepo=updates-testing"). If there is a match, then it
          will replace the aliased "command" in the argument list and try
          again (again skipping over any options). By convention, in the
          default aliases list, alias "commands" that are in all CAPS only
          add options so you can join together a chain of them before any
          real command or aliased command.

          There are two things that can alter the above, if you have the
          "recursive" configuration option set to off then alias processing
          will stop after the first alias to command substitution. Also,
          like in shell aliases, if the result starts with \ then alias
          processing will stop.


---------------------------------------------------------

::

          To create a new alias command called "rm" which does the same
          thing as the command "remove" use:

                 yum alias rm remove

          To always add the --skip-broken --disableexcludes=all --obsoletes
          options to the update command (but leaving the upgrade option
          alone), you could use:

                 yum alias update \update  --skip-broken
                 --disableexcludes=all --obsoletes

          To override the default "up" alias to use the above update
          command, and never ask for confirmation, you could use:

                 yum alias up update -y


-------------------------------------------------------

::

                 James Antill <james@and.org>


---------------------------------------------------------

::

          yum-utils(1) yum(1)

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

   James Antill                 31 March 2008                yum-aliases(1)

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
