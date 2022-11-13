.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

warning::buildid(7stap) — Linux manual page
===========================================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   WARNING::BUILDID(7stap)                          WARNING::BUILDID(7stap)

NAME
-------------------------------------------------

::

          warning::buildid - build-id verification failures


---------------------------------------------------------------

::

          Because systemtap's script translation / execution stages may be
          executed at different times and places, it is sometimes necessary
          to verify certain invariants.  One such invariant is that if a
          script was informed by translate-time analysis of executables,
          then those same executables need to be used at run time.  This
          checking is done based upon the build-id, a binary hash that
          modern (post-2007) compilers/toolchains add as an NT_GNU_BUILD_ID
          ELF note to object files and executables.  Use the readelf -n
          command to examine the build-ids of binaries, if you are
          interested.

          Only scripts are sensitive to executables' build-ids: generally
          those that perform deep analysis of the binaries or their
          debuginfo.  For example, scripts that place .function or
          .statement probes, or use stack backtrace-related tapset
          functions may be sensitive.  Other scripts that rely only on
          process.mark or kernel.trace probes do not require debuginfo.
          See the DWARF DEBUGINFO section in the stapprobes(3stap) man
          page.

          During translation, systemtap saves a copy of the relevant files'
          build-ids within the compiled modules.  At run-time, the modules
          compare the saved ones to the actual run-time build-ids in
          memory.  The warning message indicates that they did not match,
          so the module will decline placing a probe that was computed
          based upon obsolete data.  This is important for safety, as
          placing them at an inappropriate address could crash the
          programs.  However, this is not necessarily a fatal error, since
          probes unrelated to the mismatching binaries may operate.

          A build-id mismatch could be caused by a few different
          situations.  The main one is where the executable versions or
          architecture were different between the systemtap translation and
          execution times/places.  For example, one may run a stap-server
          on a slightly different version of the OS distribution.  Someone
          may have rebuilt a new kernel image, but preserved the previous
          version numbers.  The kernel running on the workstation may be
          slightly different from the version being targeted - perhaps due
          to a pending kernel upgrade leaving different files on disk
          versus running in memory.  If your OS distribution uses separate
          debuginfo packages, the split .debug files may not exactly match
          the main binaries.

          To disable build-id verification warnings, if one is confident
          that they are an artefact of build accidents rather than a real
          mismatch, one might try the -DSTP_NO_BUILDID_CHECK option.


---------------------------------------------------------

::

          http://fedoraproject.org/wiki/Releases/FeatureBuildId ,
          stap(1),
          stapprobes(3stap),
          warning::debuginfo(7stap),
          error::reporting(7stap)

COLOPHON
---------------------------------------------------------

::

          This page is part of the systemtap (a tracing and live-system
          analysis tool) project.  Information about the project can be
          found at ⟨https://sourceware.org/systemtap/⟩.  If you have a bug
          report for this manual page, send it to systemtap@sourceware.org.
          This page was obtained from the project's upstream Git repository
          ⟨git://sourceware.org/git/systemtap.git⟩ on 2021-08-27.  (At that
          time, the date of the most recent commit that was found in the
          repository was 2021-08-26.)  If you discover any rendering
          problems in this HTML version of the page, or you believe there
          is a better or more up-to-date source for the page, or you have
          corrections or improvements to the information in this COLOPHON
          (which is not part of the original manual page), send a mail to
          man-pages@man7.org

                                                    WARNING::BUILDID(7stap)

--------------

Pages that refer to this page:
`error::dwarf(7stap) <../man7/error::dwarf.7stap.html>`__

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
