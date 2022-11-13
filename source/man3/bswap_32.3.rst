.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

bswap(3) — Linux manual page
============================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `RETURN VALUE <#RETURN_VALUE>`__  |                                   |
| \| `ERRORS <#ERRORS>`__ \|        |                                   |
| `                                 |                                   |
| CONFORMING TO <#CONFORMING_TO>`__ |                                   |
| \| `EXAMPLES <#EXAMPLES>`__ \|    |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   BSWAP(3)                Linux Programmer's Manual               BSWAP(3)

NAME
-------------------------------------------------

::

          bswap_16, bswap_32, bswap_64 - reverse order of bytes


---------------------------------------------------------

::

          #include <byteswap.h>

          uint16_t bswap_16(uint16_t x);
          uint32_t bswap_32(uint32_t x);
          uint64_t bswap_64(uint64_t x);


---------------------------------------------------------------

::

          These functions return a value in which the order of the bytes in
          their 2-, 4-, or 8-byte arguments is reversed.


-----------------------------------------------------------------

::

          These functions return the value of their argument with the bytes
          reversed.


-----------------------------------------------------

::

          These functions always succeed.


-------------------------------------------------------------------

::

          These functions are GNU extensions.


---------------------------------------------------------

::

          The program below swaps the bytes of the 8-byte integer supplied
          as its command-line argument.  The following shell session
          demonstrates the use of the program:

              $ ./a.out 0x0123456789abcdef
              0x123456789abcdef ==> 0xefcdab8967452301

      Program source

          #include <stdio.h>
          #include <stdint.h>
          #include <stdlib.h>
          #include <inttypes.h>
          #include <byteswap.h>

          int
          main(int argc, char *argv[])
          {
              uint64_t x;

              if (argc != 2) {
                  fprintf(stderr, "Usage: %s <num>\n", argv[0]);
                  exit(EXIT_FAILURE);
              }

              x = strtoull(argv[1], NULL, 0);
              printf("%#" PRIx64 " ==> %#" PRIx64 "\n", x, bswap_64(x));

              exit(EXIT_SUCCESS);
          }


---------------------------------------------------------

::

          byteorder(3), endian(3)

COLOPHON
---------------------------------------------------------

::

          This page is part of release 5.13 of the Linux man-pages project.
          A description of the project, information about reporting bugs,
          and the latest version of this page, can be found at
          https://www.kernel.org/doc/man-pages/.

   Linux                          2021-06-20                       BSWAP(3)

--------------

Pages that refer to this page:
`byteorder(3) <../man3/byteorder.3.html>`__, 
`endian(3) <../man3/endian.3.html>`__

--------------

`Copyright and license for this manual
page <../man3/bswap.3.license.html>`__

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
