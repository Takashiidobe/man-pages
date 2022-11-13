.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

fnmatch(3) — Linux manual page
==============================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `RETURN VALUE <#RETURN_VALUE>`__  |                                   |
| \| `ATTRIBUTES <#ATTRIBUTES>`__   |                                   |
| \|                                |                                   |
| `                                 |                                   |
| CONFORMING TO <#CONFORMING_TO>`__ |                                   |
| \| `SEE ALSO <#SEE_ALSO>`__ \|    |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   FNMATCH(3)              Linux Programmer's Manual             FNMATCH(3)

NAME
-------------------------------------------------

::

          fnmatch - match filename or pathname


---------------------------------------------------------

::

          #include <fnmatch.h>

          int fnmatch(const char *pattern, const char *string, int flags);


---------------------------------------------------------------

::

          The fnmatch() function checks whether the string argument matches
          the pattern argument, which is a shell wildcard pattern (see
          glob(7)).

          The flags argument modifies the behavior; it is the bitwise OR of
          zero or more of the following flags:

          FNM_NOESCAPE
                 If this flag is set, treat backslash as an ordinary
                 character, instead of an escape character.

          FNM_PATHNAME
                 If this flag is set, match a slash in string only with a
                 slash in pattern and not by an asterisk (*) or a question
                 mark (?) metacharacter, nor by a bracket expression ([])
                 containing a slash.

          FNM_PERIOD
                 If this flag is set, a leading period in string has to be
                 matched exactly by a period in pattern.  A period is
                 considered to be leading if it is the first character in
                 string, or if both FNM_PATHNAME is set and the period
                 immediately follows a slash.

          FNM_FILE_NAME
                 This is a GNU synonym for FNM_PATHNAME.

          FNM_LEADING_DIR
                 If this flag (a GNU extension) is set, the pattern is
                 considered to be matched if it matches an initial segment
                 of string which is followed by a slash.  This flag is
                 mainly for the internal use of glibc and is implemented
                 only in certain cases.

          FNM_CASEFOLD
                 If this flag (a GNU extension) is set, the pattern is
                 matched case-insensitively.

          FNM_EXTMATCH
                 If this flag (a GNU extension) is set, extended patterns
                 are supported, as introduced by 'ksh' and now supported by
                 other shells.  The extended format is as follows, with
                 pattern-list being a '|' separated list of patterns.

          '?(pattern-list)'
                 The pattern matches if zero or one occurrences of any of
                 the patterns in the pattern-list match the input string.

          '*(pattern-list)'
                 The pattern matches if zero or more occurrences of any of
                 the patterns in the pattern-list match the input string.

          '+(pattern-list)'
                 The pattern matches if one or more occurrences of any of
                 the patterns in the pattern-list match the input string.

          '@(pattern-list)'
                 The pattern matches if exactly one occurrence of any of
                 the patterns in the pattern-list match the input string.

          '!(pattern-list)'
                 The pattern matches if the input string cannot be matched
                 with any of the patterns in the pattern-list.


-----------------------------------------------------------------

::

          Zero if string matches pattern, FNM_NOMATCH if there is no match
          or another nonzero value if there is an error.


-------------------------------------------------------------

::

          For an explanation of the terms used in this section, see
          attributes(7).

          ┌───────────────────────────┬───────────────┬────────────────────┐
          │Interface                  │ Attribute     │ Value              │
          ├───────────────────────────┼───────────────┼────────────────────┤
          │fnmatch()                  │ Thread safety │ MT-Safe env locale │
          └───────────────────────────┴───────────────┴────────────────────┘


-------------------------------------------------------------------

::

          POSIX.1-2001, POSIX.1-2008, POSIX.2.  The FNM_FILE_NAME,
          FNM_LEADING_DIR, and FNM_CASEFOLD flags are GNU extensions.


---------------------------------------------------------

::

          sh(1), glob(3), scandir(3), wordexp(3), glob(7)

COLOPHON
---------------------------------------------------------

::

          This page is part of release 5.13 of the Linux man-pages project.
          A description of the project, information about reporting bugs,
          and the latest version of this page, can be found at
          https://www.kernel.org/doc/man-pages/.

   GNU                            2021-03-22                     FNMATCH(3)

--------------

Pages that refer to this page: `find(1) <../man1/find.1.html>`__, 
`systemctl(1) <../man1/systemctl.1.html>`__, 
`glob(3) <../man3/glob.3.html>`__, 
`scandir(3) <../man3/scandir.3.html>`__, 
`wordexp(3) <../man3/wordexp.3.html>`__, 
`glob(7) <../man7/glob.7.html>`__,  `ss(8) <../man8/ss.8.html>`__

--------------

`Copyright and license for this manual
page <../man3/fnmatch.3.license.html>`__

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
