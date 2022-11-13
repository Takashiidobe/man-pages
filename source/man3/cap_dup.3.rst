.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

cap_init(3) — Linux manual page
===============================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `RETURN VALUE <#RETURN_VALUE>`__  |                                   |
| \|                                |                                   |
| `                                 |                                   |
| CONFORMING TO <#CONFORMING_TO>`__ |                                   |
| \| `SEE ALSO <#SEE_ALSO>`__ \|    |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   CAP_INIT(3)             Linux Programmer's Manual            CAP_INIT(3)

NAME
-------------------------------------------------

::

          cap_init, cap_free, cap_dup - capability data object storage
          management


---------------------------------------------------------

::

          #include <sys/capability.h>

          cap_t cap_init(void);
          int cap_free(void *obj_d);
          cap_t cap_dup(cap_t cap_p);

          Link with -lcap.


---------------------------------------------------------------

::

          The capabilities associated with a file or process are never
          edited directly.  Instead, working storage is allocated to
          contain a representation of the capability state.  Capabilities
          are edited and manipulated only within this working storage area.
          Once editing of the capability state is complete, the updated
          capability state is used to replace the capability state
          associated with the file or process.

          cap_init() creates a capability state in working storage and
          returns a pointer to the capability state.  The initial value of
          all flags are cleared.  The caller should free any releasable
          memory, when the capability state in working storage is no longer
          required, by calling cap_free() with the cap_t as an argument.

          cap_free() liberates any releasable memory that has been
          allocated to the capability state identified by obj_d.  The obj_d
          argument may identify either a cap_t entity, or a char * entity
          allocated by the cap_to_text() function.

          cap_dup() returns a duplicate capability state in working storage
          given by the source object cap_p, allocating any memory
          necessary, and returning a pointer to the newly created
          capability state.  Once duplicated, no operation on either
          capability state affects the other in any way.  When the
          duplicated capability state in working storage is no longer
          required, the caller should free any releasable memory by calling
          cap_free() with the cap_t as an argument.


-----------------------------------------------------------------

::

          cap_init() and cap_dup() return a non-NULL value on success, and
          NULL on failure.

          cap_free() returns zero on success, and -1 on failure.

          On failure, errno is set to EINVAL or ENOMEM.


-------------------------------------------------------------------

::

          These functions are specified in the withdrawn POSIX.1e draft
          specification.


---------------------------------------------------------

::

          libcap(3), cap_clear(3), cap_copy_ext(3), cap_from_text(3),
          cap_get_file(3), cap_get_proc(3), capabilities(7)

COLOPHON
---------------------------------------------------------

::

          This page is part of the libcap (capabilities commands and
          library) project.  Information about the project can be found at
          ⟨https://git.kernel.org/pub/scm/libs/libcap/libcap.git/⟩.  If you
          have a bug report for this manual page, send it to
          morgan@kernel.org (please put "libcap" in the Subject line).
          This page was obtained from the project's upstream Git repository
          ⟨https://git.kernel.org/pub/scm/libs/libcap/libcap.git/⟩ on
          2021-08-27.  (At that time, the date of the most recent commit
          that was found in the repository was 2021-08-25.)  If you
          discover any rendering problems in this HTML version of the page,
          or you believe there is a better or more up-to-date source for
          the page, or you have corrections or improvements to the
          information in this COLOPHON (which is not part of the original
          manual page), send a mail to man-pages@man7.org

                                  2021-03-06                    CAP_INIT(3)

--------------

Pages that refer to this page:
`cap_clear(3) <../man3/cap_clear.3.html>`__, 
`cap_copy_ext(3) <../man3/cap_copy_ext.3.html>`__, 
`cap_from_text(3) <../man3/cap_from_text.3.html>`__, 
`cap_get_file(3) <../man3/cap_get_file.3.html>`__, 
`cap_get_proc(3) <../man3/cap_get_proc.3.html>`__, 
`cap_iab(3) <../man3/cap_iab.3.html>`__, 
`cap_launch(3) <../man3/cap_launch.3.html>`__, 
`libcap(3) <../man3/libcap.3.html>`__, 
`capabilities(7) <../man7/capabilities.7.html>`__

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
