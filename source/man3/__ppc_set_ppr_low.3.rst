.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

\__ppc_set_ppr_med(3) — Linux manual page
=========================================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `VERSIONS <#VERSIONS>`__ \|       |                                   |
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

   __PPC_SET_PPR_MED(3)    LinuxProgrammer's Manual    __PPC_SET_PPR_MED(3)

NAME
-------------------------------------------------

::

          __ppc_set_ppr_med, __ppc_set_ppr_very_low, __ppc_set_ppr_low,
          __ppc_set_ppr_med_low, __ppc_set_ppr_med_high - Set the Program
          Priority Register


---------------------------------------------------------

::

          #include <sys/platform/ppc.h>

          void __ppc_set_ppr_med(void);
          void __ppc_set_ppr_very_low(void);
          void __ppc_set_ppr_low(void);
          void __ppc_set_ppr_med_low(void);
          void __ppc_set_ppr_med_high(void);


---------------------------------------------------------------

::

          These functions provide access to the Program Priority Register
          (PPR) on the Power architecture.

          The PPR is a 64-bit register that controls the program's
          priority.  By adjusting the PPR value the programmer may improve
          system throughput by causing system resources to be used more
          efficiently, especially in contention situations.  The available
          unprivileged states are covered by the following functions:

          *  __ppc_set_ppr_med() sets the Program Priority Register value
             to medium (default).

          *  __ppc_set_ppr_very_low() sets the Program Priority Register
             value to very low.

          *  __ppc_set_ppr_low() sets the Program Priority Register value
             to low.

          *  __ppc_set_ppr_med_low() sets the Program Priority Register
             value to medium low.

          The privileged state medium high may also be set during certain
          time intervals by problem-state (unprivileged) programs, with the
          following function:

          *  __ppc_set_ppr_med_high() sets the Program Priority to medium
             high.

          If the program priority is medium high when the time interval
          expires or if an attempt is made to set the priority to medium
          high when it is not allowed, the priority is set to medium.


---------------------------------------------------------

::

          The functions __ppc_set_ppr_med(), __ppc_set_ppr_low(), and
          __ppc_set_ppr_med_low() are provided by glibc since version 2.18.
          The functions __ppc_set_ppr_very_low() and
          __ppc_set_ppr_med_high() first appeared in glibc in version 2.23.


-------------------------------------------------------------

::

          For an explanation of the terms used in this section, see
          attributes(7).

          ┌──────────────────────────────────────┬───────────────┬─────────┐
          │Interface                             │ Attribute     │ Value   │
          ├──────────────────────────────────────┼───────────────┼─────────┤
          │__ppc_set_ppr_med(),                  │ Thread safety │ MT-Safe │
          │__ppc_set_ppr_very_low(),             │               │         │
          │__ppc_set_ppr_low(),                  │               │         │
          │__ppc_set_ppr_med_low(),              │               │         │
          │__ppc_set_ppr_med_high()              │               │         │
          └──────────────────────────────────────┴───────────────┴─────────┘


-------------------------------------------------------------------

::

          These functions are nonstandard GNU extensions.


---------------------------------------------------

::

          The functions __ppc_set_ppr_very_low() and
          __ppc_set_ppr_med_high() will be defined by <sys/platform/ppc.h>
          if _ARCH_PWR8 is defined.  Availability of these functions can be
          tested using #ifdef _ARCH_PWR8.


---------------------------------------------------------

::

          __ppc_yield(3)

          Power ISA, Book II - Section 3.1 (Program Priority Registers)

COLOPHON
---------------------------------------------------------

::

          This page is part of release 5.13 of the Linux man-pages project.
          A description of the project, information about reporting bugs,
          and the latest version of this page, can be found at
          https://www.kernel.org/doc/man-pages/.

   GNU C Library                  2021-03-22           __PPC_SET_PPR_MED(3)

--------------

Pages that refer to this page:
`\__ppc_yield(3) <../man3/__ppc_yield.3.html>`__

--------------

`Copyright and license for this manual
page <../man3/__ppc_set_ppr_med.3.license.html>`__

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
