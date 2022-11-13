.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

\__ppc_yield(3) — Linux manual page
===================================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `VERSIONS <#VERSIONS>`__ \|       |                                   |
| `ATTRIBUTES <#ATTRIBUTES>`__ \|   |                                   |
| `                                 |                                   |
| CONFORMING TO <#CONFORMING_TO>`__ |                                   |
| \| `SEE ALSO <#SEE_ALSO>`__ \|    |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   __PPC_YIELD(3)          Linux Programmer'sManual          __PPC_YIELD(3)

NAME
-------------------------------------------------

::

          __ppc_yield, __ppc_mdoio, __ppc_mdoom - Hint the processor to
          release shared resources


---------------------------------------------------------

::

          #include <sys/platform/ppc.h>

          void __ppc_yield(void);
          void __ppc_mdoio(void);
          void __ppc_mdoom(void);


---------------------------------------------------------------

::

          These functions provide hints about the usage of resources that
          are shared with other processors on the Power architecture.  They
          can be used, for example, if a program waiting on a lock intends
          to divert the shared resources to be used by other processors.

          __ppc_yield() provides a hint that performance will probably be
          improved if shared resources dedicated to the executing processor
          are released for use by other processors.

          __ppc_mdoio() provides a hint that performance will probably be
          improved if shared resources dedicated to the executing processor
          are released until all outstanding storage accesses to caching-
          inhibited storage have been completed.

          __ppc_mdoom() provides a hint that performance will probably be
          improved if shared resources dedicated to the executing processor
          are released until all outstanding storage accesses to cacheable
          storage for which the data is not in the cache have been
          completed.


---------------------------------------------------------

::

          These functions first appeared in glibc in version 2.18.


-------------------------------------------------------------

::

          For an explanation of the terms used in this section, see
          attributes(7).

          ┌──────────────────────────────────────┬───────────────┬─────────┐
          │Interface                             │ Attribute     │ Value   │
          ├──────────────────────────────────────┼───────────────┼─────────┤
          │__ppc_yield(), __ppc_mdoio(),         │ Thread safety │ MT-Safe │
          │__ppc_mdoom()                         │               │         │
          └──────────────────────────────────────┴───────────────┴─────────┘


-------------------------------------------------------------------

::

          These functions are nonstandard GNU extensions.


---------------------------------------------------------

::

          __ppc_set_ppr_med(3)

          Power ISA, Book II - Section 3.2 ("or" architecture)

COLOPHON
---------------------------------------------------------

::

          This page is part of release 5.13 of the Linux man-pages project.
          A description of the project, information about reporting bugs,
          and the latest version of this page, can be found at
          https://www.kernel.org/doc/man-pages/.

   GNU C Library                  2021-03-22                 __PPC_YIELD(3)

--------------

Pages that refer to this page:
`\__ppc_set_ppr_med(3) <../man3/__ppc_set_ppr_med.3.html>`__

--------------

`Copyright and license for this manual
page <../man3/__ppc_yield.3.license.html>`__

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
