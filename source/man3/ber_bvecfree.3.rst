.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

lber-types(3) — Linux manual page
=================================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `LIBRARY <#LIBRARY>`__ \|         |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `ACKNOW                           |                                   |
| LEDGEMENTS <#ACKNOWLEDGEMENTS>`__ |                                   |
| \| `COLOPHON <#COLOPHON>`__       |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   LBER_TYPES(3)           Library Functions Manual           LBER_TYPES(3)

NAME
-------------------------------------------------

::

          ber_int_t, ber_uint_t, ber_len_t, ber_slen_t, ber_tag_t, struct
          berval, BerValue, BerVarray, BerElement, ber_bvfree,
          ber_bvecfree, ber_bvecadd, ber_bvarray_free, ber_bvarray_add,
          ber_bvdup, ber_dupbv, ber_bvstr, ber_bvstrdup, ber_str2bv,
          ber_alloc_t, ber_init, ber_init2, ber_free - OpenLDAP LBER types
          and allocation functions


-------------------------------------------------------

::

          OpenLDAP LBER (liblber, -llber)


---------------------------------------------------------

::

          #include <lber.h>

          typedef impl_tag_t ber_tag_t;
          typedef impl_int_t ber_int_t;
          typedef impl_uint_t ber_uint_t;
          typedef impl_len_t ber_len_t;
          typedef impl_slen_t ber_slen_t;

          typedef struct berval {
              ber_len_t bv_len;
              char *bv_val;
          } BerValue, *BerVarray;

          typedef struct berelement BerElement;

          void ber_bvfree(struct berval *bv);

          void ber_bvecfree(struct berval **bvec);

          void ber_bvecadd(struct berval ***bvec, struct berval *bv);

          void ber_bvarray_free(struct berval *bvarray);

          void ber_bvarray_add(BerVarray *bvarray, BerValue *bv);

          struct berval *ber_bvdup(const struct berval *bv);

          struct berval *ber_dupbv(const struct berval *dst, struct berval
          *src);

          struct berval *ber_bvstr(const char *str);

          struct berval *ber_bvstrdup(const char *str);

          struct berval *ber_str2bv(const char *str, ber_len_t len, int
          dup, struct berval *bv);

          BerElement *ber_alloc_t(int options);

          BerElement *ber_init(struct berval *bv);

          void ber_init2(BerElement *ber, struct berval *bv, int options);

          void ber_free(BerElement *ber, int freebuf);


---------------------------------------------------------------

::

          The following are the basic types and structures defined for use
          with the Lightweight BER library.

          ber_int_t is a signed integer of at least 32 bits.  It is
          commonly equivalent to int.  ber_uint_t is the unsigned variant
          of ber_int_t.

          ber_len_t is an unsigned integer of at least 32 bits used to
          represent a length.  It is commonly equivalent to a size_t.
          ber_slen_t is the signed variant to ber_len_t.

          ber_tag_t is an unsigned integer of at least 32 bits used to
          represent a BER tag.  It is commonly equivalent to a
          unsigned long.

          The actual definitions of the integral impl_TYPE_t types are
          platform specific.

          BerValue, commonly used as struct berval, is used to hold an
          arbitrary sequence of octets.  bv_val points to bv_len octets.
          bv_val is not necessarily terminated by a NULL (zero) octet.
          ber_bvfree() frees a BerValue, pointed to by bv, returned from
          this API.  If bv is NULL, the routine does nothing.

          ber_bvecfree() frees an array of BerValues (and the array),
          pointed to by bvec, returned from this API.  If bvec is NULL, the
          routine does nothing.  ber_bvecadd() appends the bv pointer to
          the bvec array.  Space for the array is allocated as needed.  The
          end of the array is marked by a NULL pointer.

          ber_bvarray_free() frees an array of BerValues (and the array),
          pointed to by bvarray, returned from this API.  If bvarray is
          NULL, the routine does nothing.  ber_bvarray_add() appends the
          contents of the BerValue pointed to by bv to the bvarray array.
          Space for the new element is allocated as needed.  The end of the
          array is marked by a BerValue with a NULL bv_val field.

          ber_bvdup() returns a copy of a BerValue.  The routine returns
          NULL upon error (e.g. out of memory).  The caller should use
          ber_bvfree() to deallocate the resulting BerValue.  ber_dupbv()
          copies a BerValue from src to dst.  If dst is NULL a new BerValue
          will be allocated to hold the copy.  The routine returns NULL
          upon error, otherwise it returns a pointer to the copy.  If dst
          is NULL the caller should use ber_bvfree() to deallocate the
          resulting BerValue, otherwise ber_memfree() should be used to
          deallocate the dst->bv_val.  (The ber_bvdup() function is
          internally implemented as ber_dupbv(NULL, bv).  ber_bvdup() is
          provided only for compatibility with an expired draft of the LDAP
          C API; ber_dupbv() is the preferred interface.)

          ber_bvstr() returns a BerValue containing the string pointed to
          by str.  ber_bvstrdup() returns a BerValue containing a copy of
          the string pointed to by str.  ber_str2bv() returns a BerValue
          containing the string pointed to by str, whose length may be
          optionally specified in len.  If dup is non-zero, the BerValue
          will contain a copy of str.  If len is zero, the number of bytes
          to copy will be determined by strlen(3), otherwise len bytes will
          be copied.  If bv is non-NULL, the result will be stored in the
          given BerValue, otherwise a new BerValue will be allocated to
          store the result.  NOTE: Both ber_bvstr() and ber_bvstrdup() are
          implemented as macros using ber_str2bv() in this version of the
          library.

          BerElement is an opaque structure used to maintain state
          information used in encoding and decoding.  ber_alloc_t() is used
          to create an empty BerElement structure. If LBER_USE_DER is
          specified for the options parameter then data lengths for data
          written to the BerElement will be encoded in the minimal number
          of octets required, otherwise they will always be written as four
          byte values.  ber_init() creates a BerElement structure that is
          initialized with a copy of the data in its bv parameter.
          ber_init2() initializes an existing BerElement ber using the data
          in the bv parameter. The data is referenced directly, not copied.
          The options parameter is the same as for ber_alloc_t().
          ber_free() frees a BerElement pointed to by ber.  If ber is NULL,
          the routine does nothing.  If freebuf is zero, the internal
          buffer is not freed.


---------------------------------------------------------

::

          lber-encode(3), lber-decode(3), lber-memory(3)


-------------------------------------------------------------------------

::

          OpenLDAP Software is developed and maintained by The OpenLDAP
          Project <http://www.openldap.org/>.  OpenLDAP Software is derived
          from the University of Michigan LDAP 3.3 Release.

COLOPHON
---------------------------------------------------------

::

          This page is part of the OpenLDAP (an open source implementation
          of the Lightweight Directory Access Protocol) project.
          Information about the project can be found at 
          ⟨http://www.openldap.org/⟩.  If you have a bug report for this
          manual page, see ⟨http://www.openldap.org/its/⟩.  This page was
          obtained from the project's upstream Git repository
          ⟨https://git.openldap.org/openldap/openldap.git⟩ on 2021-08-27.
          (At that time, the date of the most recent commit that was found
          in the repository was 2021-08-26.)  If you discover any rendering
          problems in this HTML version of the page, or you believe there
          is a better or more up-to-date source for the page, or you have
          corrections or improvements to the information in this COLOPHON
          (which is not part of the original manual page), send a mail to
          man-pages@man7.org

   OpenLDAP LDVERSION             RELEASEDATE                 LBER_TYPES(3)

--------------

Pages that refer to this page:
`lber-decode(3) <../man3/lber-decode.3.html>`__, 
`lber-encode(3) <../man3/lber-encode.3.html>`__, 
`lber-memory(3) <../man3/lber-memory.3.html>`__, 
`lber-sockbuf(3) <../man3/lber-sockbuf.3.html>`__, 
`ldap(3) <../man3/ldap.3.html>`__, 
`ldap_extended_operation(3) <../man3/ldap_extended_operation.3.html>`__, 
`ldap_first_attribute(3) <../man3/ldap_first_attribute.3.html>`__, 
`ldap_parse_result(3) <../man3/ldap_parse_result.3.html>`__

--------------

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
