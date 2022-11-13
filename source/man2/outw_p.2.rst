.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

outb(2) — Linux manual page
===========================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `                                 |                                   |
| CONFORMING TO <#CONFORMING_TO>`__ |                                   |
| \| `SEE ALSO <#SEE_ALSO>`__ \|    |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   OUTB(2)                 Linux Programmer's Manual                OUTB(2)

NAME
-------------------------------------------------

::

          outb, outw, outl, outsb, outsw, outsl, inb, inw, inl, insb, insw,
          insl, outb_p, outw_p, outl_p, inb_p, inw_p, inl_p - port I/O


---------------------------------------------------------

::

          #include <sys/io.h>

          unsigned char inb(unsigned short port);
          unsigned char inb_p(unsigned short port);
          unsigned short inw(unsigned short port);
          unsigned short inw_p(unsigned short port);
          unsigned int inl(unsigned short port);
          unsigned int inl_p(unsigned short port);

          void outb(unsigned char value, unsigned short port);
          void outb_p(unsigned char value, unsigned short port);
          void outw(unsigned short value, unsigned short port);
          void outw_p(unsigned short value, unsigned short port);
          void outl(unsigned int value, unsigned short port);
          void outl_p(unsigned int value, unsigned short port);

          void insb(unsigned short port, void *addr,
                     unsigned long count);
          void insw(unsigned short port, void *addr,
                     unsigned long count);
          void insl(unsigned short port, void *addr,
                     unsigned long count);
          void outsb(unsigned short port, const void *addr,
                     unsigned long count);
          void outsw(unsigned short port, const void *addr,
                     unsigned long count);
          void outsl(unsigned short port, const void *addr,
                     unsigned long count);


---------------------------------------------------------------

::

          This family of functions is used to do low-level port input and
          output.  The out* functions do port output, the in* functions do
          port input; the b-suffix functions are byte-width and the w-
          suffix functions word-width; the _p-suffix functions pause until
          the I/O completes.

          They are primarily designed for internal kernel use, but can be
          used from user space.

          You must compile with -O or -O2 or similar.  The functions are
          defined as inline macros, and will not be substituted in without
          optimization enabled, causing unresolved references at link time.

          You use ioperm(2) or alternatively iopl(2) to tell the kernel to
          allow the user space application to access the I/O ports in
          question.  Failure to do this will cause the application to
          receive a segmentation fault.


-------------------------------------------------------------------

::

          outb() and friends are hardware-specific.  The value argument is
          passed first and the port argument is passed second, which is the
          opposite order from most DOS implementations.


---------------------------------------------------------

::

          ioperm(2), iopl(2)

COLOPHON
---------------------------------------------------------

::

          This page is part of release 5.13 of the Linux man-pages project.
          A description of the project, information about reporting bugs,
          and the latest version of this page, can be found at
          https://www.kernel.org/doc/man-pages/.

   Linux                          2020-11-01                        OUTB(2)

--------------

Pages that refer to this page: `ioperm(2) <../man2/ioperm.2.html>`__, 
`iopl(2) <../man2/iopl.2.html>`__

--------------

`Copyright and license for this manual
page <../man2/outb.2.license.html>`__

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
