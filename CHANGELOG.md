# OpenStudio Model Articulation Gems

## Version 0.6.1
* Removed recent changes made to `blended_space_type_from_model` to remove standards space type and building type assignment from resulting blended space type. `blend_space_type_collections` method in extension gem `os_lib_model_simplification.rb` already picks the most prevenant space type. The space type name still indicates that it is blended.

## Version 0.6.0
* Support for OpenStudio 3.4 (upgrade to standards gem 0.2.16, no extension gem upgrade)
* Fixed [#92]( https://github.com/NREL/openstudio-model-articulation-gem/issues/92 ), SetWindowToWallRatio triangulation can produce non-planar surfaces
* Fixed [#94]( https://github.com/NREL/openstudio-model-articulation-gem/pull/94 ), fix SetWindowToWallRatio triangulation
* Fixed [#95]( https://github.com/NREL/openstudio-model-articulation-gem/pull/95 ), add warnings to SetWindowToWallRatio to categorize cases when WWR can't be applied
* Fixed [#98]( https://github.com/NREL/openstudio-model-articulation-gem/pull/98 ), Radiance Daylighting Measure - Update measure.rb
* Fixed [#101]( https://github.com/NREL/openstudio-model-articulation-gem/pull/101 ), setting building and space type standard to Blend

## Version 0.5.0
* Support for OpenStudio 3.3 (upgrade to extension gem 0.5.1 and standards gem 0.2.15)
* Fixed [#73]( https://github.com/NREL/openstudio-model-articulation-gem/pull/73 ), added add_empd_material_properties measure contributed by GFlechas
* Fixed [#83]( https://github.com/NREL/openstudio-model-articulation-gem/pull/83 ), adding compatibility matrix and contribution policy
* Fixed [#85]( https://github.com/NREL/openstudio-model-articulation-gem/pull/85 ), For SetWindowToWallRatioByFacade fixed rectangle tol and pre-split at door remove windows

## Version 0.4.1

* Support for OpenStudio 3.2.1 (upgrade to extension gem 0.4.3 and standards gem 0.2.14)
* update to use rubocop_v4
* Documentation update to some measures
* Setting up webhook for https://bcl2.nrel.gov

## Version 0.4.0

* Support Ruby ~> 2.7
* Support for OpenStudio 3.2 (upgrade to extension gem 0.4.2 and standards gem 0.2.13)
* Support for ASHRAE 90.1 2016 for DOE prototype measure
* Support for ASHRAE 90.1 216 and 2019 for measures that pull templates from extension gem. This includes but is not limited to DOE create_bar, create_typical, and space type and construction set wizard measures.

## Version 0.3.1

* Bump openstudio-extension-gem version to 0.3.2 to support updated workflow-gem

## Version 0.3.0

* Support for OpenStudio 3.1
	* Update OpenStudio Standards to 0.2.12
    * Update OpenStudio Extension gem to 0.3.1
* Move errs array creation in radiant_slab_with_doas measure
* Fix radiant measure to work with Ruby 2.2 (remove Safe Navigation operator)

## Version 0.2.1

* Support for OpenStudio 3.1
    * Update OpenStudio Standards to 0.2.12
    * Update OpenStudio Extension gem to 0.3.1
    
## Version 0.2.0

* Support for OpenStudio 3.0
    * Upgrade Bundler to 2.1.x
    * Restrict to Ruby ~> 2.5.0   
    * Removed simplecov forked dependency 
* Upgraded openstudio-extension to 0.2.3
    * Updated measure tester to 0.2.0 (removes need for github gem in downstream projects)
* Upgraded openstudio-standards to 0.2.11
* Exclude measure tests from being released with the gem (reduces the size of the installed gem significantly)
* Removed dependency on openstudio-common-measures gem

## Version 0.1.1

* Update to OpenStudio Common Gem 0.1.2 (and extension gem 0.1.6)
* Merge in OpenStudio articulation measures from OpenStudio-measures
* Code cleanup on the measures
* Update copyrights and licenses 

## Version 0.1.0

* Initial release of the articulation measures that are used for generating OpenStudio models.
