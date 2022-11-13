.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

sd_bus_error(3) — Linux manual page
===================================

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

   SD_BUS_ERROR(3)               sd_bus_error               SD_BUS_ERROR(3)

NAME
-------------------------------------------------

::

          sd_bus_error, SD_BUS_ERROR_MAKE_CONST, SD_BUS_ERROR_NULL,
          sd_bus_error_free, sd_bus_error_set, sd_bus_error_setf,
          sd_bus_error_set_const, sd_bus_error_set_errno,
          sd_bus_error_set_errnof, sd_bus_error_set_errnofv,
          sd_bus_error_get_errno, sd_bus_error_copy, sd_bus_error_move,
          sd_bus_error_is_set, sd_bus_error_has_name,
          sd_bus_error_has_names_sentinel, sd_bus_error_has_names - sd-bus
          error handling


---------------------------------------------------------

::

          #include <systemd/sd-bus.h>

          typedef struct {
                  const char *name;
                  const char *message;
                  ...
          } sd_bus_error;

          SD_BUS_ERROR_MAKE_CONST(name, message)

          SD_BUS_ERROR_NULL

          void sd_bus_error_free(sd_bus_error *e);

          int sd_bus_error_set(sd_bus_error *e, const char *name,
                               const char *message);

          int sd_bus_error_setf(sd_bus_error *e, const char *name,
                                const char *format, ...);

          int sd_bus_error_set_const(sd_bus_error *e, const char *name,
                                     const char *message);

          int sd_bus_error_set_errno(sd_bus_error *e, int error);

          int sd_bus_error_set_errnof(sd_bus_error *e, int error,
                                      const char *format, ...);

          int sd_bus_error_set_errnofv(sd_bus_error *e, int error,
                                       const char *format, va_list ap);

          int sd_bus_error_get_errno(const sd_bus_error *e);

          int sd_bus_error_copy(sd_bus_error *dst, const sd_bus_error *e);

          int sd_bus_error_move(sd_bus_error *dst, sd_bus_error *e);

          int sd_bus_error_is_set(const sd_bus_error *e);

          int sd_bus_error_has_name(const sd_bus_error *e,
                                    const char *name);

          int sd_bus_error_has_names_sentinel(const sd_bus_error *e, ...);

          #define sd_bus_error_has_names(e, ...)
          sd_bus_error_has_names_sentinel(e, ..., NULL)


---------------------------------------------------------------

::

          The sd_bus_error structure carries information about a D-Bus
          error condition, or lack thereof. The functions described below
          may be used to set and query fields in this structure.

          •   The name field contains a short identifier of an error. It
              should follow the rules for error names described in the
              D-Bus specification, subsection Valid Names[1]. A number of
              common, standardized error names are described in
              sd-bus-errors(3), but additional domain-specific errors may
              be defined by applications.

          •   The message field usually contains a human-readable string
              describing the details, but might be NULL.

          An unset sd_bus_error structure should have both fields
          initialized to NULL, and signifies lack of an error, i.e.
          success. Assign SD_BUS_ERROR_NULL to the structure in order to
          initialize both fields to NULL. When no longer necessary,
          resources held by the sd_bus_error structure should be destroyed
          with sd_bus_error_free().

          sd_bus_error_set() sets an error structure to the specified name
          and message strings. The strings will be copied into internal,
          newly allocated memory. It is essential to free the contents
          again when they are not required anymore (see above). Do not use
          this call on error structures that have already been set. If you
          intend to reuse an error structure, free the old data stored in
          it with sd_bus_error_free() first.

          sd_bus_error_set() will return an errno-like value (see errno(3))
          determined from the specified error name name. If name is NULL,
          it is assumed that no error occurred, and 0 is returned. If name
          is nonnull, a negative value is always returned. If e is NULL, no
          error structure is initialized, but name is still converted into
          an errno-style value.

          Various well-known D-Bus errors are converted to well-known errno
          counterparts, and the other ones to -EIO. See sd-bus-errors(3)
          for a list of well-known error names. Additional error mappings
          may be defined with sd_bus_error_add_map(3).

          sd_bus_error_set() is designed to be conveniently used in a
          return statement. If message is NULL, no message is set. This
          call can fail if no memory may be allocated for the name and
          message strings, in which case an SD_BUS_ERROR_NO_MEMORY error
          will be set instead and -ENOMEM returned.

          sd_bus_error_setf() is similar to sd_bus_error_set(), but takes a
          printf(3) format string and corresponding arguments to generate
          the message field.

          sd_bus_error_set_const() is similar to sd_bus_error_set(), but
          the string parameters are not copied internally, and must hence
          remain constant and valid for the lifetime of e. Use this call to
          avoid memory allocations when setting error structures. Since
          this call does not allocate memory, it will not fail with an
          out-of-memory condition as sd_bus_error_set() may, as described
          above. Alternatively, the SD_BUS_ERROR_MAKE_CONST() macro may be
          used to generate a literal, constant bus error structure
          on-the-fly.

          sd_bus_error_set_errno() will immediately return 0 if the
          specified error parameter error is 0. Otherwise, it will set name
          from an errno-like value that is converted to a D-Bus error.
          strerror_r(3) will be used to set message. Well-known D-Bus error
          names will be used for name if applicable, otherwise a name in
          the "System.Error."  namespace will be generated. The sign of the
          specified error number is ignored and the absolute value is used
          implicitly. If the specified error error is non-zero, the call
          always returns a negative value, for convenient usage in return
          statements. This call might fail due to lack of memory, in which
          case an SD_BUS_ERROR_NO_MEMORY error is set instead, and -ENOMEM
          is returned.

          sd_bus_error_set_errnof() is similar to sd_bus_error_set_errno(),
          but in addition to error, takes a printf(3) format string and
          corresponding arguments. The message field will be generated from
          format and the arguments.

          sd_bus_error_set_errnofv() is similar to
          sd_bus_error_set_errnof(), but takes the format string parameters
          as va_arg(3) parameter list.

          sd_bus_error_get_errno() converts the name field of an error
          structure to an errno-like (positive) value using the same rules
          as sd_bus_error_set(). If e is NULL, 0 will be returned.

          sd_bus_error_copy() will initialize dst using the values in e, if
          e has been set with an error value before. Otherwise, it will
          return immediately. If the strings in e were set using
          sd_bus_error_set_const(), they will be shared. Otherwise, they
          will be copied. Returns a converted errno-like, negative error
          code or 0. Before this call, dst must be unset, i.e. either
          freshly initialized with NULL or reset using sd_bus_error_free().

          sd_bus_error_move() is similar to sd_bus_error_copy(), but will
          move any error information from e into dst, resetting the former.
          This function cannot fail, as no new memory is allocated. Note
          that if e is not set, dst is initialized to SD_BUS_ERROR_NULL.
          Moreover, if dst is NULL no operation is executed on it and
          resources held by e are freed and reset. Returns a converted
          errno-like, non-positive error value.

          sd_bus_error_is_set() will return a non-zero value if e is
          non-NULL and an error has been set, false otherwise.

          sd_bus_error_has_name() will return a non-zero value if e is
          non-NULL and an error with the same name has been set, false
          otherwise.

          sd_bus_error_has_names_sentinel() is similar to
          sd_bus_error_has_name(), but takes multiple names to check
          against. The list must be terminated with NULL.
          sd_bus_error_has_names() is a macro wrapper around
          sd_bus_error_has_names_sentinel() that adds the NULL sentinel
          automatically.

          sd_bus_error_free() will destroy resources held by e. The
          parameter itself will not be deallocated, and must be free(3)d by
          the caller if necessary. The function may also be called safely
          on unset errors (error structures with both fields set to NULL),
          in which case it performs no operation. This call will reset the
          error structure after freeing the data, so that all fields are
          set to NULL. The structure may be reused afterwards.


-----------------------------------------------------------------

::

          The functions sd_bus_error_set(), sd_bus_error_setf(), and
          sd_bus_error_set_const() always return 0 when the specified error
          value is NULL, and a negative errno-like value corresponding to
          the name parameter otherwise. The functions
          sd_bus_error_set_errno(), sd_bus_error_set_errnof() and
          sd_bus_error_set_errnofv(), return 0 when the specified error
          value is 0, and a negative errno-like value corresponding to the
          error parameter otherwise. If an error occurs internally, one of
          the negative error values listed below will be returned.

          sd_bus_error_get_errno() returns false when e is NULL, and a
          positive errno value mapped from e->name otherwise.

          sd_bus_error_copy() and sd_bus_error_move() return a negative
          error value converted from the source error, and zero if the
          error has not been set.

          sd_bus_error_is_set() returns a non-zero value when e and the
          name field are non-NULL, zero otherwise.

          sd_bus_error_has_name(), sd_bus_error_has_names(), and
          sd_bus_error_has_names_sentinel() return a non-zero value when e
          is non-NULL and the name field is equal to one of the given
          names, zero otherwise.


-------------------------------------------------------------------------------

::

          sd_bus_error is not reference counted. Users should destroy
          resources held by it by calling sd_bus_error_free(). Usually,
          error structures are allocated on the stack or passed in as
          function parameters, but they may also be allocated dynamically,
          in which case it is the duty of the caller to free(3) the memory
          held by the structure itself after freeing its contents with
          sd_bus_error_free().

      Errors
          Returned errors may indicate the following problems:

          -EINVAL
              Error was already set in sd_bus_error structure when one the
              error-setting functions was called.

          -ENOMEM
              Memory allocation failed.


---------------------------------------------------

::

          These APIs are implemented as a shared library, which can be
          compiled and linked to with the libsystemd pkg-config(1) file.


---------------------------------------------------------

::

          systemd(1), sd-bus(3), sd-bus-errors(3), sd_bus_error_add_map(3),
          errno(3), strerror_r(3)

.. _notes-top-1:


---------------------------------------------------

::

           1. Valid Names
              http://dbus.freedesktop.org/doc/dbus-specification.html#message-protocol-names

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

   systemd 249                                              SD_BUS_ERROR(3)

--------------

Pages that refer to this page: `sd-bus(3) <../man3/sd-bus.3.html>`__, 
`sd_bus_add_object(3) <../man3/sd_bus_add_object.3.html>`__, 
`sd_bus_call(3) <../man3/sd_bus_call.3.html>`__, 
`sd_bus_error_add_map(3) <../man3/sd_bus_error_add_map.3.html>`__, 
`sd-bus-errors(3) <../man3/sd-bus-errors.3.html>`__, 
`sd_bus_message_new_method_error(3) <../man3/sd_bus_message_new_method_error.3.html>`__, 
`sd_bus_reply_method_error(3) <../man3/sd_bus_reply_method_error.3.html>`__

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
