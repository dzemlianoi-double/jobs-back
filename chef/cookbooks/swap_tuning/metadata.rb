# encoding: UTF-8
#
# Cookbook Name:: swap_tuning
# Author:: Xabier de Zuazo (<xabier@onddo.com>)
# Copyright:: Copyright (c) 2014 Onddo Labs, SL. (www.onddo.com)
# License:: Apache License, Version 2.0
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

name 'swap_tuning'
maintainer 'Onddo Labs, Sl.'
maintainer_email 'team@onddo.com'
license 'Apache 2.0'
description <<-EOS
Creates a swap file of the recommended size considering the system memory.
EOS
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version '0.1.4'

supports 'amazon'
supports 'arch'
supports 'centos'
supports 'debian'
supports 'fedora'
supports 'redhat'
supports 'ubuntu'

depends 'swap', '~> 0.3'

recipe 'swap_tuning::default', 'Creates the swap file.'

attribute 'swap_tuning/size',
          display_name: 'Swap size',
          description: 'Total swap size in MB.',
          type: 'string',
          required: 'optional',
          calculated: true

attribute 'swap_tuning/minimum_size',
          display_name: 'Swap minimum size',
          description: 'Swap minimum size in MB.',
          type: 'string',
          required: 'optional',
          default: 'nil'

attribute 'swap_tuning/file_prefix',
          display_name: 'Swap file prefix',
          description: 'Swap file name prefix.',
          type: 'string',
          required: 'optional',
          default: '"/swapfile"'

attribute 'swap_tuning/persist',
          display_name: 'Swap file persist',
          description: 'Swap file persist.',
          type: 'string',
          required: 'optional',
          default: 'true'
