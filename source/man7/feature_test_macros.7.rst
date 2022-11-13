.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

feature_test_macros(7) — Linux manual page
==========================================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `                                 |                                   |
| CONFORMING TO <#CONFORMING_TO>`__ |                                   |
| \| `NOTES <#NOTES>`__ \|          |                                   |
| `EXAMPLES <#EXAMPLES>`__ \|       |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   FEATURE_TEST_MACROS(7)  Linux Programmer's Manual FEATURE_TEST_MACROS(7)

NAME
-------------------------------------------------

::

          feature_test_macros - feature test macros


---------------------------------------------------------------

::

          Feature test macros allow the programmer to control the
          definitions that are exposed by system header files when a
          program is compiled.

          NOTE: In order to be effective, a feature test macro must be
          defined before including any header files.  This can be done
          either in the compilation command (cc -DMACRO=value) or by
          defining the macro within the source code before including any
          headers.  The requirement that the macro must be defined before
          including any header file exists because header files may freely
          include one another.  Thus, for example, in the following lines,
          defining the _GNU_SOURCE macro may have no effect because the
          header <abc.h> itself includes <xyz.h> (POSIX explicitly allows
          this):

              #include <abc.h>
              #define _GNU_SOURCE
              #include <xyz.h>

          Some feature test macros are useful for creating portable
          applications, by preventing nonstandard definitions from being
          exposed.  Other macros can be used to expose nonstandard
          definitions that are not exposed by default.

          The precise effects of each of the feature test macros described
          below can be ascertained by inspecting the <features.h> header
          file.  Note: applications do not need to directly include
          <features.h>; indeed, doing so is actively discouraged.  See
          NOTES.

      Specification of feature test macro requirements in manual pages
          When a function requires that a feature test macro is defined,
          the manual page SYNOPSIS typically includes a note of the
          following form (this example from the acct(2) manual page):

                 #include <unistd.h>

                 int acct(const char *filename);

             Feature Test Macro Requirements for glibc (see
             feature_test_macros(7)):

                 acct(): _BSD_SOURCE || (_XOPEN_SOURCE && _XOPEN_SOURCE <
                 500)

          The || means that in order to obtain the declaration of acct(2)
          from <unistd.h>, either of the following macro definitions must
          be made before including any header files:

              #define _BSD_SOURCE
              #define _XOPEN_SOURCE        /* or any value < 500 */

          Alternatively, equivalent definitions can be included in the
          compilation command:

              cc -D_BSD_SOURCE
              cc -D_XOPEN_SOURCE           # Or any value < 500

          Note that, as described below, some feature test macros are
          defined by default, so that it may not always be necessary to
          explicitly specify the feature test macro(s) shown in the
          SYNOPSIS.

          In a few cases, manual pages use a shorthand for expressing the
          feature test macro requirements (this example from readahead(2)):

              #define _GNU_SOURCE
              #include <fcntl.h>

              ssize_t readahead(int fd, off64_t *offset, size_t count);

          This format is employed in cases where only a single feature test
          macro can be used to expose the function declaration, and that
          macro is not defined by default.

      Feature test macros understood by glibc
          The paragraphs below explain how feature test macros are handled
          in glibc 2.x, x > 0.

          First, though, a summary of a few details for the impatient:

          *  The macros that you most likely need to use in modern source
             code are _POSIX_C_SOURCE (for definitions from various
             versions of POSIX.1), _XOPEN_SOURCE (for definitions from
             various versions of SUS), _GNU_SOURCE (for GNU and/or Linux
             specific stuff), and _DEFAULT_SOURCE (to get definitions that
             would normally be provided by default).

          *  Certain macros are defined with default values.  Thus,
             although one or more macros may be indicated as being required
             in the SYNOPSIS of a man page, it may not be necessary to
             define them explicitly.  Full details of the defaults are
             given later in this man page.

          *  Defining _XOPEN_SOURCE with a value of 600 or greater produces
             the same effects as defining _POSIX_C_SOURCE with a value of
             200112L or greater.  Where one sees

                 _POSIX_C_SOURCE >= 200112L

             in the feature test macro requirements in the SYNOPSIS of a
             man page, it is implicit that the following has the same
             effect:

                 _XOPEN_SOURCE >= 600

          *  Defining _XOPEN_SOURCE with a value of 700 or greater produces
             the same effects as defining _POSIX_C_SOURCE with a value of
             200809L or greater.  Where one sees

                 _POSIX_C_SOURCE >= 200809L

             in the feature test macro requirements in the SYNOPSIS of a
             man page, it is implicit that the following has the same
             effect:

                 _XOPEN_SOURCE >= 700

          Glibc understands the following feature test macros:

          __STRICT_ANSI__
                 ISO Standard C.  This macro is implicitly defined by
                 gcc(1) when invoked with, for example, the -std=c99 or
                 -ansi flag.

          _POSIX_C_SOURCE
                 Defining this macro causes header files to expose
                 definitions as follows:

                 •  The value 1 exposes definitions conforming to
                    POSIX.1-1990 and ISO C (1990).

                 •  The value 2 or greater additionally exposes definitions
                    for POSIX.2-1992.

                 •  The value 199309L or greater additionally exposes
                    definitions for POSIX.1b (real-time extensions).

                 •  The value 199506L or greater additionally exposes
                    definitions for POSIX.1c (threads).

                 •  (Since glibc 2.3.3) The value 200112L or greater
                    additionally exposes definitions corresponding to the
                    POSIX.1-2001 base specification (excluding the XSI
                    extension).  This value also causes C95 (since glibc
                    2.12) and C99 (since glibc 2.10) features to be exposed
                    (in other words, the equivalent of defining
                    _ISOC99_SOURCE).

                 •  (Since glibc 2.10) The value 200809L or greater
                    additionally exposes definitions corresponding to the
                    POSIX.1-2008 base specification (excluding the XSI
                    extension).

          _POSIX_SOURCE
                 Defining this obsolete macro with any value is equivalent
                 to defining _POSIX_C_SOURCE with the value 1.

                 Since this macro is obsolete, its usage is generally not
                 documented when discussing feature test macro requirements
                 in the man pages.

          _XOPEN_SOURCE
                 Defining this macro causes header files to expose
                 definitions as follows:

                 •  Defining with any value exposes definitions conforming
                    to POSIX.1, POSIX.2, and XPG4.

                 •  The value 500 or greater additionally exposes
                    definitions for SUSv2 (UNIX 98).

                 •  (Since glibc 2.2) The value 600 or greater additionally
                    exposes definitions for SUSv3 (UNIX 03; i.e., the
                    POSIX.1-2001 base specification plus the XSI extension)
                    and C99 definitions.

                 •  (Since glibc 2.10) The value 700 or greater
                    additionally exposes definitions for SUSv4 (i.e., the
                    POSIX.1-2008 base specification plus the XSI
                    extension).

                 If __STRICT_ANSI__ is not defined, or _XOPEN_SOURCE is
                 defined with a value greater than or equal to 500 and
                 neither _POSIX_SOURCE nor _POSIX_C_SOURCE is explicitly
                 defined, then the following macros are implicitly defined:

                 •  _POSIX_SOURCE is defined with the value 1.

                 •  _POSIX_C_SOURCE is defined, according to the value of
                    _XOPEN_SOURCE:

                    _XOPEN_SOURCE < 500
                           _POSIX_C_SOURCE is defined with the value 2.

                    500 <= _XOPEN_SOURCE < 600
                           _POSIX_C_SOURCE is defined with the value
                           199506L.

                    600 <= _XOPEN_SOURCE < 700
                           _POSIX_C_SOURCE is defined with the value
                           200112L.

                    700 <= _XOPEN_SOURCE (since glibc 2.10)
                           _POSIX_C_SOURCE is defined with the value
                           200809L.

                 In addition, defining _XOPEN_SOURCE with a value of 500 or
                 greater produces the same effects as defining
                 _XOPEN_SOURCE_EXTENDED.

          _XOPEN_SOURCE_EXTENDED
                 If this macro is defined, and _XOPEN_SOURCE is defined,
                 then expose definitions corresponding to the XPG4v2
                 (SUSv1) UNIX extensions (UNIX 95).  Defining _XOPEN_SOURCE
                 with a value of 500 or more also produces the same effect
                 as defining _XOPEN_SOURCE_EXTENDED.  Use of
                 _XOPEN_SOURCE_EXTENDED in new source code should be
                 avoided.

                 Since defining _XOPEN_SOURCE with a value of 500 or more
                 has the same effect as defining _XOPEN_SOURCE_EXTENDED,
                 the latter (obsolete) feature test macro is generally not
                 described in the SYNOPSIS in man pages.

          _ISOC99_SOURCE (since glibc 2.1.3)
                 Exposes declarations consistent with the ISO C99 standard.

                 Earlier glibc 2.1.x versions recognized an equivalent
                 macro named _ISOC9X_SOURCE (because the C99 standard had
                 not then been finalized).  Although the use of this macro
                 is obsolete, glibc continues to recognize it for backward
                 compatibility.

                 Defining _ISOC99_SOURCE also exposes ISO C (1990)
                 Amendment 1 ("C95") definitions.  (The primary change in
                 C95 was support for international character sets.)

                 Invoking the C compiler with the option -std=c99 produces
                 the same effects as defining this macro.

          _ISOC11_SOURCE (since glibc 2.16)
                 Exposes declarations consistent with the ISO C11 standard.
                 Defining this macro also enables C99 and C95 features
                 (like _ISOC99_SOURCE).

                 Invoking the C compiler with the option -std=c11 produces
                 the same effects as defining this macro.

          _LARGEFILE64_SOURCE
                 Expose definitions for the alternative API specified by
                 the LFS (Large File Summit) as a "transitional extension"
                 to the Single UNIX Specification.  (See
                 ⟨http://opengroup.org/platform/lfs.html⟩.)  The
                 alternative API consists of a set of new objects (i.e.,
                 functions and types) whose names are suffixed with "64"
                 (e.g., off64_t versus off_t, lseek64() versus lseek(),
                 etc.).  New programs should not employ this macro; instead
                 _FILE_OFFSET_BITS=64 should be employed.

          _LARGEFILE_SOURCE
                 This macro was historically used to expose certain
                 functions (specifically fseeko(3) and ftello(3)) that
                 address limitations of earlier APIs (fseek(3) and
                 ftell(3)) that use long for file offsets.  This macro is
                 implicitly defined if _XOPEN_SOURCE is defined with a
                 value greater than or equal to 500.  New programs should
                 not employ this macro; defining _XOPEN_SOURCE as just
                 described or defining _FILE_OFFSET_BITS with the value 64
                 is the preferred mechanism to achieve the same result.

          _FILE_OFFSET_BITS
                 Defining this macro with the value 64 automatically
                 converts references to 32-bit functions and data types
                 related to file I/O and filesystem operations into
                 references to their 64-bit counterparts.  This is useful
                 for performing I/O on large files (> 2 Gigabytes) on
                 32-bit systems.  (Defining this macro permits correctly
                 written programs to use large files with only a
                 recompilation being required.)

                 64-bit systems naturally permit file sizes greater than 2
                 Gigabytes, and on those systems this macro has no effect.

          _BSD_SOURCE (deprecated since glibc 2.20)
                 Defining this macro with any value causes header files to
                 expose BSD-derived definitions.

                 In glibc versions up to and including 2.18, defining this
                 macro also causes BSD definitions to be preferred in some
                 situations where standards conflict, unless one or more of
                 _SVID_SOURCE, _POSIX_SOURCE, _POSIX_C_SOURCE,
                 _XOPEN_SOURCE, _XOPEN_SOURCE_EXTENDED, or _GNU_SOURCE is
                 defined, in which case BSD definitions are disfavored.
                 Since glibc 2.19, _BSD_SOURCE no longer causes BSD
                 definitions to be preferred in case of conflicts.

                 Since glibc 2.20, this macro is deprecated.  It now has
                 the same effect as defining _DEFAULT_SOURCE, but generates
                 a compile-time warning (unless _DEFAULT_SOURCE is also
                 defined).  Use _DEFAULT_SOURCE instead.  To allow code
                 that requires _BSD_SOURCE in glibc 2.19 and earlier and
                 _DEFAULT_SOURCE in glibc 2.20 and later to compile without
                 warnings, define both _BSD_SOURCE and _DEFAULT_SOURCE.

          _SVID_SOURCE (deprecated since glibc 2.20)
                 Defining this macro with any value causes header files to
                 expose System V-derived definitions.  (SVID == System V
                 Interface Definition; see standards(7).)

                 Since glibc 2.20, this macro is deprecated in the same
                 fashion as _BSD_SOURCE.

          _DEFAULT_SOURCE (since glibc 2.19)
                 This macro can be defined to ensure that the "default"
                 definitions are provided even when the defaults would
                 otherwise be disabled, as happens when individual macros
                 are explicitly defined, or the compiler is invoked in one
                 of its "standard" modes (e.g., cc -std=c99).  Defining
                 _DEFAULT_SOURCE without defining other individual macros
                 or invoking the compiler in one of its "standard" modes
                 has no effect.

                 The "default" definitions comprise those required by
                 POSIX.1-2008 and ISO C99, as well as various definitions
                 originally derived from BSD and System V.  On glibc 2.19
                 and earlier, these defaults were approximately equivalent
                 to explicitly defining the following:

                     cc -D_BSD_SOURCE -D_SVID_SOURCE
                 -D_POSIX_C_SOURCE=200809

          _ATFILE_SOURCE (since glibc 2.4)
                 Defining this macro with any value causes header files to
                 expose declarations of a range of functions with the
                 suffix "at"; see openat(2).  Since glibc 2.10, this macro
                 is also implicitly defined if _POSIX_C_SOURCE is defined
                 with a value greater than or equal to 200809L.

          _GNU_SOURCE
                 Defining this macro (with any value) implicitly defines
                 _ATFILE_SOURCE, _LARGEFILE64_SOURCE, _ISOC99_SOURCE,
                 _XOPEN_SOURCE_EXTENDED, _POSIX_SOURCE, _POSIX_C_SOURCE
                 with the value 200809L (200112L in glibc versions before
                 2.10; 199506L in glibc versions before 2.5; 199309L in
                 glibc versions before 2.1) and _XOPEN_SOURCE with the
                 value 700 (600 in glibc versions before 2.10; 500 in glibc
                 versions before 2.2).  In addition, various GNU-specific
                 extensions are also exposed.

                 Since glibc 2.19, defining _GNU_SOURCE also has the effect
                 of implicitly defining _DEFAULT_SOURCE.  In glibc versions
                 before 2.20, defining _GNU_SOURCE also had the effect of
                 implicitly defining _BSD_SOURCE and _SVID_SOURCE.

          _REENTRANT
                 Historically, on various C libraries it was necessary to
                 define this macro in all multithreaded code.  (Some C
                 libraries may still require this.)  In glibc, this macro
                 also exposed definitions of certain reentrant functions.

                 However, glibc has been thread-safe by default for many
                 years; since glibc 2.3, the only effect of defining
                 _REENTRANT has been to enable one or two of the same
                 declarations that are also enabled by defining
                 _POSIX_C_SOURCE with a value of 199606L or greater.

                 _REENTRANT is now obsolete.  In glibc 2.25 and later,
                 defining _REENTRANT is equivalent to defining
                 _POSIX_C_SOURCE with the value 199606L.  If a higher POSIX
                 conformance level is selected by any other means (such as
                 _POSIX_C_SOURCE itself, _XOPEN_SOURCE, _DEFAULT_SOURCE, or
                 _GNU_SOURCE), then defining _REENTRANT has no effect.

                 This macro is automatically defined if one compiles with
                 cc -pthread.

          _THREAD_SAFE
                 Synonym for the (deprecated) _REENTRANT, provided for
                 compatibility with some other implementations.

          _FORTIFY_SOURCE (since glibc 2.3.4)
                 Defining this macro causes some lightweight checks to be
                 performed to detect some buffer overflow errors when
                 employing various string and memory manipulation functions
                 (for example, memcpy(3), memset(3), stpcpy(3), strcpy(3),
                 strncpy(3), strcat(3), strncat(3), sprintf(3),
                 snprintf(3), vsprintf(3), vsnprintf(3), gets(3), and wide
                 character variants thereof).  For some functions, argument
                 consistency is checked; for example, a check is made that
                 open(2) has been supplied with a mode argument when the
                 specified flags include O_CREAT.  Not all problems are
                 detected, just some common cases.

                 If _FORTIFY_SOURCE is set to 1, with compiler optimization
                 level 1 (gcc -O1) and above, checks that shouldn't change
                 the behavior of conforming programs are performed.  With
                 _FORTIFY_SOURCE set to 2, some more checking is added, but
                 some conforming programs might fail.

                 Some of the checks can be performed at compile time (via
                 macros logic implemented in header files), and result in
                 compiler warnings; other checks take place at run time,
                 and result in a run-time error if the check fails.

                 Use of this macro requires compiler support, available
                 with gcc(1) since version 4.0.

      Default definitions, implicit definitions, and combining definitions
          If no feature test macros are explicitly defined, then the
          following feature test macros are defined by default: _BSD_SOURCE
          (in glibc 2.19 and earlier), _SVID_SOURCE (in glibc 2.19 and
          earlier), _DEFAULT_SOURCE (since glibc 2.19), _POSIX_SOURCE, and
          _POSIX_C_SOURCE=200809L (200112L in glibc versions before 2.10;
          199506L in glibc versions before 2.4; 199309L in glibc versions
          before 2.1).

          If any of __STRICT_ANSI__, _ISOC99_SOURCE, _ISOC11_SOURCE (since
          glibc 2.18), _POSIX_SOURCE, _POSIX_C_SOURCE, _XOPEN_SOURCE,
          _XOPEN_SOURCE_EXTENDED (in glibc 2.11 and earlier), _BSD_SOURCE
          (in glibc 2.19 and earlier), or _SVID_SOURCE (in glibc 2.19 and
          earlier) is explicitly defined, then _BSD_SOURCE, _SVID_SOURCE,
          and _DEFAULT_SOURCE are not defined by default.

          If _POSIX_SOURCE and _POSIX_C_SOURCE are not explicitly defined,
          and either __STRICT_ANSI__ is not defined or _XOPEN_SOURCE is
          defined with a value of 500 or more, then

          *  _POSIX_SOURCE is defined with the value 1; and

          *  _POSIX_C_SOURCE is defined with one of the following values:

             •  2, if _XOPEN_SOURCE is defined with a value less than 500;

             •  199506L, if _XOPEN_SOURCE is defined with a value greater
                than or equal to 500 and less than 600; or

             •  (since glibc 2.4) 200112L, if _XOPEN_SOURCE is defined with
                a value greater than or equal to 600 and less than 700.

             •  (Since glibc 2.10) 200809L, if _XOPEN_SOURCE is defined
                with a value greater than or equal to 700.

             •  Older versions of glibc do not know about the values
                200112L and 200809L for _POSIX_C_SOURCE, and the setting of
                this macro will depend on the glibc version.

             •  If _XOPEN_SOURCE is undefined, then the setting of
                _POSIX_C_SOURCE depends on the glibc version: 199506L, in
                glibc versions before 2.4; 200112L, in glibc 2.4 to 2.9;
                and 200809L, since glibc 2.10.

          Multiple macros can be defined; the results are additive.


-------------------------------------------------------------------

::

          POSIX.1 specifies _POSIX_C_SOURCE, _POSIX_SOURCE, and
          _XOPEN_SOURCE.

          _XOPEN_SOURCE_EXTENDED was specified by XPG4v2 (aka SUSv1), but
          is not present in SUSv2 and later.  _FILE_OFFSET_BITS is not
          specified by any standard, but is employed on some other
          implementations.

          _BSD_SOURCE, _SVID_SOURCE, _DEFAULT_SOURCE, _ATFILE_SOURCE,
          _GNU_SOURCE, _FORTIFY_SOURCE, _REENTRANT, and _THREAD_SAFE are
          specific to Linux (glibc).


---------------------------------------------------

::

          <features.h> is a Linux/glibc-specific header file.  Other
          systems have an analogous file, but typically with a different
          name.  This header file is automatically included by other header
          files as required: it is not necessary to explicitly include it
          in order to employ feature test macros.

          According to which of the above feature test macros are defined,
          <features.h> internally defines various other macros that are
          checked by other glibc header files.  These macros have names
          prefixed by two underscores (e.g., __USE_MISC).  Programs should
          never define these macros directly: instead, the appropriate
          feature test macro(s) from the list above should be employed.


---------------------------------------------------------

::

          The program below can be used to explore how the various feature
          test macros are set depending on the glibc version and what
          feature test macros are explicitly set.  The following shell
          session, on a system with glibc 2.10, shows some examples of what
          we would see:

              $ cc ftm.c
              $ ./a.out
              _POSIX_SOURCE defined
              _POSIX_C_SOURCE defined: 200809L
              _BSD_SOURCE defined
              _SVID_SOURCE defined
              _ATFILE_SOURCE defined
              $ cc -D_XOPEN_SOURCE=500 ftm.c
              $ ./a.out
              _POSIX_SOURCE defined
              _POSIX_C_SOURCE defined: 199506L
              _XOPEN_SOURCE defined: 500
              $ cc -D_GNU_SOURCE ftm.c
              $ ./a.out
              _POSIX_SOURCE defined
              _POSIX_C_SOURCE defined: 200809L
              _ISOC99_SOURCE defined
              _XOPEN_SOURCE defined: 700
              _XOPEN_SOURCE_EXTENDED defined
              _LARGEFILE64_SOURCE defined
              _BSD_SOURCE defined
              _SVID_SOURCE defined
              _ATFILE_SOURCE defined
              _GNU_SOURCE defined

      Program source

          /* ftm.c */

          #include <stdint.h>
          #include <stdio.h>
          #include <unistd.h>
          #include <stdlib.h>

          int
          main(int argc, char *argv[])
          {
          #ifdef _POSIX_SOURCE
              printf("_POSIX_SOURCE defined\n");
          #endif

          #ifdef _POSIX_C_SOURCE
              printf("_POSIX_C_SOURCE defined: %jdL\n",
                      (intmax_t) _POSIX_C_SOURCE);
          #endif

          #ifdef _ISOC99_SOURCE
              printf("_ISOC99_SOURCE defined\n");
          #endif

          #ifdef _ISOC11_SOURCE
              printf("_ISOC11_SOURCE defined\n");
          #endif

          #ifdef _XOPEN_SOURCE
              printf("_XOPEN_SOURCE defined: %d\n", _XOPEN_SOURCE);
          #endif

          #ifdef _XOPEN_SOURCE_EXTENDED
              printf("_XOPEN_SOURCE_EXTENDED defined\n");
          #endif

          #ifdef _LARGEFILE64_SOURCE
              printf("_LARGEFILE64_SOURCE defined\n");
          #endif

          #ifdef _FILE_OFFSET_BITS
              printf("_FILE_OFFSET_BITS defined: %d\n", _FILE_OFFSET_BITS);
          #endif

          #ifdef _BSD_SOURCE
              printf("_BSD_SOURCE defined\n");
          #endif

          #ifdef _SVID_SOURCE
              printf("_SVID_SOURCE defined\n");
          #endif

          #ifdef _DEFAULT_SOURCE
              printf("_DEFAULT_SOURCE defined\n");
          #endif

          #ifdef _ATFILE_SOURCE
              printf("_ATFILE_SOURCE defined\n");
          #endif

          #ifdef _GNU_SOURCE
              printf("_GNU_SOURCE defined\n");
          #endif

          #ifdef _REENTRANT
              printf("_REENTRANT defined\n");
          #endif

          #ifdef _THREAD_SAFE
              printf("_THREAD_SAFE defined\n");
          #endif

          #ifdef _FORTIFY_SOURCE
              printf("_FORTIFY_SOURCE defined\n");
          #endif

              exit(EXIT_SUCCESS);
          }


---------------------------------------------------------

::

          libc(7), standards(7), system_data_types(7)

          The section "Feature Test Macros" under info libc.

          /usr/include/features.h

COLOPHON
---------------------------------------------------------

::

          This page is part of release 5.13 of the Linux man-pages project.
          A description of the project, information about reporting bugs,
          and the latest version of this page, can be found at
          https://www.kernel.org/doc/man-pages/.

   Linux                          2021-03-22         FEATURE_TEST_MACROS(7)

--------------

Pages that refer to this page: `access(2) <../man2/access.2.html>`__, 
`acct(2) <../man2/acct.2.html>`__,  `brk(2) <../man2/brk.2.html>`__, 
`chdir(2) <../man2/chdir.2.html>`__, 
`chmod(2) <../man2/chmod.2.html>`__, 
`chown(2) <../man2/chown.2.html>`__, 
`chroot(2) <../man2/chroot.2.html>`__, 
`clock_getres(2) <../man2/clock_getres.2.html>`__, 
`clock_nanosleep(2) <../man2/clock_nanosleep.2.html>`__, 
`\_exit(2) <../man2/_exit.2.html>`__, 
`fcntl(2) <../man2/fcntl.2.html>`__, 
`fsync(2) <../man2/fsync.2.html>`__, 
`futimesat(2) <../man2/futimesat.2.html>`__, 
`getdomainname(2) <../man2/getdomainname.2.html>`__, 
`getgroups(2) <../man2/getgroups.2.html>`__, 
`gethostname(2) <../man2/gethostname.2.html>`__, 
`getpagesize(2) <../man2/getpagesize.2.html>`__, 
`getrlimit(2) <../man2/getrlimit.2.html>`__, 
`getsid(2) <../man2/getsid.2.html>`__, 
`gettimeofday(2) <../man2/gettimeofday.2.html>`__, 
`intro(2) <../man2/intro.2.html>`__, 
`kill(2) <../man2/kill.2.html>`__,  `link(2) <../man2/link.2.html>`__, 
`madvise(2) <../man2/madvise.2.html>`__, 
`mincore(2) <../man2/mincore.2.html>`__, 
`mkdir(2) <../man2/mkdir.2.html>`__, 
`mknod(2) <../man2/mknod.2.html>`__, 
`nanosleep(2) <../man2/nanosleep.2.html>`__, 
`nice(2) <../man2/nice.2.html>`__,  `open(2) <../man2/open.2.html>`__, 
`posix_fadvise(2) <../man2/posix_fadvise.2.html>`__, 
`pread(2) <../man2/pread.2.html>`__, 
`process_vm_readv(2) <../man2/process_vm_readv.2.html>`__, 
`readlink(2) <../man2/readlink.2.html>`__, 
`readv(2) <../man2/readv.2.html>`__, 
`rename(2) <../man2/rename.2.html>`__, 
`select(2) <../man2/select.2.html>`__, 
`semop(2) <../man2/semop.2.html>`__, 
`seteuid(2) <../man2/seteuid.2.html>`__, 
`setpgid(2) <../man2/setpgid.2.html>`__, 
`setreuid(2) <../man2/setreuid.2.html>`__, 
`sigaction(2) <../man2/sigaction.2.html>`__, 
`sigaltstack(2) <../man2/sigaltstack.2.html>`__, 
`signal(2) <../man2/signal.2.html>`__, 
`sigpending(2) <../man2/sigpending.2.html>`__, 
`sigprocmask(2) <../man2/sigprocmask.2.html>`__, 
`sigsuspend(2) <../man2/sigsuspend.2.html>`__, 
`sigwaitinfo(2) <../man2/sigwaitinfo.2.html>`__, 
`stat(2) <../man2/stat.2.html>`__, 
`stime(2) <../man2/stime.2.html>`__, 
`symlink(2) <../man2/symlink.2.html>`__, 
`sync(2) <../man2/sync.2.html>`__, 
`syscall(2) <../man2/syscall.2.html>`__, 
`timer_create(2) <../man2/timer_create.2.html>`__, 
`timer_delete(2) <../man2/timer_delete.2.html>`__, 
`timer_getoverrun(2) <../man2/timer_getoverrun.2.html>`__, 
`timer_settime(2) <../man2/timer_settime.2.html>`__, 
`truncate(2) <../man2/truncate.2.html>`__, 
`unlink(2) <../man2/unlink.2.html>`__, 
`utimensat(2) <../man2/utimensat.2.html>`__, 
`vfork(2) <../man2/vfork.2.html>`__, 
`vhangup(2) <../man2/vhangup.2.html>`__, 
`wait(2) <../man2/wait.2.html>`__, 
`wait4(2) <../man2/wait4.2.html>`__, 
`a64l(3) <../man3/a64l.3.html>`__,  `abs(3) <../man3/abs.3.html>`__, 
`acos(3) <../man3/acos.3.html>`__, 
`acosh(3) <../man3/acosh.3.html>`__, 
`addseverity(3) <../man3/addseverity.3.html>`__, 
`adjtime(3) <../man3/adjtime.3.html>`__, 
`asin(3) <../man3/asin.3.html>`__, 
`asinh(3) <../man3/asinh.3.html>`__, 
`atan2(3) <../man3/atan2.3.html>`__, 
`atan(3) <../man3/atan.3.html>`__, 
`atanh(3) <../man3/atanh.3.html>`__, 
`atoi(3) <../man3/atoi.3.html>`__, 
`bsd_signal(3) <../man3/bsd_signal.3.html>`__, 
`cbrt(3) <../man3/cbrt.3.html>`__,  `ceil(3) <../man3/ceil.3.html>`__, 
`cfree(3) <../man3/cfree.3.html>`__, 
`clearenv(3) <../man3/clearenv.3.html>`__, 
`clock_getcpuclockid(3) <../man3/clock_getcpuclockid.3.html>`__, 
`confstr(3) <../man3/confstr.3.html>`__, 
`copysign(3) <../man3/copysign.3.html>`__, 
`cos(3) <../man3/cos.3.html>`__,  `cosh(3) <../man3/cosh.3.html>`__, 
`crypt(3) <../man3/crypt.3.html>`__, 
`ctermid(3) <../man3/ctermid.3.html>`__, 
`ctime(3) <../man3/ctime.3.html>`__, 
`daemon(3) <../man3/daemon.3.html>`__, 
`dirfd(3) <../man3/dirfd.3.html>`__,  `div(3) <../man3/div.3.html>`__, 
`drand48(3) <../man3/drand48.3.html>`__, 
`drand48_r(3) <../man3/drand48_r.3.html>`__, 
`duplocale(3) <../man3/duplocale.3.html>`__, 
`dysize(3) <../man3/dysize.3.html>`__, 
`ecvt(3) <../man3/ecvt.3.html>`__, 
`ecvt_r(3) <../man3/ecvt_r.3.html>`__, 
`endian(3) <../man3/endian.3.html>`__, 
`erf(3) <../man3/erf.3.html>`__,  `erfc(3) <../man3/erfc.3.html>`__, 
`exec(3) <../man3/exec.3.html>`__,  `exp2(3) <../man3/exp2.3.html>`__, 
`exp(3) <../man3/exp.3.html>`__,  `expm1(3) <../man3/expm1.3.html>`__, 
`fabs(3) <../man3/fabs.3.html>`__,  `fdim(3) <../man3/fdim.3.html>`__, 
`fexecve(3) <../man3/fexecve.3.html>`__, 
`ffs(3) <../man3/ffs.3.html>`__,  `fgetc(3) <../man3/fgetc.3.html>`__, 
`fgetgrent(3) <../man3/fgetgrent.3.html>`__, 
`fgetpwent(3) <../man3/fgetpwent.3.html>`__, 
`fileno(3) <../man3/fileno.3.html>`__, 
`finite(3) <../man3/finite.3.html>`__, 
`flockfile(3) <../man3/flockfile.3.html>`__, 
`floor(3) <../man3/floor.3.html>`__,  `fma(3) <../man3/fma.3.html>`__, 
`fmax(3) <../man3/fmax.3.html>`__, 
`fmemopen(3) <../man3/fmemopen.3.html>`__, 
`fmin(3) <../man3/fmin.3.html>`__,  `fmod(3) <../man3/fmod.3.html>`__, 
`fopen(3) <../man3/fopen.3.html>`__, 
`fpclassify(3) <../man3/fpclassify.3.html>`__, 
`frexp(3) <../man3/frexp.3.html>`__, 
`fseeko(3) <../man3/fseeko.3.html>`__, 
`ftw(3) <../man3/ftw.3.html>`__, 
`futimes(3) <../man3/futimes.3.html>`__, 
`fwide(3) <../man3/fwide.3.html>`__, 
`gamma(3) <../man3/gamma.3.html>`__, 
`gcvt(3) <../man3/gcvt.3.html>`__, 
`getaddrinfo(3) <../man3/getaddrinfo.3.html>`__, 
`getcwd(3) <../man3/getcwd.3.html>`__, 
`getdate(3) <../man3/getdate.3.html>`__, 
`getdirentries(3) <../man3/getdirentries.3.html>`__, 
`getdtablesize(3) <../man3/getdtablesize.3.html>`__, 
`getentropy(3) <../man3/getentropy.3.html>`__, 
`getenv(3) <../man3/getenv.3.html>`__, 
`getgrent(3) <../man3/getgrent.3.html>`__, 
`getgrent_r(3) <../man3/getgrent_r.3.html>`__, 
`getgrnam(3) <../man3/getgrnam.3.html>`__, 
`getgrouplist(3) <../man3/getgrouplist.3.html>`__, 
`gethostbyname(3) <../man3/gethostbyname.3.html>`__, 
`gethostid(3) <../man3/gethostid.3.html>`__, 
`getline(3) <../man3/getline.3.html>`__, 
`getloadavg(3) <../man3/getloadavg.3.html>`__, 
`getlogin(3) <../man3/getlogin.3.html>`__, 
`getmntent(3) <../man3/getmntent.3.html>`__, 
`getnameinfo(3) <../man3/getnameinfo.3.html>`__, 
`getnetent_r(3) <../man3/getnetent_r.3.html>`__, 
`getopt(3) <../man3/getopt.3.html>`__, 
`getpass(3) <../man3/getpass.3.html>`__, 
`getprotoent_r(3) <../man3/getprotoent_r.3.html>`__, 
`getpwent(3) <../man3/getpwent.3.html>`__, 
`getpwent_r(3) <../man3/getpwent_r.3.html>`__, 
`getpwnam(3) <../man3/getpwnam.3.html>`__, 
`getrpcent_r(3) <../man3/getrpcent_r.3.html>`__, 
`gets(3) <../man3/gets.3.html>`__, 
`getservent_r(3) <../man3/getservent_r.3.html>`__, 
`getspnam(3) <../man3/getspnam.3.html>`__, 
`getsubopt(3) <../man3/getsubopt.3.html>`__, 
`getusershell(3) <../man3/getusershell.3.html>`__, 
`getutent(3) <../man3/getutent.3.html>`__, 
`getw(3) <../man3/getw.3.html>`__, 
`grantpt(3) <../man3/grantpt.3.html>`__, 
`group_member(3) <../man3/group_member.3.html>`__, 
`gsignal(3) <../man3/gsignal.3.html>`__, 
`hypot(3) <../man3/hypot.3.html>`__, 
`ilogb(3) <../man3/ilogb.3.html>`__, 
`inet(3) <../man3/inet.3.html>`__, 
`inet_net_pton(3) <../man3/inet_net_pton.3.html>`__, 
`initgroups(3) <../man3/initgroups.3.html>`__, 
`insque(3) <../man3/insque.3.html>`__, 
`intro(3) <../man3/intro.3.html>`__, 
`isalpha(3) <../man3/isalpha.3.html>`__, 
`isfdtype(3) <../man3/isfdtype.3.html>`__, 
`isgreater(3) <../man3/isgreater.3.html>`__, 
`iswblank(3) <../man3/iswblank.3.html>`__, 
`j0(3) <../man3/j0.3.html>`__,  `killpg(3) <../man3/killpg.3.html>`__, 
`ldexp(3) <../man3/ldexp.3.html>`__, 
`lgamma(3) <../man3/lgamma.3.html>`__, 
`lockf(3) <../man3/lockf.3.html>`__, 
`log10(3) <../man3/log10.3.html>`__, 
`log1p(3) <../man3/log1p.3.html>`__, 
`log2(3) <../man3/log2.3.html>`__,  `log(3) <../man3/log.3.html>`__, 
`logb(3) <../man3/logb.3.html>`__, 
`lrint(3) <../man3/lrint.3.html>`__, 
`lround(3) <../man3/lround.3.html>`__, 
`malloc(3) <../man3/malloc.3.html>`__, 
`mbsnrtowcs(3) <../man3/mbsnrtowcs.3.html>`__, 
`memchr(3) <../man3/memchr.3.html>`__, 
`mkdtemp(3) <../man3/mkdtemp.3.html>`__, 
`mkfifo(3) <../man3/mkfifo.3.html>`__, 
`mkstemp(3) <../man3/mkstemp.3.html>`__, 
`mktemp(3) <../man3/mktemp.3.html>`__, 
`modf(3) <../man3/modf.3.html>`__, 
`mq_receive(3) <../man3/mq_receive.3.html>`__, 
`mq_send(3) <../man3/mq_send.3.html>`__, 
`nan(3) <../man3/nan.3.html>`__, 
`newlocale(3) <../man3/newlocale.3.html>`__, 
`nextafter(3) <../man3/nextafter.3.html>`__, 
`nl_langinfo(3) <../man3/nl_langinfo.3.html>`__, 
`on_exit(3) <../man3/on_exit.3.html>`__, 
`opendir(3) <../man3/opendir.3.html>`__, 
`open_memstream(3) <../man3/open_memstream.3.html>`__, 
`perror(3) <../man3/perror.3.html>`__, 
`popen(3) <../man3/popen.3.html>`__, 
`posix_fallocate(3) <../man3/posix_fallocate.3.html>`__, 
`posix_madvise(3) <../man3/posix_madvise.3.html>`__, 
`posix_memalign(3) <../man3/posix_memalign.3.html>`__, 
`posix_openpt(3) <../man3/posix_openpt.3.html>`__, 
`pow(3) <../man3/pow.3.html>`__, 
`printf(3) <../man3/printf.3.html>`__, 
`profil(3) <../man3/profil.3.html>`__, 
`psignal(3) <../man3/psignal.3.html>`__, 
`pthread_attr_setstack(3) <../man3/pthread_attr_setstack.3.html>`__, 
`pthread_cleanup_push_defer_np(3) <../man3/pthread_cleanup_push_defer_np.3.html>`__, 
`pthread_kill(3) <../man3/pthread_kill.3.html>`__, 
`pthread_mutexattr_setrobust(3) <../man3/pthread_mutexattr_setrobust.3.html>`__, 
`pthread_mutex_consistent(3) <../man3/pthread_mutex_consistent.3.html>`__, 
`pthread_rwlockattr_setkind_np(3) <../man3/pthread_rwlockattr_setkind_np.3.html>`__, 
`pthread_sigmask(3) <../man3/pthread_sigmask.3.html>`__, 
`pthread_sigqueue(3) <../man3/pthread_sigqueue.3.html>`__, 
`pthread_spin_init(3) <../man3/pthread_spin_init.3.html>`__, 
`pthread_spin_lock(3) <../man3/pthread_spin_lock.3.html>`__, 
`ptsname(3) <../man3/ptsname.3.html>`__, 
`putenv(3) <../man3/putenv.3.html>`__, 
`putpwent(3) <../man3/putpwent.3.html>`__, 
`qecvt(3) <../man3/qecvt.3.html>`__, 
`qsort(3) <../man3/qsort.3.html>`__, 
`rand(3) <../man3/rand.3.html>`__, 
`random(3) <../man3/random.3.html>`__, 
`random_r(3) <../man3/random_r.3.html>`__, 
`rcmd(3) <../man3/rcmd.3.html>`__, 
`readdir_r(3) <../man3/readdir_r.3.html>`__, 
`realpath(3) <../man3/realpath.3.html>`__, 
`remainder(3) <../man3/remainder.3.html>`__, 
`remquo(3) <../man3/remquo.3.html>`__, 
`rint(3) <../man3/rint.3.html>`__, 
`round(3) <../man3/round.3.html>`__, 
`rpmatch(3) <../man3/rpmatch.3.html>`__, 
`scalb(3) <../man3/scalb.3.html>`__, 
`scalbln(3) <../man3/scalbln.3.html>`__, 
`scandir(3) <../man3/scandir.3.html>`__, 
`scanf(3) <../man3/scanf.3.html>`__, 
`sched_getcpu(3) <../man3/sched_getcpu.3.html>`__, 
`seekdir(3) <../man3/seekdir.3.html>`__, 
`sem_wait(3) <../man3/sem_wait.3.html>`__, 
`setbuf(3) <../man3/setbuf.3.html>`__, 
`setenv(3) <../man3/setenv.3.html>`__, 
`setjmp(3) <../man3/setjmp.3.html>`__, 
`setnetgrent(3) <../man3/setnetgrent.3.html>`__, 
`siginterrupt(3) <../man3/siginterrupt.3.html>`__, 
`signbit(3) <../man3/signbit.3.html>`__, 
`significand(3) <../man3/significand.3.html>`__, 
`sigpause(3) <../man3/sigpause.3.html>`__, 
`sigqueue(3) <../man3/sigqueue.3.html>`__, 
`sigset(3) <../man3/sigset.3.html>`__, 
`sigsetops(3) <../man3/sigsetops.3.html>`__, 
`sigvec(3) <../man3/sigvec.3.html>`__, 
`sigwait(3) <../man3/sigwait.3.html>`__, 
`sin(3) <../man3/sin.3.html>`__,  `sinh(3) <../man3/sinh.3.html>`__, 
`sockatmark(3) <../man3/sockatmark.3.html>`__, 
`sqrt(3) <../man3/sqrt.3.html>`__, 
`stpcpy(3) <../man3/stpcpy.3.html>`__, 
`stpncpy(3) <../man3/stpncpy.3.html>`__, 
`strdup(3) <../man3/strdup.3.html>`__, 
`strerror(3) <../man3/strerror.3.html>`__, 
`strfromd(3) <../man3/strfromd.3.html>`__, 
`strnlen(3) <../man3/strnlen.3.html>`__, 
`strsep(3) <../man3/strsep.3.html>`__, 
`strsignal(3) <../man3/strsignal.3.html>`__, 
`strtod(3) <../man3/strtod.3.html>`__, 
`strtok(3) <../man3/strtok.3.html>`__, 
`strtol(3) <../man3/strtol.3.html>`__, 
`strtoul(3) <../man3/strtoul.3.html>`__, 
`syslog(3) <../man3/syslog.3.html>`__, 
`tan(3) <../man3/tan.3.html>`__,  `tanh(3) <../man3/tanh.3.html>`__, 
`telldir(3) <../man3/telldir.3.html>`__, 
`tempnam(3) <../man3/tempnam.3.html>`__, 
`termios(3) <../man3/termios.3.html>`__, 
`tgamma(3) <../man3/tgamma.3.html>`__, 
`timegm(3) <../man3/timegm.3.html>`__, 
`timeradd(3) <../man3/timeradd.3.html>`__, 
`tmpnam(3) <../man3/tmpnam.3.html>`__, 
`toascii(3) <../man3/toascii.3.html>`__, 
`toupper(3) <../man3/toupper.3.html>`__, 
`towlower(3) <../man3/towlower.3.html>`__, 
`towupper(3) <../man3/towupper.3.html>`__, 
`trunc(3) <../man3/trunc.3.html>`__, 
`ttyslot(3) <../man3/ttyslot.3.html>`__, 
`tzset(3) <../man3/tzset.3.html>`__, 
`ualarm(3) <../man3/ualarm.3.html>`__, 
`unlocked_stdio(3) <../man3/unlocked_stdio.3.html>`__, 
`unlockpt(3) <../man3/unlockpt.3.html>`__, 
`uselocale(3) <../man3/uselocale.3.html>`__, 
`usleep(3) <../man3/usleep.3.html>`__, 
`wcpcpy(3) <../man3/wcpcpy.3.html>`__, 
`wcpncpy(3) <../man3/wcpncpy.3.html>`__, 
`wcscasecmp(3) <../man3/wcscasecmp.3.html>`__, 
`wcsdup(3) <../man3/wcsdup.3.html>`__, 
`wcsncasecmp(3) <../man3/wcsncasecmp.3.html>`__, 
`wcsnlen(3) <../man3/wcsnlen.3.html>`__, 
`wcsnrtombs(3) <../man3/wcsnrtombs.3.html>`__, 
`wordexp(3) <../man3/wordexp.3.html>`__, 
`wprintf(3) <../man3/wprintf.3.html>`__, 
`y0(3) <../man3/y0.3.html>`__, 
`environ(7) <../man7/environ.7.html>`__, 
`feature_test_macros(7) <../man7/feature_test_macros.7.html>`__, 
`libc(7) <../man7/libc.7.html>`__, 
`man-pages(7) <../man7/man-pages.7.html>`__, 
`standards(7) <../man7/standards.7.html>`__, 
`system_data_types(7) <../man7/system_data_types.7.html>`__

--------------

`Copyright and license for this manual
page <../man7/feature_test_macros.7.license.html>`__

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
