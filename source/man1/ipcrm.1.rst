.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

ipcrm(1) — Linux manual page
============================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `OPTIONS <#OPTIONS>`__ \|         |                                   |
| `NOTES <#NOTES>`__ \|             |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `RE                               |                                   |
| PORTING BUGS <#REPORTING_BUGS>`__ |                                   |
| \|                                |                                   |
| `AVAILABILITY <#AVAILABILITY>`__  |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   IPCRM(1)                      User Commands                     IPCRM(1)

NAME
-------------------------------------------------

::

          ipcrm - remove certain IPC resources


---------------------------------------------------------

::

          ipcrm [options]

          ipcrm [shm|msg|sem] ID ...


---------------------------------------------------------------

::

          ipcrm removes System V inter-process communication (IPC) objects
          and associated data structures from the system. In order to
          delete such objects, you must be superuser, or the creator or
          owner of the object.

          System V IPC objects are of three types: shared memory, message
          queues, and semaphores. Deletion of a message queue or semaphore
          object is immediate (regardless of whether any process still
          holds an IPC identifier for the object). A shared memory object
          is only removed after all currently attached processes have
          detached (shmdt(2)) the object from their virtual address space.

          Two syntax styles are supported. The old Linux historical syntax
          specifies a three-letter keyword indicating which class of object
          is to be deleted, followed by one or more IPC identifiers for
          objects of this type.

          The SUS-compliant syntax allows the specification of zero or more
          objects of all three types in a single command line, with objects
          specified either by key or by identifier (see below). Both keys
          and identifiers may be specified in decimal, hexadecimal
          (specified with an initial '0x' or '0X'), or octal (specified
          with an initial '0').

          The details of the removes are described in shmctl(2), msgctl(2),
          and semctl(2). The identifiers and keys can be found by using
          ipcs(1).


-------------------------------------------------------

::

          -a, --all [shm] [msg] [sem]
              Remove all resources. When an option argument is provided,
              the removal is performed only for the specified resource
              types.

              Warning! Do not use -a if you are unsure how the software
              using the resources might react to missing objects. Some
              programs create these resources at startup and may not have
              any code to deal with an unexpected disappearance.

          -M, --shmem-key shmkey
              Remove the shared memory segment created with shmkey after
              the last detach is performed.

          -m, --shmem-id shmid
              Remove the shared memory segment identified by shmid after
              the last detach is performed.

          -Q, --queue-key msgkey
              Remove the message queue created with msgkey.

          -q, --queue-id msgid
              Remove the message queue identified by msgid.

          -S, --semaphore-key semkey
              Remove the semaphore created with semkey.

          -s, --semaphore-id semid
              Remove the semaphore identified by semid.

          -V, --version
              Display version information and exit.

          -h, --help
              Display help text and exit.


---------------------------------------------------

::

          In its first Linux implementation, ipcrm used the deprecated
          syntax shown in the second line of the SYNOPSIS. Functionality
          present in other *nix implementations of ipcrm has since been
          added, namely the ability to delete resources by key (not just
          identifier), and to respect the same command-line syntax. For
          backward compatibility the previous syntax is still supported.


---------------------------------------------------------

::

          ipcmk(1), ipcs(1), msgctl(2), msgget(2), semctl(2), semget(2),
          shmctl(2), shmdt(2), shmget(2), ftok(3), sysvipc(7)


---------------------------------------------------------------------

::

          For bug reports, use the issue tracker at
          https://github.com/karelzak/util-linux/issues.


-----------------------------------------------------------------

::

          The ipcrm command is part of the util-linux package which can be
          downloaded from Linux Kernel Archive
          <https://www.kernel.org/pub/linux/utils/util-linux/>. This page
          is part of the util-linux (a random collection of Linux
          utilities) project. Information about the project can be found at
          ⟨https://www.kernel.org/pub/linux/utils/util-linux/⟩. If you have
          a bug report for this manual page, send it to
          util-linux@vger.kernel.org. This page was obtained from the
          project's upstream Git repository
          ⟨git://git.kernel.org/pub/scm/utils/util-linux/util-linux.git⟩ on
          2021-08-27. (At that time, the date of the most recent commit
          that was found in the repository was 2021-08-24.) If you discover
          any rendering problems in this HTML version of the page, or you
          believe there is a better or more up-to-date source for the page,
          or you have corrections or improvements to the information in
          this COLOPHON (which is not part of the original manual page),
          send a mail to man-pages@man7.org

   util-linux 2.37.85-637cc       2021-04-02                       IPCRM(1)

--------------

Pages that refer to this page: `ipcmk(1) <../man1/ipcmk.1.html>`__, 
`ipcs(1) <../man1/ipcs.1.html>`__, 
`lsipc(1) <../man1/lsipc.1.html>`__, 
`pcp-ipcs(1) <../man1/pcp-ipcs.1.html>`__, 
`sysvipc(7) <../man7/sysvipc.7.html>`__

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
