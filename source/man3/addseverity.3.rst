.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

addseverity(3) — Linux manual page
==================================

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

   ADDSEVERITY(3)          Linux Programmer's Manual         ADDSEVERITY(3)

NAME
-------------------------------------------------

::

          addseverity - introduce new severity classes


---------------------------------------------------------

::

          #include <fmtmsg.h>

          int addseverity(int severity, const char *s);

      Feature Test Macro Requirements for glibc (see
      feature_test_macros(7)):

          addseverity():
              Since glibc 2.19:
                  _DEFAULT_SOURCE
              Glibc 2.19 and earlier:
                  _SVID_SOURCE


---------------------------------------------------------------

::

          This function allows the introduction of new severity classes
          which can be addressed by the severity argument of the fmtmsg(3)
          function.  By default, that function knows only how to print
          messages for severity 0-4 (with strings (none), HALT, ERROR,
          WARNING, INFO).  This call attaches the given string s to the
          given value severity.  If s is NULL, the severity class with the
          numeric value severity is removed.  It is not possible to
          overwrite or remove one of the default severity classes.  The
          severity value must be nonnegative.


-----------------------------------------------------------------

::

          Upon success, the value MM_OK is returned.  Upon error, the
          return value is MM_NOTOK.  Possible errors include: out of
          memory, attempt to remove a nonexistent or default severity
          class.


---------------------------------------------------------

::

          addseverity() is provided in glibc since version 2.1.


-------------------------------------------------------------

::

          For an explanation of the terms used in this section, see
          attributes(7).

          ┌──────────────────────────────────────┬───────────────┬─────────┐
          │Interface                             │ Attribute     │ Value   │
          ├──────────────────────────────────────┼───────────────┼─────────┤
          │addseverity()                         │ Thread safety │ MT-Safe │
          └──────────────────────────────────────┴───────────────┴─────────┘


-------------------------------------------------------------------

::

          This function is not specified in the X/Open Portability Guide
          although the fmtmsg(3) function is.  It is available on System V
          systems.


---------------------------------------------------

::

          New severity classes can also be added by setting the environment
          variable SEV_LEVEL.


---------------------------------------------------------

::

          fmtmsg(3)

COLOPHON
---------------------------------------------------------

::

          This page is part of release 5.13 of the Linux man-pages project.
          A description of the project, information about reporting bugs,
          and the latest version of this page, can be found at
          https://www.kernel.org/doc/man-pages/.

   GNU                            2021-03-22                 ADDSEVERITY(3)

--------------

Pages that refer to this page: `fmtmsg(3) <../man3/fmtmsg.3.html>`__

--------------

`Copyright and license for this manual
page <../man3/addseverity.3.license.html>`__

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
