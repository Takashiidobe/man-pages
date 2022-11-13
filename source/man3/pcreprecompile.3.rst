.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

pcreprecompile(3) — Linux manual page
=====================================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SAVING AND RE-USING PRECOMPILED  |                                   |
|  PCRE PATTERNS <#SAVING_AND_RE-US |                                   |
| ING_PRECOMPILED_PCRE_PATTERNS>`__ |                                   |
| \|                                |                                   |
| `SAVING A COMPILED PATTER         |                                   |
| N <#SAVING_A_COMPILED_PATTERN>`__ |                                   |
| \|                                |                                   |
| `R                                |                                   |
| E-USING A PRECOMPILED PATTERN <#R |                                   |
| E-USING_A_PRECOMPILED_PATTERN>`__ |                                   |
| \|                                |                                   |
| `COMPATIBILITY WITH DIFFER        |                                   |
| ENT PCRE RELEASES <#COMPATIBILITY |                                   |
| _WITH_DIFFERENT_PCRE_RELEASES>`__ |                                   |
| \| `AUTHOR <#AUTHOR>`__ \|        |                                   |
| `REVISION <#REVISION>`__ \|       |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   PCREPRECOMPILE(3)       Library Functions Manual       PCREPRECOMPILE(3)

NAME
-------------------------------------------------

::

          PCRE - Perl-compatible regular expressions


-----------------------------------------------------------------------------------------------------------------------------------

::


          If you are running an application that uses a large number of
          regular expression patterns, it may be useful to store them in a
          precompiled form instead of having to compile them every time the
          application is run.  If you are not using any private character
          tables (see the pcre_maketables() documentation), this is
          relatively straightforward. If you are using private tables, it
          is a little bit more complicated. However, if you are using the
          just-in-time optimization feature, it is not possible to save and
          reload the JIT data.

          If you save compiled patterns to a file, you can copy them to a
          different host and run them there. If the two hosts have
          different endianness (byte order), you should run the
          pcre[16|32]_pattern_to_host_byte_order() function on the new host
          before trying to match the pattern. The matching functions return
          PCRE_ERROR_BADENDIANNESS if they detect a pattern with the wrong
          endianness.

          Compiling regular expressions with one version of PCRE for use
          with a different version is not guaranteed to work and may cause
          crashes, and saving and restoring a compiled pattern loses any
          JIT optimization data.


-------------------------------------------------------------------------------------------

::


          The value returned by pcre[16|32]_compile() points to a single
          block of memory that holds the compiled pattern and associated
          data. You can find the length of this block in bytes by calling
          pcre[16|32]_fullinfo() with an argument of PCRE_INFO_SIZE. You
          can then save the data in any appropriate manner. Here is sample
          code for the 8-bit library that compiles a pattern and writes it
          to a file. It assumes that the variable fd refers to a file that
          is open for output:

            int erroroffset, rc, size;
            char *error;
            pcre *re;

            re = pcre_compile("my pattern", 0, &error, &erroroffset, NULL);
            if (re == NULL) { ... handle errors ... }
            rc = pcre_fullinfo(re, NULL, PCRE_INFO_SIZE, &size);
            if (rc < 0) { ... handle errors ... }
            rc = fwrite(re, 1, size, fd);
            if (rc != size) { ... handle errors ... }

          In this example, the bytes that comprise the compiled pattern are
          copied exactly. Note that this is binary data that may contain
          any of the 256 possible byte values. On systems that make a
          distinction between binary and non-binary data, be sure that the
          file is opened for binary output.

          If you want to write more than one pattern to a file, you will
          have to devise a way of separating them. For binary data,
          preceding each pattern with its length is probably the most
          straightforward approach. Another possibility is to write out the
          data in hexadecimal instead of binary, one pattern to a line.

          Saving compiled patterns in a file is only one possible way of
          storing them for later use. They could equally well be saved in a
          database, or in the memory of some daemon process that passes
          them via sockets to the processes that want them.

          If the pattern has been studied, it is also possible to save the
          normal study data in a similar way to the compiled pattern
          itself. However, if the PCRE_STUDY_JIT_COMPILE was used, the
          just-in-time data that is created cannot be saved because it is
          too dependent on the current environment. When studying generates
          additional information, pcre[16|32]_study() returns a pointer to
          a pcre[16|32]_extra data block. Its format is defined in the
          section on matching a pattern in the pcreapi documentation. The
          study_data field points to the binary study data, and this is
          what you must save (not the pcre[16|32]_extra block itself). The
          length of the study data can be obtained by calling
          pcre[16|32]_fullinfo() with an argument of PCRE_INFO_STUDYSIZE.
          Remember to check that pcre[16|32]_study() did return a non-NULL
          value before trying to save the study data.


-----------------------------------------------------------------------------------------------------

::


          Re-using a precompiled pattern is straightforward. Having
          reloaded it into main memory, called
          pcre[16|32]_pattern_to_host_byte_order() if necessary, you pass
          its pointer to pcre[16|32]_exec() or pcre[16|32]_dfa_exec() in
          the usual way.

          However, if you passed a pointer to custom character tables when
          the pattern was compiled (the tableptr argument of
          pcre[16|32]_compile()), you must now pass a similar pointer to
          pcre[16|32]_exec() or pcre[16|32]_dfa_exec(), because the value
          saved with the compiled pattern will obviously be nonsense. A
          field in a pcre[16|32]_extra() block is used to pass this data,
          as described in the section on matching a pattern in the pcreapi
          documentation.

          Warning: The tables that pcre_exec() and pcre_dfa_exec() use must
          be the same as those that were used when the pattern was
          compiled. If this is not the case, the behaviour is undefined.

          If you did not provide custom character tables when the pattern
          was compiled, the pointer in the compiled pattern is NULL, which
          causes the matching functions to use PCRE's internal tables.
          Thus, you do not need to take any special action at run time in
          this case.

          If you saved study data with the compiled pattern, you need to
          create your own pcre[16|32]_extra data block and set the
          study_data field to point to the reloaded study data. You must
          also set the PCRE_EXTRA_STUDY_DATA bit in the flags field to
          indicate that study data is present. Then pass the
          pcre[16|32]_extra block to the matching function in the usual
          way. If the pattern was studied for just-in-time optimization,
          that data cannot be saved, and so is lost by a save/restore
          cycle.


-----------------------------------------------------------------------------------------------------------------------------

::


          In general, it is safest to recompile all saved patterns when you
          update to a new PCRE release, though not all updates actually
          require this.


-----------------------------------------------------

::


          Philip Hazel
          University Computing Service
          Cambridge CB2 3QH, England.


---------------------------------------------------------

::


          Last updated: 12 November 2013
          Copyright (c) 1997-2013 University of Cambridge.

COLOPHON
---------------------------------------------------------

::

          This page is part of the PCRE (Perl Compatible Regular
          Expressions) project.  Information about the project can be found
          at ⟨http://www.pcre.org/⟩.  If you have a bug report for this
          manual page, see
          ⟨http://bugs.exim.org/enter_bug.cgi?product=PCRE⟩.  This page was
          obtained from the tarball pcre-8.45.tar.gz fetched from
          ⟨ftp://ftp.csx.cam.ac.uk/pub/software/programming/pcre/⟩ on
          2021-08-27.  If you discover any rendering problems in this HTML
          version of the page, or you believe there is a better or more up-
          to-date source for the page, or you have corrections or
          improvements to the information in this COLOPHON (which is not
          part of the original manual page), send a mail to
          man-pages@man7.org

   PCRE 8.34                   12 November 2013           PCREPRECOMPILE(3)

--------------

Pages that refer to this page:
`pcretest(1) <../man1/pcretest.1.html>`__, 
`pcreapi(3) <../man3/pcreapi.3.html>`__

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
