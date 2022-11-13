.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

sd_id128_get_machine(3) — Linux manual page
===========================================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `RETURN VALUE <#RETURN_VALUE>`__  |                                   |
| \| `NOTES <#NOTES>`__ \|          |                                   |
| `EXAMPLES <#EXAMPLES>`__ \|       |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   SD_ID128_GET_MACHINE(3)   sd_id128_get_machine   SD_ID128_GET_MACHINE(3)

NAME
-------------------------------------------------

::

          sd_id128_get_machine, sd_id128_get_machine_app_specific,
          sd_id128_get_boot, sd_id128_get_boot_app_specific,
          sd_id128_get_invocation - Retrieve 128-bit IDs


---------------------------------------------------------

::

          #include <systemd/sd-id128.h>

          int sd_id128_get_machine(sd_id128_t *ret);

          int sd_id128_get_machine_app_specific(sd_id128_t app_id,
                                                sd_id128_t *ret);

          int sd_id128_get_boot(sd_id128_t *ret);

          int sd_id128_get_boot_app_specific(sd_id128_t app_id,
                                             sd_id128_t *ret);

          int sd_id128_get_invocation(sd_id128_t *ret);


---------------------------------------------------------------

::

          sd_id128_get_machine() returns the machine ID of the executing
          host. This reads and parses the machine-id(5) file. This function
          caches the machine ID internally to make retrieving the machine
          ID a cheap operation. This ID may be used wherever a unique
          identifier for the local system is needed. However, it is
          recommended to use this ID as-is only in trusted environments. In
          untrusted environments it is recommended to derive an application
          specific ID from this machine ID, in an irreversible
          (cryptographically secure) way. To make this easy
          sd_id128_get_machine_app_specific() is provided, see below.

          sd_id128_get_machine_app_specific() is similar to
          sd_id128_get_machine(), but retrieves a machine ID that is
          specific to the application that is identified by the indicated
          application ID. It is recommended to use this function instead of
          sd_id128_get_machine() when passing an ID to untrusted
          environments, in order to make sure that the original machine ID
          may not be determined externally. This way, the ID used by the
          application remains stable on a given machine, but cannot be
          easily correlated with IDs used in other applications on the same
          machine. The application-specific ID should be generated via a
          tool like systemd-id128 new, and may be compiled into the
          application. This function will return the same
          application-specific ID for each combination of machine ID and
          application ID. Internally, this function calculates HMAC-SHA256
          of the application ID, keyed by the machine ID.

          sd_id128_get_boot() returns the boot ID of the executing kernel.
          This reads and parses the /proc/sys/kernel/random/boot_id file
          exposed by the kernel. It is randomly generated early at boot and
          is unique for every running kernel instance. See random(4) for
          more information. This function also internally caches the
          returned ID to make this call a cheap operation. It is
          recommended to use this ID as-is only in trusted environments. In
          untrusted environments it is recommended to derive an application
          specific ID using sd_id128_get_machine_app_specific(), see below.

          sd_id128_get_boot_app_specific() is analogous to
          sd_id128_get_machine_app_specific() but returns an ID that
          changes between boots. Some machines may be used for a long time
          without rebooting, hence the boot ID may remain constant for a
          long time, and has properties similar to the machine ID during
          that time.

          sd_id128_get_invocation() returns the invocation ID of the
          currently executed service. In its current implementation, this
          reads and parses the $INVOCATION_ID environment variable that the
          service manager sets when activating a service, see
          systemd.exec(5) for details. The ID is cached internally. In
          future a different mechanism to determine the invocation ID may
          be added.

          Note that sd_id128_get_machine_app_specific(),
          sd_id128_get_boot(), sd_id128_get_boot_app_specific(), and
          sd_id128_get_invocation() always return UUID Variant 1 Version 4
          compatible IDs.  sd_id128_get_machine() will also return a UUID
          Variant 1 Version 4 compatible ID on new installations but might
          not on older. It is possible to convert the machine ID
          non-reversibly into a UUID Variant 1 Version 4 compatible one.
          For more information, see machine-id(5). It is hence guaranteed
          that these functions will never return the ID consisting of all
          zero or all one bits (SD_ID128_NULL, SD_ID128_ALLF) — with the
          possible exception of sd_id128_get_machine(), as mentioned.

          For more information about the "sd_id128_t" type see sd-id128(3).


-----------------------------------------------------------------

::

          Those calls return 0 on success (in which case ret is filled in),
          or a negative errno-style error code.

      Errors
          Returned errors may indicate the following problems:

          -ENOENT
              Returned by sd_id128_get_machine(),
              sd_id128_get_machine_app_specific(), and
              sd_id128_get_boot_app_specific() when /etc/machine-id is
              missing.

          -ENOMEDIUM
              Returned by sd_id128_get_machine(),
              sd_id128_get_machine_app_specific(), and
              sd_id128_get_boot_app_specific() when /etc/machine-id is
              empty or all zeros.

          -ENXIO
              Returned by sd_id128_get_invocation() if no invocation ID is
              set.

          -EIO
              Returned by any of the functions described here when the
              configured value has invalid format.

          -EPERM
              Requested information could not be retrieved because of
              insufficient permissions.


---------------------------------------------------

::

          These APIs are implemented as a shared library, which can be
          compiled and linked to with the libsystemd pkg-config(1) file.


---------------------------------------------------------

::

          Example 1. Application-specific machine ID

          First, generate the application ID:

              $ systemd-id128 -p new
              As string:
              c273277323db454ea63bb96e79b53e97

              As UUID:
              c2732773-23db-454e-a63b-b96e79b53e97

              As man:sd-id128(3) macro:
              #define MESSAGE_XYZ SD_ID128_MAKE(c2,73,27,73,23,db,45,4e,a6,3b,b9,6e,79,b5,3e,97)
              ...

          Then use the new identifier in an example application:

              #include <stdio.h>
              #include <systemd/sd-id128.h>

              #define OUR_APPLICATION_ID SD_ID128_MAKE(c2,73,27,73,23,db,45,4e,a6,3b,b9,6e,79,b5,3e,97)

              int main(int argc, char *argv[]) {
                sd_id128_t id;
                sd_id128_get_machine_app_specific(OUR_APPLICATION_ID, &id);
                printf("Our application ID: " SD_ID128_FORMAT_STR "\n", SD_ID128_FORMAT_VAL(id));
                return 0;
              }


---------------------------------------------------------

::

          systemd(1), systemd-id128(1), sd-id128(3), machine-id(5),
          systemd.exec(5), sd_id128_randomize(3), random(4)

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

   systemd 249                                      SD_ID128_GET_MACHINE(3)

--------------

Pages that refer to this page:
`systemd-id128(1) <../man1/systemd-id128.1.html>`__, 
`sd_bus_message_get_monotonic_usec(3) <../man3/sd_bus_message_get_monotonic_usec.3.html>`__, 
`sd-id128(3) <../man3/sd-id128.3.html>`__, 
`sd_id128_randomize(3) <../man3/sd_id128_randomize.3.html>`__, 
`sd_journal_get_cutoff_realtime_usec(3) <../man3/sd_journal_get_cutoff_realtime_usec.3.html>`__, 
`sd_journal_get_realtime_usec(3) <../man3/sd_journal_get_realtime_usec.3.html>`__, 
`machine-id(5) <../man5/machine-id.5.html>`__, 
`networkd.conf(5) <../man5/networkd.conf.5.html>`__, 
`pam_systemd(8) <../man8/pam_systemd.8.html>`__

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
