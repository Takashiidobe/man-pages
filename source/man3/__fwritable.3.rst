.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

stdio_ext(3) — Linux manual page
================================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `ATTRIBUTES <#ATTRIBUTES>`__ \|   |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   STDIO_EXT(3)            Linux Programmer's Manual           STDIO_EXT(3)

NAME
-------------------------------------------------

::

          __fbufsize, __flbf, __fpending, __fpurge, __freadable,
          __freading, __fsetlocking, __fwritable, __fwriting, _flushlbf -
          interfaces to stdio FILE structure


---------------------------------------------------------

::

          #include <stdio.h>
          #include <stdio_ext.h>

          size_t __fbufsize(FILE *stream);
          size_t __fpending(FILE *stream);
          int __flbf(FILE *stream);
          int __freadable(FILE *stream);
          int __fwritable(FILE *stream);
          int __freading(FILE *stream);
          int __fwriting(FILE *stream);
          int __fsetlocking(FILE *stream, int type);
          void _flushlbf(void);
          void __fpurge(FILE *stream);


---------------------------------------------------------------

::

          Solaris introduced routines to allow portable access to the
          internals of the FILE structure, and glibc also implemented
          these.

          The __fbufsize() function returns the size of the buffer
          currently used by the given stream.

          The __fpending() function returns the number of bytes in the
          output buffer.  For wide-oriented streams the unit is wide
          characters.  This function is undefined on buffers in reading
          mode, or opened read-only.

          The __flbf() function returns a nonzero value if the stream is
          line-buffered, and zero otherwise.

          The __freadable() function returns a nonzero value if the stream
          allows reading, and zero otherwise.

          The __fwritable() function returns a nonzero value if the stream
          allows writing, and zero otherwise.

          The __freading() function returns a nonzero value if the stream
          is read-only, or if the last operation on the stream was a read
          operation, and zero otherwise.

          The __fwriting() function returns a nonzero value if the stream
          is write-only (or append-only), or if the last operation on the
          stream was a write operation, and zero otherwise.

          The __fsetlocking() function can be used to select the desired
          type of locking on the stream.  It returns the current type.  The
          type argument can take the following three values:

          FSETLOCKING_INTERNAL
                 Perform implicit locking around every operation on the
                 given stream (except for the *_unlocked ones).  This is
                 the default.

          FSETLOCKING_BYCALLER
                 The caller will take care of the locking (possibly using
                 flockfile(3) in case there is more than one thread), and
                 the stdio routines will not do locking until the state is
                 reset to FSETLOCKING_INTERNAL.

          FSETLOCKING_QUERY
                 Don't change the type of locking.  (Only return it.)

          The _flushlbf() function flushes all line-buffered streams.
          (Presumably so that output to a terminal is forced out, say
          before reading keyboard input.)

          The __fpurge() function discards the contents of the stream's
          buffer.


-------------------------------------------------------------

::

          For an explanation of the terms used in this section, see
          attributes(7).

          ┌──────────────────────────┬───────────────┬─────────────────────┐
          │Interface                 │ Attribute     │ Value               │
          ├──────────────────────────┼───────────────┼─────────────────────┤
          │__fbufsize(),             │ Thread safety │ MT-Safe race:stream │
          │__fpending(), __fpurge(), │               │                     │
          │__fsetlocking()           │               │                     │
          ├──────────────────────────┼───────────────┼─────────────────────┤
          │__flbf(), __freadable(),  │ Thread safety │ MT-Safe             │
          │__freading(),             │               │                     │
          │__fwritable(),            │               │                     │
          │__fwriting(), _flushlbf() │               │                     │
          └──────────────────────────┴───────────────┴─────────────────────┘


---------------------------------------------------------

::

          flockfile(3), fpurge(3)

COLOPHON
---------------------------------------------------------

::

          This page is part of release 5.13 of the Linux man-pages project.
          A description of the project, information about reporting bugs,
          and the latest version of this page, can be found at
          https://www.kernel.org/doc/man-pages/.

                                  2021-03-22                   STDIO_EXT(3)

--------------

Pages that refer to this page: `fpurge(3) <../man3/fpurge.3.html>`__

--------------

`Copyright and license for this manual
page <../man3/stdio_ext.3.license.html>`__

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
