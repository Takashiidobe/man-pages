.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

getnetent_r(3) — Linux manual page
==================================

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

   GETNETENT_R(3)          Linux Programmer's Manual         GETNETENT_R(3)

NAME
-------------------------------------------------

::

          getnetent_r, getnetbyname_r, getnetbyaddr_r - get network entry
          (reentrant)


---------------------------------------------------------

::

          #include <netdb.h>

          int getnetent_r(struct netent *restrict result_buf,
                          char *restrict buf, size_t buflen,
                          struct netent **restrict result,
                          int *restrict h_errnop);
          int getnetbyname_r(const char *restrict name,
                          struct netent *restrict result_buf,
                          char *restrict buf, size_t buflen,
                          struct netent **restrict result,
                          int *restrict h_errnop);
          int getnetbyaddr_r(uint32_t net, int type,
                          struct netent *restrict result_buf,
                          char *restrict buf, size_t buflen,
                          struct netent **restrict result,
                          int *restrict h_errnop);

      Feature Test Macro Requirements for glibc (see
      feature_test_macros(7)):

          getnetent_r(), getnetbyname_r(), getnetbyaddr_r():
              Since glibc 2.19:
                  _DEFAULT_SOURCE
              Glibc 2.19 and earlier:
                  _BSD_SOURCE || _SVID_SOURCE


---------------------------------------------------------------

::

          The getnetent_r(), getnetbyname_r(), and getnetbyaddr_r()
          functions are the reentrant equivalents of, respectively,
          getnetent(3), getnetbyname(3), and getnetbynumber(3).  They
          differ in the way that the netent structure is returned, and in
          the function calling signature and return value.  This manual
          page describes just the differences from the nonreentrant
          functions.

          Instead of returning a pointer to a statically allocated netent
          structure as the function result, these functions copy the
          structure into the location pointed to by result_buf.

          The buf array is used to store the string fields pointed to by
          the returned netent structure.  (The nonreentrant functions
          allocate these strings in static storage.)  The size of this
          array is specified in buflen.  If buf is too small, the call
          fails with the error ERANGE, and the caller must try again with a
          larger buffer.  (A buffer of length 1024 bytes should be
          sufficient for most applications.)

          If the function call successfully obtains a network record, then
          *result is set pointing to result_buf; otherwise, *result is set
          to NULL.

          The buffer pointed to by h_errnop is used to return the value
          that would be stored in the global variable h_errno by the
          nonreentrant versions of these functions.


-----------------------------------------------------------------

::

          On success, these functions return 0.  On error, they return one
          of the positive error numbers listed in ERRORS.

          On error, record not found (getnetbyname_r(), getnetbyaddr_r()),
          or end of input (getnetent_r()) result is set to NULL.


-----------------------------------------------------

::

          ENOENT (getnetent_r()) No more records in database.

          ERANGE buf is too small.  Try again with a larger buffer (and
                 increased buflen).


-------------------------------------------------------------

::

          For an explanation of the terms used in this section, see
          attributes(7).

          ┌───────────────────────────────┬───────────────┬────────────────┐
          │Interface                      │ Attribute     │ Value          │
          ├───────────────────────────────┼───────────────┼────────────────┤
          │getnetent_r(),                 │ Thread safety │ MT-Safe locale │
          │getnetbyname_r(),              │               │                │
          │getnetbyaddr_r()               │               │                │
          └───────────────────────────────┴───────────────┴────────────────┘


-------------------------------------------------------------------

::

          These functions are GNU extensions.  Functions with similar names
          exist on some other systems, though typically with different
          calling signatures.


---------------------------------------------------------

::

          getnetent(3), networks(5)

COLOPHON
---------------------------------------------------------

::

          This page is part of release 5.13 of the Linux man-pages project.
          A description of the project, information about reporting bugs,
          and the latest version of this page, can be found at
          https://www.kernel.org/doc/man-pages/.

   GNU                            2021-03-22                 GETNETENT_R(3)

--------------

Pages that refer to this page:
`getnetent(3) <../man3/getnetent.3.html>`__

--------------

`Copyright and license for this manual
page <../man3/getnetent_r.3.license.html>`__

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
