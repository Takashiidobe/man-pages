.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

attr_set(3) — Linux manual page
===============================

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

   ATTR_SET(3)               XFS Compatibility API              ATTR_SET(3)

NAME
-------------------------------------------------

::

          attr_set, attr_setf - set the value of a user attribute of a
          filesystem object


-------------------------------------------------------------

::

          #include <attr/attributes.h>

          int attr_set (const char *path, const char *attrname,
                        const char *attrvalue, const int valuelength,
                        int flags);

          int attr_setf (int fd, const char *attrname,
                         const char *attrvalue, const int valuelength,
                         int flags);


---------------------------------------------------------------

::

          The attr_set and attr_setf functions provide a way to create
          attributes and set/change their values.

          Path points to a path name for a filesystem object, and fd refers
          to the file descriptor associated with a file.  If the attribute
          attrname does not exist, an attribute with the given name and
          value will be created and associated with that indicated
          filesystem object.  If an attribute with that name already exists
          on that filesystem object, the existing value is replaced with
          the new value given in this call.  The new attribute value is
          copied from the attrvalue buffer for a total of valuelength
          bytes.  The flags argument can contain the following symbols
          bitwise OR'ed together:

          ATTR_ROOT
                 Look for attrname in the root address space, not in the
                 user address space.  (limited to use by super-user only)

          ATTR_DONTFOLLOW
                 Do not follow symbolic links when resolving a path on an
                 attr_set function call.  The default is to follow symbolic
                 links.

          ATTR_CREATE
                 Return an error (EEXIST) if an attribute of the given name
                 already exists on the indicated filesystem object,
                 otherwise create an attribute with the given name and
                 value.  This flag is used to implement a pure create
                 operation, without this flag attr_set will create the
                 attribute if it does not already exist.  An error (EINVAL)
                 will be returned if both ATTR_CREATE and ATTR_REPLACE are
                 set in the same call.

          ATTR_REPLACE
                 Return an error (ENOATTR) if an attribute of the given
                 name does not already exist on the indicated filesystem
                 object, otherwise replace the existing attribute´s value
                 with the given value.  This flag is used to implement a
                 pure replacement operation, without this flag attr_set
                 will create the attribute if it does not already exist.
                 An error (EINVAL) will be returned if both ATTR_CREATE and
                 ATTR_REPLACE are set in the same call.

          attr_set will fail if one or more of the following are true:

          [ENOATTR]
                 The attribute name given is not associated with the
                 indicated filesystem object and the ATTR_REPLACE flag bit
                 was set.

          [E2BIG]
                 The value of the given attribute is too large, it exceeds
                 the maximum allowable size of an attribute value.

          [EEXIST]
                 The attribute name given is already associated with the
                 indicated filesystem object and the ATTR_CREATE flag bit
                 was set.

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
                 this system call, or both the ATTR_CREATE and ATTR_REPLACE
                 flags bits were set.

          [EFAULT]
                 Path, attrname, or attrvalue points outside the allocated
                 address space of the process.

          [ELOOP]
                 A path name lookup involved too many symbolic links.

          [ENAMETOOLONG]
                 The length of path exceeds {MAXPATHLEN}, or a pathname
                 component is longer than {MAXNAMELEN}.

          attr_setf will fail if:

          [ENOATTR]
                 The attribute name given is not associated with the
                 indicated filesystem object and the ATTR_REPLACE flag bit
                 was set.

          [E2BIG]
                 The value of the given attribute is too large, it exceeds
                 the maximum allowable size of an attribute value.

          [EEXIST]
                 The attribute name given is already associated with the
                 indicated filesystem object and the ATTR_CREATE flag bit
                 was set.

          [EINVAL]
                 A bit was set in the flag argument that is not defined for
                 this system call, or both the ATTR_CREATE and ATTR_REPLACE
                 flags bits were set, or fd refers to a socket, not a file.

          [EFAULT]
                 Attrname, or attrvalue points outside the allocated
                 address space of the process.

          [EBADF]
                 Fd does not refer to a valid descriptor.


---------------------------------------------------------------

::

          On success, zero is returned.  On error, -1 is returned, and
          errno is set appropriately.


---------------------------------------------------------

::

          attr(1), attr_get(3), attr_list(3), attr_multi(3), attr_remove(3)

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

   Dec 2001                   Extended Attributes               ATTR_SET(3)

--------------

Pages that refer to this page: `attr(1) <../man1/attr.1.html>`__, 
`attr_get(3) <../man3/attr_get.3.html>`__, 
`attr_list(3) <../man3/attr_list.3.html>`__, 
`attr_multi(3) <../man3/attr_multi.3.html>`__, 
`attr_remove(3) <../man3/attr_remove.3.html>`__

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
