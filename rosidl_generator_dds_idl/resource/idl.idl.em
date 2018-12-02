// generated from rosidl_generator_dds_idl/resource/idl.idl.em
// with input from @(package_name):@(interface_path)
// generated code does not contain a copyright notice
@{
import os
from rosidl_parser.definition import Include
includes = content.get_elements_of_type(Include)

include_directives = set()
}@
@[if includes]@

@[  for include in includes]@
@{
name, ext = os.path.splitext(include.locator)
dir_name = os.path.dirname(name)
include_name = '{}_{}'.format(os.path.join(dir_name, *subfolders, os.path.basename(name)), ext)
include_directives.add(include_name)
}@
#include "@(include_name)"
@[  end for]@
@[end if]@
@{
from rosidl_parser.definition import Action
from rosidl_parser.definition import Message
from rosidl_parser.definition import Service

from rosidl_cmake import convert_camel_case_to_lower_case_underscore
header_guard_parts = [package_name] + list(interface_path.parents[0].parts) + \
    [convert_camel_case_to_lower_case_underscore(interface_path.stem)] + \
    ['idl']
}@

#ifndef __@('__'.join(header_guard_parts))__
#define __@('__'.join(header_guard_parts))__

@{
for message in content.get_elements_of_type(Message):
    TEMPLATE(
        'msg.idl.em', package_name=package_name,
        interface_path=interface_path, message=message,
        include_directives=include_directives,
        get_post_struct_lines=get_post_struct_lines
    )

for service in content.get_elements_of_type(Service):
    TEMPLATE(
        'srv.idl.em', package_name=package_name,
        interface_path=interface_path, service=service,
        include_directives=include_directives,
        get_post_struct_lines=get_post_struct_lines
    )

for action in content.get_elements_of_type(Action):
    TEMPLATE(
        'action.idl.em', package_name=package_name,
        interface_path=interface_path, action=action,
        include_directives=include_directives,
        get_post_struct_lines=get_post_struct_lines
    )
}@

#endif  // __@('__'.join(header_guard_parts))__
