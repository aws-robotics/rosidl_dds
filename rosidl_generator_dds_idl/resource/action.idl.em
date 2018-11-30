@# Included from rosidl_generator_dds_idl/resource/idl.idl.em
@{
TEMPLATE(
    'srv.idl.em',
    package_name=package_name,
    interface_path=interface_path,
    message=action.goal_service,
    get_post_struct_lines=get_post_struct_lines
)

TEMPLATE(
    'srv.idl.em',
    package_name=package_name,
    interface_path=interface_path,
    message=action.result_service,
    get_post_struct_lines=get_post_struct_lines
)

TEMPLATE(
    'msg.idl.em',
    package_name=package_name,
    interface_path=interface_path,
    message=action.feedback_message,
    get_post_struct_lines=get_post_struct_lines
)
}@
