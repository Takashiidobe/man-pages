.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

fileno(3) — Linux manual page
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
| \| `SEE ALSO <#SEE_ALSO>`__ \|    |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   FILENO(3)               Linux Programmer's Manual              FILENO(3)

NAME
-------------------------------------------------

::

          fileno - obtain file descriptor of a stdio stream


---------------------------------------------------------

::

          #include <stdio.h>

          int fileno(FILE *stream);

      Feature Test Macro Requirements for glibc (see
      feature_test_macros(7)):

          fileno():
              _POSIX_C_SOURCE


---------------------------------------------------------------

::

          The function fileno() examines the argument stream and returns
          the integer file descriptor used to implement this stream.  The
          file descriptor is still owned by stream and will be closed when
          fclose(3) is called.  Duplicate the file descriptor with dup(2)
          before passing it to code that might close it.

          For the nonlocking counterpart, see unlocked_stdio(3).


-----------------------------------------------------------------

::

          On success, fileno() returns the file descriptor associated with
          stream.  On failure, -1 is returned and errno is set to indicate
          the error.


-----------------------------------------------------

::

          EBADF  stream is not associated with a file.


-------------------------------------------------------------

::

          For an explanation of the terms used in this section, see
          attributes(7).

          ┌──────────────────────────────────────┬───────────────┬─────────┐
          │Interface                             │ Attribute     │ Value   │
          ├──────────────────────────────────────┼───────────────┼─────────┤
          │fileno()                              │ Thread safety │ MT-Safe │
          └──────────────────────────────────────┴───────────────┴─────────┘


-------------------------------------------------------------------

::

          The function fileno() conforms to POSIX.1-2001 and POSIX.1-2008.


---------------------------------------------------------

::

          open(2), fdopen(3), stdio(3), unlocked_stdio(3)

COLOPHON
---------------------------------------------------------

::

          This page is part of release 5.13 of the Linux man-pages project.
          A description of the project, information about reporting bugs,
          and the latest version of this page, can be found at
          https://www.kernel.org/doc/man-pages/.

                                  2021-03-22                      FILENO(3)

--------------

Pages that refer to this page: `fsync(2) <../man2/fsync.2.html>`__, 
`fclose(3) <../man3/fclose.3.html>`__, 
`ferror(3) <../man3/ferror.3.html>`__, 
`fflush(3) <../man3/fflush.3.html>`__, 
`fmemopen(3) <../man3/fmemopen.3.html>`__, 
`fopen(3) <../man3/fopen.3.html>`__, 
`open_memstream(3) <../man3/open_memstream.3.html>`__, 
`pcap_file(3pcap) <../man3/pcap_file.3pcap.html>`__, 
`stdio(3) <../man3/stdio.3.html>`__

--------------

`Copyright and license for this manual
page <../man3/fileno.3.license.html>`__

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
