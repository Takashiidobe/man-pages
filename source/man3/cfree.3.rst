.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

cfree(3) — Linux manual page
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
| \| `SEE ALSO <#SEE_ALSO>`__ \|    |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   CFREE(3)                Linux Programmer's Manual               CFREE(3)

NAME
-------------------------------------------------

::

          cfree - free allocated memory


---------------------------------------------------------

::

          #include <stdlib.h>

          /* In SunOS 4 */
          int cfree(void *ptr);

          /* In glibc or FreeBSD libcompat */
          void cfree(void *ptr);

          /* In SCO OpenServer */
          void cfree(char *ptr, unsigned int num, unsigned int size);

          /* In Solaris watchmalloc.so.1 */
          void cfree(void *ptr, size_t nelem, size_t elsize);

      Feature Test Macro Requirements for glibc (see
      feature_test_macros(7)):

          cfree():
              Since glibc 2.19:
                  _DEFAULT_SOURCE
              Glibc 2.19 and earlier:
                  _BSD_SOURCE || _SVID_SOURCE


---------------------------------------------------------------

::

          This function should never be used.  Use free(3) instead.
          Starting with version 2.26, it has been removed from glibc.

      1-arg cfree
          In glibc, the function cfree() is a synonym for free(3), "added
          for compatibility with SunOS".

          Other systems have other functions with this name.  The
          declaration is sometimes in <stdlib.h> and sometimes in
          <malloc.h>.

      3-arg cfree
          Some SCO and Solaris versions have malloc libraries with a
          3-argument cfree(), apparently as an analog to calloc(3).

          If you need it while porting something, add

              #define cfree(p, n, s) free((p))

          to your file.

          A frequently asked question is "Can I use free(3) to free memory
          allocated with calloc(3), or do I need cfree()?"  Answer: use
          free(3).

          An SCO manual writes: "The cfree routine is provided for
          compliance to the iBCSe2 standard and simply calls free.  The num
          and size arguments to cfree are not used."


-----------------------------------------------------------------

::

          The SunOS version of cfree() (which is a synonym for free(3))
          returns 1 on success and 0 on failure.  In case of error, errno
          is set to EINVAL: the value of ptr was not a pointer to a block
          previously allocated by one of the routines in the malloc(3)
          family.


---------------------------------------------------------

::

          The cfree() function was removed from glibc in version 2.26.


-------------------------------------------------------------

::

          For an explanation of the terms used in this section, see
          attributes(7).

          ┌───────────────────────┬───────────────┬────────────────────────┐
          │Interface              │ Attribute     │ Value                  │
          ├───────────────────────┼───────────────┼────────────────────────┤
          │cfree()                │ Thread safety │ MT-Safe /* In glibc */ │
          └───────────────────────┴───────────────┴────────────────────────┘


-------------------------------------------------------------------

::

          The 3-argument version of cfree() as used by SCO conforms to the
          iBCSe2 standard: Intel386 Binary Compatibility Specification,
          Edition 2.


---------------------------------------------------------

::

          malloc(3)

COLOPHON
---------------------------------------------------------

::

          This page is part of release 5.13 of the Linux man-pages project.
          A description of the project, information about reporting bugs,
          and the latest version of this page, can be found at
          https://www.kernel.org/doc/man-pages/.

                                  2021-03-22                       CFREE(3)

--------------

`Copyright and license for this manual
page <../man3/cfree.3.license.html>`__

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
