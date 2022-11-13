.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

attr_list(3) — Linux manual page
================================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `C SYNOPSIS <#C_SYNOPSIS>`__ \|   |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `DIAGNOSTICS <#DIAGNOSTICS>`__ \| |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   ATTR_LIST(3)              XFS Compatibility API             ATTR_LIST(3)

NAME
-------------------------------------------------

::

          attr_list, attr_listf - list the names of the user attributes of
          a filesystem object


-------------------------------------------------------------

::

          #include <attr/attributes.h>

          int attr_list (const char ∗path, char ∗buffer,
                         const int buffersize, int flags,
                         attrlist_cursor_t ∗cursor);

          int attr_listf (int fd, char ∗buffer,
                          const int buffersize, int flags,
                          attrlist_cursor_t ∗cursor);


---------------------------------------------------------------

::

          The attr_list and attr_listf functions provide a way to list the
          existing attributes of a filesystem object.

          Path points to a path name for a filesystem object, and fd refers
          to the file descriptor associated with a file.  The buffer will
          be filled with a structure describing at least a portion of the
          attributes associated with the given filesystem object.  Buffer
          will be overwritten with an attrlist_t structure containing a
          list of the attributes associated with that filesystem object, up
          to a maximum of buffersize bytes.  The buffer must be
          sufficiently large to hold the appropriate data structures plus
          at least one maximally sized attribute name, but cannot be more
          than ATTR_MAX_VALUELEN (currently 64KB) bytes in length.

          The contents of an attrlist_t structure include the following
          members:

             int32_t al_count; /∗ number of entries in attrlist ∗/
             int32_t al_more; /∗ T/F: more attrs (do syscall again) ∗/
             int32_t al_offset[1]; /∗ byte offsets of attrs [var-sized] ∗/

          The al_count field shows the number of attributes represented in
          this buffer, which is also the number of elements in the
          al_offset array.  The al_more field will be non-zero if another
          attr_list call would result in more attributes.  The al_offset
          array contains the byte offset within the buffer of the structure
          describing each of the attributes, an attrlist_ent_t structure.
          The ATTR_ENTRY(buffer, index) macro will help with decoding the
          list.  It takes a pointer to the buffer and an index into the
          al_offset array and returns a pointer to the corresponding
          attrlist_ent_t structure.

          The contents of an attrlist_ent_t structure include the following
          members:

             uint32_t a_valuelen; /∗ number bytes in value of attr ∗/
             char a_name[]; /∗ attr name (NULL terminated) ∗/

          The a_valuelen field shows the size in bytes of the value
          associated with the attribute whose name is stored in the a_name
          field.  The name is a NULL terminated string.

          Note that the value of the attribute cannot be obtained through
          this interface, the attr_get call should be used to get the
          value.  The attr_list interface tells the calling process how
          large of a buffer it must have in order to get the attribute´s
          value.

          The flags argument can contain the following symbols bitwise
          OR´ed together:

          ATTR_ROOT
                 List the attributes that are in the root address space,
                 not in the user address space.  (limited to use by super-
                 user only)

          ATTR_DONTFOLLOW
                 Do not follow symbolic links when resolving a path on an
                 attr_list function call.  The default is to follow
                 symbolic links.

          The cursor argument is a pointer to an opaque data structure that
          the kernel uses to track the calling process´s position in the
          attribute list.  The only valid operations on a cursor are to
          pass it into an attr_list function call or to zero it out.  It
          should be zero´ed out before the first attr_list call.  Note that
          multi-threaded applications may keep more than one cursor in
          order to serve multiple contexts, ie: the attr_list call is
          "thread-safe".

          attr_list will fail if one or more of the following are true:

          [ENOENT]
                 The named file does not exist.

          [EPERM]
                 The effective user ID does not match the owner of the file
                 and the effective user ID is not super-user.

          [ENOTDIR]
                 A component of the path prefix is not a directory.

          [EACCES]
                 Search permission is denied on a component of the path
                 prefix.

          [EINVAL]
                 A bit was set in the flag argument that is not defined for
                 this system call, or the buffer was too small or too
                 large.

          [EFAULT]
                 Either Path or buffer points outside the allocated address
                 space of the process, or buffer or bufsize are not 32bit
                 aligned.

          [ELOOP]
                 A path name lookup involved too many symbolic links.

          [ENAMETOOLONG]
                 The length of path exceeds {MAXPATHLEN}, or a pathname
                 component is longer than {MAXNAMELEN}.

          [ENOATTR]
                 attribute does not exist for this file.

          attr_listf will fail if:

          [EINVAL]
                 A bit was set in the flag argument that is not defined for
                 this system call, or fd refers to a socket, not a file, or
                 the buffer was too small or too large.

          [EFAULT]
                 Either Path or buffer points outside the allocated address
                 space of the process, or buffer or bufsize are not 32bit
                 aligned.

          [EBADF]
                 Fd does not refer to a valid descriptor.


---------------------------------------------------------------

::

          Upon successful completion, a value of 0 is returned.  Otherwise,
          a value of -1 is returned and errno is set to indicate the error.


---------------------------------------------------------

::

          attr(1), attr_multi(3), attr_remove(3), attr_set(3)

COLOPHON
---------------------------------------------------------

::

          This page is part of the attr (manipulating filesystem extended
          attributes) project.  Information about the project can be found
          at ⟨http://savannah.nongnu.org/projects/attr⟩.  If you have a bug
          report for this manual page, see
          ⟨http://savannah.nongnu.org/bugs/?group=attr⟩.  This page was
          obtained from the project's upstream Git repository
          ⟨git://git.savannah.nongnu.org/attr.git⟩ on 2021-08-27.  (At that
          time, the date of the most recent commit that was found in the
          repository was 2021-04-19.)  If you discover any rendering
          problems in this HTML version of the page, or you believe there
          is a better or more up-to-date source for the page, or you have
          corrections or improvements to the information in this COLOPHON
          (which is not part of the original manual page), send a mail to
          man-pages@man7.org

   Dec 2005                   Extended Attributes              ATTR_LIST(3)

--------------

Pages that refer to this page:
`attr_get(3) <../man3/attr_get.3.html>`__, 
`attr_multi(3) <../man3/attr_multi.3.html>`__, 
`attr_remove(3) <../man3/attr_remove.3.html>`__, 
`attr_set(3) <../man3/attr_set.3.html>`__, 
`handle(3) <../man3/handle.3.html>`__

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
