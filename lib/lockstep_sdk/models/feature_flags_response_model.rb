#
# Lockstep Platform SDK for Ruby
#
# (c) 2021-2023 Lockstep, Inc.
#
# For the full copyright and license information, please view the LICENSE
# file that was distributed with this source code.
#
# @author     Lockstep Network <support@lockstep.io>
# @copyright  2021-2023 Lockstep, Inc.
# @link       https://github.com/Lockstep-Network/lockstep-sdk-ruby
#


require 'json'

module LockstepSdk

    ##
    # Response information for Feature Flags
    class FeatureFlagsResponseModel

        ##
        # Initialize the FeatureFlagsResponseModel using the provided prototype
        def initialize(params = {})
            @values = params.dig(:values)
        end

        ##
        # @return [Object] State of the requested Feature Flags
        attr_accessor :values

        ##
        # @return [object] This object as a JSON key-value structure
        def as_json(options={})
            {
                'values' => @values,
            }
        end

        ##
        # @return [String] This object converted to a JSON string
        def to_json(*options)
            "[#{as_json(*options).to_json(*options)}]"
        end
    end
end
