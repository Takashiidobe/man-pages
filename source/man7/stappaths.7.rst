.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

stappaths(7) — Linux manual page
================================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `BUGS <#BUGS>`__ \|               |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   STAP(7)             Miscellaneous Information Manual             STAP(7)

NAME
-------------------------------------------------

::

          stappaths - systemtap configurable file paths


---------------------------------------------------------------

::

          This manual page was generated for systemtap 4.6.  The following
          section will list the main paths in systemtap that are important
          to know and may be required to reference.

          /usr/local/share/systemtap/tapset/
                 The directory for the standard probe-alias / function
                 tapset library, unless overridden by the SYSTEMTAP_TAPSET
                 environment variable or the XDG_DATA_DIRS environment
                 variable.  These are described in the stapprobes(3stap),
                 probe::*(3stap), and function::*(3stap) manual pages.

          /usr/local/share/systemtap/runtime/
                 The runtime sources, unless overridden by the
                 SYSTEMTAP_RUNTIME environment variable.

          /usr/local/bin/staprun
                 The auxiliary program supervising module loading,
                 interaction, and unloading.

          ${prefix}/etc/stap-exporter
                 The default directory to search for *.stp files, for
                 exporting to HTTP.

          ${exec_prefix}/libexec/systemtap/stapio
                 The auxiliary program for module input and output
                 handling.

          /usr/include/sys/sdt.h
                 Location of the <sys/sdt.h> headers.

          Kernel debuginfo Path: /usr/lib/debug/lib/modules/$(uname -r)/
                 The location of kernel debugging information when packaged
                 into the kernel-debuginfo RPM, unless overridden by the
                 SYSTEMTAP_DEBUGINFO_PATH environment variable.  The
                 default value for this variable is
                 +:.debug:/usr/lib/debug:build.  elfutils searches vmlinux
                 in this path and it interprets the path as a base
                 directory of which various subdirectories will be searched
                 for finding debuginfo for the kernel, kernel modules, and
                 user-space binaries.  By default, systemtap will also look
                 for vmlinux in these locations:

                 /boot/vmlinux-`uname -r`
                 /lib/modules/`uname -r`/vmlinux
                 /lib/modules/`uname -r`/vmlinux.debug
                 /lib/modules/`uname -r`/build/vmlinux
                 /lib/modules/`uname -r`/.debug/vmlinux.debug
                 /usr/lib/debug/lib/modules/`uname -r`/vmlinux.debug
                 /var/cache/abrt-di/usr/debug/lib/modules/`uname -r`/
                 /var/cache/abrt-di/usr/lib/debug/lib/modules/`uname -r`/vmlinux.debug

                 Corresponding source files are usually located under
                 /usr/src/debug/.  Further file information on user-space
                 applications can be determined per-basis using rpm -ql
                 <package>-debuginfo. For supported user-space applications
                 information please visit the systemtap wiki.

                 With elfutils version >0.178, systemtap can automatically
                 download debugging information from debuginfod servers.
                 You can try it by setting an environment variable or two:
                 export DEBUGINFOD_URLS=https://debuginfod.elfutils.org/
                 export DEBUGINFOD_PROGRESS=1

          $HOME/.systemtap
                 Systemtap data directory for cached systemtap files,
                 unless overridden by the SYSTEMTAP_DIR environment
                 variable.

          /tmp/stapXXXXXX
                 Temporary directory for systemtap files, including
                 translated C code and kernel object.

          /lib/modules/VERSION/build
                 The location of kernel module building infrastructure.

          /usr/local/share/doc/systemtap*/examples
                 Examples with greater detail can be found here. Each
                 example comes with a .txt or .meta file explaining what
                 the example, sample or demo does and how it is ordinarily
                 run.  See also online at:
                 https://sourceware.org/systemtap/examples/ 

          $SYSTEMTAP_DIR/ssl/server
                 User's server-side SSL certificate database. If
                 SYSTEMTAP_DIR is not set, the default is $HOME/.systemtap.

          $SYSTEMTAP_DIR/ssl/client
                 User's private client-side SSL certificate database. If
                 SYSTEMTAP_DIR is not set, the default is $HOME/.systemtap.

          ${prefix}/etc/systemtap/ssl/client
                 Global client-side SSL certificate database.

          ${prefix}/etc/systemtap/staprun/
                 staprun's trusted signer certificate database.

          ${prefix}/etc/sysconfig/stap-server
                 stap-server service global configuration file.

          ${prefix}/etc/sysconfig/stap-exporter
                 stap-exporter service global configuration file.

          ${prefix}/var/run/stap-server/
                 stap-server service default location of status files for
                 running servers.

          ${prefix}/var/log/stap-server/log
                 stap-server service default log file.


---------------------------------------------------------

::

          stapprobes(3stap),
          staprun(8),
          stapvars(3stap),
          stapex(3stap),
          stap-server(8),
          awk(1),
          gdb(1)
          http://sourceware.org/elfutils/Debuginfod.html 


-------------------------------------------------

::

          Use the Bugzilla link of the project web page or our mailing
          list.
          http://sourceware.org/systemtap/ ,<systemtap@sourceware.org>.

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

                                Systemtap Team                      STAP(7)

--------------

Pages that refer to this page: `dtrace(1) <../man1/dtrace.1.html>`__, 
`stap(1) <../man1/stap.1.html>`__, 
`stap-merge(1) <../man1/stap-merge.1.html>`__, 
`stapex(3stap) <../man3/stapex.3stap.html>`__, 
`stapvars(3stap) <../man3/stapvars.3stap.html>`__, 
`warning::debuginfo(7stap) <../man7/warning::debuginfo.7stap.html>`__, 
`warning::symbols(7stap) <../man7/warning::symbols.7stap.html>`__, 
`stapbpf(8) <../man8/stapbpf.8.html>`__, 
`stap-exporter(8) <../man8/stap-exporter.8.html>`__, 
`stap-server(8) <../man8/stap-server.8.html>`__

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
