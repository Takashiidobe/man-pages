.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

fseek(3) — Linux manual page
============================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `RETURN VALUE <#RETURN_VALUE>`__  |                                   |
| \| `ERRORS <#ERRORS>`__ \|        |                                   |
| `ATTRIBUTES <#ATTRIBUTES>`__ \|   |                                   |
| `                                 |                                   |
| CONFORMING TO <#CONFORMING_TO>`__ |                                   |
| \| `SEE ALSO <#SEE_ALSO>`__ \|    |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   FSEEK(3)                Linux Programmer's Manual               FSEEK(3)

NAME
-------------------------------------------------

::

          fgetpos, fseek, fsetpos, ftell, rewind - reposition a stream


---------------------------------------------------------

::

          #include <stdio.h>

          int fseek(FILE *stream, long offset, int whence);
          long ftell(FILE *stream);

          void rewind(FILE *stream);

          int fgetpos(FILE *restrict stream, fpos_t *restrict pos);
          int fsetpos(FILE *stream, const fpos_t *pos);


---------------------------------------------------------------

::

          The fseek() function sets the file position indicator for the
          stream pointed to by stream.  The new position, measured in
          bytes, is obtained by adding offset bytes to the position
          specified by whence.  If whence is set to SEEK_SET, SEEK_CUR, or
          SEEK_END, the offset is relative to the start of the file, the
          current position indicator, or end-of-file, respectively.  A
          successful call to the fseek() function clears the end-of-file
          indicator for the stream and undoes any effects of the ungetc(3)
          function on the same stream.

          The ftell() function obtains the current value of the file
          position indicator for the stream pointed to by stream.

          The rewind() function sets the file position indicator for the
          stream pointed to by stream to the beginning of the file.  It is
          equivalent to:

                 (void) fseek(stream, 0L, SEEK_SET)

          except that the error indicator for the stream is also cleared
          (see clearerr(3)).

          The fgetpos() and fsetpos() functions are alternate interfaces
          equivalent to ftell() and fseek() (with whence set to SEEK_SET),
          setting and storing the current value of the file offset into or
          from the object referenced by pos.  On some non-UNIX systems, an
          fpos_t object may be a complex object and these routines may be
          the only way to portably reposition a text stream.


-----------------------------------------------------------------

::

          The rewind() function returns no value.  Upon successful
          completion, fgetpos(), fseek(), fsetpos() return 0, and ftell()
          returns the current offset.  Otherwise, -1 is returned and errno
          is set to indicate the error.


-----------------------------------------------------

::

          EINVAL The whence argument to fseek() was not SEEK_SET, SEEK_END,
                 or SEEK_CUR.  Or: the resulting file offset would be
                 negative.

          ESPIPE The file descriptor underlying stream is not seekable
                 (e.g., it refers to a pipe, FIFO, or socket).

          The functions fgetpos(), fseek(), fsetpos(), and ftell() may also
          fail and set errno for any of the errors specified for the
          routines fflush(3), fstat(2), lseek(2), and malloc(3).


-------------------------------------------------------------

::

          For an explanation of the terms used in this section, see
          attributes(7).

          ┌──────────────────────────────────────┬───────────────┬─────────┐
          │Interface                             │ Attribute     │ Value   │
          ├──────────────────────────────────────┼───────────────┼─────────┤
          │fseek(), ftell(), rewind(),           │ Thread safety │ MT-Safe │
          │fgetpos(), fsetpos()                  │               │         │
          └──────────────────────────────────────┴───────────────┴─────────┘


-------------------------------------------------------------------

::

          POSIX.1-2001, POSIX.1-2008, C89, C99.


---------------------------------------------------------

::

          lseek(2), fseeko(3)

COLOPHON
---------------------------------------------------------

::

          This page is part of release 5.13 of the Linux man-pages project.
          A description of the project, information about reporting bugs,
          and the latest version of this page, can be found at
          https://www.kernel.org/doc/man-pages/.

   GNU                            2021-03-22                       FSEEK(3)

--------------

Pages that refer to this page: `lseek(2) <../man2/lseek.2.html>`__, 
`fgetc(3) <../man3/fgetc.3.html>`__, 
`fmemopen(3) <../man3/fmemopen.3.html>`__, 
`fopen(3) <../man3/fopen.3.html>`__, 
`fopencookie(3) <../man3/fopencookie.3.html>`__, 
`fseeko(3) <../man3/fseeko.3.html>`__, 
`gets(3) <../man3/gets.3.html>`__, 
`open_memstream(3) <../man3/open_memstream.3.html>`__, 
`puts(3) <../man3/puts.3.html>`__, 
`stdio(3) <../man3/stdio.3.html>`__, 
`feature_test_macros(7) <../man7/feature_test_macros.7.html>`__

--------------

`Copyright and license for this manual
page <../man3/fseek.3.license.html>`__

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
