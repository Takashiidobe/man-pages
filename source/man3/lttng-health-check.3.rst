.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

lttng-health-check(3) — Linux manual page
=========================================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `RETURN VALUE <#RETURN_VALUE>`__  |                                   |
| \| `LIMITATIONS <#LIMITATIONS>`__ |                                   |
| \| `AUTHORS <#AUTHORS>`__ \|      |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   LTTNG_HEALTH_CHECK(3)    LTTng Developer Manual    LTTNG_HEALTH_CHECK(3)

NAME
-------------------------------------------------

::

          DEPRECATED

          lttng_health_check - Monitor health of the session daemon


---------------------------------------------------------

::

          #include <lttng/lttng.h>

          int lttng_health_check(enum lttng_health_component c);

          Link with -llttng-ctl.


---------------------------------------------------------------

::

          The lttng_health_check() is used to check the session daemon
          health for either a specific component c or for all of them. Each
          component represent a subsystem of the session daemon.  Those
          components are set with health counters that are atomically
          incremented once reached. An even value indicates progress in the
          execution of the component. An odd value means that the code has
          entered a blocking state which is not a poll(7) wait period.

          A bad health is defined by a fatal error code path reached or any
          IPC used in the session daemon that was blocked for more than 20
          seconds (default timeout).  The condition for this bad health to
          be detected is that one or many of the counters are odd.

          The health check mechanism of the session daemon can only be
          reached through the health socket which is a different one from
          the command and the application socket. An isolated thread serves
          this socket and only computes the health counters across the code
          when asked by the lttng control library (using this call). This
          subsystem is highly unlikely to fail due to its simplicity.

          The c argument can be one of the following values:

          LTTNG_HEALTH_CMD
                 Command subsystem which handles user commands coming from
                 the liblttng-ctl or the lttng(1) command line interface.

          LTTNG_HEALTH_APP_MANAGE
                 The session daemon manages application socket in order to
                 route client command and check if they get closed which
                 indicates the application shutdown.

          LTTNG_HEALTH_APP_REG
                 The application registration mechanism is an important and
                 vital part of for user space tracing. Upon startup,
                 applications instrumented with lttng-ust(3) try to
                 register to the session daemon through this subsystem.

          LTTNG_HEALTH_KERNEL
                 Monitor the Kernel tracer streams and main channel of
                 communication (/proc/lttng). If this component
                 malfunction, the Kernel tracer is not usable anymore by
                 lttng-tools.

          LTTNG_HEALTH_CONSUMER
                 The session daemon can spawn up to three consumer daemon
                 for kernel, user space 32 and 64 bit. This subsystem
                 monitors the consumer daemon(s). A bad health state means
                 that the consumer(s) are not usable anymore hence likely
                 making tracing not usable.

          LTTNG_HEALTH_ALL
                 Check all components. If only one of them is in a bad
                 state, a health check error is returned.


-----------------------------------------------------------------

::

          Return 0 if the health is OK, or 1 is it's in a bad state. A
          return code of -1 indicates that the control library was not able
          to connect to the session daemon health socket.


---------------------------------------------------------------

::

          For the LTTNG_HEALTH_CONSUMER, you can not know which consumer
          daemon has failed but only that either the consumer subsystem has
          failed or that a lttng-consumerd died.


-------------------------------------------------------

::

          lttng-health-check was originally written by David Goulet and is
          currently maintained by Jérémie Galarneau
          <jeremie.galarneau@efficios.com>.

COLOPHON
---------------------------------------------------------

::

          This page is part of the LTTng-Tools (    LTTng tools) project.
          Information about the project can be found at 
          ⟨http://lttng.org/⟩.  It is not known how to report bugs for this
          man page; if you know, please send a mail to man-pages@man7.org.
          This page was obtained from the project's upstream Git repository
          ⟨git://git.lttng.org/lttng-tools.git⟩ on 2019-11-19.  (At that
          time, the date of the most recent commit that was found in the
          repository was 2019-11-14.)  If you discover any rendering
          problems in this HTML version of the page, or you believe there
          is a better or more up-to-date source for the page, or you have
          corrections or improvements to the information in this COLOPHON
          (which is not part of the original manual page), send a mail to
          man-pages@man7.org

   LTTng                          2012-09-19          LTTNG_HEALTH_CHECK(3)

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
