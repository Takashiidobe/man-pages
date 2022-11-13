.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

inttypes.h(0p) — Linux manual page
==================================

+-----------------------------------+-----------------------------------+
| `PROLOG <#PROLOG>`__ \|           |                                   |
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `EXAMPLES <#EXAMPLES>`__ \|       |                                   |
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

   inttypes.h(0P)          POSIX Programmer's Manual         inttypes.h(0P)


-----------------------------------------------------

::

          This manual page is part of the POSIX Programmer's Manual.  The
          Linux implementation of this interface may differ (consult the
          corresponding Linux manual page for details of Linux behavior),
          or the interface may not be implemented on Linux.

NAME
-------------------------------------------------

::

          inttypes.h — fixed size integer types


---------------------------------------------------------

::

          #include <inttypes.h>


---------------------------------------------------------------

::

          Some of the functionality described on this reference page
          extends the ISO C standard. Applications shall define the
          appropriate feature test macro (see the System Interfaces volume
          of POSIX.1‐2017, Section 2.2, The Compilation Environment) to
          enable the visibility of these symbols in this header.

          The <inttypes.h> header shall include the <stdint.h> header.

          The <inttypes.h> header shall define at least the following
          types:

          imaxdiv_t   Structure type that is the type of the value returned
                      by the imaxdiv() function.

          wchar_t     As described in <stddef.h>.

          The <inttypes.h> header shall define the following macros. Each
          expands to a character string literal containing a conversion
          specifier, possibly modified by a length modifier, suitable for
          use within the format argument of a formatted input/output
          function when converting the corresponding integer type. These
          macros have the general form of PRI (character string literals
          for the fprintf() and fwprintf() family of functions) or SCN
          (character string literals for the fscanf() and fwscanf() family
          of functions), followed by the conversion specifier, followed by
          a name corresponding to a similar type name in <stdint.h>.  In
          these names, N represents the width of the type as described in
          <stdint.h>.  For example, PRIdFAST32 can be used in a format
          string to print the value of an integer of type int_fast32_t.

          The fprintf() macros for signed integers are:

                 PRIdN        PRIdLEASTN   PRIdFASTN    PRIdMAX      PRIdPTR
                 PRIiN        PRIiLEASTN   PRIiFASTN    PRIiMAX      PRIiPTR

          The fprintf() macros for unsigned integers are:

                 PRIoN        PRIoLEASTN   PRIoFASTN    PRIoMAX      PRIoPTR
                 PRIuN        PRIuLEASTN   PRIuFASTN    PRIuMAX      PRIuPTR
                 PRIxN        PRIxLEASTN   PRIxFASTN    PRIxMAX      PRIxPTR
                 PRIXN        PRIXLEASTN   PRIXFASTN    PRIXMAX      PRIXPTR

          The fscanf() macros for signed integers are:

                 SCNdN        SCNdLEASTN   SCNdFASTN    SCNdMAX      SCNdPTR

                 SCNiN        SCNiLEASTN   SCNiFASTN    SCNiMAX      SCNiPTR

          The fscanf() macros for unsigned integers are:

                 SCNoN        SCNoLEASTN   SCNoFASTN    SCNoMAX      SCNoPTR
                 SCNuN        SCNuLEASTN   SCNuFASTN    SCNuMAX      SCNuPTR
                 SCNxN        SCNxLEASTN   SCNxFASTN    SCNxMAX      SCNxPTR

          For each type that the implementation provides in <stdint.h>, the
          corresponding fprintf() and fwprintf() macros shall be defined
          and the corresponding fscanf() and fwscanf() macros shall be
          defined unless the implementation does not have a suitable
          modifier for the type.

          The following shall be declared as functions and may also be
          defined as macros. Function prototypes shall be provided.

              intmax_t  imaxabs(intmax_t);
              imaxdiv_t imaxdiv(intmax_t, intmax_t);
              intmax_t  strtoimax(const char *restrict, char **restrict, int);
              uintmax_t strtoumax(const char *restrict, char **restrict, int);
              intmax_t  wcstoimax(const wchar_t *restrict, wchar_t **restrict, int);
              uintmax_t wcstoumax(const wchar_t *restrict, wchar_t **restrict, int);

          The following sections are informative.


---------------------------------------------------------

::

          #include <inttypes.h>
          #include <wchar.h>
          int main(void)
          {
              uintmax_t i = UINTMAX_MAX; // This type always exists.
              wprintf(L"The largest integer value is %020"
                  PRIxMAX "\n", i);
              return 0;
          }


---------------------------------------------------------------------------

::

          The purpose of <inttypes.h> is to provide a set of integer types
          whose definitions are consistent across machines and independent
          of operating systems and other implementation idiosyncrasies. It
          defines, through typedef, integer types of various sizes.
          Implementations are free to typedef them as ISO C standard
          integer types or extensions that they support. Consistent use of
          this header will greatly increase the portability of applications
          across platforms.


-----------------------------------------------------------

::

          The ISO/IEC 9899:1990 standard specified that the language should
          support four signed and unsigned integer data types—char, short,
          int, and long—but placed very little requirement on their size
          other than that int and short be at least 16 bits and long be at
          least as long as int and not smaller than 32 bits. For 16-bit
          systems, most implementations assigned 8, 16, 16, and 32 bits to
          char, short, int, and long, respectively. For 32-bit systems, the
          common practice has been to assign 8, 16, 32, and 32 bits to
          these types. This difference in int size can create some problems
          for users who migrate from one system to another which assigns
          different sizes to integer types, because the ISO C standard
          integer promotion rule can produce silent changes unexpectedly.
          The need for defining an extended integer type increased with the
          introduction of 64-bit systems.


---------------------------------------------------------------------------

::

          Macro names beginning with PRI or SCN followed by any lowercase
          letter or 'X' may be added to the macros defined in the
          <inttypes.h> header.


---------------------------------------------------------

::

          stddef.h(0p)

          The System Interfaces volume of POSIX.1‐2017, Section 2.2, The
          Compilation Environment, imaxabs(3p), imaxdiv(3p), strtoimax(3p),
          wcstoimax(3p)


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

   IEEE/The Open Group               2017                    inttypes.h(0P)

--------------

Pages that refer to this page:
`arpa_inet.h(0p) <../man0/arpa_inet.h.0p.html>`__, 
`netdb.h(0p) <../man0/netdb.h.0p.html>`__, 
`netinet_in.h(0p) <../man0/netinet_in.h.0p.html>`__, 
`stdint.h(0p) <../man0/stdint.h.0p.html>`__, 
`fprintf(3p) <../man3/fprintf.3p.html>`__, 
`fscanf(3p) <../man3/fscanf.3p.html>`__, 
`fwprintf(3p) <../man3/fwprintf.3p.html>`__, 
`fwscanf(3p) <../man3/fwscanf.3p.html>`__, 
`htonl(3p) <../man3/htonl.3p.html>`__, 
`imaxabs(3p) <../man3/imaxabs.3p.html>`__, 
`imaxdiv(3p) <../man3/imaxdiv.3p.html>`__, 
`strtoimax(3p) <../man3/strtoimax.3p.html>`__, 
`wcstoimax(3p) <../man3/wcstoimax.3p.html>`__

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
