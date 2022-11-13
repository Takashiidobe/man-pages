.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

insque(3p) — Linux manual page
==============================

+-----------------------------------+-----------------------------------+
| `PROLOG <#PROLOG>`__ \|           |                                   |
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `RETURN VALUE <#RETURN_VALUE>`__  |                                   |
| \| `ERRORS <#ERRORS>`__ \|        |                                   |
| `EXAMPLES <#EXAMPLES>`__ \|       |                                   |
| `APPLICAT                         |                                   |
| ION USAGE <#APPLICATION_USAGE>`__ |                                   |
| \| `RATIONALE <#RATIONALE>`__ \|  |                                   |
| `FUTURE D                         |                                   |
| IRECTIONS <#FUTURE_DIRECTIONS>`__ |                                   |
| \| `SEE ALSO <#SEE_ALSO>`__ \|    |                                   |
| `COPYRIGHT <#COPYRIGHT>`__        |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   INSQUE(3P)              POSIX Programmer's Manual             INSQUE(3P)


-----------------------------------------------------

::

          This manual page is part of the POSIX Programmer's Manual.  The
          Linux implementation of this interface may differ (consult the
          corresponding Linux manual page for details of Linux behavior),
          or the interface may not be implemented on Linux.

NAME
-------------------------------------------------

::

          insque, remque — insert or remove an element in a queue


---------------------------------------------------------

::

          #include <search.h>

          void insque(void *element, void *pred);
          void remque(void *element);


---------------------------------------------------------------

::

          The insque() and remque() functions shall manipulate queues built
          from doubly-linked lists.  The queue can be either circular or
          linear. An application using insque() or remque() shall ensure it
          defines a structure in which the first two members of the
          structure are pointers to the same type of structure, and any
          further members are application-specific. The first member of the
          structure is a forward pointer to the next entry in the queue.
          The second member is a backward pointer to the previous entry in
          the queue.  If the queue is linear, the queue is terminated with
          null pointers. The names of the structure and of the pointer
          members are not subject to any special restriction.

          The insque() function shall insert the element pointed to by
          element into a queue immediately after the element pointed to by
          pred.

          The remque() function shall remove the element pointed to by
          element from a queue.

          If the queue is to be used as a linear list, invoking
          insque(&element, NULL), where element is the initial element of
          the queue, shall initialize the forward and backward pointers of
          element to null pointers.

          If the queue is to be used as a circular list, the application
          shall ensure it initializes the forward pointer and the backward
          pointer of the initial element of the queue to the element's own
          address.


-----------------------------------------------------------------

::

          The insque() and remque() functions do not return a value.


-----------------------------------------------------

::

          No errors are defined.

          The following sections are informative.


---------------------------------------------------------

::

      Creating a Linear Linked List
          The following example creates a linear linked list.

              #include <search.h>
              ...
              struct myque element1;
              struct myque element2;

              char *data1 = "DATA1";
              char *data2 = "DATA2";
              ...
              element1.data = data1;
              element2.data = data2;

              insque (&element1, NULL);
              insque (&element2, &element1);

      Creating a Circular Linked List
          The following example creates a circular linked list.

              #include <search.h>
              ...
              struct myque element1;
              struct myque element2;

              char *data1 = "DATA1";
              char *data2 = "DATA2";
              ...
              element1.data = data1;
              element2.data = data2;

              element1.fwd = &element1;
              element1.bck = &element1;

              insque (&element2, &element1);

      Removing an Element
          The following example removes the element pointed to by element1.

              #include <search.h>
              ...
              struct myque element1;
              ...
              remque (&element1);


---------------------------------------------------------------------------

::

          The historical implementations of these functions described the
          arguments as being of type struct qelem * rather than as being of
          type void * as defined here. In those implementations, struct
          qelem was commonly defined in <search.h> as:

              struct qelem {
                  struct qelem  *q_forw;
                  struct qelem  *q_back;
              };

          Applications using these functions, however, were never able to
          use this structure directly since it provided no room for the
          actual data contained in the elements. Most applications defined
          structures that contained the two pointers as the initial
          elements and also provided space for, or pointers to, the
          object's data. Applications that used these functions to update
          more than one type of table also had the problem of specifying
          two or more different structures with the same name, if they
          literally used struct qelem as specified.

          As described here, the implementations were actually expecting a
          structure type where the first two members were forward and
          backward pointers to structures. With C compilers that didn't
          provide function prototypes, applications used structures as
          specified in the DESCRIPTION above and the compiler did what the
          application expected.

          If this method had been carried forward with an ISO C standard
          compiler and the historical function prototype, most applications
          would have to be modified to cast pointers to the structures
          actually used to be pointers to struct qelem to avoid compilation
          warnings. By specifying void * as the argument type, applications
          do not need to change (unless they specifically referenced struct
          qelem and depended on it being defined in <search.h>).


-----------------------------------------------------------

::

          None.


---------------------------------------------------------------------------

::

          None.


---------------------------------------------------------

::

          The Base Definitions volume of POSIX.1‐2017, search.h(0p)


-----------------------------------------------------------

::

          Portions of this text are reprinted and reproduced in electronic
          form from IEEE Std 1003.1-2017, Standard for Information
          Technology -- Portable Operating System Interface (POSIX), The
          Open Group Base Specifications Issue 7, 2018 Edition, Copyright
          (C) 2018 by the Institute of Electrical and Electronics
          Engineers, Inc and The Open Group.  In the event of any
          discrepancy between this version and the original IEEE and The
          Open Group Standard, the original IEEE and The Open Group
          Standard is the referee document. The original Standard can be
          obtained online at http://www.opengroup.org/unix/online.html .

          Any typographical or formatting errors that appear in this page
          are most likely to have been introduced during the conversion of
          the source files to man page format. To report such errors, see
          https://www.kernel.org/doc/man-pages/reporting_bugs.html .

   IEEE/The Open Group               2017                        INSQUE(3P)

--------------

Pages that refer to this page:
`search.h(0p) <../man0/search.h.0p.html>`__, 
`remque(3p) <../man3/remque.3p.html>`__

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
