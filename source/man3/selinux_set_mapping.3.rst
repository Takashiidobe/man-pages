.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

selinux_set_mapping(3) — Linux manual page
==========================================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `RETURN VALUE <#RETURN_VALUE>`__  |                                   |
| \| `ERRORS <#ERRORS>`__ \|        |                                   |
| `EXAMPLE <#EXAMPLE>`__ \|         |                                   |
| `AUTHOR <#AUTHOR>`__ \|           |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   selinux_set_mapping(3)  SELinux API documentation selinux_set_mapping(3)

NAME
-------------------------------------------------

::

          selinux_set_mapping - establish dynamic object class and
          permission mapping


---------------------------------------------------------

::

          #include <selinux/selinux.h>

          struct security_class_mapping {
               const char *name;
               const char *perms[];
          };

          int selinux_set_mapping(struct security_class_mapping *map);


---------------------------------------------------------------

::

          selinux_set_mapping() establishes a mapping from a user-provided
          ordering of object classes and permissions to the numbers
          actually used by the loaded system policy. If using this
          function, applications should also set a SELINUX_CB_POLICYLOAD
          callback via selinux_set_callback(3) that calls this function
          again upon a policy reload to re-create the mapping in case the
          class or permission values change in the new policy.  Generally
          it is preferred to instead use selinux_check_access(3) instead of
          avc_has_perm(3) or security_compute_av(3) and not use this
          function at all.

          After the mapping is established, all libselinux functions that
          operate on class and permission values take the user-provided
          numbers, which are determined as follows:

          The map argument consists of an array of security_class_mapping
          structures, which must be terminated by a structure having a NULL
          name field.  Except for this last structure, the name field
          should refer to the string name of an object class, and the
          corresponding perms field should refer to an array of permission
          bit names terminated by a NULL string.

          The object classes named in the mapping and the bit indexes of
          each set of permission bits named in the mapping are numbered in
          order starting from 1.  These numbers are the values that should
          be passed to subsequent libselinux calls.


-----------------------------------------------------------------

::

          Zero is returned on success.  On error, -1 is returned and errno
          is set appropriately.


-----------------------------------------------------

::

          EINVAL One of the class or permission names requested in the
                 mapping is not present in the loaded policy.

          ENOMEM An attempt to allocate memory failed.


-------------------------------------------------------

::

                 struct security_class_mapping map[] = {
                     { "file", { "create", "unlink", "read", "write", NULL } },
                     { "socket", { "bind", NULL } },
                     { "process", { "signal", NULL } },
                     { NULL }
                 };

                 if (selinux_set_mapping(map) < 0)
                     exit(1);

          In this example, after the call has succeeded, classes file,
          socket, and process will be identified by 1, 2 and 3,
          respectively.  Permissions create, unlink, read, and write (for
          the file class) will be identified by 1, 2, 4, and 8
          respectively.  Classes and permissions not listed in the mapping
          cannot be used.


-----------------------------------------------------

::

          Originally Eamon Walsh.  Updated by Stephen Smalley
          <sds@tycho.nsa.gov>


---------------------------------------------------------

::

          selinux_check_access(3), selinux_set_callback(3),
          avc_has_perm(3), selinux(8)

COLOPHON
---------------------------------------------------------

::

          This page is part of the selinux (Security-Enhanced Linux user-
          space libraries and tools) project.  Information about the
          project can be found at 
          ⟨https://github.com/SELinuxProject/selinux/wiki⟩.  If you have a
          bug report for this manual page, see
          ⟨https://github.com/SELinuxProject/selinux/wiki/Contributing⟩.
          This page was obtained from the project's upstream Git repository
          ⟨https://github.com/SELinuxProject/selinux⟩ on 2021-08-27.  (At
          that time, the date of the most recent commit that was found in
          the repository was 2021-08-23.)  If you discover any rendering
          problems in this HTML version of the page, or you believe there
          is a better or more up-to-date source for the page, or you have
          corrections or improvements to the information in this COLOPHON
          (which is not part of the original manual page), send a mail to
          man-pages@man7.org

                                  12 Jun 2008        selinux_set_mapping(3)

--------------

Pages that refer to this page:
`avc_has_perm(3) <../man3/avc_has_perm.3.html>`__, 
`security_compute_av(3) <../man3/security_compute_av.3.html>`__

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
