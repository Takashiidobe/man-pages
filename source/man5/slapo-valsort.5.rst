.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

slapo-valsort(5) — Linux manual page
====================================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `                                 |                                   |
| CONFIGURATION <#CONFIGURATION>`__ |                                   |
| \| `EXAMPLES <#EXAMPLES>`__ \|    |                                   |
| `FILES <#FILES>`__ \|             |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `ACKNOW                           |                                   |
| LEDGEMENTS <#ACKNOWLEDGEMENTS>`__ |                                   |
| \| `COLOPHON <#COLOPHON>`__       |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   SLAPO-VALSORT(5)           File Formats Manual          SLAPO-VALSORT(5)

NAME
-------------------------------------------------

::

          slapo-valsort - Value Sorting overlay to slapd


---------------------------------------------------------

::

          ETCDIR/slapd.conf


---------------------------------------------------------------

::

          The Value Sorting overlay can be used with a backend database to
          sort the values of specific multi-valued attributes within a
          subtree. The sorting occurs whenever the attributes are returned
          in a search response.

          Sorting can be specified in ascending or descending order, using
          either numeric or alphanumeric sort methods. Additionally, a
          "weighted" sort can be specified, which uses a numeric weight
          prepended to the attribute values.  The weighted sort is always
          performed in ascending order, but may be combined with the other
          methods for values that all have equal weights. The weight is
          specified by prepending an integer weight {<weight>} in front of
          each value of the attribute for which weighted sorting is
          desired. This weighting factor is stripped off and not returned
          in search results unless the valsort control is specified
          (1.3.6.1.4.1.4203.666.5.14).

          The valsort control requires a value consisting of a Sequence
          that contains a boolean flag. The weighting factor is only
          returned if the boolean value is TRUE. In lber-encode(3) format,
          the required value must conform to "{b}" syntax.


-------------------------------------------------------------------

::

          These slapd.conf options apply to the Value Sorting overlay.
          They should appear after the overlay directive.

          valsort-attr <attribute> <baseDN> (<sort-method> | weighted
          [<sort-method>])
                 Configure a sorting method for the specified attribute in
                 the subtree rooted at baseDN.  The sort-method may be one
                 of alpha-ascend, alpha-descend, numeric-ascend, or
                 numeric-descend.  If the special weighted method is
                 specified, a secondary sort-method may also be specified.
                 It is an error to specify an alphanumeric sort-method for
                 an attribute with Integer or NumericString syntax, and it
                 is an error to specify a numeric sort-method for an
                 attribute with a syntax other than Integer or
                 NumericString.


---------------------------------------------------------

::

               database mdb
               suffix dc=example,dc=com
               ...
               overlay valsort
               valsort-attr member ou=groups,dc=example,dc=com alpha-ascend

          To invoke ldapsearch(1) with the valsort control, the control
          value must be set appropriately.  The following octets represent
          the desired "{b}" encoding:

               0x30 0x03 0x01 0x01 0xff

          The control can be sent from the command-line using the base64
          encoding of the value:

               ldapsearch -E 1.3.6.1.4.1.4203.666.5.14=::MAMBAf8=


---------------------------------------------------

::

          ETCDIR/slapd.conf
                 default slapd configuration file


---------------------------------------------------------

::

          slapd.conf(5), slapd-config(5).


-------------------------------------------------------------------------

::

          This module was written in 2005 by Howard Chu of Symas
          Corporation. The work was sponsored by Stanford University.

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

   OpenLDAP LDVERSION             RELEASEDATE              SLAPO-VALSORT(5)

--------------

Pages that refer to this page:
`slapd.overlays(5) <../man5/slapd.overlays.5.html>`__

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
