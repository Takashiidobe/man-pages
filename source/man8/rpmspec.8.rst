.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

rpmspec(8) — Linux manual page
==============================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `EXAMPLES <#EXAMPLES>`__ \|       |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `AUTHORS <#AUTHORS>`__ \|         |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   RPMSPEC(8)                                                    RPMSPEC(8)

NAME
-------------------------------------------------

::

          rpmspec - RPM Spec Tool


---------------------------------------------------------

::

      QUERYING SPEC FILES:
          rpmspec {-q|--query} [select-options] [query-options] SPEC_FILE
          ...

      PARSING SPEC FILES TO STDOUT:
          rpmspec {-P|--parse} SPEC_FILE ...


---------------------------------------------------------------

::

          rpmspec is a tool for querying a spec file.  More specifically
          for querying hypothetical packages which would be created from
          the given spec file.  So querying a spec file with rpmspec is
          similar to querying a package built from that spec file.  But is
          is not identical.  With rpmspec you can't query all fields which
          you can query from a built package.  E.  g.  you can't query
          BUILDTIME with rpmspec for obvious reasons.  You also cannot
          query other fields automatically generated during a build of a
          package like auto generated dependencies.

      select-options
          [--rpms] [--srpm]

      query-options
          [--qf,--queryformat QUERYFMT] [--target TARGET_PLATFORM]

      QUERY OPTIONS
          The general form of an rpm spec query command is

          rpm {-q|--query} [select-options] [query-options]

          You may specify the format that the information should be printed
          in.  To do this, you use the

          --qf|--queryformat QUERYFMT

          option, followed by the QUERYFMT format string.  See rpm(8) for
          details.

      SELECT OPTIONS
          --rpms Operate on the all binary package headers generated from
          spec.  --builtrpms Operate only on the binary package headers of
          packages which would be built from spec.  That means ignoring
          package headers of packages that won't be built from spec i.  e.
          ignoring package headers of packages without file section.
          --srpm Operate on the source package header(s) generated from
          spec.


---------------------------------------------------------

::

          Get list of binary packages which would be generated from the rpm
          spec file:

                         $ rpmspec -q rpm.spec
                         rpm-4.11.3-3.fc20.x86_64
                         rpm-libs-4.11.3-3.fc20.x86_64
                         rpm-build-libs-4.11.3-3.fc20.x86_64
                         ...

                        Get summary infos for single binary packages generated from the rpm spec file:

                         $ rpmspec -q --qf "%{name}: %{summary}\n" rpm.spec
                         rpm: The RPM package management system
                         rpm-libs: Libraries for manipulating RPM packages
                         rpm-build-libs: Libraries for building and signing RPM packages
                         ...

                        Get the source package which would be generated from the rpm spec file:

                         $ rpmspec -q --srpm rpm.spec
                         rpm-4.11.3-3.fc20.x86_64

                        Parse the rpm spec file to stdout:

                         $ rpmspec -P rpm.spec
                         Summary: The RPM package management system
                         Name: rpm
                         Version: 4.14.0
                         ...


---------------------------------------------------------

::

                 popt(3),
                 rpm(8),
                 rpmdb(8),
                 rpmkeys(8),
                 rpmsign(8),
                 rpm2cpio(8),
                 rpmbuild(8),

          rpmspec --help - as rpm supports customizing the options via popt
          aliases it's impossible to guarantee that what's described in the
          manual matches what's available.

          http://www.rpm.org/ <URL:http://www.rpm.org/>


-------------------------------------------------------

::

                 Marc Ewing <marc@redhat.com>
                 Jeff Johnson <jbj@redhat.com>
                 Erik Troan <ewt@redhat.com>
                 Panu Matilainen <pmatilai@redhat.com>

COLOPHON
---------------------------------------------------------

::

          This page is part of the rpm (RPM Package Manager) project.
          Information about the project can be found at 
          ⟨https://github.com/rpm-software-management/rpm⟩.  It is not known
          how to report bugs for this man page; if you know, please send a
          mail to man-pages@man7.org.  This page was obtained from the
          project's upstream Git repository
          ⟨https://github.com/rpm-software-management/rpm.git⟩ on
          2021-08-27.  (At that time, the date of the most recent commit
          that was found in the repository was 2021-08-25.)  If you
          discover any rendering problems in this HTML version of the page,
          or you believe there is a better or more up-to-date source for
          the page, or you have corrections or improvements to the
          information in this COLOPHON (which is not part of the original
          manual page), send a mail to man-pages@man7.org

                                29 October 2010                  RPMSPEC(8)

--------------

Pages that refer to this page: `rpm(8) <../man8/rpm.8.html>`__, 
`rpmbuild(8) <../man8/rpmbuild.8.html>`__, 
`rpmdb(8) <../man8/rpmdb.8.html>`__, 
`rpmkeys(8) <../man8/rpmkeys.8.html>`__, 
`rpmsign(8) <../man8/rpmsign.8.html>`__

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
