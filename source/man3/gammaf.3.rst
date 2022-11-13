.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

gamma(3) — Linux manual page
============================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `RETURN VALUE <#RETURN_VALUE>`__  |                                   |
| \| `ERRORS <#ERRORS>`__ \|        |                                   |
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

   GAMMA(3)                Linux Programmer's Manual               GAMMA(3)

NAME
-------------------------------------------------

::

          gamma, gammaf, gammal - (logarithm of the) gamma function


---------------------------------------------------------

::

          #include <math.h>

          double gamma(double x);
          float gammaf(float x);
          long double gammal(long double x);

          Link with -lm.

      Feature Test Macro Requirements for glibc (see
      feature_test_macros(7)):

          gamma():
              _XOPEN_SOURCE
                  || /* Since glibc 2.19: */ _DEFAULT_SOURCE
                  || /* Glibc <= 2.19: */ _BSD_SOURCE || _SVID_SOURCE

          gammaf(), gammal():
              _XOPEN_SOURCE >= 600 || (_XOPEN_SOURCE && _ISOC99_SOURCE)
                  || /* Since glibc 2.19: */ _DEFAULT_SOURCE
                  || /* Glibc <= 2.19: */ _BSD_SOURCE || _SVID_SOURCE


---------------------------------------------------------------

::

          These functions are deprecated: instead, use either the tgamma(3)
          or the lgamma(3) functions, as appropriate.

          For the definition of the Gamma function, see tgamma(3).

      *BSD version
          The libm in 4.4BSD and some versions of FreeBSD had a gamma()
          function that computes the Gamma function, as one would expect.

      glibc version
          Glibc has a gamma() function that is equivalent to lgamma(3) and
          computes the natural logarithm of the Gamma function.


-----------------------------------------------------------------

::

          See lgamma(3).


-----------------------------------------------------

::

          See lgamma(3).


-------------------------------------------------------------

::

          For an explanation of the terms used in this section, see
          attributes(7).

          ┌───────────────────────┬───────────────┬────────────────────────┐
          │Interface              │ Attribute     │ Value                  │
          ├───────────────────────┼───────────────┼────────────────────────┤
          │gamma(), gammaf(),     │ Thread safety │ MT-Unsafe race:signgam │
          │gammal()               │               │                        │
          └───────────────────────┴───────────────┴────────────────────────┘


-------------------------------------------------------------------

::

          Because of historical variations in behavior across systems, this
          function is not specified in any recent standard.  It was
          documented in SVID 2.


---------------------------------------------------

::

      History
          4.2BSD had a gamma() that computed ln(|Gamma(|x|)|), leaving the
          sign of Gamma(|x|) in the external integer signgam.  In 4.3BSD
          the name was changed to lgamma(3), and the man page promises

              "At some time in the future the name gamma will be
              rehabilitated and used for the Gamma function"

          This did indeed happen in 4.4BSD, where gamma() computes the
          Gamma function (with no effect on signgam).  However, this came
          too late, and we now have tgamma(3), the "true gamma" function.


---------------------------------------------------------

::

          lgamma(3), signgam(3), tgamma(3)

COLOPHON
---------------------------------------------------------

::

          This page is part of release 5.13 of the Linux man-pages project.
          A description of the project, information about reporting bugs,
          and the latest version of this page, can be found at
          https://www.kernel.org/doc/man-pages/.

   GNU                            2021-03-22                       GAMMA(3)

--------------

Pages that refer to this page: `tgamma(3) <../man3/tgamma.3.html>`__

--------------

`Copyright and license for this manual
page <../man3/gamma.3.license.html>`__

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
