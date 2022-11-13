.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

cap_copy_ext(3) — Linux manual page
===================================

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

   CAP_COPY_EXT(3)         Linux Programmer's Manual        CAP_COPY_EXT(3)

NAME
-------------------------------------------------

::

          cap_copy_ext, cap_size, cap_copy_int - capability state external
          representation translation


---------------------------------------------------------

::

          #include <sys/capability.h>

          ssize_t cap_size(cap_t cap_p);
          ssize_t cap_copy_ext(void *ext_p, cap_t cap_p, ssize_t size);
          cap_t cap_copy_int(const void * ext_p);

          Link with -lcap.


---------------------------------------------------------------

::

          These functions translate between internal and external
          representations of a capability state.  The external
          representation is an exportable, contiguous, persistent
          representation of a capability state in user-managed space.  The
          internal representation is managed by the capability functions in
          working storage.

          cap_size() returns the total length (in bytes) that the
          capability state in working storage identified by cap_p would
          require when converted by cap_copy_ext().  This function is used
          primarily to determine the amount of buffer space that must be
          provided to the cap_copy_ext() function in order to hold the
          capability data record created from cap_p.

          cap_copy_ext() copies a capability state in working storage,
          identified by cap_p, from system-managed space to user-managed
          space (pointed to by ext_p) and returns the length of the
          resulting data record.  The size parameter represents the maximum
          size, in bytes, of the resulting data record.  The cap_copy_ext()
          function will do any conversions necessary to convert the
          capability state from the undefined internal format to an
          exportable, contiguous, persistent data record.  It is the
          responsibility of the user to allocate a buffer large enough to
          hold the copied data.  The buffer length required to hold the
          copied data may be obtained by a call to the cap_size() function.

          cap_copy_int() copies a capability state from a capability data
          record in user-managed space to a new capability state in working
          storage, allocating any memory necessary, and returning a pointer
          to the newly created capability state.  The function initializes
          the capability state and then copies the capability state from
          the record pointed to by ext_p into the capability state,
          converting, if necessary, the data from a contiguous, persistent
          format to an undefined, internal format.  Once copied into
          internal format, the object can be manipulated by the capability
          state manipulation functions (see cap_clear(3)).  Note that the
          record pointed to by ext_p must have been obtained from a
          previous, successful call to cap_copy_ext() for this function to
          work successfully.  The caller should free any releasable memory,
          when the capability state in working storage is no longer
          required, by calling cap_free() with the cap_t as an argument.


-----------------------------------------------------------------

::

          cap_size() returns the length required to hold a capability data
          record on success, and -1 on failure.

          cap_copy_ext() returns the number of bytes placed in the user
          managed space pointed to by ext_p on success, and -1 on failure.

          cap_copy_int() returns a pointer to the newly created capability
          state in working storage on success, and NULL on failure.

          On failure, errno is set to EINVAL, ENOMEM, or ERANGE.


-------------------------------------------------------------------

::

          These functions are specified in the withdrawn POSIX.1e draft
          specification.


---------------------------------------------------------

::

          libcap(3), cap_clear(3), cap_from_text(3), cap_get_file(3),
          cap_get_proc(3), cap_init(3), capabilities(7)

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

                                  2021-03-06                CAP_COPY_EXT(3)

--------------

Pages that refer to this page:
`cap_clear(3) <../man3/cap_clear.3.html>`__, 
`cap_from_text(3) <../man3/cap_from_text.3.html>`__, 
`cap_get_file(3) <../man3/cap_get_file.3.html>`__, 
`cap_get_proc(3) <../man3/cap_get_proc.3.html>`__, 
`cap_init(3) <../man3/cap_init.3.html>`__, 
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
