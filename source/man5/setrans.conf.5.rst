.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

setrans.conf(5) — Linux manual page
===================================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `AUTHOR <#AUTHOR>`__ \|           |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `FILES <#FILES>`__ \|             |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   setrans.conf(5)        setrans.conf documentation        setrans.conf(5)

NAME
-------------------------------------------------

::

          setrans.conf - translation configuration file for MCS/MLS SELinux
          systems


---------------------------------------------------------------

::

          The /etc/selinux/{SELINUXTYPE}/setrans.conf configuration file
          specifies the way that SELinux MCS/MLS labels are translated into
          human readable form by the mcstransd daemon.  The default
          policies support 16 sensitivity levels (s0 through s15) and 1024
          categories (c0 through c1023). Multiple categories can be
          separated with commas (c0,c1,c3,c5) and a range of categories can
          be shortened using dot notation (c0.c3,c5).

      Keywords
          Base   once a base is declared, subsequent sensitivity label
                 definitions will have all modifiers applied to them during
                 translation.  Sensitivity labels defined before the base
                 declaration are immediately cached and no modifiers will
                 be applied these are used as direct translations.

          Default
                 defines the category bit range that will be used for
                 inverse bits.

          Domain creates a new domain with the supplied name.

          Include
                 read and process the contents of the specified
                 configuration file.

          Join   defines a character used to separate members of a modifier
                 group when more than one is specified (ex. USA/AUS).

          ModifierGroup
                 a means of grouping category bit definitions by how they
                 modify the sensitivity label.

          Prefix word(s) that may proceed member(s) of a modifier group
                 (ex. REL USA).

          Suffix word(s) that may follow member(s) of a modifier group (ex.
                 USA EYES ONLY).

          Whitespace
                 defines the set of acceptable white space characters that
                 may be used in label being translated.

      Sensitivity Level Definition Examples
          s0=SystemLow
                 defines a translation of s0 (the lowest sensitivity level)
                 with no categories to SystemLow.

          s15:c0.c1023=SystemHigh
                 defines a translation of s15:c0.c1023 to SystemHigh.
                 c0.c1023 is shorthand for all categories. A colon
                 separates the sensitivity level and categories.

          s0-s15:c0.c1023=SystemLow-SystemHigh
                 defines a range translation of s0-s15:c0.c1023 to
                 SystemLow-SystemHigh. The two range components are
                 separated by a dash.

          s0:c0=PatientRecord
                 defines a translation of sensitivity s0 with category c0
                 to PatientRecord.

          s0:c1=Accounting
                 defines a translation of sensitivity s0 with category c1
                 to Accounting.

          s2:c1,c2,c3=Confidential3Categories

          s2:c1.c3=Confidential3Categories
                 both define a translation of sensitivity s2 with
                 categories c1, c2 and c3 to Confidential3Categories.

          s5=TopSecret
                 defines a translation of sensitivity s5 with no categories
                 to TopSecret.

      Constraint Examples
          c0!c1  if category bits 0 and 1 are both set, the constraint will
                 fail and the original context will be returned.

          c5.c9>c1
                 if category bits 5 through 9 are set, bit 1 must also be
                 set or the constraint will fail and the original context
                 will be returned.

          s1!c5,c9
                 if category bits 5 and 9 are set and the sensitivity level
                 is s1, the constraint will fail and the original context
                 will be returned.


-----------------------------------------------------

::

              Written by Joe Nall <joe@nall.com>.
              Updated by Ted X. Toth <txtoth@gmail.com>.


---------------------------------------------------------

::

          selinux(8), mcs(8), mls(8), chcon(1)


---------------------------------------------------

::

          /etc/selinux/{SELINUXTYPE}/setrans.conf
          /usr/share/mcstrans/examples

COLOPHON
---------------------------------------------------------

::

          This page is part of the selinux (Security-Enhanced Linux user-
          space libraries and tools) project.  Information about the
          project can be found at 
          ⟨https://github.com/SELinuxProject/selinux/wiki⟩.  If you have a
          bug report for this manual page, see
          ⟨https://github.com/SELinuxProject/selinux/wiki/Contributing⟩.
          This page was obtained from the project's upstream Git repository
          ⟨https://github.com/SELinuxProject/selinux⟩ on 2021-08-27.  (At
          that time, the date of the most recent commit that was found in
          the repository was 2021-08-23.)  If you discover any rendering
          problems in this HTML version of the page, or you believe there
          is a better or more up-to-date source for the page, or you have
          corrections or improvements to the information in this COLOPHON
          (which is not part of the original manual page), send a mail to
          man-pages@man7.org

   txtoth@gmail.com              13 July 2010               setrans.conf(5)

--------------

Pages that refer to this page:
`mcstransd(8) <../man8/mcstransd.8.html>`__

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
