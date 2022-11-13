.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

standards(7) — Linux manual page
================================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   STANDARDS(7)            Linux Programmer's Manual           STANDARDS(7)

NAME
-------------------------------------------------

::

          standards - C and UNIX Standards


---------------------------------------------------------------

::

          The CONFORMING TO section that appears in many manual pages
          identifies various standards to which the documented interface
          conforms.  The following list briefly describes these standards.

          V7     Version 7 (also known as Seventh Edition) UNIX, released
                 by AT&T/Bell Labs in 1979.  After this point, UNIX systems
                 diverged into two main dialects: BSD and System V.

          4.2BSD This is an implementation standard defined by the 4.2
                 release of the Berkeley Software Distribution, released by
                 the University of California at Berkeley.  This was the
                 first Berkeley release that contained a TCP/IP stack and
                 the sockets API.  4.2BSD was released in 1983.

                 Earlier major BSD releases included 3BSD (1980), 4BSD
                 (1980), and 4.1BSD (1981).

          4.3BSD The successor to 4.2BSD, released in 1986.

          4.4BSD The successor to 4.3BSD, released in 1993.  This was the
                 last major Berkeley release.

          System V
                 This is an implementation standard defined by AT&T's
                 milestone 1983 release of its commercial System V (five)
                 release.  The previous major AT&T release was System III,
                 released in 1981.

          System V release 2 (SVr2)
                 This was the next System V release, made in 1985.  The
                 SVr2 was formally described in the System V Interface
                 Definition version 1 (SVID 1) published in 1985.

          System V release 3 (SVr3)
                 This was the successor to SVr2, released in 1986.  This
                 release was formally described in the System V Interface
                 Definition version 2 (SVID 2).

          System V release 4 (SVr4)
                 This was the successor to SVr3, released in 1989.  This
                 version of System V is described in the "Programmer's
                 Reference Manual: Operating System API (Intel processors)"
                 (Prentice-Hall 1992, ISBN 0-13-951294-2) This release was
                 formally described in the System V Interface Definition
                 version 3 (SVID 3), and is considered the definitive
                 System V release.

          SVID 4 System V Interface Definition version 4, issued in 1995.
                 Available online at 
                 ⟨http://www.sco.com/developers/devspecs/⟩.

          C89    This was the first C language standard, ratified by ANSI
                 (American National Standards Institute) in 1989
                 (X3.159-1989).  Sometimes this is known as ANSI C, but
                 since C99 is also an ANSI standard, this term is
                 ambiguous.  This standard was also ratified by ISO
                 (International Standards Organization) in 1990 (ISO/IEC
                 9899:1990), and is thus occasionally referred to as ISO
                 C90.

          C99    This revision of the C language standard was ratified by
                 ISO in 1999 (ISO/IEC 9899:1999).  Available online at 
                 ⟨http://www.open-std.org/jtc1/sc22/wg14/www/standards⟩.

          C11    This revision of the C language standard was ratified by
                 ISO in 2011 (ISO/IEC 9899:2011).

                 LFS The Large File Summit specification, completed in
                 1996.  This specification defined mechanisms that allowed
                 32-bit systems to support the use of large files (i.e.,
                 64-bit file offsets).  See 
                 ⟨https://www.opengroup.org/platform/lfs.html⟩.

          POSIX.1-1988
                 This was the first POSIX standard, ratified by IEEE as
                 IEEE Std 1003.1-1988, and subsequently adopted (with minor
                 revisions) as an ISO standard in 1990.  The term "POSIX"
                 was coined by Richard Stallman.

          POSIX.1-1990
                 "Portable Operating System Interface for Computing
                 Environments".  IEEE 1003.1-1990 part 1, ratified by ISO
                 in 1990 (ISO/IEC 9945-1:1990).

          POSIX.2
                 IEEE Std 1003.2-1992, describing commands and utilities,
                 ratified by ISO in 1993 (ISO/IEC 9945-2:1993).

          POSIX.1b (formerly known as POSIX.4)
                 IEEE Std 1003.1b-1993, describing real-time facilities for
                 portable operating systems, ratified by ISO in 1996
                 (ISO/IEC 9945-1:1996).

          POSIX.1c  (formerly known as POSIX.4a)
                 IEEE Std 1003.1c-1995, which describes the POSIX threads
                 interfaces.

          POSIX.1d
                 IEEE Std 1003.1c-1999, which describes additional real-
                 time extensions.

          POSIX.1g
                 IEEE Std 1003.1g-2000, which describes networking APIs
                 (including sockets).

          POSIX.1j
                 IEEE Std 1003.1j-2000, which describes advanced real-time
                 extensions.

          POSIX.1-1996
                 A 1996 revision of POSIX.1 which incorporated POSIX.1b and
                 POSIX.1c.

          XPG3   Released in 1989, this was the first release of the X/Open
                 Portability Guide to be based on a POSIX standard
                 (POSIX.1-1988).  This multivolume guide was developed by
                 the X/Open Group, a multivendor consortium.

          XPG4   A revision of the X/Open Portability Guide, released in
                 1992.  This revision incorporated POSIX.2.

          XPG4v2 A 1994 revision of XPG4.  This is also referred to as Spec
                 1170, where 1170 referred to the number of interfaces
                 defined by this standard.

          SUS (SUSv1)
                 Single UNIX Specification.  This was a repackaging of
                 XPG4v2 and other X/Open standards (X/Open Curses Issue 4
                 version 2, X/Open Networking Service (XNS) Issue 4).
                 Systems conforming to this standard can be branded UNIX
                 95.

          SUSv2  Single UNIX Specification version 2.  Sometimes also
                 referred to (incorrectly) as XPG5.  This standard appeared
                 in 1997.  Systems conforming to this standard can be
                 branded UNIX 98.  See also 
                 ⟨http://www.unix.org/version2/⟩.)

          POSIX.1-2001, SUSv3
                 This was a 2001 revision and consolidation of the POSIX.1,
                 POSIX.2, and SUS standards into a single document,
                 conducted under the auspices of the Austin Group 
                 ⟨http://www.opengroup.org/austin/⟩.  The standard is
                 available online at ⟨http://www.unix.org/version3/⟩.

                 The standard defines two levels of conformance: POSIX
                 conformance, which is a baseline set of interfaces
                 required of a conforming system; and XSI Conformance,
                 which additionally mandates a set of interfaces (the "XSI
                 extension") which are only optional for POSIX conformance.
                 XSI-conformant systems can be branded UNIX 03.

                 The POSIX.1-2001 document is broken into four parts:

                 XBD: Definitions, terms, and concepts, header file
                 specifications.

                 XSH: Specifications of functions (i.e., system calls and
                 library functions in actual implementations).

                 XCU: Specifications of commands and utilities (i.e., the
                 area formerly described by POSIX.2).

                 XRAT: Informative text on the other parts of the standard.

                 POSIX.1-2001 is aligned with C99, so that all of the
                 library functions standardized in C99 are also
                 standardized in POSIX.1-2001.

                 The Single UNIX Specification version 3 (SUSv3) comprises
                 the Base Specifications containing XBD, XSH, XCU, and XRAT
                 as above, plus X/Open Curses Issue 4 version 2 as an extra
                 volume that is not in POSIX.1-2001.

                 Two Technical Corrigenda (minor fixes and improvements) of
                 the original 2001 standard have occurred: TC1 in 2003 and
                 TC2 in 2004.

          POSIX.1-2008, SUSv4
                 Work on the next revision of POSIX.1/SUS was completed and
                 ratified in 2008.  The standard is available online at 
                 ⟨http://www.unix.org/version4/⟩.

                 The changes in this revision are not as large as those
                 that occurred for POSIX.1-2001/SUSv3, but a number of new
                 interfaces are added and various details of existing
                 specifications are modified.  Many of the interfaces that
                 were optional in POSIX.1-2001 become mandatory in the 2008
                 revision of the standard.  A few interfaces that are
                 present in POSIX.1-2001 are marked as obsolete in
                 POSIX.1-2008, or removed from the standard altogether.

                 The revised standard is structured in the same way as its
                 predecessor.  The Single UNIX Specification version 4
                 (SUSv4) comprises the Base Specifications containing XBD,
                 XSH, XCU, and XRAT, plus X/Open Curses Issue 7 as an extra
                 volume that is not in POSIX.1-2008.

                 Again there are two levels of conformance: the baseline
                 POSIX Conformance, and XSI Conformance, which mandates an
                 additional set of interfaces beyond those in the base
                 specification.

                 In general, where the CONFORMING TO section of a manual
                 page lists POSIX.1-2001, it can be assumed that the
                 interface also conforms to POSIX.1-2008, unless otherwise
                 noted.

                 Technical Corrigendum 1 (minor fixes and improvements) of
                 this standard was released in 2013.

                 Technical Corrigendum 2 of this standard was released in
                 2016.

                 Further information can be found on the Austin Group web
                 site, ⟨http://www.opengroup.org/austin/⟩.

          SUSv4 2016 edition
                 This is equivalent to POSIX.1-2008, with the addition of
                 Technical Corrigenda 1 and 2 and the XCurses
                 specification.

          POSIX.1-2017
                 This revision of POSIX is technically identical to
                 POSIX.1-2008 with Technical Corrigenda 1 and 2 applied.

          SUSv4 2018 edition
                 This is equivalent to POSIX.1-2017, with the addition of
                 the XCurses specification.

          The interfaces documented in POSIX.1/SUS are available as manual
          pages under sections 0p (header files), 1p (commands), and 3p
          (functions); thus one can write "man 3p open".


---------------------------------------------------------

::

          getconf(1), confstr(3), pathconf(3), sysconf(3), attributes(7),
          feature_test_macros(7), libc(7), posixoptions(7),
          system_data_types(7)

COLOPHON
---------------------------------------------------------

::

          This page is part of release 5.13 of the Linux man-pages project.
          A description of the project, information about reporting bugs,
          and the latest version of this page, can be found at
          https://www.kernel.org/doc/man-pages/.

   Linux                          2020-11-01                   STANDARDS(7)

--------------

Pages that refer to this page: `intro(1) <../man1/intro.1.html>`__, 
`intro(2) <../man2/intro.2.html>`__, 
`intro(3) <../man3/intro.3.html>`__, 
`matherr(3) <../man3/matherr.3.html>`__, 
`intro(4) <../man4/intro.4.html>`__, 
`intro(5) <../man5/intro.5.html>`__, 
`feature_test_macros(7) <../man7/feature_test_macros.7.html>`__, 
`intro(7) <../man7/intro.7.html>`__, 
`libc(7) <../man7/libc.7.html>`__, 
`man-pages(7) <../man7/man-pages.7.html>`__, 
`nptl(7) <../man7/nptl.7.html>`__, 
`posixoptions(7) <../man7/posixoptions.7.html>`__, 
`signal-safety(7) <../man7/signal-safety.7.html>`__, 
`system_data_types(7) <../man7/system_data_types.7.html>`__

--------------

`Copyright and license for this manual
page <../man7/standards.7.license.html>`__

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
