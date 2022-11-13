.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

lp(4) — Linux manual page
=========================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `                                 |                                   |
| CONFIGURATION <#CONFIGURATION>`__ |                                   |
| \| `DESCRIPTION <#DESCRIPTION>`__ |                                   |
| \| `FILES <#FILES>`__ \|          |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   LP(4)                   Linux Programmer's Manual                  LP(4)

NAME
-------------------------------------------------

::

          lp - line printer devices


---------------------------------------------------------

::

          #include <linux/lp.h>


-------------------------------------------------------------------

::

          lp[0–2] are character devices for the parallel line printers;
          they have major number 6 and minor number 0–2.  The minor numbers
          correspond to the printer port base addresses 0x03bc, 0x0378, and
          0x0278.  Usually they have mode 220 and are owned by user root
          and group lp.  You can use printer ports either with polling or
          with interrupts.  Interrupts are recommended when high traffic is
          expected, for example, for laser printers.  For typical dot
          matrix printers, polling will usually be enough.  The default is
          polling.


---------------------------------------------------------------

::

          The following ioctl(2) calls are supported:

          int ioctl(int fd, LPTIME, int arg)
                 Sets the amount of time that the driver sleeps before
                 rechecking the printer when the printer's buffer appears
                 to be filled to arg.  If you have a fast printer, decrease
                 this number; if you have a slow printer, then increase it.
                 This is in hundredths of a second, the default 2 being
                 0.02 seconds.  It influences only the polling driver.

          int ioctl(int fd, LPCHAR, int arg)
                 Sets the maximum number of busy-wait iterations which the
                 polling driver does while waiting for the printer to get
                 ready for receiving a character to arg.  If printing is
                 too slow, increase this number; if the system gets too
                 slow, decrease this number.  The default is 1000.  It
                 influences only the polling driver.

          int ioctl(int fd, LPABORT, int arg)
                 If arg is 0, the printer driver will retry on errors,
                 otherwise it will abort.  The default is 0.

          int ioctl(int fd, LPABORTOPEN, int arg)
                 If arg is 0, open(2) will be aborted on error, otherwise
                 error will be ignored.  The default is to ignore it.

          int ioctl(int fd, LPCAREFUL, int arg)
                 If arg is 0, then the out-of-paper, offline, and error
                 signals are required to be false on all writes, otherwise
                 they are ignored.  The default is to ignore them.

          int ioctl(int fd, LPWAIT, int arg)
                 Sets the number of busy waiting iterations to wait before
                 strobing the printer to accept a just-written character,
                 and the number of iterations to wait before turning the
                 strobe off again, to arg.  The specification says this
                 time should be 0.5 microseconds, but experience has shown
                 the delay caused by the code is already enough.  For that
                 reason, the default value is 0.  This is used for both the
                 polling and the interrupt driver.

          int ioctl(int fd, LPSETIRQ, int arg)
                 This ioctl(2) requires superuser privileges.  It takes an
                 int containing the new IRQ as argument.  As a side effect,
                 the printer will be reset.  When arg is 0, the polling
                 driver will be used, which is also default.

          int ioctl(int fd, LPGETIRQ, int *arg)
                 Stores the currently used IRQ in arg.

          int ioctl(int fd, LPGETSTATUS, int *arg)
                 Stores the value of the status port in arg.  The bits have
                 the following meaning:

                 LP_PBUSY     inverted busy input, active high
                 LP_PACK      unchanged acknowledge input, active low
                 LP_POUTPA    unchanged out-of-paper input, active high
                 LP_PSELECD   unchanged selected input, active high
                 LP_PERRORP   unchanged error input, active low

                 Refer to your printer manual for the meaning of the
                 signals.  Note that undocumented bits may also be set,
                 depending on your printer.

          int ioctl(int fd, LPRESET)
                 Resets the printer.  No argument is used.


---------------------------------------------------

::

          /dev/lp*


---------------------------------------------------------

::

          chmod(1), chown(1), mknod(1), lpcntl(8), tunelp(8)

COLOPHON
---------------------------------------------------------

::

          This page is part of release 5.13 of the Linux man-pages project.
          A description of the project, information about reporting bugs,
          and the latest version of this page, can be found at
          https://www.kernel.org/doc/man-pages/.

   Linux                          2021-03-22                          LP(4)

--------------

`Copyright and license for this manual
page <../man4/lp.4.license.html>`__

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
