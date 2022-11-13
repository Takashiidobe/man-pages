.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

perf-buildid-cache(1) — Linux manual page
=========================================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `OPTIONS <#OPTIONS>`__ \|         |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   PERF-BUILDID-CACHE(1)          perf Manual         PERF-BUILDID-CACHE(1)

NAME
-------------------------------------------------

::

          perf-buildid-cache - Manage build-id cache.


---------------------------------------------------------

::

          perf buildid-cache <options>


---------------------------------------------------------------

::

          This command manages the build-id cache. It can add, remove,
          update and purge files to/from the cache. In the future it should
          as well set upper limits for the space used by the cache, etc.
          This also scans the target binary for SDT (Statically Defined
          Tracing) and record it along with the buildid-cache, which will
          be used by perf-probe. For more details, see perf-probe(1).


-------------------------------------------------------

::

          -a, --add=
              Add specified file to the cache.

          -f, --force
              Don’t complain, do it.

          -k, --kcore
              Add specified kcore file to the cache. For the current host
              that is /proc/kcore which requires root permissions to read.
              Be aware that running perf buildid-cache as root may update
              root’s build-id cache not the user’s. Use the -v option to
              see where the file is created. Note that the copied file
              contains only code sections not the whole core image. Note
              also that files "kallsyms" and "modules" must also be in the
              same directory and are also copied. All 3 files are created
              with read permissions for root only. kcore will not be added
              if there is already a kcore in the cache (with the same
              build-id) that has the same modules at the same addresses.
              Use the -v option to see if a copy of kcore is actually made.

          -r, --remove=
              Remove a cached binary which has same build-id of specified
              file from the cache.

          -p, --purge=
              Purge all cached binaries including older caches which have
              specified path from the cache.

          -P, --purge-all
              Purge all cached binaries. This will flush out entire cache.

          -M, --missing=
              List missing build ids in the cache for the specified file.

          -u, --update=
              Update specified file of the cache. Note that this doesn’t
              remove older entries since those may be still needed for
              annotating old (or remote) perf.data. Only if there is
              already a cache which has exactly same build-id, that is
              replaced by new one. It can be used to update kallsyms and
              kernel dso to vmlinux in order to support annotation.

          -l, --list
              List all valid binaries from cache.

          -v, --verbose
              Be more verbose.

          --target-ns=PID: Obtain mount namespace information from the
          target pid. This is used when creating a uprobe for a process
          that resides in a different mount namespace from the perf(1)
          utility.

          --debuginfod=URLs
              Specify debuginfod URL to be used when retrieving perf.data
              binaries, it follows the same syntax as the DEBUGINFOD_URLS
              variable, like:

                  buildid-cache.debuginfod=http://192.168.122.174:8002


---------------------------------------------------------

::

          perf-record(1), perf-report(1), perf-buildid-list(1)

COLOPHON
---------------------------------------------------------

::

          This page is part of the perf (Performance analysis tools for
          Linux (in Linux source tree)) project.  Information about the
          project can be found at 
          ⟨https://perf.wiki.kernel.org/index.php/Main_Page⟩.  If you have a
          bug report for this manual page, send it to
          linux-kernel@vger.kernel.org.  This page was obtained from the
          project's upstream Git repository
          ⟨http://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git⟩
          on 2021-08-27.  (At that time, the date of the most recent commit
          that was found in the repository was 2021-08-26.)  If you
          discover any rendering problems in this HTML version of the page,
          or you believe there is a better or more up-to-date source for
          the page, or you have corrections or improvements to the
          information in this COLOPHON (which is not part of the original
          manual page), send a mail to man-pages@man7.org

   perf                           2021-03-23          PERF-BUILDID-CACHE(1)

--------------

Pages that refer to this page: `perf(1) <../man1/perf.1.html>`__, 
`perf-probe(1) <../man1/perf-probe.1.html>`__

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
