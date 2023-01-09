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
    # Model to invite a new user to your accounting group
    class InviteSubmitModel

        ##
        # Initialize the InviteSubmitModel using the provided prototype
        def initialize(params = {})
            @email = params.dig(:email)
        end

        ##
        # @return [Email] The email address of the user to invite
        attr_accessor :email

        ##
        # @return [object] This object as a JSON key-value structure
        def as_json(options={})
            {
                'email' => @email,
            }
        end

        ##
        # @return [String] This object converted to a JSON string
        def to_json(*options)
            "[#{as_json(*options).to_json(*options)}]"
        end
    end
end
