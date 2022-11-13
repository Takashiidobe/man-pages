.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

attr_multi(3) — Linux manual page
=================================

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

   ATTR_MULTI(3)             XFS Compatibility API            ATTR_MULTI(3)

NAME
-------------------------------------------------

::

          attr_multi, attr_multif - manipulate multiple user attributes on
          a filesystem object at once


-------------------------------------------------------------

::

          #include <attr/attributes.h>

          int attr_multi (const char *path, attr_multiop_t *oplist,
                          int count, int flags);

          int attr_multif (int fd, attr_multiop_t *oplist,
                           int count, int flags);


---------------------------------------------------------------

::

          The attr_multi and attr_multif functions provide a way to operate
          on multiple attributes of a filesystem object at once.

          Path points to a path name for a filesystem object, and fd refers
          to the file descriptor associated with a file.  The oplist is an
          array of attr_multiop_t structures.  Each element in that array
          describes a single attribute operation and provides all the
          information required to carry out that operation and to check for
          success or failure of that operation.  Count tells how many
          elements are in the oplist array.

          The contents of an attr_multiop_t structure include the following
          members:

             int am_opcode; /* which operation to perform (see below) */
             int am_error; /* [out arg] result of this sub-op (an errno) */
             char *am_attrname; /* attribute name to work with */
             char *am_attrvalue; /* [in/out arg] attribute value (raw bytes) */
             int am_length; /* [in/out arg] length of value */
             int am_flags; /* flags (bit-wise OR of #defines below) */

          The am_opcode field defines how the remaining fields are to be
          interpreted and can take on one of the following values:

             ATTR_OP_GET /* return the indicated attr's value */
             ATTR_OP_SET /* set/create the indicated attr/value pair */
             ATTR_OP_REMOVE /* remove the indicated attr */

          The am_error field will contain the appropriate error result code
          if that sub-operation fails.  The result codes for a given sub-
          operation are a subset of the result codes that are possible from
          the corresponding single-attribute function call.  For example,
          the result code possible from an ATTR_OP_GET sub-operation are a
          subset of those that can be returned from an attr_get function
          call.

          The am_attrname field is a pointer to a NULL terminated string
          giving the attribute name that the sub-operation should operate
          on.

          The am_attrvalue, am_length and am_flags fields are used to store
          the value of the named attribute, and some control flags for that
          sub-operation, respectively.  Their use varies depending on the
          value of the am_opcode field.

          ATTR_OP_GET
                 The am_attrvalue field is a pointer to a empty buffer that
                 will be overwritten with the value of the named attribute.
                 The am_length field is initially the total size of the
                 memory buffer that the am_attrvalue field points to.
                 After the operation, the am_length field contains the
                 actual size of the attribute´s value.  The am_flags field
                 may be set to the ATTR_ROOT flag.  If the process has
                 appropriate priviledges, the ROOT namespace will be
                 searched for the named attribute, otherwise the USER
                 namespace will be searched.

          ATTR_OP_SET
                 The am_attrvalue and am_length fields contain the new
                 value for the given attribute name and its length.  The
                 ATTR_ROOT flag may be set in the am_flags field.  If the
                 process has appropriate priviledges, the ROOT namespace
                 will be searched for the named attribute, otherwise the
                 USER namespace will be searched.  The ATTR_CREATE and the
                 ATTR_REPLACE flags may also be set in the am_flags field
                 (but not simultaneously).  If the ATTR_CREATE flag is set,
                 the sub-operation will set the am_error field to EEXIST if
                 the named attribute already exists.  If the ATTR_REPLACE
                 flag is set, the sub-operation will set the am_error field
                 to ENOATTR if the named attribute does not already exist.
                 If neither of those two flags are set and the attribute
                 does not exist, then the attribute will be created with
                 the given value.  If neither of those two flags are set
                 and the attribute already exists, then the value will be
                 replaced with the given value.

          ATTR_OP_REMOVE
                 The am_attrvalue and am_length fields are not used and are
                 ignored.  The am_flags field may be set to the ATTR_ROOT
                 flag.  If the process has appropriate priviledges, the
                 ROOT namespace will be searched for the named attribute,
                 otherwise the USER namespace will be searched.

          The flags argument to the attr_multi call is used to control
          following of symbolic links in the path argument.  The default is
          to follow symbolic links, flags should be set to ATTR_DONTFOLLOW
          to not follow symbolic links.

          attr_multi will fail if one or more of the following are true:

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
                 A bit other than ATTR_DONTFOLLOW was set in the flag
                 argument.

          [EFAULT]
                 Path, or oplist points outside the allocated address space
                 of the process.

          [ELOOP]
                 A path name lookup involved too many symbolic links.

          [ENAMETOOLONG]
                 The length of path exceeds {MAXPATHLEN}, or a pathname
                 component is longer than {MAXNAMELEN}.

          attr_multif will fail if:

          [EINVAL]
                 A bit was set in the flag argument, or fd refers to a
                 socket, not a file.

          [EFAULT]
                 Oplist points outside the allocated address space of the
                 process.

          [EBADF]
                 Fd does not refer to a valid descriptor.


---------------------------------------------------------------

::

          On success, zero is returned.  On error, -1 is returned, and
          errno is set appropriately.  Note that the individual operations
          listed in the oplist array each have their own error return
          fields.  The errno variable only records the result of the
          attr_multi call itself, not the result of any of the sub-
          operations.


---------------------------------------------------------

::

          attr(1), attr_get(3), attr_list(3), attr_remove(3), attr_set(3)

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

   Dec 2001                   Extended Attributes             ATTR_MULTI(3)

--------------

Pages that refer to this page: `attr(1) <../man1/attr.1.html>`__, 
`attr_get(3) <../man3/attr_get.3.html>`__, 
`attr_list(3) <../man3/attr_list.3.html>`__, 
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
