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


require 'awrence'

class ProfilesAccountingClient

    ##
    # Initialize the ProfilesAccountingClient class with an API client instance.
    # @param connection [LockstepApi] The API client object for this connection
    def initialize(connection)
        @connection = connection
    end


    ##
    # Retrieves the Accounting Profile specified by this unique identifier, optionally including nested data sets.
    #
    # An Accounting Profile is a child of a Company Profile, and collectively, they comprise the identity and necessary information for an accounting  team to work with trading partners, financial institutions, auditors, and others. You can use Accounting Profiles to define an accounting function by what the function does and how to interface with the function.
    #
    # @param id [uuid] The unique Lockstep Platform ID number of this Accounting Profile
    # @param include_param [string] To fetch additional data on this object, specify the list of elements to retrieve. Available collections: Attachments, CustomFields, Notes
    def retrieve_accounting_profile(id:, include_param:)
        path = "/api/v1/profiles/accounting/#{id}"
        params = {:include => include_param}
        @connection.request(:get, path, nil, params)
    end

    ##
    # Updates an accounting profile that matches the specified id with the requested information.
    #
    # The PATCH method allows you to change specific values on the object while leaving other values alone.  As input you should supply a list of field names and new values.  If you do not provide the name of a field, that field will remain unchanged.  This allows you to ensure that you are only updating the specific fields desired.
    #
    # An Accounting Profile is a child of a Company Profile, and collectively, they comprise the identity and necessary information for an accounting  team to work with trading partners, financial institutions, auditors, and others. You can use Accounting Profiles to define an accounting function by what the function does and how to interface with the function.
    #
    # @param id [uuid] The unique Lockstep Platform ID number of the Accounting Profile to update
    # @param body [object] A list of changes to apply to this Accounting Profile
    def update_accounting_profile(id:, body:)
        path = "/api/v1/profiles/accounting/#{id}"
        @connection.request(:patch, path, body.to_camelback_keys.to_json, nil)
    end

    ##
    # Delete the Accounting Profile referred to by this unique identifier.
    #
    # An Accounting Profile is a child of a Company Profile, and collectively, they comprise the identity and necessary information for an accounting  team to work with trading partners, financial institutions, auditors, and others. You can use Accounting Profiles to define an accounting function by what the function does and how to interface with the function.
    #
    # @param id [uuid] The unique Lockstep Platform ID number of the Accounting Profile to disable
    def delete_accounting_profile(id:)
        path = "/api/v1/profiles/accounting/#{id}"
        @connection.request(:delete, path, nil, nil)
    end

    ##
    # Creates one or more accounting profiles from a given model.
    #
    # An Accounting Profile is a child of a Company Profile, and collectively, they comprise the identity and necessary information for an accounting  team to work with trading partners, financial institutions, auditors, and others. You can use Accounting Profiles to define an accounting function by what the function does and how to interface with the function.
    #
    # @param body [AccountingProfileModel] The Accounting Profiles to create
    def create_accounting_profiles(body:)
        path = "/api/v1/profiles/accounting"
        @connection.request(:post, path, body, nil)
    end

    ##
    # Queries Accounting Profiles for this account using the specified filtering, sorting, nested fetch, and pagination rules requested.
    #
    # More information on querying can be found on the [Searchlight Query Language](https://developer.lockstep.io/docs/querying-with-searchlight) page on the Lockstep Developer website.
    #
    # An Accounting Profile is a child of a Company Profile, and collectively, they comprise the identity and necessary information for an accounting  team to work with trading partners, financial institutions, auditors, and others. You can use Accounting Profiles to define an accounting function by what the function does and how to interface with the function.
    #
    # @param filter [string] The filter for this query. See [Searchlight Query Language](https://developer.lockstep.io/docs/querying-with-searchlight)
    # @param include_param [string] To fetch additional data on this object, specify the list of elements to retrieve. Available collections: Attachments, CustomFields, Notes
    # @param order [string] The sort order for this query. See See [Searchlight Query Language](https://developer.lockstep.io/docs/querying-with-searchlight)
    # @param page_size [int32] The page size for results (default 250, maximum of 500). See [Searchlight Query Language](https://developer.lockstep.io/docs/querying-with-searchlight)
    # @param page_number [int32] The page number for results (default 0). See [Searchlight Query Language](https://developer.lockstep.io/docs/querying-with-searchlight)
    def query_accounting_profiles(filter:, include_param:, order:, page_size:, page_number:)
        path = "/api/v1/profiles/accounting/query"
        params = {:filter => filter, :include => include_param, :order => order, :pageSize => page_size, :pageNumber => page_number}
        @connection.request(:get, path, nil, params)
    end

    ##
    # Retrieves all the Contacts associated with the Accounting Profile by this unique identifier, optionally including nested data sets.
    #
    # A Contact has a link to a Contact that is associated with your company's Accounting Profile.
    #
    # @param id [uuid] The unique Lockstep Platform ID number of this Accounting Profile
    def retrieve_all_accounting_profile_contacts(id:)
        path = "/api/v1/profiles/accounting/#{id}/contacts/models"
        @connection.request(:get, path, nil, nil)
    end
end
