.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

sd-bus-errors(3) — Linux manual page
====================================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `NOTES <#NOTES>`__ \|             |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   SD-BUS-ERRORS(3)              sd-bus-errors             SD-BUS-ERRORS(3)

NAME
-------------------------------------------------

::

          sd-bus-errors, SD_BUS_ERROR_FAILED, SD_BUS_ERROR_NO_MEMORY,
          SD_BUS_ERROR_SERVICE_UNKNOWN, SD_BUS_ERROR_NAME_HAS_NO_OWNER,
          SD_BUS_ERROR_NO_REPLY, SD_BUS_ERROR_IO_ERROR,
          SD_BUS_ERROR_BAD_ADDRESS, SD_BUS_ERROR_NOT_SUPPORTED,
          SD_BUS_ERROR_LIMITS_EXCEEDED, SD_BUS_ERROR_ACCESS_DENIED,
          SD_BUS_ERROR_AUTH_FAILED, SD_BUS_ERROR_NO_SERVER,
          SD_BUS_ERROR_TIMEOUT, SD_BUS_ERROR_NO_NETWORK,
          SD_BUS_ERROR_ADDRESS_IN_USE, SD_BUS_ERROR_DISCONNECTED,
          SD_BUS_ERROR_INVALID_ARGS, SD_BUS_ERROR_FILE_NOT_FOUND,
          SD_BUS_ERROR_FILE_EXISTS, SD_BUS_ERROR_UNKNOWN_METHOD,
          SD_BUS_ERROR_UNKNOWN_OBJECT, SD_BUS_ERROR_UNKNOWN_INTERFACE,
          SD_BUS_ERROR_UNKNOWN_PROPERTY, SD_BUS_ERROR_PROPERTY_READ_ONLY,
          SD_BUS_ERROR_UNIX_PROCESS_ID_UNKNOWN,
          SD_BUS_ERROR_INVALID_SIGNATURE,
          SD_BUS_ERROR_INCONSISTENT_MESSAGE,
          SD_BUS_ERROR_MATCH_RULE_NOT_FOUND,
          SD_BUS_ERROR_MATCH_RULE_INVALID,
          SD_BUS_ERROR_INTERACTIVE_AUTHORIZATION_REQUIRED - Standard D-Bus
          error names


---------------------------------------------------------

::

          #include <systemd/sd-bus.h>

          #define SD_BUS_ERROR_FAILED                     "org.freedesktop.DBus.Error.Failed"
          #define SD_BUS_ERROR_NO_MEMORY                  "org.freedesktop.DBus.Error.NoMemory"
          #define SD_BUS_ERROR_SERVICE_UNKNOWN            "org.freedesktop.DBus.Error.ServiceUnknown"
          #define SD_BUS_ERROR_NAME_HAS_NO_OWNER          "org.freedesktop.DBus.Error.NameHasNoOwner"
          #define SD_BUS_ERROR_NO_REPLY                   "org.freedesktop.DBus.Error.NoReply"
          #define SD_BUS_ERROR_IO_ERROR                   "org.freedesktop.DBus.Error.IOError"
          #define SD_BUS_ERROR_BAD_ADDRESS                "org.freedesktop.DBus.Error.BadAddress"
          #define SD_BUS_ERROR_NOT_SUPPORTED              "org.freedesktop.DBus.Error.NotSupported"
          #define SD_BUS_ERROR_LIMITS_EXCEEDED            "org.freedesktop.DBus.Error.LimitsExceeded"
          #define SD_BUS_ERROR_ACCESS_DENIED              "org.freedesktop.DBus.Error.AccessDenied"
          #define SD_BUS_ERROR_AUTH_FAILED                "org.freedesktop.DBus.Error.AuthFailed"
          #define SD_BUS_ERROR_NO_SERVER                  "org.freedesktop.DBus.Error.NoServer"
          #define SD_BUS_ERROR_TIMEOUT                    "org.freedesktop.DBus.Error.Timeout"
          #define SD_BUS_ERROR_NO_NETWORK                 "org.freedesktop.DBus.Error.NoNetwork"
          #define SD_BUS_ERROR_ADDRESS_IN_USE             "org.freedesktop.DBus.Error.AddressInUse"
          #define SD_BUS_ERROR_DISCONNECTED               "org.freedesktop.DBus.Error.Disconnected"
          #define SD_BUS_ERROR_INVALID_ARGS               "org.freedesktop.DBus.Error.InvalidArgs"
          #define SD_BUS_ERROR_FILE_NOT_FOUND             "org.freedesktop.DBus.Error.FileNotFound"
          #define SD_BUS_ERROR_FILE_EXISTS                "org.freedesktop.DBus.Error.FileExists"
          #define SD_BUS_ERROR_UNKNOWN_METHOD             "org.freedesktop.DBus.Error.UnknownMethod"
          #define SD_BUS_ERROR_UNKNOWN_OBJECT             "org.freedesktop.DBus.Error.UnknownObject"
          #define SD_BUS_ERROR_UNKNOWN_INTERFACE          "org.freedesktop.DBus.Error.UnknownInterface"
          #define SD_BUS_ERROR_UNKNOWN_PROPERTY           "org.freedesktop.DBus.Error.UnknownProperty"
          #define SD_BUS_ERROR_PROPERTY_READ_ONLY         "org.freedesktop.DBus.Error.PropertyReadOnly"
          #define SD_BUS_ERROR_UNIX_PROCESS_ID_UNKNOWN    "org.freedesktop.DBus.Error.UnixProcessIdUnknown"
          #define SD_BUS_ERROR_INVALID_SIGNATURE          "org.freedesktop.DBus.Error.InvalidSignature"
          #define SD_BUS_ERROR_INCONSISTENT_MESSAGE       "org.freedesktop.DBus.Error.InconsistentMessage"
          #define SD_BUS_ERROR_MATCH_RULE_NOT_FOUND       "org.freedesktop.DBus.Error.MatchRuleNotFound"
          #define SD_BUS_ERROR_MATCH_RULE_INVALID         "org.freedesktop.DBus.Error.MatchRuleInvalid"
          #define SD_BUS_ERROR_INTERACTIVE_AUTHORIZATION_REQUIRED \
                                                          "org.freedesktop.DBus.Error.InteractiveAuthorizationRequired"


---------------------------------------------------------------

::

          In addition to the error names user programs define, D-Bus knows
          a number of generic, standardized error names that are listed
          below.

          In addition to this list, in sd-bus, the special error namespace
          "System.Error."  is used to map arbitrary Linux system errors (as
          defined by errno(3)) to D-Bus errors and back. For example, the
          error EUCLEAN is mapped to "System.Error.EUCLEAN" and back.

          SD_BUS_ERROR_FAILED
              A generic error indication. See the error message for further
              details. This error name should be avoided, in favor of a
              more expressive error name.

          SD_BUS_ERROR_NO_MEMORY
              A memory allocation failed, and the requested operation could
              not be completed.

          SD_BUS_ERROR_SERVICE_UNKNOWN
              The contacted bus service is unknown and cannot be activated.

          SD_BUS_ERROR_NAME_HAS_NO_OWNER
              The specified bus service name currently has no owner.

          SD_BUS_ERROR_NO_REPLY
              A message did not receive a reply. This error is usually
              generated after a timeout.

          SD_BUS_ERROR_IO_ERROR
              Generic input/output error, for example when accessing a
              socket or other I/O context.

          SD_BUS_ERROR_BAD_ADDRESS
              The specified D-Bus bus address string is malformed.

          SD_BUS_ERROR_NOT_SUPPORTED
              The requested operation is not supported on the local system.

          SD_BUS_ERROR_LIMITS_EXCEEDED
              Some limited resource has been exhausted.

          SD_BUS_ERROR_ACCESS_DENIED
              Access to a resource has been denied due to security
              restrictions.

          SD_BUS_ERROR_AUTH_FAILED
              Authentication did not complete successfully.

          SD_BUS_ERROR_NO_SERVER
              Unable to connect to the specified server.

          SD_BUS_ERROR_TIMEOUT
              An operation timed out. Note that method calls which timeout
              generate a SD_BUS_ERROR_NO_REPLY.

          SD_BUS_ERROR_NO_NETWORK
              No network available to execute requested network operation
              on.

          SD_BUS_ERROR_ADDRESS_IN_USE
              The specified network address is already being listened on.

          SD_BUS_ERROR_DISCONNECTED
              The connection has been terminated.

          SD_BUS_ERROR_INVALID_ARGS
              One or more invalid arguments have been passed.

          SD_BUS_ERROR_FILE_NOT_FOUND
              The requested file could not be found.

          SD_BUS_ERROR_FILE_EXISTS
              The requested file already exists.

          SD_BUS_ERROR_UNKNOWN_METHOD
              The requested method does not exist in the selected
              interface.

          SD_BUS_ERROR_UNKNOWN_OBJECT
              The requested object does not exist in the selected service.

          SD_BUS_ERROR_UNKNOWN_INTERFACE
              The requested interface does not exist on the selected
              object.

          SD_BUS_ERROR_UNKNOWN_PROPERTY
              The requested property does not exist in the selected
              interface.

          SD_BUS_ERROR_PROPERTY_READ_ONLY
              A write operation was requested on a read-only property.

          SD_BUS_ERROR_UNIX_PROCESS_ID_UNKNOWN
              The requested PID is not known.

          SD_BUS_ERROR_INVALID_SIGNATURE
              The specified message signature is not valid.

          SD_BUS_ERROR_INCONSISTENT_MESSAGE
              The passed message does not validate correctly.

          SD_BUS_ERROR_MATCH_RULE_NOT_FOUND
              The specified match rule does not exist.

          SD_BUS_ERROR_MATCH_RULE_INVALID
              The specified match rule is invalid.

          SD_BUS_ERROR_INTERACTIVE_AUTHORIZATION_REQUIRED
              Access to the requested operation is not permitted. However,
              it might be available after interactive authentication. This
              is usually returned by method calls supporting a framework
              for additional interactive authorization, when interactive
              authorization was not enabled with the
              sd_bus_message_set_allow_interactive_authorization(3) for the
              method call message.


---------------------------------------------------

::

          These APIs are implemented as a shared library, which can be
          compiled and linked to with the libsystemd pkg-config(1) file.


---------------------------------------------------------

::

          systemd(1), sd-bus(3), sd_bus_error(3),
          sd_bus_message_set_allow_interactive_authorization(3), errno(3),
          strerror(3)

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

   systemd 249                                             SD-BUS-ERRORS(3)

--------------

Pages that refer to this page: `sd-bus(3) <../man3/sd-bus.3.html>`__, 
`sd_bus_error(3) <../man3/sd_bus_error.3.html>`__, 
`sd_bus_error_add_map(3) <../man3/sd_bus_error_add_map.3.html>`__, 
`sd_bus_message_get_type(3) <../man3/sd_bus_message_get_type.3.html>`__

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
