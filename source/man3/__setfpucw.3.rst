.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

\__setfpucw(3) — Linux manual page
==================================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `                                 |                                   |
| CONFORMING TO <#CONFORMING_TO>`__ |                                   |
| \| `NOTES <#NOTES>`__ \|          |                                   |
| `EXAMPLES <#EXAMPLES>`__ \|       |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   __SETFPUCW(3)           Linux Programmer's Manual          __SETFPUCW(3)

NAME
-------------------------------------------------

::

          __setfpucw - set FPU control word on i386 architecture (obsolete)


---------------------------------------------------------

::

          #include <i386/fpu_control.h>

          void __setfpucw(unsigned short control_word);


---------------------------------------------------------------

::

          __setfpucw() transfers control_word to the registers of the FPU
          (floating-point unit) on the i386 architecture.  This was used to
          control floating-point precision, rounding and floating-point
          exceptions.


-------------------------------------------------------------------

::

          This function was a nonstandard GNU extension.


---------------------------------------------------

::

          As of glibc 2.1 this function does not exist anymore.  There are
          new functions from C99, with prototypes in <fenv.h>, to control
          FPU rounding modes, like fegetround(3), fesetround(3), and the
          floating-point environment, like fegetenv(3), feholdexcept(3),
          fesetenv(3), feupdateenv(3), and FPU exception handling, like
          feclearexcept(3), fegetexceptflag(3), feraiseexcept(3),
          fesetexceptflag(3), and fetestexcept(3).

          If direct access to the FPU control word is still needed, the
          _FPU_GETCW and _FPU_SETCW macros from <fpu_control.h> can be
          used.


---------------------------------------------------------

::

          __setfpucw(0x1372)

          Set FPU control word on the i386 architecture to
               - extended precision
               - rounding to nearest
               - exceptions on overflow, zero divide and NaN


---------------------------------------------------------

::

          feclearexcept(3)

          <fpu_control.h>

COLOPHON
---------------------------------------------------------

::

          This page is part of release 5.13 of the Linux man-pages project.
          A description of the project, information about reporting bugs,
          and the latest version of this page, can be found at
          https://www.kernel.org/doc/man-pages/.

   Linux                          2021-03-22                  __SETFPUCW(3)

--------------

`Copyright and license for this manual
page <../man3/__setfpucw.3.license.html>`__

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
