.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

getrlimit(3p) — Linux manual page
=================================

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

   GETRLIMIT(3P)           POSIX Programmer's Manual          GETRLIMIT(3P)


-----------------------------------------------------

::

          This manual page is part of the POSIX Programmer's Manual.  The
          Linux implementation of this interface may differ (consult the
          corresponding Linux manual page for details of Linux behavior),
          or the interface may not be implemented on Linux.

NAME
-------------------------------------------------

::

          getrlimit, setrlimit — control maximum resource consumption


---------------------------------------------------------

::

          #include <sys/resource.h>

          int getrlimit(int resource, struct rlimit *rlp);
          int setrlimit(int resource, const struct rlimit *rlp);


---------------------------------------------------------------

::

          The getrlimit() function shall get, and the setrlimit() function
          shall set, limits on the consumption of a variety of resources.

          Each call to either getrlimit() or setrlimit() identifies a
          specific resource to be operated upon as well as a resource
          limit. A resource limit is represented by an rlimit structure.
          The rlim_cur member specifies the current or soft limit and the
          rlim_max member specifies the maximum or hard limit. Soft limits
          may be changed by a process to any value that is less than or
          equal to the hard limit. A process may (irreversibly) lower its
          hard limit to any value that is greater than or equal to the soft
          limit. Only a process with appropriate privileges can raise a
          hard limit. Both hard and soft limits can be changed in a single
          call to setrlimit() subject to the constraints described above.

          The value RLIM_INFINITY, defined in <sys/resource.h>, shall be
          considered to be larger than any other limit value. If a call to
          getrlimit() returns RLIM_INFINITY for a resource, it means the
          implementation shall not enforce limits on that resource.
          Specifying RLIM_INFINITY as any resource limit value on a
          successful call to setrlimit() shall inhibit enforcement of that
          resource limit.

          The following resources are defined:

          RLIMIT_CORE   This is the maximum size of a core file, in bytes,
                        that may be created by a process. A limit of 0
                        shall prevent the creation of a core file. If this
                        limit is exceeded, the writing of a core file shall
                        terminate at this size.

          RLIMIT_CPU    This is the maximum amount of CPU time, in seconds,
                        used by a process.  If this limit is exceeded,
                        SIGXCPU shall be generated for the process. If the
                        process is catching or ignoring SIGXCPU, or all
                        threads belonging to that process are blocking
                        SIGXCPU, the behavior is unspecified.

          RLIMIT_DATA   This is the maximum size of a data segment of the
                        process, in bytes.  If this limit is exceeded, the
                        malloc() function shall fail with errno set to
                        [ENOMEM].

          RLIMIT_FSIZE  This is the maximum size of a file, in bytes, that
                        may be created by a process. If a write or truncate
                        operation would cause this limit to be exceeded,
                        SIGXFSZ shall be generated for the thread. If the
                        thread is blocking, or the process is catching or
                        ignoring SIGXFSZ, continued attempts to increase
                        the size of a file from end-of-file to beyond the
                        limit shall fail with errno set to [EFBIG].

          RLIMIT_NOFILE This is a number one greater than the maximum value
                        that the system may assign to a newly-created
                        descriptor. If this limit is exceeded, functions
                        that allocate a file descriptor shall fail with
                        errno set to [EMFILE].  This limit constrains the
                        number of file descriptors that a process may
                        allocate.

          RLIMIT_STACK  This is the maximum size of the initial thread's
                        stack, in bytes. The implementation does not
                        automatically grow the stack beyond this limit. If
                        this limit is exceeded, SIGSEGV shall be generated
                        for the thread. If the thread is blocking SIGSEGV,
                        or the process is ignoring or catching SIGSEGV and
                        has not made arrangements to use an alternate
                        stack, the disposition of SIGSEGV shall be set to
                        SIG_DFL before it is generated.

          RLIMIT_AS     This is the maximum size of total available memory
                        of the process, in bytes. If this limit is
                        exceeded, the malloc() and mmap() functions shall
                        fail with errno set to [ENOMEM].  In addition, the
                        automatic stack growth fails with the effects
                        outlined above.

          When using the getrlimit() function, if a resource limit can be
          represented correctly in an object of type rlim_t, then its
          representation is returned; otherwise, if the value of the
          resource limit is equal to that of the corresponding saved hard
          limit, the value returned shall be RLIM_SAVED_MAX; otherwise, the
          value returned shall be RLIM_SAVED_CUR.

          When using the setrlimit() function, if the requested new limit
          is RLIM_INFINITY, the new limit shall be ``no limit''; otherwise,
          if the requested new limit is RLIM_SAVED_MAX, the new limit shall
          be the corresponding saved hard limit; otherwise, if the
          requested new limit is RLIM_SAVED_CUR, the new limit shall be the
          corresponding saved soft limit; otherwise, the new limit shall be
          the requested value. In addition, if the corresponding saved
          limit can be represented correctly in an object of type rlim_t
          then it shall be overwritten with the new limit.

          The result of setting a limit to RLIM_SAVED_MAX or RLIM_SAVED_CUR
          is unspecified unless a previous call to getrlimit() returned
          that value as the soft or hard limit for the corresponding
          resource limit.

          The determination of whether a limit can be correctly represented
          in an object of type rlim_t is implementation-defined. For
          example, some implementations permit a limit whose value is
          greater than RLIM_INFINITY and others do not.

          The exec family of functions shall cause resource limits to be
          saved.


-----------------------------------------------------------------

::

          Upon successful completion, getrlimit() and setrlimit() shall
          return 0. Otherwise, these functions shall return -1 and set
          errno to indicate the error.


-----------------------------------------------------

::

          The getrlimit() and setrlimit() functions shall fail if:

          EINVAL An invalid resource was specified; or in a setrlimit()
                 call, the new rlim_cur exceeds the new rlim_max.

          EPERM  The limit specified to setrlimit() would have raised the
                 maximum limit value, and the calling process does not have
                 appropriate privileges.

          The setrlimit() function may fail if:

          EINVAL The limit specified cannot be lowered because current
                 usage is already higher than the limit.

          The following sections are informative.


---------------------------------------------------------

::

          None.


---------------------------------------------------------------------------

::

          If a process attempts to set the hard limit or soft limit for
          RLIMIT_NOFILE to less than the value of {_POSIX_OPEN_MAX} from
          <limits.h>, unexpected behavior may occur.

          If a process attempts to set the hard limit or soft limit for
          RLIMIT_NOFILE to less than the highest currently open file
          descriptor +1, unexpected behavior may occur.


-----------------------------------------------------------

::

          It should be noted that RLIMIT_STACK applies ``at least'' to the
          stack of the initial thread in the process, and not to the sum of
          all the stacks in the process, as that would be very limiting
          unless the value is so big as to provide no value at all with a
          single thread.


---------------------------------------------------------------------------

::

          None.


---------------------------------------------------------

::

          exec(1p), fork(3p), malloc(3p), open(3p), sigaltstack(3p),
          sysconf(3p), ulimit(3p)

          The Base Definitions volume of POSIX.1‐2017, stropts.h(0p),
          sys_resource.h(0p)


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

   IEEE/The Open Group               2017                     GETRLIMIT(3P)

--------------

Pages that refer to this page:
`sys_resource.h(0p) <../man0/sys_resource.h.0p.html>`__, 
`exec(3p) <../man3/exec.3p.html>`__, 
`fclose(3p) <../man3/fclose.3p.html>`__, 
`fflush(3p) <../man3/fflush.3p.html>`__, 
`fputc(3p) <../man3/fputc.3p.html>`__, 
`fseek(3p) <../man3/fseek.3p.html>`__, 
`malloc(3p) <../man3/malloc.3p.html>`__, 
`setrlimit(3p) <../man3/setrlimit.3p.html>`__, 
`ulimit(3p) <../man3/ulimit.3p.html>`__, 
`write(3p) <../man3/write.3p.html>`__, 
`limits.conf(5) <../man5/limits.conf.5.html>`__

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
