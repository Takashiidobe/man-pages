.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

cfgetispeed(3p) — Linux manual page
===================================

+-----------------------------------+-----------------------------------+
| `PROLOG <#PROLOG>`__ \|           |                                   |
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `RETURN VALUE <#RETURN_VALUE>`__  |                                   |
| \| `ERRORS <#ERRORS>`__ \|        |                                   |
| `EXAMPLES <#EXAMPLES>`__ \|       |                                   |
| `APPLICAT                         |                                   |
| ION USAGE <#APPLICATION_USAGE>`__ |                                   |
| \| `RATIONALE <#RATIONALE>`__ \|  |                                   |
| `FUTURE D                         |                                   |
| IRECTIONS <#FUTURE_DIRECTIONS>`__ |                                   |
| \| `SEE ALSO <#SEE_ALSO>`__ \|    |                                   |
| `COPYRIGHT <#COPYRIGHT>`__        |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   CFGETISPEED(3P)         POSIX Programmer's Manual        CFGETISPEED(3P)


-----------------------------------------------------

::

          This manual page is part of the POSIX Programmer's Manual.  The
          Linux implementation of this interface may differ (consult the
          corresponding Linux manual page for details of Linux behavior),
          or the interface may not be implemented on Linux.

NAME
-------------------------------------------------

::

          cfgetispeed — get input baud rate


---------------------------------------------------------

::

          #include <termios.h>

          speed_t cfgetispeed(const struct termios *termios_p);


---------------------------------------------------------------

::

          The cfgetispeed() function shall extract the input baud rate from
          the termios structure to which the termios_p argument points.

          This function shall return exactly the value in the termios data
          structure, without interpretation.


-----------------------------------------------------------------

::

          Upon successful completion, cfgetispeed() shall return a value of
          type speed_t representing the input baud rate.


-----------------------------------------------------

::

          No errors are defined.

          The following sections are informative.


---------------------------------------------------------

::

          None.


---------------------------------------------------------------------------

::

          None.


-----------------------------------------------------------

::

          The term ``baud'' is used historically here, but is not
          technically correct. This is properly ``bits per second'', which
          may not be the same as baud. However, the term is used because of
          the historical usage and understanding.

          The cfgetospeed(), cfgetispeed(), cfsetospeed(), and
          cfsetispeed() functions do not take arguments as numbers, but
          rather as symbolic names. There are two reasons for this:

           1. Historically, numbers were not used because of the way the
              rate was stored in the data structure. This is retained even
              though a function is now used.

           2. More importantly, only a limited set of possible rates is at
              all portable, and this constrains the application to that
              set.

          There is nothing to prevent an implementation accepting as an
          extension a number (such as 126), and since the encoding of the
          Bxxx symbols is not specified, this can be done to avoid
          introducing ambiguity.

          Setting the input baud rate to zero was a mechanism to allow for
          split baud rates. Clarifications in this volume of POSIX.1‐2017
          have made it possible to determine whether split rates are
          supported and to support them without having to treat zero as a
          special case. Since this functionality is also confusing, it has
          been declared obsolescent.  The 0 argument referred to is the
          literal constant 0, not the symbolic constant B0. This volume of
          POSIX.1‐2017 does not preclude B0 from being defined as the value
          0; in fact, implementations would likely benefit from the two
          being equivalent. This volume of POSIX.1‐2017 does not fully
          specify whether the previous cfsetispeed() value is retained
          after a tcgetattr() as the actual value or as zero. Therefore,
          conforming applications should always set both the input speed
          and output speed when setting either.

          In historical implementations, the baud rate information is
          traditionally kept in c_cflag.  Applications should be written to
          presume that this might be the case (and thus not blindly copy
          c_cflag), but not to rely on it in case it is in some other field
          of the structure. Setting the c_cflag field absolutely after
          setting a baud rate is a non-portable action because of this. In
          general, the unused parts of the flag fields might be used by the
          implementation and should not be blindly copied from the
          descriptions of one terminal device to another.


---------------------------------------------------------------------------

::

          None.


---------------------------------------------------------

::

          cfgetospeed(3p), cfsetispeed(3p), cfsetospeed(3p), tcgetattr(3p)

          The Base Definitions volume of POSIX.1‐2017, Chapter 11, General
          Terminal Interface, termios.h(0p)


-----------------------------------------------------------

::

          Portions of this text are reprinted and reproduced in electronic
          form from IEEE Std 1003.1-2017, Standard for Information
          Technology -- Portable Operating System Interface (POSIX), The
          Open Group Base Specifications Issue 7, 2018 Edition, Copyright
          (C) 2018 by the Institute of Electrical and Electronics
          Engineers, Inc and The Open Group.  In the event of any
          discrepancy between this version and the original IEEE and The
          Open Group Standard, the original IEEE and The Open Group
          Standard is the referee document. The original Standard can be
          obtained online at http://www.opengroup.org/unix/online.html .

          Any typographical or formatting errors that appear in this page
          are most likely to have been introduced during the conversion of
          the source files to man page format. To report such errors, see
          https://www.kernel.org/doc/man-pages/reporting_bugs.html .

   IEEE/The Open Group               2017                   CFGETISPEED(3P)

--------------

Pages that refer to this page:
`termios.h(0p) <../man0/termios.h.0p.html>`__, 
`cfgetospeed(3p) <../man3/cfgetospeed.3p.html>`__, 
`cfsetispeed(3p) <../man3/cfsetispeed.3p.html>`__, 
`cfsetospeed(3p) <../man3/cfsetospeed.3p.html>`__, 
`tcsetattr(3p) <../man3/tcsetattr.3p.html>`__

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
