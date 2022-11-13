.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

stdlib.h(0p) — Linux manual page
================================

+-----------------------------------+-----------------------------------+
| `PROLOG <#PROLOG>`__ \|           |                                   |
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `APPLICAT                         |                                   |
| ION USAGE <#APPLICATION_USAGE>`__ |                                   |
| \| `RATIONALE <#RATIONALE>`__ \|  |                                   |
| `FUTURE D                         |                                   |
| IRECTIONS <#FUTURE_DIRECTIONS>`__ |                                   |
| \| `SEE ALSO <#SEE_ALSO>`__ \|    |                                   |
| `COPYRIGHT <#COPYRIGHT>`__        |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   stdlib.h(0P)            POSIX Programmer's Manual           stdlib.h(0P)


-----------------------------------------------------

::

          This manual page is part of the POSIX Programmer's Manual.  The
          Linux implementation of this interface may differ (consult the
          corresponding Linux manual page for details of Linux behavior),
          or the interface may not be implemented on Linux.

NAME
-------------------------------------------------

::

          stdlib.h — standard library definitions


---------------------------------------------------------

::

          #include <stdlib.h>


---------------------------------------------------------------

::

          Some of the functionality described on this reference page
          extends the ISO C standard. Applications shall define the
          appropriate feature test macro (see the System Interfaces volume
          of POSIX.1‐2017, Section 2.2, The Compilation Environment) to
          enable the visibility of these symbols in this header.

          The <stdlib.h> header shall define the following macros which
          shall expand to integer constant expressions:

          EXIT_FAILURE
                      Unsuccessful termination for exit(); evaluates to a
                      non-zero value.

          EXIT_SUCCESS
                      Successful termination for exit(); evaluates to 0.

          {RAND_MAX}  Maximum value returned by rand(); at least 32767.

          The <stdlib.h> header shall define the following macro which
          shall expand to a positive integer expression with type size_t:

          {MB_CUR_MAX}
                      Maximum number of bytes in a character specified by
                      the current locale (category LC_CTYPE).

          In the POSIX locale the value of {MB_CUR_MAX} shall be 1.

          The <stdlib.h> header shall define NULL as described in
          <stddef.h>.

          The <stdlib.h> header shall define the following data types
          through typedef:

          div_t       Structure type returned by the div() function.

          ldiv_t      Structure type returned by the ldiv() function.

          lldiv_t     Structure type returned by the lldiv() function.

          size_t      As described in <stddef.h>.

          wchar_t     As described in <stddef.h>.

          In addition, the <stdlib.h> header shall define the following
          symbolic constants and macros as described in <sys/wait.h>:

          WEXITSTATUS
          WIFEXITED
          WIFSIGNALED
          WIFSTOPPED
          WNOHANG
          WSTOPSIG
          WTERMSIG
          WUNTRACED

          The following shall be declared as functions and may also be
          defined as macros. Function prototypes shall be provided.

              void          _Exit(int);
              long          a64l(const char *);
              void          abort(void);
              int           abs(int);
              int           atexit(void (*)(void));
              double        atof(const char *);
              int           atoi(const char *);
              long          atol(const char *);
              long long     atoll(const char *);
              void         *bsearch(const void *, const void *, size_t, size_t,
                                int (*)(const void *, const void *));
              void         *calloc(size_t, size_t);
              div_t         div(int, int);
              double        drand48(void);
              double        erand48(unsigned short [3]);
              void          exit(int);
              void          free(void *);
              char         *getenv(const char *);
              int           getsubopt(char **, char *const *, char **);
              int           grantpt(int);
              char         *initstate(unsigned, char *, size_t);
              long          jrand48(unsigned short [3]);
              char         *l64a(long);
              long          labs(long);
              void          lcong48(unsigned short [7]);
              ldiv_t        ldiv(long, long);
              long long     llabs(long long);
              lldiv_t       lldiv(long long, long long);
              long          lrand48(void);
              void         *malloc(size_t);
              int           mblen(const char *, size_t);
              size_t        mbstowcs(wchar_t *restrict, const char *restrict, size_t);
              int           mbtowc(wchar_t *restrict, const char *restrict, size_t);
              char         *mkdtemp(char *);
              int           mkstemp(char *);
              long          mrand48(void);
              long          nrand48(unsigned short [3]);
              int           posix_memalign(void **, size_t, size_t);
              int           posix_openpt(int);
              char         *ptsname(int);
              int           putenv(char *);
              void          qsort(void *, size_t, size_t, int (*)(const void *,
                                const void *));
              int           rand(void);
              int           rand_r(unsigned *);
              long          random(void);
              void         *realloc(void *, size_t);
              char         *realpath(const char *restrict, char *restrict);
              unsigned short *seed48(unsigned short [3]);
              int           setenv(const char *, const char *, int);
              void          setkey(const char *);
              char         *setstate(char *);
              void          srand(unsigned);
              void          srand48(long);
              void          srandom(unsigned);
              double        strtod(const char *restrict, char **restrict);
              float         strtof(const char *restrict, char **restrict);
              long          strtol(const char *restrict, char **restrict, int);
              long double   strtold(const char *restrict, char **restrict);
              long long     strtoll(const char *restrict, char **restrict, int);
              unsigned long strtoul(const char *restrict, char **restrict, int);
              unsigned long long
                            strtoull(const char *restrict, char **restrict, int);
              int           system(const char *);
              int           unlockpt(int);
              int           unsetenv(const char *);
              size_t        wcstombs(char *restrict, const wchar_t *restrict, size_t);
              int           wctomb(char *, wchar_t);

          Inclusion of the <stdlib.h> header may also make visible all
          symbols from <stddef.h>, <limits.h>, <math.h>, and <sys/wait.h>.

          The following sections are informative.


---------------------------------------------------------------------------

::

          None.


-----------------------------------------------------------

::

          None.


---------------------------------------------------------------------------

::

          None.


---------------------------------------------------------

::

          limits.h(0p), math.h(0p), stddef.h(0p), sys_types.h(0p),
          sys_wait.h(0p)

          The System Interfaces volume of POSIX.1‐2017, Section 2.2, The
          Compilation Environment, _Exit(3p), a64l(3p), abort(3p), abs(3p),
          atexit(3p), atof(3p), atoi(3p), atol(3p), bsearch(3p),
          calloc(3p), div(3p), drand48(3p), exit(3p), free(3p), getenv(3p),
          getsubopt(3p), grantpt(3p), initstate(3p), labs(3p), ldiv(3p),
          malloc(3p), mblen(3p), mbstowcs(3p), mbtowc(3p), mkdtemp(3p),
          posix_memalign(3p), posix_openpt(3p), ptsname(3p), putenv(3p),
          qsort(3p), rand(3p), realloc(3p), realpath(3p), setenv(3p),
          setkey(3p), strtod(3p), strtol(3p), strtoul(3p), system(3p),
          unlockpt(3p), unsetenv(3p), wcstombs(3p), wctomb(3p)


-----------------------------------------------------------

::

          Portions of this text are reprinted and reproduced in electronic
          form from IEEE Std 1003.1-2017, Standard for Information
          Technology -- Portable Operating System Interface (POSIX), The
          Open Group Base Specifications Issue 7, 2018 Edition, Copyright
          (C) 2018 by the Institute of Electrical and Electronics
          Engineers, Inc and The Open Group.  In the event of any
          discrepancy between this version and the original IEEE and The
          Open Group Standard, the original IEEE and The Open Group
          Standard is the referee document. The original Standard can be
          obtained online at http://www.opengroup.org/unix/online.html .

          Any typographical or formatting errors that appear in this page
          are most likely to have been introduced during the conversion of
          the source files to man page format. To report such errors, see
          https://www.kernel.org/doc/man-pages/reporting_bugs.html .

   IEEE/The Open Group               2017                      stdlib.h(0P)

--------------

Pages that refer to this page:
`float.h(0p) <../man0/float.h.0p.html>`__, 
`wchar.h(0p) <../man0/wchar.h.0p.html>`__, 
`wctype.h(0p) <../man0/wctype.h.0p.html>`__, 
`a64l(3p) <../man3/a64l.3p.html>`__, 
`abort(3p) <../man3/abort.3p.html>`__, 
`abs(3p) <../man3/abs.3p.html>`__, 
`atexit(3p) <../man3/atexit.3p.html>`__, 
`atof(3p) <../man3/atof.3p.html>`__, 
`atoi(3p) <../man3/atoi.3p.html>`__, 
`atol(3p) <../man3/atol.3p.html>`__, 
`bsearch(3p) <../man3/bsearch.3p.html>`__, 
`calloc(3p) <../man3/calloc.3p.html>`__, 
`div(3p) <../man3/div.3p.html>`__, 
`drand48(3p) <../man3/drand48.3p.html>`__, 
`exit(3p) <../man3/exit.3p.html>`__, 
`\_Exit(3p) <../man3/_Exit.3p.html>`__, 
`free(3p) <../man3/free.3p.html>`__, 
`getenv(3p) <../man3/getenv.3p.html>`__, 
`getsubopt(3p) <../man3/getsubopt.3p.html>`__, 
`grantpt(3p) <../man3/grantpt.3p.html>`__, 
`initstate(3p) <../man3/initstate.3p.html>`__, 
`labs(3p) <../man3/labs.3p.html>`__, 
`ldiv(3p) <../man3/ldiv.3p.html>`__, 
`malloc(3p) <../man3/malloc.3p.html>`__, 
`mblen(3p) <../man3/mblen.3p.html>`__, 
`mbstowcs(3p) <../man3/mbstowcs.3p.html>`__, 
`mbtowc(3p) <../man3/mbtowc.3p.html>`__, 
`mkdtemp(3p) <../man3/mkdtemp.3p.html>`__, 
`posix_memalign(3p) <../man3/posix_memalign.3p.html>`__, 
`posix_openpt(3p) <../man3/posix_openpt.3p.html>`__, 
`ptsname(3p) <../man3/ptsname.3p.html>`__, 
`putenv(3p) <../man3/putenv.3p.html>`__, 
`qsort(3p) <../man3/qsort.3p.html>`__, 
`rand(3p) <../man3/rand.3p.html>`__, 
`realloc(3p) <../man3/realloc.3p.html>`__, 
`realpath(3p) <../man3/realpath.3p.html>`__, 
`setenv(3p) <../man3/setenv.3p.html>`__, 
`setkey(3p) <../man3/setkey.3p.html>`__, 
`strtod(3p) <../man3/strtod.3p.html>`__, 
`strtol(3p) <../man3/strtol.3p.html>`__, 
`strtoul(3p) <../man3/strtoul.3p.html>`__, 
`system(3p) <../man3/system.3p.html>`__, 
`unlockpt(3p) <../man3/unlockpt.3p.html>`__, 
`unsetenv(3p) <../man3/unsetenv.3p.html>`__, 
`wcstombs(3p) <../man3/wcstombs.3p.html>`__, 
`wctomb(3p) <../man3/wctomb.3p.html>`__

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
