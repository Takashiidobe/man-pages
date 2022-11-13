.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

sd_bus_add_object(3) — Linux manual page
========================================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `EXAMPLES <#EXAMPLES>`__ \|       |                                   |
| `RETURN VALUE <#RETURN_VALUE>`__  |                                   |
| \| `NOTES <#NOTES>`__ \|          |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `NOTES <#NOTES>`__ \|             |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   SD_BUS_ADD_OBJECT(3)        sd_bus_add_object       SD_BUS_ADD_OBJECT(3)

NAME
-------------------------------------------------

::

          sd_bus_add_object, sd_bus_add_fallback, sd_bus_add_object_vtable,
          sd_bus_add_fallback_vtable, sd_bus_add_filter,
          SD_BUS_VTABLE_START, SD_BUS_VTABLE_END,
          SD_BUS_METHOD_WITH_NAMES_OFFSET, SD_BUS_METHOD_WITH_NAMES,
          SD_BUS_METHOD_WITH_OFFSET, SD_BUS_METHOD,
          SD_BUS_SIGNAL_WITH_NAMES, SD_BUS_SIGNAL,
          SD_BUS_WRITABLE_PROPERTY, SD_BUS_PROPERTY, SD_BUS_PARAM - Declare
          properties and methods for a D-Bus path


---------------------------------------------------------

::

          #include <systemd/sd-bus-vtable.h>

          typedef int (*sd_bus_message_handler_t)(sd_bus_message *m,
                                                  void *userdata,
                                                  sd_bus_error *ret_error);

          typedef int (*sd_bus_property_get_t)(sd_bus *bus,
                                               const char *path,
                                               const char *interface,
                                               const char *property,
                                               sd_bus_message *reply,
                                               void *userdata,
                                               sd_bus_error *ret_error);

          typedef int (*sd_bus_property_set_t)(sd_bus *bus,
                                               const char *path,
                                               const char *interface,
                                               const char *property,
                                               sd_bus_message *value,
                                               void *userdata,
                                               sd_bus_error *ret_error);

          typedef int (*sd_bus_object_find_t)(const char *path,
                                              const char *interface,
                                              void *userdata,
                                              void **ret_found,
                                              sd_bus_error *ret_error);

          int sd_bus_add_object(sd_bus *bus, sd_bus_slot **slot,
                                const char *path,
                                sd_bus_message_handler_t callback,
                                void *userdata);

          int sd_bus_add_fallback(sd_bus *bus, sd_bus_slot **slot,
                                  const char *path,
                                  sd_bus_message_handler_t callback,
                                  void *userdata);

          int sd_bus_add_object_vtable(sd_bus *bus, sd_bus_slot **slot,
                                       const char *path,
                                       const char *interface,
                                       const sd_bus_vtable *vtable,
                                       void *userdata);

          int sd_bus_add_fallback_vtable(sd_bus *bus, sd_bus_slot **slot,
                                         const char *prefix,
                                         const char *interface,
                                         const sd_bus_vtable *vtable,
                                         sd_bus_object_find_t find,
                                         void *userdata);

          int sd_bus_add_filter(sd_bus *bus, sd_bus_slot **slot,
                                sd_bus_message_handler_t callback,
                                void *userdata);

          SD_BUS_VTABLE_START(flags)

          SD_BUS_VTABLE_END

          SD_BUS_METHOD_WITH_ARGS_OFFSET( member, args, result, handler,
          offset, flags)

          SD_BUS_METHOD_WITH_ARGS( member, args, result, handler, flags)

          SD_BUS_METHOD_WITH_NAMES_OFFSET( member, signature, in_names,
          result, out_names, handler, offset, flags)

          SD_BUS_METHOD_WITH_NAMES( member, signature, in_names, result,
          out_names, handler, flags)

          SD_BUS_METHOD_WITH_OFFSET( member, signature, result, handler,
          offset, flags)

          SD_BUS_METHOD( member, signature, result, handler, flags)

          SD_BUS_SIGNAL_WITH_ARGS( member, args, flags)

          SD_BUS_SIGNAL_WITH_NAMES( member, signature, names, flags)

          SD_BUS_SIGNAL( member, signature, flags)

          SD_BUS_WRITABLE_PROPERTY( member, signature, get, set, offset,
          flags)

          SD_BUS_PROPERTY( member, signature, get, offset, flags)

          SD_BUS_PARAM(name) SD_BUS_ARGS(...)  SD_BUS_RESULT(...)
          SD_BUS_NO_ARGS SD_BUS_NO_RESULT


---------------------------------------------------------------

::

          sd_bus_add_object_vtable() is used to declare attributes for the
          object path path connected to the bus connection bus under the
          interface interface. The table vtable may contain property
          declarations using SD_BUS_PROPERTY() or
          SD_BUS_WRITABLE_PROPERTY(), method declarations using
          SD_BUS_METHOD(), SD_BUS_METHOD_WITH_NAMES(),
          SD_BUS_METHOD_WITH_OFFSET(), or
          SD_BUS_METHOD_WITH_NAMES_OFFSET(), and signal declarations using
          SD_BUS_SIGNAL_WITH_NAMES() or SD_BUS_SIGNAL(), see below. The
          userdata parameter contains a pointer that will be passed to
          various callback functions. It may be specified as NULL if no
          value is necessary. An interface can have any number of vtables
          attached to it.

          sd_bus_add_fallback_vtable() is similar to
          sd_bus_add_object_vtable(), but is used to register "fallback"
          attributes. When looking for an attribute declaration, bus object
          paths registered with sd_bus_add_object_vtable() are checked
          first. If no match is found, the fallback vtables are checked for
          each prefix of the bus object path, i.e. with the last
          slash-separated components successively removed. This allows the
          vtable to be used for an arbitrary number of dynamically created
          objects.

          Parameter find is a function which is used to locate the target
          object based on the bus object path path. It must return 1 and
          set the ret_found output parameter if the object is found, return
          0 if the object was not found, and return a negative errno-style
          error code or initialize the error structure ret_error on error.
          The pointer passed in ret_found will be used as the userdata
          parameter for the callback functions (offset by the offset
          offsets as specified in the vtable entries).

          sd_bus_add_object() attaches a callback directly to the object
          path path. An object path can have any number of callbacks
          attached to it. Each callback is prepended to the list of
          callbacks which are always called in order.
          sd_bus_add_fallback() is similar to sd_bus_add_object() but
          applies to fallback paths instead.

          sd_bus_add_filter() installs a callback that is invoked for each
          incoming D-Bus message. Filters can be used to handle logic
          common to all messages received by a service (e.g. authentication
          or authorization).

          When a request is received, any associated callbacks are called
          sequentially until a callback returns a non-zero integer. Return
          zero from a callback to give other callbacks the chance to
          process the request. Callbacks are called in the following order:
          first, global callbacks installed with sd_bus_add_filter() are
          called. Second, callbacks attached directly to the request object
          path are called, followed by any D-Bus method callbacks attached
          to the request object path, interface and member. Finally, the
          property callbacks attached to the request object path, interface
          and member are called. If the final callback returns zero, an
          error reply is sent back to the caller indicating no matching
          object for the request was found.

          Note that you can return a positive integer from a method
          callback without immediately sending a reply. This informs sd-bus
          this callback will take responsibility for replying to the
          request without forcing the callback to produce a reply
          immediately. This allows a callback to perform any number of
          asynchronous operations required to construct a reply. However,
          if producing a reply takes too long, the method call will time
          out at the caller. This is only available to methods and not
          properties.

          If a callback was invoked to handle a request that expects a
          reply and the callback returns a negative value, the value is
          interpreted as a negative errno-style error code and sent back to
          the caller as a D-Bus error as if sd_bus_reply_method_errno(3)
          was called. Additionally, all callbacks take a sd_bus_error
          output parameter that can be used to provide more detailed error
          information. If ret_error is set when the callback finishes, the
          corresponding D-Bus error is sent back to the caller as if
          sd_bus_reply_method_error(3) was called. Any error stored in
          ret_error takes priority over any negative values returned by the
          same callback when determining which error to send back to the
          caller. Use sd_bus_error_set(3) or one of its variants to set
          ret_error and return a negative integer from a callback with a
          single function call. To send an error reply after a callback has
          already finished, use sd_bus_reply_method_errno(3) or one of its
          variants.

          For all functions, a match slot is created internally. If the
          output parameter slot is NULL, a "floating" slot object is
          created, see sd_bus_slot_set_floating(3). Otherwise, a pointer to
          the slot object is returned. In that case, the reference to the
          slot object should be dropped when the vtable is not needed
          anymore, see sd_bus_slot_unref(3).

      The sd_bus_vtable array
          The array consists of the structures of type sd_bus_vtable, but
          it should never be filled in manually, but through one of the
          following macros:

          SD_BUS_VTABLE_START(), SD_BUS_VTABLE_END
              Those must always be the first and last element.

          SD_BUS_METHOD_WITH_ARGS_OFFSET(), SD_BUS_METHOD_WITH_ARGS()
              Declare a D-Bus method with the name member, arguments args
              and result result.  args expects a sequence of argument
              type/name pairs wrapped in the SD_BUS_ARGS() macro. The
              elements at even indices in this list describe the types of
              the method's arguments. The method's parameter signature is
              the concatenation of all the string literals at even indices
              in args. If a method has no parameters, pass SD_BUS_NO_ARGS
              to args. The elements at uneven indices describe the names of
              the method's arguments.  result expects a sequence of
              type/name pairs wrapped in the SD_BUS_RESULT() macro in the
              same format as SD_BUS_ARGS(). The method's result signature
              is the concatenation of all the string literals at even
              indices in result. If a method has no result, pass
              SD_BUS_NO_RESULT to result. Note that argument types are
              expected to be quoted string literals and argument names are
              expected to be unquoted string literals. See below for a
              complete example.

              The handler function handler must be of type
              sd_bus_message_handler_t. It will be called to handle the
              incoming messages that call this method. It receives a
              pointer that is the userdata parameter passed to the
              registration function offset by offset bytes. This may be
              used to pass pointers to different fields in the same data
              structure to different methods in the same vtable. To send a
              reply from handler, call sd_bus_reply_method_return(3) with
              the message the callback was invoked with. Parameter flags is
              a combination of flags, see below.

              SD_BUS_METHOD_WITH_ARGS() is a shorthand for calling
              SD_BUS_METHOD_WITH_ARGS_OFFSET() with an offset of zero.

          SD_BUS_METHOD_WITH_NAMES_OFFSET(), SD_BUS_METHOD_WITH_NAMES(),
          SD_BUS_METHOD_WITH_OFFSET(), SD_BUS_METHOD()
              Declare a D-Bus method with the name member, parameter
              signature signature, result signature result. Parameters
              in_names and out_names specify the argument names of the
              input and output arguments in the function signature.
              in_names and out_names should be created using the
              SD_BUS_PARAM() macro, see below. In all other regards, this
              macro behaves exactly the same as
              SD_BUS_METHOD_WITH_ARGS_OFFSET().

              SD_BUS_METHOD_WITH_NAMES(), SD_BUS_METHOD_WITH_OFFSET(), and
              SD_BUS_METHOD() are variants which specify zero offset
              (userdata parameter is passed with no change), leave the
              names unset (i.e. no parameter names), or both.

              Prefer using SD_BUS_METHOD_WITH_ARGS_OFFSET() and
              SD_BUS_METHOD_WITH_ARGS() over these macros as they allow
              specifying argument types and names next to each other which
              is less error-prone than first specifying all argument types
              followed by specifying all argument names.

          SD_BUS_SIGNAL_WITH_ARGS()
              Declare a D-Bus signal with the name member and arguments
              args.  args expects a sequence of argument type/name pairs
              wrapped in the SD_BUS_ARGS() macro. The elements at even
              indices in this list describe the types of the signal's
              arguments. The signal's parameter signature is the
              concatenation of all the string literals at even indices in
              args. If a signal has no parameters, pass SD_BUS_NO_ARGS to
              args. The elements at uneven indices describe the names of
              the signal's arguments. Parameter flags is a combination of
              flags. See below for a complete example.

          SD_BUS_SIGNAL_WITH_NAMES(), SD_BUS_SIGNAL()
              Declare a D-Bus signal with the name member, parameter
              signature signature, and argument names names.  names should
              be created using the SD_BUS_PARAM() macro, see below.
              Parameter flags is a combination of flags, see below.

              SD_BUS_SIGNAL() is equivalent to SD_BUS_SIGNAL_WITH_NAMES()
              with the names parameter unset (i.e. no parameter names).

              Prefer using SD_BUS_SIGNAL_WITH_ARGS() over these macros as
              it allows specifying argument types and names next to each
              other which is less error-prone than first specifying all
              argument types followed by specifying all argument names.

          SD_BUS_WRITABLE_PROPERTY(), SD_BUS_PROPERTY()
              Declare a D-Bus property with the name member and value
              signature signature. Parameters get and set are the getter
              and setter methods. They are called with a pointer that is
              the userdata parameter passed to the registration function
              offset by offset bytes. This may be used pass pointers to
              different fields in the same data structure to different
              setters and getters in the same vtable. Parameter flags is a
              combination of flags, see below.

              The setter and getter methods may be omitted (specified as
              NULL), if the property is one of the basic types or "as" in
              case of read-only properties. In those cases, the userdata
              and offset parameters must together point to a valid variable
              of the corresponding type. A default setter and getter will
              be provided, which simply copy the argument between this
              variable and the message.

              SD_BUS_PROPERTY() is used to define a read-only property.

          SD_BUS_PARAM()
              Parameter names should be wrapped in this macro, see the
              example below.

      Flags
          The flags parameter is used to specify a combination of D-Bus
          annotations[1].

          SD_BUS_VTABLE_DEPRECATED
              Mark this vtable entry as deprecated using the
              org.freedesktop.DBus.Deprecated annotation in introspection
              data. If specified for SD_BUS_VTABLE_START(), the annotation
              is applied to the enclosing interface.

          SD_BUS_VTABLE_HIDDEN
              Make this vtable entry hidden. It will not be shown in
              introspection data. If specified for SD_BUS_VTABLE_START(),
              all entries in the array are hidden.

          SD_BUS_VTABLE_UNPRIVILEGED
              Mark this vtable entry as unprivileged. If not specified, the
              org.freedesktop.systemd1.Privileged annotation with value
              "true" will be shown in introspection data.

          SD_BUS_VTABLE_METHOD_NO_REPLY
              Mark his vtable entry as a method that will not return a
              reply using the org.freedesktop.DBus.Method.NoReply
              annotation in introspection data.

          SD_BUS_VTABLE_PROPERTY_CONST,
          SD_BUS_VTABLE_PROPERTY_EMITS_CHANGE,
          SD_BUS_VTABLE_PROPERTY_EMITS_INVALIDATION
              Those three flags correspond to different values of the
              org.freedesktop.DBus.Property.EmitsChangedSignal annotation,
              which specifies whether the
              org.freedesktop.DBus.Properties.PropertiesChanged signal is
              emitted whenever the property changes.
              SD_BUS_VTABLE_PROPERTY_CONST corresponds to const and means
              that the property never changes during the lifetime of the
              object it belongs to, so no signal needs to be emitted.
              SD_BUS_VTABLE_PROPERTY_EMITS_CHANGE corresponds to true and
              means that the signal is emitted.
              SD_BUS_VTABLE_PROPERTY_EMITS_INVALIDATION corresponds to
              invalidates and means that the signal is emitted, but the
              value is not included in the signal.

          SD_BUS_VTABLE_PROPERTY_EXPLICIT
              Mark this vtable property entry as requiring explicit request
              to for the value to be shown (generally because the value is
              large or slow to calculate). This entry cannot be combined
              with SD_BUS_VTABLE_PROPERTY_EMITS_CHANGE, and will not be
              shown in property listings by default (e.g.  busctl
              introspect). This corresponds to the
              org.freedesktop.systemd1.Explicit annotation in introspection
              data.

          SD_BUS_VTABLE_SENSITIVE
              Mark this vtable method entry as processing sensitive data.
              When set, incoming method call messages and their outgoing
              reply messages are marked as sensitive using
              sd_bus_message_sensitive(3), so that they are erased from
              memory when freed.

          SD_BUS_VTABLE_ABSOLUTE_OFFSET
              Mark this vtable method or property entry so that the user
              data pointer passed to its associated handler functions is
              determined slightly differently: instead of adding the offset
              parameter of the entry to the user data pointer specified
              during vtable registration, the offset is passed directly,
              converted to a pointer, without taking the user data pointer
              specified during vtable registration into account.


---------------------------------------------------------

::

          Example 1. Create a simple listener on the bus

              #include <errno.h>
              #include <stdbool.h>
              #include <stddef.h>
              #include <stdlib.h>
              #include <stdio.h>
              #include <systemd/sd-bus.h>

              #define _cleanup_(f) __attribute__((cleanup(f)))

              typedef struct object {
                char *name;
                uint32_t number;
              } object;

              static int method(sd_bus_message *m, void *userdata, sd_bus_error *error) {
                printf("Got called with userdata=%p\n", userdata);
                return 1;
              }

              static const sd_bus_vtable vtable[] = {
                      SD_BUS_VTABLE_START(0),
                      SD_BUS_METHOD(
                          "Method1", "s", "s", method, 0),
                      SD_BUS_METHOD_WITH_NAMES_OFFSET(
                          "Method2",
                          "so", SD_BUS_PARAM(string) SD_BUS_PARAM(path),
                          "s", SD_BUS_PARAM(returnstring),
                          method, offsetof(object, number),
                          SD_BUS_VTABLE_DEPRECATED),
                      SD_BUS_METHOD_WITH_ARGS_OFFSET(
                          "Method3",
                          SD_BUS_ARGS("s", string, "o", path),
                          SD_BUS_RESULT("s", returnstring),
                          method, offsetof(object, number),
                          SD_BUS_VTABLE_UNPRIVILEGED),
                      SD_BUS_METHOD_WITH_ARGS(
                          "Method4",
                          SD_BUS_NO_ARGS,
                          SD_BUS_NO_RESULT,
                          method,
                          SD_BUS_VTABLE_UNPRIVILEGED),
                      SD_BUS_SIGNAL(
                          "Signal1",
                          "so",
                          0),
                      SD_BUS_SIGNAL_WITH_NAMES(
                          "Signal2",
                          "so", SD_BUS_PARAM(string) SD_BUS_PARAM(path),
                          0),
                      SD_BUS_SIGNAL_WITH_ARGS(
                          "Signal3",
                          SD_BUS_ARGS("s", string, "o", path),
                          0),
                      SD_BUS_WRITABLE_PROPERTY(
                          "AutomaticStringProperty", "s", NULL, NULL,
                          offsetof(object, name),
                          SD_BUS_VTABLE_PROPERTY_EMITS_CHANGE),
                      SD_BUS_WRITABLE_PROPERTY(
                          "AutomaticIntegerProperty", "u", NULL, NULL,
                          offsetof(object, number),
                          SD_BUS_VTABLE_PROPERTY_EMITS_INVALIDATION),
                      SD_BUS_VTABLE_END
              };

              #define check(x) ({                             \
                int r = x;                                    \
                errno = r < 0 ? -r : 0;                       \
                printf(#x ": %m\n");                          \
                if (r < 0)                                    \
                  return EXIT_FAILURE;                        \
                })

              int main(int argc, char **argv) {
                _cleanup_(sd_bus_flush_close_unrefp) sd_bus *bus = NULL;

                sd_bus_default(&bus);

                object object = { .number = 666 };
                check((object.name = strdup("name")) != NULL);

                check(sd_bus_add_object_vtable(bus, NULL, "/object",
                                               "org.freedesktop.systemd.VtableExample",
                                               vtable,
                                               &object));

                for (;;) {
                  check(sd_bus_wait(bus, UINT64_MAX));
                  check(sd_bus_process(bus, NULL));
                }

                free(object.name);

                return 0;
              }

          This creates a simple client on the bus (the user bus, when run
          as normal user). We may use the D-Bus
          org.freedesktop.DBus.Introspectable.Introspect call to acquire
          the XML description of the interface:

              <!DOCTYPE node PUBLIC "-//freedesktop//DTD D-BUS Object Introspection 1.0//EN"
              "http://www.freedesktop.org/standards/dbus/1.0/introspect.dtd">
              <node>
               <interface name="org.freedesktop.DBus.Peer">
                <method name="Ping"/>
                <method name="GetMachineId">
                 <arg type="s" name="machine_uuid" direction="out"/>
                </method>
               </interface>
               <interface name="org.freedesktop.DBus.Introspectable">
                <method name="Introspect">
                 <arg name="data" type="s" direction="out"/>
                </method>
               </interface>
               <interface name="org.freedesktop.DBus.Properties">
                <method name="Get">
                 <arg name="interface" direction="in" type="s"/>
                 <arg name="property" direction="in" type="s"/>
                 <arg name="value" direction="out" type="v"/>
                </method>
                <method name="GetAll">
                 <arg name="interface" direction="in" type="s"/>
                 <arg name="properties" direction="out" type="a{sv}"/>
                </method>
                <method name="Set">
                 <arg name="interface" direction="in" type="s"/>
                 <arg name="property" direction="in" type="s"/>
                 <arg name="value" direction="in" type="v"/>
                </method>
                <signal name="PropertiesChanged">
                 <arg type="s" name="interface"/>
                 <arg type="a{sv}" name="changed_properties"/>
                 <arg type="as" name="invalidated_properties"/>
                </signal>
               </interface>
               <interface name="org.freedesktop.systemd.VtableExample">
                <method name="Method1">
                 <arg type="s" direction="in"/>
                 <arg type="s" direction="out"/>
                </method>
                <method name="Method2">
                 <arg type="s" name="string" direction="in"/>
                 <arg type="o" name="path" direction="in"/>
                 <arg type="s" name="returnstring" direction="out"/>
                 <annotation name="org.freedesktop.DBus.Deprecated" value="true"/>
                </method>
                <property name="AutomaticStringProperty" type="s" access="readwrite">
                </property>
                <property name="AutomaticIntegerProperty" type="u" access="readwrite">
                 <annotation name="org.freedesktop.DBus.Property.EmitsChangedSignal" value="invalidates"/>
                </property>
               </interface>
              </node>


-----------------------------------------------------------------

::

          On success, sd_bus_add_object_vtable() and
          sd_bus_add_fallback_vtable() return a non-negative integer. On
          failure, they return a negative errno-style error code.

      Errors
          Returned errors may indicate the following problems:

          -EINVAL
              One of the required parameters is NULL or invalid. A reserved
              D-Bus interface was passed as the interface parameter.

          -ENOPKG
              The bus cannot be resolved.

          -ECHILD
              The bus was created in a different process.

          -ENOMEM
              Memory allocation failed.

          -EPROTOTYPE
              sd_bus_add_object_vtable() and sd_bus_add_fallback_vtable()
              have been both called for the same bus object path, which is
              not allowed.

          -EEXIST
              This vtable has already been registered for this interface
              and path.


---------------------------------------------------

::

          These APIs are implemented as a shared library, which can be
          compiled and linked to with the libsystemd pkg-config(1) file.


---------------------------------------------------------

::

          sd-bus(3), busctl(1), sd_bus_emit_properties_changed(3),
          sd_bus_emit_object_added(3)

.. _notes-top-1:


---------------------------------------------------

::

           1. D-Bus annotations
              https://dbus.freedesktop.org/doc/dbus-specification.html#introspection-format

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

   systemd 249                                         SD_BUS_ADD_OBJECT(3)

--------------

Pages that refer to this page: `sd-bus(3) <../man3/sd-bus.3.html>`__, 
`sd_bus_add_node_enumerator(3) <../man3/sd_bus_add_node_enumerator.3.html>`__, 
`sd_bus_add_object_manager(3) <../man3/sd_bus_add_object_manager.3.html>`__, 
`sd_bus_call(3) <../man3/sd_bus_call.3.html>`__, 
`sd_bus_slot_set_userdata(3) <../man3/sd_bus_slot_set_userdata.3.html>`__

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
