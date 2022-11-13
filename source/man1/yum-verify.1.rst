.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

yum-verify(1) — Linux manual page
=================================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `GENE                             |                                   |
| RAL OPTIONS <#GENERAL_OPTIONS>`__ |                                   |
| \| `EXAMPLES <#EXAMPLES>`__ \|    |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `AUTHORS <#AUTHORS>`__ \|         |                                   |
| `BUGS <#BUGS>`__ \|               |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   yum-verify(1)                                              yum-verify(1)

NAME
-------------------------------------------------

::

          yum verify plugin


---------------------------------------------------------

::

          yum [options] verify [package ...]


---------------------------------------------------------------

::

          This plugin extends yum with some commands that give verification
          information on the installed system, much like rpm -V. You can
          change how the verification is done and which files it applies
          to. In case any mismatches are found, the exit status is set to
          1.

          added yum commands are:
           * verify
           * verify-rpm
           * verify-all

          all of which take the same arguments as the list yum command. You
          can only verify packages that are installed on the system.

          verify Is the generic verification command, and is intended to
                 give the most useful output. It removes all false matches
                 due to multilib and ignores changes to configuration files
                 by default.

          verify-rpm
                 Does the same checks as rpm -V.

          verify-all
                 Is used to list all the differences, including some that
                 rpm itself will ignore.


-----------------------------------------------------------------------

::

          These are the options added to yum that are available in the
          verify commands.  They are:

          --verify-filenames
                 This option is used to limit the filenames that the
                 packages will perform verification.

          --verify-configuration-files
                 This option is only useful in the generic verify command,
                 and will enable/disable verification of files that are
                 tagged as configuration files.


---------------------------------------------------------

::

          To do the same as rpm -Va, use:

                 yum verify-rpm

          To verify the packages starting with the name yum, use:

                 yum verify 'yum*'

          To verify the binaries that are in a bin directory, use:

                 yum verify --verify-filenames='*bin/*'

          To verify all include files, Eg. for multilib problems, use:

                 yum verify-all --verify-filenames='/usr/include/*'


---------------------------------------------------------

::

          yum(8)
          yum.conf(5)
          the verify.conf file in /etc/yum/plugins.d


-------------------------------------------------------

::

          James Antill <james.antill@redhat.com>.


-------------------------------------------------

::

          Currently yum-verify does not do verify-script checking or dependency checking,
          only file checking.

          Should you find any other bugs, you should first
          consult the FAQ section on http://yum.baseurl.org/wiki/Faq and if unsuccessful
          in finding a resolution contact the mailing list: yum-devel@lists.baseurl.org.
          To file a bug use http://bugzilla.redhat.com for Fedora/RHEL/Centos
          related bugs and http://yum.baseurl.org/report for all other bugs.

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

   James Antill                  01 March 2008                yum-verify(1)

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
