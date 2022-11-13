.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

units(7) — Linux manual page
============================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   UNITS(7)                Linux Programmer's Manual               UNITS(7)

NAME
-------------------------------------------------

::

          units - decimal and binary prefixes


---------------------------------------------------------------

::

      Decimal prefixes
          The SI system of units uses prefixes that indicate powers of ten.
          A kilometer is 1000 meter, and a megawatt is 1000000 watt.  Below
          the standard prefixes.

                 Prefix   Name    Value
                 y        yocto   10^-24 = 0.000000000000000000000001
                 z        zepto   10^-21 = 0.000000000000000000001
                 a        atto    10^-18 = 0.000000000000000001
                 f        femto   10^-15 = 0.000000000000001
                 p        pico    10^-12 = 0.000000000001
                 n        nano    10^-9  = 0.000000001
                 µ        micro   10^-6  = 0.000001
                 m        milli   10^-3  = 0.001
                 c        centi   10^-2  = 0.01
                 d        deci    10^-1  = 0.1
                 da       deka    10^ 1  = 10
                 h        hecto   10^ 2  = 100
                 k        kilo    10^ 3  = 1000
                 M        mega    10^ 6  = 1000000
                 G        giga    10^ 9  = 1000000000
                 T        tera    10^12  = 1000000000000
                 P        peta    10^15  = 1000000000000000
                 E        exa     10^18  = 1000000000000000000
                 Z        zetta   10^21  = 1000000000000000000000
                 Y        yotta   10^24  = 1000000000000000000000000

          The symbol for micro is the Greek letter mu, often written u in
          an ASCII context where this Greek letter is not available.  See
          also

                 ⟨http://physics.nist.gov/cuu/Units/prefixes.html⟩

      Binary prefixes
          The binary prefixes resemble the decimal ones, but have an
          additional 'i' (and "Ki" starts with a capital 'K').  The names
          are formed by taking the first syllable of the names of the
          decimal prefix with roughly the same size, followed by "bi" for
          "binary".

                 Prefix   Name   Value
                 Ki       kibi   2^10 = 1024
                 Mi       mebi   2^20 = 1048576
                 Gi       gibi   2^30 = 1073741824
                 Ti       tebi   2^40 = 1099511627776
                 Pi       pebi   2^50 = 1125899906842624
                 Ei       exbi   2^60 = 1152921504606846976

          See also

          ⟨http://physics.nist.gov/cuu/Units/binary.html⟩

      Discussion
          Before these binary prefixes were introduced, it was fairly
          common to use k=1000 and K=1024, just like b=bit, B=byte.
          Unfortunately, the M is capital already, and cannot be
          capitalized to indicate binary-ness.

          At first that didn't matter too much, since memory modules and
          disks came in sizes that were powers of two, so everyone knew
          that in such contexts "kilobyte" and "megabyte" meant 1024 and
          1048576 bytes, respectively.  What originally was a sloppy use of
          the prefixes "kilo" and "mega" started to become regarded as the
          "real true meaning" when computers were involved.  But then disk
          technology changed, and disk sizes became arbitrary numbers.
          After a period of uncertainty all disk manufacturers settled on
          the standard, namely k=1000, M=1000 k, G=1000 M.

          The situation was messy: in the 14k4 modems, k=1000; in the
          1.44 MB diskettes, M=1024000; and so on.  In 1998 the IEC
          approved the standard that defines the binary prefixes given
          above, enabling people to be precise and unambiguous.

          Thus, today, MB = 1000000 B and MiB = 1048576 B.

          In the free software world programs are slowly being changed to
          conform.  When the Linux kernel boots and says

              hda: 120064896 sectors (61473 MB) w/2048KiB Cache

          the MB are megabytes and the KiB are kibibytes.

COLOPHON
---------------------------------------------------------

::

          This page is part of release 5.13 of the Linux man-pages project.
          A description of the project, information about reporting bugs,
          and the latest version of this page, can be found at
          https://www.kernel.org/doc/man-pages/.

   Linux                          2020-08-13                       UNITS(7)

--------------

`Copyright and license for this manual
page <../man7/units.7.license.html>`__

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
