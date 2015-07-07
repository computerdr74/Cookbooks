# Encoding: UTF-8
#
# Cookbook Name:: vlc
# Library:: provider_vlc_app_debian
#
# Copyright 2015 Jonathan Hartman
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

require 'chef/provider/lwrp_base'
require 'chef/dsl/include_recipe'
require_relative 'provider_vlc_app'

class Chef
  class Provider
    class VlcApp < Provider::LWRPBase
      # An provider for VLC for Ubuntu and Debian.
      #
      # @author Jonathan Hartman <j@p4nt5.com>
      class Debian < VlcApp
        include Chef::DSL::IncludeRecipe

        private

        #
        # Use a regular package resource to install VLC, since it's available
        # in APT.
        #
        # (see VlcApp#install!)
        #
        def install!
          include_recipe 'apt'
          package 'vlc' do
            version new_resource.version
            action :install
          end
        end

        #
        # Use a regular package resource to uninstall VLC.
        #
        # (see VlcApp#remove!)
        #
        def remove!
          package 'vlc' do
            action :remove
          end
        end
      end
    end
  end
end
