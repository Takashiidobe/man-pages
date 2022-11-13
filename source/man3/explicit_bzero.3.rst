.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

bzero(3) — Linux manual page
============================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `RETURN VALUE <#RETURN_VALUE>`__  |                                   |
| \| `VERSIONS <#VERSIONS>`__ \|    |                                   |
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

   BZERO(3)                Linux Programmer's Manual               BZERO(3)

NAME
-------------------------------------------------

::

          bzero, explicit_bzero - zero a byte string


---------------------------------------------------------

::

          #include <strings.h>

          void bzero(void *s, size_t n);

          #include <string.h>

          void explicit_bzero(void *s, size_t n);


---------------------------------------------------------------

::

          The bzero() function erases the data in the n bytes of the memory
          starting at the location pointed to by s, by writing zeros (bytes
          containing '\0') to that area.

          The explicit_bzero() function performs the same task as bzero().
          It differs from bzero() in that it guarantees that compiler
          optimizations will not remove the erase operation if the compiler
          deduces that the operation is "unnecessary".


-----------------------------------------------------------------

::

          None.


---------------------------------------------------------

::

          explicit_bzero() first appeared in glibc 2.25.


-------------------------------------------------------------

::

          For an explanation of the terms used in this section, see
          attributes(7).

          ┌──────────────────────────────────────┬───────────────┬─────────┐
          │Interface                             │ Attribute     │ Value   │
          ├──────────────────────────────────────┼───────────────┼─────────┤
          │bzero(), explicit_bzero()             │ Thread safety │ MT-Safe │
          └──────────────────────────────────────┴───────────────┴─────────┘


-------------------------------------------------------------------

::

          The bzero() function is deprecated (marked as LEGACY in
          POSIX.1-2001); use memset(3) in new programs.  POSIX.1-2008
          removes the specification of bzero().  The bzero() function first
          appeared in 4.3BSD.

          The explicit_bzero() function is a nonstandard extension that is
          also present on some of the BSDs.  Some other implementations
          have a similar function, such as memset_explicit() or memset_s().


---------------------------------------------------

::

          The explicit_bzero() function addresses a problem that security-
          conscious applications may run into when using bzero(): if the
          compiler can deduce that the location to be zeroed will never
          again be touched by a correct program, then it may remove the
          bzero() call altogether.  This is a problem if the intent of the
          bzero() call was to erase sensitive data (e.g., passwords) to
          prevent the possibility that the data was leaked by an incorrect
          or compromised program.  Calls to explicit_bzero() are never
          optimized away by the compiler.

          The explicit_bzero() function does not solve all problems
          associated with erasing sensitive data:

          1. The explicit_bzero() function does not guarantee that
             sensitive data is completely erased from memory.  (The same is
             true of bzero().)  For example, there may be copies of the
             sensitive data in a register and in "scratch" stack areas.
             The explicit_bzero() function is not aware of these copies,
             and can't erase them.

          2. In some circumstances, explicit_bzero() can decrease security.
             If the compiler determined that the variable containing the
             sensitive data could be optimized to be stored in a register
             (because it is small enough to fit in a register, and no
             operation other than the explicit_bzero() call would need to
             take the address of the variable), then the explicit_bzero()
             call will force the data to be copied from the register to a
             location in RAM that is then immediately erased (while the
             copy in the register remains unaffected).  The problem here is
             that data in RAM is more likely to be exposed by a bug than
             data in a register, and thus the explicit_bzero() call creates
             a brief time window where the sensitive data is more
             vulnerable than it would otherwise have been if no attempt had
             been made to erase the data.

          Note that declaring the sensitive variable with the volatile
          qualifier does not eliminate the above problems.  Indeed, it will
          make them worse, since, for example, it may force a variable that
          would otherwise have been optimized into a register to instead be
          maintained in (more vulnerable) RAM for its entire lifetime.

          Notwithstanding the above details, for security-conscious
          applications, using explicit_bzero() is generally preferable to
          not using it.  The developers of explicit_bzero() anticipate that
          future compilers will recognize calls to explicit_bzero() and
          take steps to ensure that all copies of the sensitive data are
          erased, including copies in registers or in "scratch" stack
          areas.


---------------------------------------------------------

::

          bstring(3), memset(3), swab(3)

COLOPHON
---------------------------------------------------------

::

          This page is part of release 5.13 of the Linux man-pages project.
          A description of the project, information about reporting bugs,
          and the latest version of this page, can be found at
          https://www.kernel.org/doc/man-pages/.

   Linux                          2021-03-22                       BZERO(3)

--------------

Pages that refer to this page: `bstring(3) <../man3/bstring.3.html>`__, 
`memset(3) <../man3/memset.3.html>`__

--------------

`Copyright and license for this manual
page <../man3/bzero.3.license.html>`__

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
