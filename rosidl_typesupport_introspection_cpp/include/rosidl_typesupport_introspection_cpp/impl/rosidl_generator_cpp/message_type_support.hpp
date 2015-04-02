// Copyright 2015 Open Source Robotics Foundation, Inc.
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//     http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.

// This header contains the type support introspection specific implementation
// of the <rosidl_generator_cpp/message_type_support_decl.hpp> header.

#ifndef __rosidl_generator_cpp__message_type_support__hpp__
#define __rosidl_generator_cpp__message_type_support__hpp__

// Provides the definition of the rosidl_message_type_support_t struct.
#include <rosidl_generator_c/message_type_support.h>
// Provides visibility macros like ROSIDL_PUBLIC.
#include <rosidl_generator_c/visibility_control.h>
// Provides the declaration of the function
// rosidl_generator_cpp::get_message_type_support_handle.
#include <rosidl_generator_cpp/message_type_support_decl.hpp>

namespace rosidl_typesupport_introspection_cpp
{

// This is implemented in the shared library provided by this package.
template<typename T>
ROSIDL_PUBLIC
const rosidl_message_type_support_t * get_message_type_support_handle_introspection();

}  // namespace rosidl_typesupport_introspection_cpp

namespace rosidl_generator_cpp
{

template<typename T>
const rosidl_message_type_support_t * get_message_type_support_handle()
{
  // Hand off to implementation specific handle getter.
  // By using this implementation specific getter in this header, it makes
  // the user executable or library have a reference to an implementation
  // specific symbol, which is implemented in the implementation specific
  // message library. This is intentional to allow the linker to pick the
  // correct implementation specific message library when being over linked
  // with multiple implementation options.
  return rosidl_typesupport_introspection_cpp::get_message_type_support_handle_introspection<T>();
}

}  // namespace rosidl_generator_cpp

#endif  // __rosidl_generator_cpp__message_type_support__hpp__
