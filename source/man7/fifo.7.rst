.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

fifo(7) — Linux manual page
===========================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `NOTES <#NOTES>`__ \|             |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   FIFO(7)                 Linux Programmer's Manual                FIFO(7)

NAME
-------------------------------------------------

::

          fifo - first-in first-out special file, named pipe


---------------------------------------------------------------

::

          A FIFO special file (a named pipe) is similar to a pipe, except
          that it is accessed as part of the filesystem.  It can be opened
          by multiple processes for reading or writing.  When processes are
          exchanging data via the FIFO, the kernel passes all data
          internally without writing it to the filesystem.  Thus, the FIFO
          special file has no contents on the filesystem; the filesystem
          entry merely serves as a reference point so that processes can
          access the pipe using a name in the filesystem.

          The kernel maintains exactly one pipe object for each FIFO
          special file that is opened by at least one process.  The FIFO
          must be opened on both ends (reading and writing) before data can
          be passed.  Normally, opening the FIFO blocks until the other end
          is opened also.

          A process can open a FIFO in nonblocking mode.  In this case,
          opening for read-only succeeds even if no one has opened on the
          write side yet and opening for write-only fails with ENXIO (no
          such device or address) unless the other end has already been
          opened.

          Under Linux, opening a FIFO for read and write will succeed both
          in blocking and nonblocking mode.  POSIX leaves this behavior
          undefined.  This can be used to open a FIFO for writing while
          there are no readers available.  A process that uses both ends of
          the connection in order to communicate with itself should be very
          careful to avoid deadlocks.


---------------------------------------------------

::

          For details of the semantics of I/O on FIFOs, see pipe(7).

          When a process tries to write to a FIFO that is not opened for
          read on the other side, the process is sent a SIGPIPE signal.

          FIFO special files can be created by mkfifo(3), and are indicated
          by ls -l with the file type 'p'.


---------------------------------------------------------

::

          mkfifo(1), open(2), pipe(2), sigaction(2), signal(2),
          socketpair(2), mkfifo(3), pipe(7)

COLOPHON
---------------------------------------------------------

::

          This page is part of release 5.13 of the Linux man-pages project.
          A description of the project, information about reporting bugs,
          and the latest version of this page, can be found at
          https://www.kernel.org/doc/man-pages/.

   Linux                          2017-11-26                        FIFO(7)

--------------

Pages that refer to this page: `open(2) <../man2/open.2.html>`__, 
`mkfifo(3) <../man3/mkfifo.3.html>`__, 
`sd_is_fifo(3) <../man3/sd_is_fifo.3.html>`__, 
`systemd.socket(5) <../man5/systemd.socket.5.html>`__, 
`pipe(7) <../man7/pipe.7.html>`__, 
`signal(7) <../man7/signal.7.html>`__

--------------

`Copyright and license for this manual
page <../man7/fifo.7.license.html>`__

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
