.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

string.h(0p) — Linux manual page
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

   string.h(0P)            POSIX Programmer's Manual           string.h(0P)


-----------------------------------------------------

::

          This manual page is part of the POSIX Programmer's Manual.  The
          Linux implementation of this interface may differ (consult the
          corresponding Linux manual page for details of Linux behavior),
          or the interface may not be implemented on Linux.

NAME
-------------------------------------------------

::

          string.h — string operations


---------------------------------------------------------

::

          #include <string.h>


---------------------------------------------------------------

::

          Some of the functionality described on this reference page
          extends the ISO C standard. Applications shall define the
          appropriate feature test macro (see the System Interfaces volume
          of POSIX.1‐2017, Section 2.2, The Compilation Environment) to
          enable the visibility of these symbols in this header.

          The <string.h> header shall define NULL and size_t as described
          in <stddef.h>.

          The <string.h> header shall define the locale_t type as described
          in <locale.h>.

          The following shall be declared as functions and may also be
          defined as macros. Function prototypes shall be provided for use
          with ISO C standard compilers.

              void    *memccpy(void *restrict, const void *restrict, int, size_t);
              void    *memchr(const void *, int, size_t);
              int      memcmp(const void *, const void *, size_t);
              void    *memcpy(void *restrict, const void *restrict, size_t);
              void    *memmove(void *, const void *, size_t);
              void    *memset(void *, int, size_t);
              char    *stpcpy(char *restrict, const char *restrict);
              char    *stpncpy(char *restrict, const char *restrict, size_t);
              char    *strcat(char *restrict, const char *restrict);
              char    *strchr(const char *, int);
              int      strcmp(const char *, const char *);
              int      strcoll(const char *, const char *);
              int      strcoll_l(const char *, const char *, locale_t);
              char    *strcpy(char *restrict, const char *restrict);
              size_t   strcspn(const char *, const char *);
              char    *strdup(const char *);
              char    *strerror(int);
              char    *strerror_l(int, locale_t);
              int      strerror_r(int, char *, size_t);
              size_t   strlen(const char *);
              char    *strncat(char *restrict, const char *restrict, size_t);
              int      strncmp(const char *, const char *, size_t);
              char    *strncpy(char *restrict, const char *restrict, size_t);
              char    *strndup(const char *, size_t);
              size_t   strnlen(const char *, size_t);
              char    *strpbrk(const char *, const char *);
              char    *strrchr(const char *, int);
              char    *strsignal(int);
              size_t   strspn(const char *, const char *);
              char    *strstr(const char *, const char *);
              char    *strtok(char *restrict, const char *restrict);
              char    *strtok_r(char *restrict, const char *restrict, char **restrict);
              size_t   strxfrm(char *restrict, const char *restrict, size_t);
              size_t   strxfrm_l(char *restrict, const char *restrict,
                           size_t, locale_t);

          Inclusion of the <string.h> header may also make visible all
          symbols from <stddef.h>.

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

          locale.h(0p), stddef.h(0p), sys_types.h(0p)

          The System Interfaces volume of POSIX.1‐2017, Section 2.2, The
          Compilation Environment, memccpy(3p), memchr(3p), memcmp(3p),
          memcpy(3p), memmove(3p), memset(3p), strcat(3p), strchr(3p),
          strcmp(3p), strcoll(3p), strcpy(3p), strcspn(3p), strdup(3p),
          strerror(3p), strlen(3p), strncat(3p), strncmp(3p), strncpy(3p),
          strpbrk(3p), strrchr(3p), strsignal(3p), strspn(3p), strstr(3p),
          strtok(3p), strxfrm(3p)


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

   IEEE/The Open Group               2017                      string.h(0P)

--------------

Pages that refer to this page:
`wchar.h(0p) <../man0/wchar.h.0p.html>`__, 
`wctype.h(0p) <../man0/wctype.h.0p.html>`__, 
`memccpy(3p) <../man3/memccpy.3p.html>`__, 
`memchr(3p) <../man3/memchr.3p.html>`__, 
`memcmp(3p) <../man3/memcmp.3p.html>`__, 
`memcpy(3p) <../man3/memcpy.3p.html>`__, 
`memmove(3p) <../man3/memmove.3p.html>`__, 
`memset(3p) <../man3/memset.3p.html>`__, 
`strcat(3p) <../man3/strcat.3p.html>`__, 
`strchr(3p) <../man3/strchr.3p.html>`__, 
`strcmp(3p) <../man3/strcmp.3p.html>`__, 
`strcoll(3p) <../man3/strcoll.3p.html>`__, 
`strcpy(3p) <../man3/strcpy.3p.html>`__, 
`strcspn(3p) <../man3/strcspn.3p.html>`__, 
`strdup(3p) <../man3/strdup.3p.html>`__, 
`strerror(3p) <../man3/strerror.3p.html>`__, 
`strlen(3p) <../man3/strlen.3p.html>`__, 
`strncat(3p) <../man3/strncat.3p.html>`__, 
`strncmp(3p) <../man3/strncmp.3p.html>`__, 
`strncpy(3p) <../man3/strncpy.3p.html>`__, 
`strpbrk(3p) <../man3/strpbrk.3p.html>`__, 
`strrchr(3p) <../man3/strrchr.3p.html>`__, 
`strsignal(3p) <../man3/strsignal.3p.html>`__, 
`strspn(3p) <../man3/strspn.3p.html>`__, 
`strstr(3p) <../man3/strstr.3p.html>`__, 
`strtok(3p) <../man3/strtok.3p.html>`__, 
`strxfrm(3p) <../man3/strxfrm.3p.html>`__

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
