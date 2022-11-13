.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

fflush(3) — Linux manual page
=============================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `RETURN VALUE <#RETURN_VALUE>`__  |                                   |
| \| `ERRORS <#ERRORS>`__ \|        |                                   |
| `ATTRIBUTES <#ATTRIBUTES>`__ \|   |                                   |
| `                                 |                                   |
| CONFORMING TO <#CONFORMING_TO>`__ |                                   |
| \| `NOTES <#NOTES>`__ \|          |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   FFLUSH(3)               Linux Programmer's Manual              FFLUSH(3)

NAME
-------------------------------------------------

::

          fflush - flush a stream


---------------------------------------------------------

::

          #include <stdio.h>

          int fflush(FILE *stream);


---------------------------------------------------------------

::

          For output streams, fflush() forces a write of all user-space
          buffered data for the given output or update stream via the
          stream's underlying write function.

          For input streams associated with seekable files (e.g., disk
          files, but not pipes or terminals), fflush() discards any
          buffered data that has been fetched from the underlying file, but
          has not been consumed by the application.

          The open status of the stream is unaffected.

          If the stream argument is NULL, fflush() flushes all open output
          streams.

          For a nonlocking counterpart, see unlocked_stdio(3).


-----------------------------------------------------------------

::

          Upon successful completion 0 is returned.  Otherwise, EOF is
          returned and errno is set to indicate the error.


-----------------------------------------------------

::

          EBADF  stream is not an open stream, or is not open for writing.

          The function fflush() may also fail and set errno for any of the
          errors specified for write(2).


-------------------------------------------------------------

::

          For an explanation of the terms used in this section, see
          attributes(7).

          ┌──────────────────────────────────────┬───────────────┬─────────┐
          │Interface                             │ Attribute     │ Value   │
          ├──────────────────────────────────────┼───────────────┼─────────┤
          │fflush()                              │ Thread safety │ MT-Safe │
          └──────────────────────────────────────┴───────────────┴─────────┘


-------------------------------------------------------------------

::

          C89, C99, POSIX.1-2001, POSIX.1-2008.

          POSIX.1-2001 did not specify the behavior for flushing of input
          streams, but the behavior is specified in POSIX.1-2008.


---------------------------------------------------

::

          Note that fflush() flushes only the user-space buffers provided
          by the C library.  To ensure that the data is physically stored
          on disk the kernel buffers must be flushed too, for example, with
          sync(2) or fsync(2).


---------------------------------------------------------

::

          fsync(2), sync(2), write(2), fclose(3), fileno(3), fopen(3),
          fpurge(3), setbuf(3), unlocked_stdio(3)

COLOPHON
---------------------------------------------------------

::

          This page is part of release 5.13 of the Linux man-pages project.
          A description of the project, information about reporting bugs,
          and the latest version of this page, can be found at
          https://www.kernel.org/doc/man-pages/.

   GNU                            2021-08-27                      FFLUSH(3)

--------------

Pages that refer to this page: `fsync(2) <../man2/fsync.2.html>`__, 
`fclose(3) <../man3/fclose.3.html>`__, 
`fcloseall(3) <../man3/fcloseall.3.html>`__, 
`fmemopen(3) <../man3/fmemopen.3.html>`__, 
`fopen(3) <../man3/fopen.3.html>`__, 
`fpurge(3) <../man3/fpurge.3.html>`__, 
`fseek(3) <../man3/fseek.3.html>`__, 
`open_memstream(3) <../man3/open_memstream.3.html>`__, 
`popen(3) <../man3/popen.3.html>`__, 
`setbuf(3) <../man3/setbuf.3.html>`__, 
`stdin(3) <../man3/stdin.3.html>`__, 
`stdio(3) <../man3/stdio.3.html>`__,  `xdr(3) <../man3/xdr.3.html>`__

--------------

`Copyright and license for this manual
page <../man3/fflush.3.license.html>`__

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
