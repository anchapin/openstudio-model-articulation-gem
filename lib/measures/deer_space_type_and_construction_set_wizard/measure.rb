# *******************************************************************************
# OpenStudio(R), Copyright (c) 2008-2021, Alliance for Sustainable Energy, LLC.
# All rights reserved.
# Redistribution and use in source and binary forms, with or without
# modification, are permitted provided that the following conditions are met:
#
# (1) Redistributions of source code must retain the above copyright notice,
# this list of conditions and the following disclaimer.
#
# (2) Redistributions in binary form must reproduce the above copyright notice,
# this list of conditions and the following disclaimer in the documentation
# and/or other materials provided with the distribution.
#
# (3) Neither the name of the copyright holder nor the names of any contributors
# may be used to endorse or promote products derived from this software without
# specific prior written permission from the respective party.
#
# (4) Other than as required in clauses (1) and (2), distributions in any form
# of modifications or other derivative works may not use the "OpenStudio"
# trademark, "OS", "os", or any other confusingly similar designation without
# specific prior written permission from Alliance for Sustainable Energy, LLC.
#
# THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDER(S) AND ANY CONTRIBUTORS
# "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO,
# THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
# ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER(S), ANY CONTRIBUTORS, THE
# UNITED STATES GOVERNMENT, OR THE UNITED STATES DEPARTMENT OF ENERGY, NOR ANY OF
# THEIR EMPLOYEES, BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL,
# EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT
# OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS
# INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT,
# STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY
# OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
# *******************************************************************************

# see the URL below for information on how to write OpenStudio measures
# http://openstudio.nrel.gov/openstudio-measure-writing-guide

# see the URL below for information on using life cycle cost objects in OpenStudio
# http://openstudio.nrel.gov/openstudio-life-cycle-examples

# see the URL below for access to C++ documentation on model objects (click on "model" in the main window to view model objects)
# http://openstudio.nrel.gov/sites/openstudio.nrel.gov/files/nv_data/cpp_documentation_it/model/html/namespaces.html

# start the measure
class DEERSpaceTypeAndConstructionSetWizard < OpenStudio::Measure::ModelMeasure
  require 'openstudio-standards'

  # load OpenStudio measure libraries from openstudio-extension gem
  require 'openstudio-extension'
  require 'openstudio/extension/core/os_lib_helper_methods'
  require 'openstudio/extension/core/os_lib_model_generation'

  # resource files used by measure
  include OsLib_HelperMethods
  include OsLib_ModelGeneration

  # define the name that a user will see, this method may be deprecated as
  # the display name in PAT comes from the name field in measure.xml
  def name
    return 'DEER Space Type and Construction Set Wizard'
  end

  # human readable description
  def description
    return 'Create DEER space types and or construction sets for the requested building type, climate zone, and target.'
  end

  # human readable description of modeling approach
  def modeler_description
    return 'The data for this measure comes from the openstudio-standards Ruby Gem. They are no longer created from the same JSON file that was used to make the OpenStudio templates. Optionally this will also set the building default space type and construction set.'
  end

  # define the arguments that the user will input
  def arguments(model)
    args = OpenStudio::Measure::OSArgumentVector.new

    # Make an argument for the building type
    building_type = OpenStudio::Measure::OSArgument.makeChoiceArgument('building_type', get_deer_building_types, true)
    building_type.setDisplayName('Building Type.')
    building_type.setDefaultValue('SmallOffice')
    args << building_type

    # Make an argument for the template
    template = OpenStudio::Measure::OSArgument.makeChoiceArgument('template', get_deer_templates, true)
    template.setDisplayName('Template.')
    template.setDefaultValue('90.1-2010')
    args << template

    # Make an argument for the climate zone
    climate_zone = OpenStudio::Measure::OSArgument.makeChoiceArgument('climate_zone', get_deer_climate_zones, true)
    climate_zone.setDisplayName('Climate Zone.')
    climate_zone.setDefaultValue('ASHRAE 169-2013-2A')
    args << climate_zone

    # make an argument to add new space types
    create_space_types = OpenStudio::Measure::OSArgument.makeBoolArgument('create_space_types', true)
    create_space_types.setDisplayName('Create Space Types?')
    create_space_types.setDefaultValue(true)
    args << create_space_types

    # make an argument to add new construction set
    create_construction_set = OpenStudio::Measure::OSArgument.makeBoolArgument('create_construction_set', true)
    create_construction_set.setDisplayName('Create Construction Set?')
    create_construction_set.setDefaultValue(true)
    args << create_construction_set

    # make an argument to determine if building defaults should be set
    set_building_defaults = OpenStudio::Measure::OSArgument.makeBoolArgument('set_building_defaults', true)
    set_building_defaults.setDisplayName('Set Building Defaults Using New Objects?')
    set_building_defaults.setDefaultValue(true)
    args << set_building_defaults

    return args
  end

  # define what happens when the measure is run
  def run(model, runner, user_arguments)
    super(model, runner, user_arguments)

    results = wizard(model, runner, user_arguments)

    if results == false
      return false
    else
      return true
    end
  end
end

# this allows the measure to be use by the application
DEERSpaceTypeAndConstructionSetWizard.new.registerWithApplication
