.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

fedabipkgdiff(1) — Linux manual page
====================================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `INVOCATION <#INVOCATION>`__ \|   |                                   |
| `ENVIRONMENT <#ENVIRONMENT>`__ \| |                                   |
| `OPTIONS <#OPTIONS>`__ \|         |                                   |
| `RETURN VALUE <#RETURN_VALUE>`__  |                                   |
| \| `USE CASES <#USE_CASES>`__ \|  |                                   |
| `AUTHOR <#AUTHOR>`__ \|           |                                   |
| `COPYRIGHT <#COPYRIGHT>`__ \|     |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   FEDABIPKGDIFF(1)               Libabigail               FEDABIPKGDIFF(1)

NAME
-------------------------------------------------

::

          fedabipkgdiff - compare ABIs of Fedora packages

          fedabipkgdiff compares the ABI of shared libraries in Fedora
          packages.  It's a convenient way to do so without having to
          manually download packages from the Fedora Build System.

          fedabipkgdiff knows how to talk with the Fedora Build System to
          find the right packages versions, their associated debug
          information and development packages, download them, compare
          their ABI locally, and report about the possible ABI changes.

          Note that by default, this tool reports ABI changes about types
          that are defined in public header files found in the development
          packages associated with the packages being compared.  It also
          reports ABI changes about functions and global variables whose
          symbols are defined and exported in the ELF binaries found in the
          packages being compared.


-------------------------------------------------------------

::

             fedabipkgdiff [option] <NVR> ...


---------------------------------------------------------------

::

          fedabipkgdiff loads two default suppression specifications files,
          merges their content and use it to filter out ABI change reports
          that might be considered as false positives to users.

          • Default system-wide suppression specification file

            It's located by the optional environment variable
            LIBABIGAIL_DEFAULT_SYSTEM_SUPPRESSION_FILE.  If that
            environment variable is not set, then fedabipkgdiff tries to
            load the suppression file
            $libdir/libabigail/libabigail-default.abignore.  If that file
            is not present, then no default system-wide suppression
            specification file is loaded.

          • Default user suppression specification file.

            It's located by the optional environment
            LIBABIGAIL_DEFAULT_USER_SUPPRESSION_FILE.  If that environment
            variable is not set, then fedabipkgdiff tries to load the
            suppression file $HOME/.abignore.  If that file is not present,
            then no default user suppression specification is loaded.


-------------------------------------------------------

::

             • --help | -h

               Display a short help about the command and exit.

             • --dry-run

               Don't actually perform the ABI comparison.  Details about
               what is going to be done are emitted on standard output.

             • --debug

               Emit debugging messages about the execution of the program.
               Details about each method invocation, including input
               parameters and returned values, are emitted.

             • --traceback

               Show traceback when an exception raised. This is useful for
               developers of the tool itself to know more exceptional
               errors.

             • --server <URL>

               Specifies the URL of the Koji XMLRPC service the tool talks
               to.  The default value of this option is
               http://koji.fedoraproject.org/kojihub .

             • --topurl <URL>

               Specifies the URL of the package store the tool downloads
               RPMs from.  The default value of this option is
               https://kojipkgs.fedoraproject.org .

             • --from <distro>

               Specifies the name of the baseline Fedora distribution in
               which to find the first build that is used for comparison.
               The distro value can be any valid value of the RPM macro
               %{?dist} for Fedora, for example, fc4, fc23, fc25.

             • --to <distro>

               Specifies the name of the Fedora distribution in which to
               find the build that is compared against the baseline
               specified by option --from.  The distro value could be any
               valid value of the RPM macro %{?dist} for Fedora, for
               example, fc4, fc23.

             • --all-subpackages

               Instructs the tool to also compare the ABI of the binaries
               in the sub-packages of the packages specified.

             • --dso-only

               Compares the ABI of shared libraries only.  If this option
               is not provided, the tool compares the ABI of all ELF
               binaries found in the packages.

             • --suppressions <path-to-suppresions>

               Use a suppression specification file located at
               path-to-suppressions.

             • --no-default-suppression

               Do not load the default suppression specification files.

             • --no-devel-pkg

               Do not take associated development packages into account
               when performing the ABI comparison.  This makes the tool
               report ABI changes about all types that are reachable from
               functions and global variables which symbols are defined and
               publicly exported in the binaries being compared, even if
               those types are not defined in public header files available
               from the packages being compared.

             • --show-identical-binaries
                 Show the names of the all binaries compared, including the
                 binaries whose ABI compare equal.  By default, when this
                 option is not provided, only binaries with ABI changes are
                 mentionned in the output.

             • --abipkgdiff <path/to/abipkgdiff>

               Specify an alternative abipkgdiff instead of the one
               installed in system.

             • --clean-cache-before

               Clean cache before ABI comparison.

             • --clean-cache-after

               Clean cache after ABI comparison.

             • --clean-cache

               If you want to clean cache both before and after ABI
               comparison, --clean-cache is the convenient way for you to
               save typing of two options at same time.

          Note that a build is a specific version and release of an RPM
          package.  It's specified by its the package name, version and
          release. These are specified by the Fedora Naming Guidelines


-----------------------------------------------------------------

::

          The exit code of the abipkgdiff command is either 0 if the ABI of
          the binaries compared are equivalent, or non-zero if they differ
          or if the tool encountered an error.

          In the later case, the value of the exit code is the same as for
          the abidiff tool.


-----------------------------------------------------------

::

          Below are some usage examples currently supported by
          fedabipkgdiff.

             1. Compare the ABI of binaries in a local package against the
                ABI of the latest stable package in Fedora 23.

                Suppose you have built just built the httpd package and you
                want to compare the ABI of the binaries in this locally
                built package against the ABI of the binaries in the latest
                http build from Fedora 23.  The command line invocation
                would be:

                    $ fedabipkgdiff --from fc23 ./httpd-2.4.18-2.fc24.x86_64.rpm

             2. Compare the ABI of binaries in two local packages.

                Suppose you have built two versions of package httpd, and
                you want to see what ABI differences between these two
                versions of RPM files. The command line invocation would
                be:

                    $ fedabipkgdiff path/to/httpd-2.4.23-3.fc23.x86_64.rpm another/path/to/httpd-2.4.23-4.fc24.x86_64.rpm

                All what fedabipkgdiff does happens on local machine
                without the need of querying or downloading RPMs from Koji.

             3. Compare the ABI of binaries in the latest build of the
                httpd package in Fedora 23 against the ABI of the binaries
                in the latest build of the same package in 24.

                In this case, note that neither of the two packages are
                available locally.  The tool is going to talk with the
                Fedora Build System, determine what the versions and
                releases of the latest packages are, download them and
                perform the comparison locally.  The command line
                invocation would be:

                    $ fedabipkgdiff --from fc23 --to fc24 httpd

             4. Compare the ABI of binaries of two builds of the httpd
                package, designated their versions and releases.

                If we want to do perform the ABI comparison for all the
                processor architectures supported by Fedora the command
                line invocation would be:

                    $ fedabipkgdiff httpd-2.8.14.fc23 httpd-2.8.14.fc24

                But if we want to perform the ABI comparison for a specific
                architecture, say, x86_64, then the command line invocation
                would be:

                    $ fedabipkgdiff httpd-2.8.14.fc23.x86_64 httpd-2.8.14.fc24.x86_64

             5. If the use wants to also compare the sub-packages of a
                given package, she can use the --all-subpackages option.
                The first command of the previous example would thus look
                like:

                    $ fedabipkgdiff --all-subpackages httpd-2.8.14.fc23 httpd-2.8.14.fc24


-----------------------------------------------------

::

          Chenxiong Qi


-----------------------------------------------------------

::

          2014-2016, Red Hat, Inc.

COLOPHON
---------------------------------------------------------

::

          This page is part of the libabigail (ABI Generic Analysis and
          Instrumentation Library) project.  Information about the project
          can be found at ⟨https://sourceware.org/libabigail/⟩.  If you
          have a bug report for this manual page, see
          ⟨http://sourceware.org/bugzilla/enter_bug.cgi?product=libabigail⟩.
          This page was obtained from the project's upstream Git repository
          ⟨git://sourceware.org/git/libabigail.git⟩ on 2021-08-27.  (At
          that time, the date of the most recent commit that was found in
          the repository was 2021-08-11.)  If you discover any rendering
          problems in this HTML version of the page, or you believe there
          is a better or more up-to-date source for the page, or you have
          corrections or improvements to the information in this COLOPHON
          (which is not part of the original manual page), send a mail to
          man-pages@man7.org

                                 Aug 27, 2021              FEDABIPKGDIFF(1)

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
