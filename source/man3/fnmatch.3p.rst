.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

fnmatch(3p) — Linux manual page
===============================

+-----------------------------------+-----------------------------------+
| `PROLOG <#PROLOG>`__ \|           |                                   |
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `RETURN VALUE <#RETURN_VALUE>`__  |                                   |
| \| `ERRORS <#ERRORS>`__ \|        |                                   |
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

   FNMATCH(3P)             POSIX Programmer's Manual            FNMATCH(3P)


-----------------------------------------------------

::

          This manual page is part of the POSIX Programmer's Manual.  The
          Linux implementation of this interface may differ (consult the
          corresponding Linux manual page for details of Linux behavior),
          or the interface may not be implemented on Linux.

NAME
-------------------------------------------------

::

          fnmatch — match a filename string or a pathname


---------------------------------------------------------

::

          #include <fnmatch.h>

          int fnmatch(const char *pattern, const char *string, int flags);


---------------------------------------------------------------

::

          The fnmatch() function shall match patterns as described in the
          Shell and Utilities volume of POSIX.1‐2017, Section 2.13.1,
          Patterns Matching a Single Character and Section 2.13.2, Patterns
          Matching Multiple Characters.  It checks the string specified by
          the string argument to see if it matches the pattern specified by
          the pattern argument.

          The flags argument shall modify the interpretation of pattern and
          string.  It is the bitwise-inclusive OR of zero or more of the
          flags defined in <fnmatch.h>.  If the FNM_PATHNAME flag is set in
          flags, then a <slash> character ('/') in string shall be
          explicitly matched by a <slash> in pattern; it shall not be
          matched by either the <asterisk> or <question-mark> special
          characters, nor by a bracket expression. If the FNM_PATHNAME flag
          is not set, the <slash> character shall be treated as an ordinary
          character.

          If FNM_NOESCAPE is not set in flags, a <backslash> character in
          pattern followed by any other character shall match that second
          character in string.  In particular, "\\" shall match a
          <backslash> in string.  If pattern ends with an unescaped
          <backslash>, fnmatch() shall return a non-zero value (indicating
          either no match or an error).  If FNM_NOESCAPE is set, a
          <backslash> character shall be treated as an ordinary character.

          If FNM_PERIOD is set in flags, then a leading <period> ('.')  in
          string shall match a <period> in pattern; as described by rule 2
          in the Shell and Utilities volume of POSIX.1‐2017, Section
          2.13.3, Patterns Used for Filename Expansion where the location
          of ``leading'' is indicated by the value of FNM_PATHNAME:

           *  If FNM_PATHNAME is set, a <period> is ``leading'' if it is
              the first character in string or if it immediately follows a
              <slash>.

           *  If FNM_PATHNAME is not set, a <period> is ``leading'' only if
              it is the first character of string.

          If FNM_PERIOD is not set, then no special restrictions are placed
          on matching a period.


-----------------------------------------------------------------

::

          If string matches the pattern specified by pattern, then
          fnmatch() shall return 0. If there is no match, fnmatch() shall
          return FNM_NOMATCH, which is defined in <fnmatch.h>.  If an error
          occurs, fnmatch() shall return another non-zero value.


-----------------------------------------------------

::

          No errors are defined.

          The following sections are informative.


---------------------------------------------------------

::

          None.


---------------------------------------------------------------------------

::

          The fnmatch() function has two major uses. It could be used by an
          application or utility that needs to read a directory and apply a
          pattern against each entry. The find utility is an example of
          this. It can also be used by the pax utility to process its
          pattern operands, or by applications that need to match strings
          in a similar manner.

          The name fnmatch() is intended to imply filename match, rather
          than pathname match. The default action of this function is to
          match filename strings, rather than pathnames, since it gives no
          special significance to the <slash> character. With the
          FNM_PATHNAME flag, fnmatch() does match pathnames, but without
          tilde expansion, parameter expansion, or special treatment for a
          <period> at the beginning of a filename.


-----------------------------------------------------------

::

          This function replaced the REG_FILENAME flag of regcomp() in
          early proposals of this volume of POSIX.1‐2017. It provides
          virtually the same functionality as the regcomp() and regexec()
          functions using the REG_FILENAME and REG_FSLASH flags (the
          REG_FSLASH flag was proposed for regcomp(), and would have had
          the opposite effect from FNM_PATHNAME), but with a simpler
          function and less system overhead.


---------------------------------------------------------------------------

::

          None.


---------------------------------------------------------

::

          glob(3p), Section 2.6, Word Expansions

          The Base Definitions volume of POSIX.1‐2017, fnmatch.h(0p)


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

   IEEE/The Open Group               2017                       FNMATCH(3P)

--------------

Pages that refer to this page:
`fnmatch.h(0p) <../man0/fnmatch.h.0p.html>`__, 
`glob(3p) <../man3/glob.3p.html>`__, 
`regcomp(3p) <../man3/regcomp.3p.html>`__, 
`wordexp(3p) <../man3/wordexp.3p.html>`__

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
