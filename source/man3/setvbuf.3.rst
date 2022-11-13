.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

setbuf(3) — Linux manual page
=============================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `RETURN VALUE <#RETURN_VALUE>`__  |                                   |
| \| `ATTRIBUTES <#ATTRIBUTES>`__   |                                   |
| \|                                |                                   |
| `                                 |                                   |
| CONFORMING TO <#CONFORMING_TO>`__ |                                   |
| \| `NOTES <#NOTES>`__ \|          |                                   |
| `BUGS <#BUGS>`__ \|               |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   SETBUF(3)               Linux Programmer's Manual              SETBUF(3)

NAME
-------------------------------------------------

::

          setbuf, setbuffer, setlinebuf, setvbuf - stream buffering
          operations


---------------------------------------------------------

::

          #include <stdio.h>

          int setvbuf(FILE *restrict stream, char *restrict buf,
                      int mode, size_t size);

          void setbuf(FILE *restrict stream, char *restrict buf);
          void setbuffer(FILE *restrict stream, char *restrict buf,
                      size_t size);
          void setlinebuf(FILE *stream);

      Feature Test Macro Requirements for glibc (see
      feature_test_macros(7)):

          setbuffer(), setlinebuf():
              Since glibc 2.19:
                  _DEFAULT_SOURCE
              Glibc 2.19 and earlier:
                  _BSD_SOURCE


---------------------------------------------------------------

::

          The three types of buffering available are unbuffered, block
          buffered, and line buffered.  When an output stream is
          unbuffered, information appears on the destination file or
          terminal as soon as written; when it is block buffered, many
          characters are saved up and written as a block; when it is line
          buffered, characters are saved up until a newline is output or
          input is read from any stream attached to a terminal device
          (typically stdin).  The function fflush(3) may be used to force
          the block out early.  (See fclose(3).)

          Normally all files are block buffered.  If a stream refers to a
          terminal (as stdout normally does), it is line buffered.  The
          standard error stream stderr is always unbuffered by default.

          The setvbuf() function may be used on any open stream to change
          its buffer.  The mode argument must be one of the following three
          macros:

                 _IONBF unbuffered

                 _IOLBF line buffered

                 _IOFBF fully buffered

          Except for unbuffered files, the buf argument should point to a
          buffer at least size bytes long; this buffer will be used instead
          of the current buffer.  If the argument buf is NULL, only the
          mode is affected; a new buffer will be allocated on the next read
          or write operation.  The setvbuf() function may be used only
          after opening a stream and before any other operations have been
          performed on it.

          The other three calls are, in effect, simply aliases for calls to
          setvbuf().  The setbuf() function is exactly equivalent to the
          call

              setvbuf(stream, buf, buf ? _IOFBF : _IONBF, BUFSIZ);

          The setbuffer() function is the same, except that the size of the
          buffer is up to the caller, rather than being determined by the
          default BUFSIZ.  The setlinebuf() function is exactly equivalent
          to the call:

              setvbuf(stream, NULL, _IOLBF, 0);


-----------------------------------------------------------------

::

          The function setvbuf() returns 0 on success.  It returns nonzero
          on failure (mode is invalid or the request cannot be honored).
          It may set errno on failure.

          The other functions do not return a value.


-------------------------------------------------------------

::

          For an explanation of the terms used in this section, see
          attributes(7).

          ┌──────────────────────────────────────┬───────────────┬─────────┐
          │Interface                             │ Attribute     │ Value   │
          ├──────────────────────────────────────┼───────────────┼─────────┤
          │setbuf(), setbuffer(), setlinebuf(),  │ Thread safety │ MT-Safe │
          │setvbuf()                             │               │         │
          └──────────────────────────────────────┴───────────────┴─────────┘


-------------------------------------------------------------------

::

          The setbuf() and setvbuf() functions conform to C89 and C99.


---------------------------------------------------

::

          POSIX notes that the value of errno is unspecified after a call
          to setbuf() and further notes that, since the value of errno is
          not required to be unchanged after a successful call to setbuf(),
          applications should instead use setvbuf() in order to detect
          errors.


-------------------------------------------------

::

          You must make sure that the space that buf points to still exists
          by the time stream is closed, which also happens at program
          termination.  For example, the following is invalid:

          #include <stdio.h>

          int
          main(void)
          {
              char buf[BUFSIZ];
              setbuf(stdout, buf);
              printf("Hello, world!\n");
              return 0;
          }


---------------------------------------------------------

::

          stdbuf(1), fclose(3), fflush(3), fopen(3), fread(3), malloc(3),
          printf(3), puts(3)

COLOPHON
---------------------------------------------------------

::

          This page is part of release 5.13 of the Linux man-pages project.
          A description of the project, information about reporting bugs,
          and the latest version of this page, can be found at
          https://www.kernel.org/doc/man-pages/.

   Linux                          2021-03-22                      SETBUF(3)

--------------

Pages that refer to this page: `fclose(3) <../man3/fclose.3.html>`__, 
`fcloseall(3) <../man3/fcloseall.3.html>`__, 
`fflush(3) <../man3/fflush.3.html>`__, 
`fpurge(3) <../man3/fpurge.3.html>`__, 
`open_memstream(3) <../man3/open_memstream.3.html>`__, 
`stdin(3) <../man3/stdin.3.html>`__, 
`stdio(3) <../man3/stdio.3.html>`__

--------------

`Copyright and license for this manual
page <../man3/setbuf.3.license.html>`__

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
