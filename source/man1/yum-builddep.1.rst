.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

yum-builddep(1) — Linux manual page
===================================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `GENE                             |                                   |
| RAL OPTIONS <#GENERAL_OPTIONS>`__ |                                   |
| \| `EXAMPLES <#EXAMPLES>`__ \|    |                                   |
| `FILES <#FILES>`__ \|             |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `AUTHORS <#AUTHORS>`__ \|         |                                   |
| `BUGS <#BUGS>`__ \|               |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   yum-builddep(1)                                          yum-builddep(1)

NAME
-------------------------------------------------

::

          yum-builddep - install missing dependencies for building an RPM
          package


---------------------------------------------------------

::

          yum-builddep package

          yum-builddep /path/to/local/package.src.rpm

          yum-builddep /path/to/local/package.spec


---------------------------------------------------------------

::

          yum-builddep is a program which installs the RPMs needed to build
          the specified package.  The source RPM for the specified package
          must be available in a Yum repository (which will be
          automatically enabled, if it is disabled) or it can be a local
          source RPM or a spec file.

          Note, that only the BuildRequires information within the SRPM
          header information is used to determine build dependencies. This
          will specifically omit any dependencies that are required only
          for specific architectures.


-----------------------------------------------------------------------

::

          --target ARCH
                 Set target architecture for spec parsing.

          --define 'MACRO EXPR'
                 Define the rpm MACRO with value EXPR for spec parsing.


---------------------------------------------------------

::

          Download and install all the RPMs needed to build the kernel RPM:
                 yumdownloader --source kernel && rpm2cpio kernel*src.rpm |
                 cpio -i kernel.spec && \
                 yum-builddep kernel.spec

          The kernel includes specific BuildRequires dependencies for
          different architectures. In order to make sure that those
          dependencies are downloaded and installed, the SRPM should be
          downloaded, the .spec file extracted from it and used to
          determine the full dependency list.


---------------------------------------------------

::

          As yum-builddep uses YUM libraries for retrieving all the
          information, it relies on YUM configuration for its default
          values like which repositories to use. Consult YUM documentation
          for details:

          /etc/yum.conf
          /etc/yum/repos.d/
          /var/cache/yum/


---------------------------------------------------------

::

          yum.conf(5)
          http://yum.baseurl.org/


-------------------------------------------------------

::

          See the Authors file included with this program.


-------------------------------------------------

::

          There are of course no bugs, but should you find any, you should
          first consult the FAQ section on http://yum.baseurl.org/wiki/Faq
          and if unsuccessful in finding a resolution contact the mailing
          list: yum-devel@lists.baseurl.org.  To file a bug use
          http://bugzilla.redhat.com for Fedora/RHEL/Centos related bugs
          and http://yum.baseurl.org/report for all other bugs.

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

   Panu Matilainen               17 July 2005               yum-builddep(1)

--------------

Pages that refer to this page:
`yum-utils(1) <../man1/yum-utils.1.html>`__

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
