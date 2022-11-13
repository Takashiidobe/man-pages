.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

sd_bus_creds_new_from_pid(3) — Linux manual page
================================================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `RETURN VALUE <#RETURN_VALUE>`__  |                                   |
| \|                                |                                   |
| `REFERENCE OW                     |                                   |
| NERSHIP <#REFERENCE_OWNERSHIP>`__ |                                   |
| \| `NOTES <#NOTES>`__ \|          |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `NOTES <#NOTES>`__ \|             |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   SD_BUS_CREDS_NEW_FROM_PID(3)us_creds_new_from_pidS_CREDS_NEW_FROM_PID(3)

NAME
-------------------------------------------------

::

          sd_bus_creds_new_from_pid, sd_bus_creds_get_mask,
          sd_bus_creds_get_augmented_mask, sd_bus_creds_ref,
          sd_bus_creds_unref, sd_bus_creds_unrefp - Retrieve credentials
          object for the specified PID


---------------------------------------------------------

::

          #include <systemd/sd-bus.h>

          int sd_bus_creds_new_from_pid(pid_t pid, uint64_t creds_mask,
                                        sd_bus_creds **ret);

          uint64_t sd_bus_creds_get_mask(sd_bus_creds *c);

          uint64_t sd_bus_creds_get_augmented_mask(sd_bus_creds *c);

          sd_bus_creds *sd_bus_creds_ref(sd_bus_creds *c);

          sd_bus_creds *sd_bus_creds_unref(sd_bus_creds *c);

          void sd_bus_creds_unrefp(sd_bus_creds **c);

          SD_BUS_CREDS_PID, SD_BUS_CREDS_PPID, SD_BUS_CREDS_TID,
          SD_BUS_CREDS_UID, SD_BUS_CREDS_EUID, SD_BUS_CREDS_SUID,
          SD_BUS_CREDS_FSUID, SD_BUS_CREDS_GID, SD_BUS_CREDS_EGID,
          SD_BUS_CREDS_SGID, SD_BUS_CREDS_FSGID,
          SD_BUS_CREDS_SUPPLEMENTARY_GIDS, SD_BUS_CREDS_COMM,
          SD_BUS_CREDS_TID_COMM, SD_BUS_CREDS_EXE, SD_BUS_CREDS_CMDLINE,
          SD_BUS_CREDS_CGROUP, SD_BUS_CREDS_UNIT, SD_BUS_CREDS_SLICE,
          SD_BUS_CREDS_USER_UNIT, SD_BUS_CREDS_USER_SLICE,
          SD_BUS_CREDS_SESSION, SD_BUS_CREDS_OWNER_UID,
          SD_BUS_CREDS_EFFECTIVE_CAPS, SD_BUS_CREDS_PERMITTED_CAPS,
          SD_BUS_CREDS_INHERITABLE_CAPS, SD_BUS_CREDS_BOUNDING_CAPS,
          SD_BUS_CREDS_SELINUX_CONTEXT, SD_BUS_CREDS_AUDIT_SESSION_ID,
          SD_BUS_CREDS_AUDIT_LOGIN_UID, SD_BUS_CREDS_TTY,
          SD_BUS_CREDS_UNIQUE_NAME, SD_BUS_CREDS_WELL_KNOWN_NAMES,
          SD_BUS_CREDS_DESCRIPTION, SD_BUS_CREDS_AUGMENT, _SD_BUS_CREDS_ALL


---------------------------------------------------------------

::

          sd_bus_creds_new_from_pid() creates a new credentials object and
          fills it with information about the process pid. The pointer to
          this object will be stored in the ret pointer. Note that
          credential objects may also be created and retrieved via
          sd_bus_get_name_creds(3), sd_bus_get_owner_creds(3) and
          sd_bus_message_get_creds(3).

          The information that will be stored is determined by creds_mask.
          It may contain a subset of ORed constants SD_BUS_CREDS_PID,
          SD_BUS_CREDS_PPID, SD_BUS_CREDS_TID, SD_BUS_CREDS_UID,
          SD_BUS_CREDS_EUID, SD_BUS_CREDS_SUID, SD_BUS_CREDS_FSUID,
          SD_BUS_CREDS_GID, SD_BUS_CREDS_EGID, SD_BUS_CREDS_SGID,
          SD_BUS_CREDS_FSGID, SD_BUS_CREDS_SUPPLEMENTARY_GIDS,
          SD_BUS_CREDS_COMM, SD_BUS_CREDS_TID_COMM, SD_BUS_CREDS_EXE,
          SD_BUS_CREDS_CMDLINE, SD_BUS_CREDS_CGROUP, SD_BUS_CREDS_UNIT,
          SD_BUS_CREDS_SLICE, SD_BUS_CREDS_USER_UNIT,
          SD_BUS_CREDS_USER_SLICE, SD_BUS_CREDS_SESSION,
          SD_BUS_CREDS_OWNER_UID, SD_BUS_CREDS_EFFECTIVE_CAPS,
          SD_BUS_CREDS_PERMITTED_CAPS, SD_BUS_CREDS_INHERITABLE_CAPS,
          SD_BUS_CREDS_BOUNDING_CAPS, SD_BUS_CREDS_SELINUX_CONTEXT,
          SD_BUS_CREDS_AUDIT_SESSION_ID, SD_BUS_CREDS_AUDIT_LOGIN_UID,
          SD_BUS_CREDS_TTY, SD_BUS_CREDS_UNIQUE_NAME,
          SD_BUS_CREDS_WELL_KNOWN_NAMES, and SD_BUS_CREDS_DESCRIPTION. Use
          the special value _SD_BUS_CREDS_ALL to request all supported
          fields. The SD_BUS_CREDS_AUGMENT constant may not be ORed into
          the mask for invocations of sd_bus_creds_new_from_pid().

          Fields can be retrieved from the credentials object using
          sd_bus_creds_get_pid(3) and other functions which correspond
          directly to the constants listed above.

          A mask of fields which were actually successfully retrieved can
          be retrieved with sd_bus_creds_get_mask(). If the credentials
          object was created with sd_bus_creds_new_from_pid(), this will be
          a subset of fields requested in creds_mask.

          Similar to sd_bus_creds_get_mask(), the function
          sd_bus_creds_get_augmented_mask() returns a bitmask of field
          constants. The mask indicates which credential fields have been
          retrieved in a non-atomic fashion. For credential objects created
          via sd_bus_creds_new_from_pid(), this mask will be identical to
          the mask returned by sd_bus_creds_get_mask(). However, for
          credential objects retrieved via sd_bus_get_name_creds(), this
          mask will be set for the credential fields that could not be
          determined atomically at peer connection time, and which were
          later added by reading augmenting credential data from /proc/.
          Similarly, for credential objects retrieved via
          sd_bus_get_owner_creds(), the mask is set for the fields that
          could not be determined atomically at bus creation time, but have
          been augmented. Similarly, for credential objects retrieved via
          sd_bus_message_get_creds(), the mask is set for the fields that
          could not be determined atomically at message sending time, but
          have been augmented. The mask returned by
          sd_bus_creds_get_augmented_mask() is always a subset of (or
          identical to) the mask returned by sd_bus_creds_get_mask() for
          the same object. The latter call hence returns all credential
          fields available in the credential object, the former then marks
          the subset of those that have been augmented. Note that augmented
          fields are unsuitable for authorization decisions, as they may be
          retrieved at different times, thus being subject to races. Hence,
          augmented fields should be used exclusively for informational
          purposes.

          sd_bus_creds_ref() creates a new reference to the credentials
          object c. This object will not be destroyed until
          sd_bus_creds_unref() has been called as many times plus once
          more. Once the reference count has dropped to zero, c cannot be
          used anymore, so further calls to sd_bus_creds_ref(c) or
          sd_bus_creds_unref(c) are illegal.

          sd_bus_creds_unref() destroys a reference to c.

          sd_bus_creds_unrefp() is similar to sd_bus_creds_unref() but
          takes a pointer to a pointer to an sd_bus_creds object. This call
          is useful in conjunction with GCC's and LLVM's Clean-up Variable
          Attribute[1]. Note that this function is defined as inline
          function.

          sd_bus_creds_ref(), sd_bus_creds_unref() and
          sd_bus_creds_unrefp() execute no operation if the passed in bus
          credentials object is NULL.


-----------------------------------------------------------------

::

          On success, sd_bus_creds_new_from_pid() returns 0 or a positive
          integer. On failure, it returns a negative errno-style error
          code.

          sd_bus_creds_get_mask() returns the mask of successfully acquired
          fields.

          sd_bus_creds_get_augmented_mask() returns the mask of fields that
          have been augmented from data in /proc/, and are thus not
          suitable for authorization decisions.

          sd_bus_creds_ref() always returns the argument.

          sd_bus_creds_unref() always returns NULL.


-------------------------------------------------------------------------------

::

          Function sd_bus_creds_new_from_pid() creates a new object and the
          caller owns the sole reference. When not needed anymore, this
          reference should be destroyed with sd_bus_creds_unref(3).

      Errors
          Returned errors may indicate the following problems:

          -ESRCH
              Specified pid could not be found.

          -EINVAL
              Specified parameter is invalid (NULL in case of output
              parameters).

          -ENOMEM
              Memory allocation failed.

          -EOPNOTSUPP
              One of the requested fields is unknown to the local system.


---------------------------------------------------

::

          These APIs are implemented as a shared library, which can be
          compiled and linked to with the libsystemd pkg-config(1) file.


---------------------------------------------------------

::

          systemd(1), sd-bus(3), sd_bus_creds_get_pid(3),
          sd_bus_get_name_creds(3), sd_bus_get_owner_creds(3),
          sd_bus_message_get_creds(3)

.. _notes-top-1:


---------------------------------------------------

::

           1. Clean-up Variable Attribute
              https://gcc.gnu.org/onlinedocs/gcc/Common-Variable-Attributes.html

COLOPHON
---------------------------------------------------------

::

          This page is part of the systemd (systemd system and service
          manager) project.  Information about the project can be found at
          ⟨http://www.freedesktop.org/wiki/Software/systemd⟩.  If you have
          a bug report for this manual page, see
          ⟨http://www.freedesktop.org/wiki/Software/systemd/#bugreports⟩.
          This page was obtained from the project's upstream Git repository
          ⟨https://github.com/systemd/systemd.git⟩ on 2021-08-27.  (At that
          time, the date of the most recent commit that was found in the
          repository was 2021-08-27.)  If you discover any rendering
          problems in this HTML version of the page, or you believe there
          is a better or more up-to-date source for the page, or you have
          corrections or improvements to the information in this COLOPHON
          (which is not part of the original manual page), send a mail to
          man-pages@man7.org

   systemd 249                                 SD_BUS_CREDS_NEW_FROM_PID(3)

--------------

Pages that refer to this page: `sd-bus(3) <../man3/sd-bus.3.html>`__, 
`sd_bus_creds_get_pid(3) <../man3/sd_bus_creds_get_pid.3.html>`__, 
`sd_bus_creds_new_from_pid(3) <../man3/sd_bus_creds_new_from_pid.3.html>`__, 
`sd_bus_get_name_creds(3) <../man3/sd_bus_get_name_creds.3.html>`__, 
`sd_bus_query_sender_creds(3) <../man3/sd_bus_query_sender_creds.3.html>`__

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
