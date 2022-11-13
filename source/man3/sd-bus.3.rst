.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

sd-bus(3) — Linux manual page
=============================

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

   SD-BUS(3)                        sd-bus                        SD-BUS(3)

NAME
-------------------------------------------------

::

          sd-bus - A lightweight D-Bus IPC client library


---------------------------------------------------------

::

          #include <systemd/sd-bus.h>

          pkg-config --cflags --libs libsystemd


---------------------------------------------------------------

::

          sd-bus.h provides an implementation of a D-Bus IPC client. See
          https://www.freedesktop.org/software/dbus/ for more information
          about D-Bus IPC.

          See

              sd_bus_add_match(3),
              sd_bus_add_object(3),
              sd_bus_add_object_manager(3),
              sd_bus_add_object_vtable(3),
              sd_bus_add_fallback(3),
              sd_bus_add_fallback_vtable(3),
              sd_bus_add_filter(3),
              sd_bus_add_node_enumerator(3),
              sd_bus_attach_event(3),
              sd_bus_call(3),
              sd_bus_call_async(3),
              sd_bus_call_method(3),
              sd_bus_call_method_async(3),
              sd_bus_can_send(3),
              sd_bus_close(3),
              sd_bus_creds_get_pid(3),
              sd_bus_creds_new_from_pid(3),
              sd_bus_default(3),
              sd_bus_emit_interfaces_added(3),
              sd_bus_emit_interfaces_added_strv(3),
              sd_bus_emit_interfaces_removed(3),
              sd_bus_emit_interfaces_removed_strv(3),
              sd_bus_emit_object_added(3),
              sd_bus_emit_object_removed(3),
              sd_bus_emit_properties_changed(3),
              sd_bus_emit_properties_changed_strv(3),
              sd_bus_emit_signal(3),
              sd_bus_emit_signalv(3),
              sd-bus-errors(3),
              sd_bus_error(3),
              sd_bus_error_add_map(3),
              sd_bus_get_address(3),
              sd_bus_get_allow_interactive_authorization(3),
              sd_bus_get_bus_id(3),
              sd_bus_get_creds_mask(3),
              sd_bus_get_current_handler(3),
              sd_bus_get_current_message(3),
              sd_bus_get_current_slot(3),
              sd_bus_get_current_userdata(3),
              sd_bus_get_exit_on_disconnect(3),
              sd_bus_get_fd(3),
              sd_bus_get_method_call_timeout(3),
              sd_bus_get_n_queued_read(3),
              sd_bus_get_name_creds(3),
              sd_bus_get_name_machine_id(3),
              sd_bus_get_owner_creds(3),
              sd_bus_get_property(3),
              sd_bus_get_property_string(3),
              sd_bus_get_property_strv(3),
              sd_bus_get_property_trivial(3),
              sd_bus_get_scope(3),
              sd_bus_get_tid(3),
              sd_bus_get_unique_name(3),
              sd_bus_interface_name_is_valid(3),
              sd_bus_is_bus_client(3),
              sd_bus_is_monitor(3),
              sd_bus_is_server(3),
              sd_bus_list_names(3),
              sd_bus_message_append(3),
              sd_bus_message_append_array(3),
              sd_bus_message_append_basic(3),
              sd_bus_message_append_string_memfd(3),
              sd_bus_message_append_strv(3),
              sd_bus_message_at_end(3),
              sd_bus_message_close_container(3),
              sd_bus_message_copy(3),
              sd_bus_message_dump(3),
              sd_bus_message_enter_container(3),
              sd_bus_message_exit_container(3),
              sd_bus_message_get_allow_interactive_authorization(3),
              sd_bus_message_get_cookie(3),
              sd_bus_message_get_creds(3),
              sd_bus_message_get_errno(3),
              sd_bus_message_get_error(3),
              sd_bus_message_get_monotonic_usec(3),
              sd_bus_message_get_sender(3),
              sd_bus_message_get_signature(3),
              sd_bus_message_get_type(3),
              sd_bus_message_new(3),
              sd_bus_message_new_method_call(3),
              sd_bus_message_new_method_error(3),
              sd_bus_message_new_signal(3),
              sd_bus_message_open_container(3),
              sd_bus_message_peek_type(3),
              sd_bus_message_read(3),
              sd_bus_message_read_array(3),
              sd_bus_message_read_basic(3),
              sd_bus_message_read_strv(3),
              sd_bus_message_rewind(3),
              sd_bus_message_seal(3),
              sd_bus_message_send(3),
              sd_bus_message_set_allow_interactive_authorization(3),
              sd_bus_message_set_destination(3),
              sd_bus_message_set_expect_reply(3),
              sd_bus_message_set_sender(3),
              sd_bus_message_skip(3),
              sd_bus_message_verify_type(3),
              sd_bus_negotiate_fds(3),
              sd_bus_new(3),
              sd_bus_path_encode(3),
              sd_bus_process(3),
              sd_bus_query_sender_creds(3),
              sd_bus_query_sender_privilege(3),
              sd_bus_reply_method_error(3),
              sd_bus_reply_method_return(3),
              sd_bus_request_name(3),
              sd_bus_send(3),
              sd_bus_send_to(3),
              sd_bus_set_address(3),
              sd_bus_set_allow_interactive_authorization(3),
              sd_bus_set_bus_client(3),
              sd_bus_set_close_on_exit(3),
              sd_bus_set_connected_signal(3),
              sd_bus_set_description(3),
              sd_bus_set_exit_on_disconnect(3),
              sd_bus_set_method_call_timeout(3),
              sd_bus_set_monitor(3),
              sd_bus_set_property(3),
              sd_bus_set_propertyv(3),
              sd_bus_set_sender(3),
              sd_bus_set_server(3),
              sd_bus_set_watch_bind(3)
              sd_bus_slot_get_current_handler(3),
              sd_bus_slot_get_current_message(3),
              sd_bus_slot_get_current_userdata(3),
              sd_bus_slot_set_description(3),
              sd_bus_slot_set_destroy_callback(3),
              sd_bus_slot_set_floating(3),
              sd_bus_slot_set_userdata(3),
              sd_bus_start(3),
              sd_bus_track_add_name(3),
              sd_bus_track_new(3)

          for more information about the functions available.


---------------------------------------------------

::

          These APIs are implemented as a shared library, which can be
          compiled and linked to with the libsystemd pkg-config(1) file.


---------------------------------------------------------

::

          systemd(1), sd-event(3), busctl(1), dbus-daemon(1), dbus-send(1)

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

   systemd 249                                                    SD-BUS(3)

--------------

Pages that refer to this page: `busctl(1) <../man1/busctl.1.html>`__, 
`sd_bus_add_match(3) <../man3/sd_bus_add_match.3.html>`__, 
`sd_bus_add_node_enumerator(3) <../man3/sd_bus_add_node_enumerator.3.html>`__, 
`sd_bus_add_object(3) <../man3/sd_bus_add_object.3.html>`__, 
`sd_bus_add_object_manager(3) <../man3/sd_bus_add_object_manager.3.html>`__, 
`sd_bus_attach_event(3) <../man3/sd_bus_attach_event.3.html>`__, 
`sd_bus_call(3) <../man3/sd_bus_call.3.html>`__, 
`sd_bus_call_method(3) <../man3/sd_bus_call_method.3.html>`__, 
`sd_bus_can_send(3) <../man3/sd_bus_can_send.3.html>`__, 
`sd_bus_close(3) <../man3/sd_bus_close.3.html>`__, 
`sd_bus_creds_get_pid(3) <../man3/sd_bus_creds_get_pid.3.html>`__, 
`sd_bus_creds_new_from_pid(3) <../man3/sd_bus_creds_new_from_pid.3.html>`__, 
`sd_bus_default(3) <../man3/sd_bus_default.3.html>`__, 
`sd_bus_emit_signal(3) <../man3/sd_bus_emit_signal.3.html>`__, 
`sd_bus_enqueue_for_read(3) <../man3/sd_bus_enqueue_for_read.3.html>`__, 
`sd_bus_error(3) <../man3/sd_bus_error.3.html>`__, 
`sd_bus_error_add_map(3) <../man3/sd_bus_error_add_map.3.html>`__, 
`sd-bus-errors(3) <../man3/sd-bus-errors.3.html>`__, 
`sd_bus_get_current_handler(3) <../man3/sd_bus_get_current_handler.3.html>`__, 
`sd_bus_get_fd(3) <../man3/sd_bus_get_fd.3.html>`__, 
`sd_bus_get_name_creds(3) <../man3/sd_bus_get_name_creds.3.html>`__, 
`sd_bus_get_name_machine_id(3) <../man3/sd_bus_get_name_machine_id.3.html>`__, 
`sd_bus_get_n_queued_read(3) <../man3/sd_bus_get_n_queued_read.3.html>`__, 
`sd_bus_interface_name_is_valid(3) <../man3/sd_bus_interface_name_is_valid.3.html>`__, 
`sd_bus_is_open(3) <../man3/sd_bus_is_open.3.html>`__, 
`sd_bus_list_names(3) <../man3/sd_bus_list_names.3.html>`__, 
`sd_bus_message_append(3) <../man3/sd_bus_message_append.3.html>`__, 
`sd_bus_message_append_array(3) <../man3/sd_bus_message_append_array.3.html>`__, 
`sd_bus_message_append_basic(3) <../man3/sd_bus_message_append_basic.3.html>`__, 
`sd_bus_message_append_string_memfd(3) <../man3/sd_bus_message_append_string_memfd.3.html>`__, 
`sd_bus_message_append_strv(3) <../man3/sd_bus_message_append_strv.3.html>`__, 
`sd_bus_message_at_end(3) <../man3/sd_bus_message_at_end.3.html>`__, 
`sd_bus_message_copy(3) <../man3/sd_bus_message_copy.3.html>`__, 
`sd_bus_message_dump(3) <../man3/sd_bus_message_dump.3.html>`__, 
`sd_bus_message_get_cookie(3) <../man3/sd_bus_message_get_cookie.3.html>`__, 
`sd_bus_message_get_monotonic_usec(3) <../man3/sd_bus_message_get_monotonic_usec.3.html>`__, 
`sd_bus_message_get_signature(3) <../man3/sd_bus_message_get_signature.3.html>`__, 
`sd_bus_message_get_type(3) <../man3/sd_bus_message_get_type.3.html>`__, 
`sd_bus_message_new(3) <../man3/sd_bus_message_new.3.html>`__, 
`sd_bus_message_new_method_call(3) <../man3/sd_bus_message_new_method_call.3.html>`__, 
`sd_bus_message_new_method_error(3) <../man3/sd_bus_message_new_method_error.3.html>`__, 
`sd_bus_message_new_signal(3) <../man3/sd_bus_message_new_signal.3.html>`__, 
`sd_bus_message_open_container(3) <../man3/sd_bus_message_open_container.3.html>`__, 
`sd_bus_message_read(3) <../man3/sd_bus_message_read.3.html>`__, 
`sd_bus_message_read_array(3) <../man3/sd_bus_message_read_array.3.html>`__, 
`sd_bus_message_read_basic(3) <../man3/sd_bus_message_read_basic.3.html>`__, 
`sd_bus_message_read_strv(3) <../man3/sd_bus_message_read_strv.3.html>`__, 
`sd_bus_message_rewind(3) <../man3/sd_bus_message_rewind.3.html>`__, 
`sd_bus_message_seal(3) <../man3/sd_bus_message_seal.3.html>`__, 
`sd_bus_message_sensitive(3) <../man3/sd_bus_message_sensitive.3.html>`__, 
`sd_bus_message_set_destination(3) <../man3/sd_bus_message_set_destination.3.html>`__, 
`sd_bus_message_set_expect_reply(3) <../man3/sd_bus_message_set_expect_reply.3.html>`__, 
`sd_bus_message_skip(3) <../man3/sd_bus_message_skip.3.html>`__, 
`sd_bus_message_verify_type(3) <../man3/sd_bus_message_verify_type.3.html>`__, 
`sd_bus_negotiate_fds(3) <../man3/sd_bus_negotiate_fds.3.html>`__, 
`sd_bus_new(3) <../man3/sd_bus_new.3.html>`__, 
`sd_bus_path_encode(3) <../man3/sd_bus_path_encode.3.html>`__, 
`sd_bus_process(3) <../man3/sd_bus_process.3.html>`__, 
`sd_bus_query_sender_creds(3) <../man3/sd_bus_query_sender_creds.3.html>`__, 
`sd_bus_reply_method_error(3) <../man3/sd_bus_reply_method_error.3.html>`__, 
`sd_bus_reply_method_return(3) <../man3/sd_bus_reply_method_return.3.html>`__, 
`sd_bus_request_name(3) <../man3/sd_bus_request_name.3.html>`__, 
`sd_bus_send(3) <../man3/sd_bus_send.3.html>`__, 
`sd_bus_set_address(3) <../man3/sd_bus_set_address.3.html>`__, 
`sd_bus_set_close_on_exit(3) <../man3/sd_bus_set_close_on_exit.3.html>`__, 
`sd_bus_set_connected_signal(3) <../man3/sd_bus_set_connected_signal.3.html>`__, 
`sd_bus_set_description(3) <../man3/sd_bus_set_description.3.html>`__, 
`sd_bus_set_exit_on_disconnect(3) <../man3/sd_bus_set_exit_on_disconnect.3.html>`__, 
`sd_bus_set_fd(3) <../man3/sd_bus_set_fd.3.html>`__, 
`sd_bus_set_method_call_timeout(3) <../man3/sd_bus_set_method_call_timeout.3.html>`__, 
`sd_bus_set_property(3) <../man3/sd_bus_set_property.3.html>`__, 
`sd_bus_set_sender(3) <../man3/sd_bus_set_sender.3.html>`__, 
`sd_bus_set_server(3) <../man3/sd_bus_set_server.3.html>`__, 
`sd_bus_set_watch_bind(3) <../man3/sd_bus_set_watch_bind.3.html>`__, 
`sd_bus_slot_get_bus(3) <../man3/sd_bus_slot_get_bus.3.html>`__, 
`sd_bus_slot_ref(3) <../man3/sd_bus_slot_ref.3.html>`__, 
`sd_bus_slot_set_description(3) <../man3/sd_bus_slot_set_description.3.html>`__, 
`sd_bus_slot_set_destroy_callback(3) <../man3/sd_bus_slot_set_destroy_callback.3.html>`__, 
`sd_bus_slot_set_floating(3) <../man3/sd_bus_slot_set_floating.3.html>`__, 
`sd_bus_slot_set_userdata(3) <../man3/sd_bus_slot_set_userdata.3.html>`__, 
`sd_bus_start(3) <../man3/sd_bus_start.3.html>`__, 
`sd_bus_track_add_name(3) <../man3/sd_bus_track_add_name.3.html>`__, 
`sd_bus_track_new(3) <../man3/sd_bus_track_new.3.html>`__, 
`sd_bus_wait(3) <../man3/sd_bus_wait.3.html>`__, 
`systemd-machined.service(8) <../man8/systemd-machined.service.8.html>`__

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
