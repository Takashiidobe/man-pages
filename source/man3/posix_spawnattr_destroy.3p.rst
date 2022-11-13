.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

posix_spawnattr_destroy(3p) — Linux manual page
===============================================

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

   POSIX_SPAWNATTR_DESTROY(3P)IX Programmer's ManualX_SPAWNATTR_DESTROY(3P)


-----------------------------------------------------

::

          This manual page is part of the POSIX Programmer's Manual.  The
          Linux implementation of this interface may differ (consult the
          corresponding Linux manual page for details of Linux behavior),
          or the interface may not be implemented on Linux.

NAME
-------------------------------------------------

::

          posix_spawnattr_destroy, posix_spawnattr_init — destroy and
          initialize spawn attributes object (ADVANCED REALTIME)


---------------------------------------------------------

::

          #include <spawn.h>

          int posix_spawnattr_destroy(posix_spawnattr_t *attr);
          int posix_spawnattr_init(posix_spawnattr_t *attr);


---------------------------------------------------------------

::

          The posix_spawnattr_destroy() function shall destroy a spawn
          attributes object. A destroyed attr attributes object can be
          reinitialized using posix_spawnattr_init(); the results of
          otherwise referencing the object after it has been destroyed are
          undefined. An implementation may cause posix_spawnattr_destroy()
          to set the object referenced by attr to an invalid value.

          The posix_spawnattr_init() function shall initialize a spawn
          attributes object attr with the default value for all of the
          individual attributes used by the implementation. Results are
          undefined if posix_spawnattr_init() is called specifying an
          already initialized attr attributes object.

          A spawn attributes object is of type posix_spawnattr_t (defined
          in <spawn.h>) and is used to specify the inheritance of process
          attributes across a spawn operation. POSIX.1‐2008 does not define
          comparison or assignment operators for the type
          posix_spawnattr_t.

          Each implementation shall document the individual attributes it
          uses and their default values unless these values are defined by
          POSIX.1‐2008.  Attributes not defined by POSIX.1‐2008, their
          default values, and the names of the associated functions to get
          and set those attribute values are implementation-defined.

          The resulting spawn attributes object (possibly modified by
          setting individual attribute values), is used to modify the
          behavior of posix_spawn() or posix_spawnp().  After a spawn
          attributes object has been used to spawn a process by a call to a
          posix_spawn() or posix_spawnp(), any function affecting the
          attributes object (including destruction) shall not affect any
          process that has been spawned in this way.


-----------------------------------------------------------------

::

          Upon successful completion, posix_spawnattr_destroy() and
          posix_spawnattr_init() shall return zero; otherwise, an error
          number shall be returned to indicate the error.


-----------------------------------------------------

::

          The posix_spawnattr_init() function shall fail if:

          ENOMEM Insufficient memory exists to initialize the spawn
                 attributes object.

          The posix_spawnattr_destroy() function may fail if:

          EINVAL The value specified by attr is invalid.

          The following sections are informative.


---------------------------------------------------------

::

          None.


---------------------------------------------------------------------------

::

          These functions are part of the Spawn option and need not be
          provided on all implementations.


-----------------------------------------------------------

::

          The original spawn interface proposed in POSIX.1‐2008 defined the
          attributes that specify the inheritance of process attributes
          across a spawn operation as a structure. In order to be able to
          separate optional individual attributes under their appropriate
          options (that is, the spawn-schedparam and spawn-schedpolicy
          attributes depending upon the Process Scheduling option), and
          also for extensibility and consistency with the newer POSIX
          interfaces, the attributes interface has been changed to an
          opaque data type. This interface now consists of the type
          posix_spawnattr_t, representing a spawn attributes object,
          together with associated functions to initialize or destroy the
          attributes object, and to set or get each individual attribute.
          Although the new object-oriented interface is more verbose than
          the original structure, it is simple to use, more extensible, and
          easy to implement.


---------------------------------------------------------------------------

::

          None.


---------------------------------------------------------

::

          posix_spawn(3p), posix_spawnattr_getsigdefault(3p),
          posix_spawnattr_getflags(3p), posix_spawnattr_getpgroup(3p),
          posix_spawnattr_getschedparam(3p),
          posix_spawnattr_getschedpolicy(3p),
          posix_spawnattr_getsigmask(3p)

          The Base Definitions volume of POSIX.1‐2017, spawn.h(0p)


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

   IEEE/The Open Group               2017       POSIX_SPAWNATTR_DESTROY(3P)

--------------

Pages that refer to this page:
`spawn.h(0p) <../man0/spawn.h.0p.html>`__, 
`posix_spawn(3p) <../man3/posix_spawn.3p.html>`__, 
`posix_spawnattr_getflags(3p) <../man3/posix_spawnattr_getflags.3p.html>`__, 
`posix_spawnattr_getpgroup(3p) <../man3/posix_spawnattr_getpgroup.3p.html>`__, 
`posix_spawnattr_getschedparam(3p) <../man3/posix_spawnattr_getschedparam.3p.html>`__, 
`posix_spawnattr_getschedpolicy(3p) <../man3/posix_spawnattr_getschedpolicy.3p.html>`__, 
`posix_spawnattr_getsigdefault(3p) <../man3/posix_spawnattr_getsigdefault.3p.html>`__, 
`posix_spawnattr_getsigmask(3p) <../man3/posix_spawnattr_getsigmask.3p.html>`__, 
`posix_spawnattr_init(3p) <../man3/posix_spawnattr_init.3p.html>`__

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
