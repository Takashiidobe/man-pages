.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

execstack(8) — Linux manual page
================================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `OPTIONS <#OPTIONS>`__ \|         |                                   |
| `ARGUMENTS <#ARGUMENTS>`__ \|     |                                   |
| `EXAMPLES <#EXAMPLES>`__ \|       |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `BUGS <#BUGS>`__ \|               |                                   |
| `AUTHORS <#AUTHORS>`__ \|         |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   execstack(8)             System Manager's Manual            execstack(8)

NAME
-------------------------------------------------

::

          execstack - tool to set, clear, or query executable stack flag of
          ELF binaries and shared libraries


---------------------------------------------------------

::

          execstack [OPTION...] [FILES]


---------------------------------------------------------------

::

          execstack is a program which sets, clears, or queries executable
          stack flag of ELF binaries and shared libraries.  Linux has in
          the past allowed execution of instructions on the stack and there
          are lots of binaries and shared libraries assuming this
          behaviour.  Furthermore, GCC trampoline code for e.g. nested
          functions requires executable stack on many architectures.  To
          avoid breaking binaries and shared libraries which need
          executable stack, ELF binaries and shared libraries now can be
          marked as requiring executable stack or not requiring it.  This
          marking is done through the p_flags field in the PT_GNU_STACK
          program header entry.  If the marking is missing, kernel or
          dynamic linker need to assume it might need executable stack.
          The marking is done automatically by recent GCC versions (objects
          using trampolines on the stack are marked as requiring executable
          stack, all other newly built objects are marked as not requiring
          it) and linker collects these markings into marking of the whole
          binary or shared library.  The user can override this at assembly
          time (through --execstack or --noexecstack assembler options), at
          link time (through -z execstack or -z noexecstack linker options)
          and using the execstack tool also on an already linker binary or
          shared library.  This tool is especially useful for third party
          shared libraries where it is known that they don't need
          executable stack or testing proves it.


-------------------------------------------------------

::

          -s --set-execstack
                 Mark binary or shared library as requiring executable
                 stack.

          -c --clear-execstack
                 Mark binary or shared library as not requiring executable
                 stack.

          -q --query
                 Query executable stack marking of binaries and shared
                 libraries.  For each file it prints either - when
                 executable stack is not required, X when executable stack
                 is required or ?  when it is unknown whether the object
                 requires or doesn't require executable stack (the marking
                 is missing).

          -V     Print execstack version and exit.

          -? --help
                 Print help message.

          --usage
                 Print a short usage message.


-----------------------------------------------------------

::

          Command line arguments should be names of ELF binaries and shared
          libraries which should be modified or queried.


---------------------------------------------------------

::

                 # execstack -s ~/lib/libfoo.so.1
          will mark ~/lib/libfoo.so.1 as requiring executable stack.
                 # execstack -c ~/bin/bar
          will mark ~/bin/bar as not requiring executable stack.
                 # execstack -q ~/lib/libfoo.so.1 ~/bin/bar
          will query executable stack marking of the given files.


---------------------------------------------------------

::

          ld.so(8).


-------------------------------------------------

::

          execstack doesn't support yet marking of executables if they do
          not have PT_GNU_STACK program header entry nor they have room for
          program segment header table growth.


-------------------------------------------------------

::

          Jakub Jelinek <jakub@redhat.com>.

COLOPHON
---------------------------------------------------------

::

          This page is part of the prelink (prelink ELF shared libraries
          and binaries) project.  Information about the project can be
          found at ⟨http://people.redhat.com/jakub/prelink/⟩.  It is not
          known how to report bugs for this man page; if you know, please
          send a mail to man-pages@man7.org.  This page was obtained from
          the tarball prelink-20130503.tar.bz2 fetched from
          ⟨http://people.redhat.com/jakub/prelink/⟩ on 2021-08-27.  If you
          discover any rendering problems in this HTML version of the page,
          or you believe there is a better or more up-to-date source for
          the page, or you have corrections or improvements to the
          information in this COLOPHON (which is not part of the original
          manual page), send a mail to man-pages@man7.org

                                28 October 2003                execstack(8)

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
