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
    # A Payment represents money sent from one company to another.  A single payment may contain payments for
    # one or more invoices; it is also possible for payments to be made in advance of an invoice, for example,
    # as a deposit.  The creator of the Payment is identified by the `CustomerId` field, and the recipient of
    # the Payment is identified by the `CompanyId` field.  Most Payments are uniquely identified both by a
    # Lockstep Platform ID number and a customer ERP "key" that was generated by the system that originated
    # the Payment.  Payments that have not been fully applied have a nonzero `UnappliedAmount` value, which
    # represents a deposit that has been paid and not yet applied to an Invoice.
    class PaymentModel

        ##
        # Initialize the PaymentModel using the provided prototype
        def initialize(params = {})
            @group_key = params.dig(:group_key)
            @payment_id = params.dig(:payment_id)
            @company_id = params.dig(:company_id)
            @erp_key = params.dig(:erp_key)
            @erp_update_status = params.dig(:erp_update_status)
            @erp_update_action = params.dig(:erp_update_action)
            @payment_type = params.dig(:payment_type)
            @tender_type = params.dig(:tender_type)
            @is_open = params.dig(:is_open)
            @memo_text = params.dig(:memo_text)
            @payment_date = params.dig(:payment_date)
            @post_date = params.dig(:post_date)
            @payment_amount = params.dig(:payment_amount)
            @unapplied_amount = params.dig(:unapplied_amount)
            @currency_code = params.dig(:currency_code)
            @bank_account_id = params.dig(:bank_account_id)
            @reference_code = params.dig(:reference_code)
            @created = params.dig(:created)
            @created_user_id = params.dig(:created_user_id)
            @modified = params.dig(:modified)
            @modified_user_id = params.dig(:modified_user_id)
            @app_enrollment_id = params.dig(:app_enrollment_id)
            @is_voided = params.dig(:is_voided)
            @in_dispute = params.dig(:in_dispute)
            @currency_rate = params.dig(:currency_rate)
            @base_currency_payment_amount = params.dig(:base_currency_payment_amount)
            @base_currency_unapplied_amount = params.dig(:base_currency_unapplied_amount)
            @service_fabric_status = params.dig(:service_fabric_status)
            @source_modified_date = params.dig(:source_modified_date)
            @applications = params.dig(:applications)
            @notes = params.dig(:notes)
            @attachments = params.dig(:attachments)
            @custom_field_definitions = params.dig(:custom_field_definitions)
            @custom_field_values = params.dig(:custom_field_values)
        end

        ##
        # @return [Uuid] The GroupKey uniquely identifies a single Lockstep Platform account. All records for this account will share the same GroupKey value. GroupKey values cannot be changed once created. For more information, see [Accounts and GroupKeys](https://developer.lockstep.io/docs/accounts-and-groupkeys).
        attr_accessor :group_key

        ##
        # @return [Uuid] The unique ID of this record, automatically assigned by Lockstep when this record is added to the Lockstep platform. For the ID of this record in its originating financial system, see `ErpKey`.
        attr_accessor :payment_id

        ##
        # @return [Uuid] The ID of the company to which this payment belongs.
        attr_accessor :company_id

        ##
        # @return [String] The unique ID of this record as it was known in its originating financial system. If this company record was imported from a financial system, it will have the value `ErpKey` set to the original primary key number of the record as it was known in the originating financial system. If this record was not imported, this value will be `null`. For more information, see [Identity Columns](https://developer.lockstep.io/docs/identity-columns).
        attr_accessor :erp_key

        ##
        # @return [ErpUpdateStatus] Possible statuses for a record that supports ERP Update.
        attr_accessor :erp_update_status

        ##
        # @return [ErpUpdateAction] Possible actions for a record that supports ERP Update.
        attr_accessor :erp_update_action

        ##
        # @return [String] The type of payment, AR Payment or AP Payment. Recognized PaymentType values are: * `AR Payment` - A payment made by a Customer to the Company * `AP Payment` - A payment made by the Company to a Vendor
        attr_accessor :payment_type

        ##
        # @return [String] Cash, check, credit card, wire transfer. Recognized TenderType values are: * `Cash` - A cash payment or other direct transfer. * `Check` - A check payment. * `Credit Card` - A payment made via a credit card. * `Wire Transfer` - A payment made via wire transfer from another financial institution. * `Other` - A payment made via another method not listed above.
        attr_accessor :tender_type

        ##
        # @return [Boolean] True if this payment includes some unassigned amount that has not yet been applied to an invoice. If this value is true, the field `UnappliedAmount` will be nonzero.
        attr_accessor :is_open

        ##
        # @return [String] Memo or reference text (ex. memo field on a check).
        attr_accessor :memo_text

        ##
        # @return [Date] The date when this payment was received. This typically is the date when an accounting employee recorded that they received notification that the payment had occurred, whether they were notified by email, postal mail, or financial transaction notification.
        attr_accessor :payment_date

        ##
        # @return [Date] The date when a payment was posted to a ledger. This date is often determined by a company's accounting practices and may be different than the date when the payment was received. This date may be affected by issues such as temporary holds on funds transferred, bank holidays, or other actions.
        attr_accessor :post_date

        ##
        # @return [Double] Total amount of this payment in it's received currency.
        attr_accessor :payment_amount

        ##
        # @return [Double] Unapplied balance of this payment in it's received currency. If this amount is nonzero, the field `IsOpen` will be true.
        attr_accessor :unapplied_amount

        ##
        # @return [String] The ISO 4217 currency code for this payment. For a list of ISO 4217 currency codes, see [Query Currencies](https://developer.lockstep.io/reference/get_api-v1-definitions-currencies).
        attr_accessor :currency_code

        ##
        # @return [String] The Bank account id for the company to which this payment belongs.
        attr_accessor :bank_account_id

        ##
        # @return [String] Reference code for the payment for the given Erp system.
        attr_accessor :reference_code

        ##
        # @return [Date-time] The date on which this record was created.
        attr_accessor :created

        ##
        # @return [Uuid] The ID of the user who created this payment.
        attr_accessor :created_user_id

        ##
        # @return [Date-time] The date on which this record was last modified.
        attr_accessor :modified

        ##
        # @return [Uuid] The ID of the user who last modified this payment.
        attr_accessor :modified_user_id

        ##
        # @return [Uuid] The AppEnrollmentId of the application that imported this record. For accounts with more than one financial system connected, this field identifies the originating financial system that produced this record. This value is null if this record was not loaded from an external ERP or financial system.
        attr_accessor :app_enrollment_id

        ##
        # @return [Boolean] Is the payment voided?
        attr_accessor :is_voided

        ##
        # @return [Boolean] Is the payment in dispute?
        attr_accessor :in_dispute

        ##
        # @return [Double] The Currency Rate used to get from the account's base currency to the payment amount.
        attr_accessor :currency_rate

        ##
        # @return [Double] Total amount of this payment in the group's base currency.
        attr_accessor :base_currency_payment_amount

        ##
        # @return [Double] Unapplied balance of this payment in the group's base currency. If this amount is nonzero, the field `IsOpen` will be true.
        attr_accessor :base_currency_unapplied_amount

        ##
        # @return [String] The status of this payment within Service Fabric. "UNAUTHORISED" "PENDING" "PAID" "PAID_OFFLINE" "FAILED" "CANCELLED" "REJECTED" "REFUNDED" "PARTIALLY" "PARTIALLY_REFUNDED"
        attr_accessor :service_fabric_status

        ##
        # @return [Date-time] The date on which this record was last modified in source ERP.
        attr_accessor :source_modified_date

        ##
        # @return [PaymentAppliedModel] All applications this payment is associated with. To retrieve this collection, specify `Applications` in the "Include" parameter for your query.
        attr_accessor :applications

        ##
        # @return [NoteModel] A collection of notes linked to this record. To retrieve this collection, specify `Notes` in the `include` parameter when retrieving data. To create a note, use the [Create Note](https://developer.lockstep.io/reference/post_api-v1-notes) endpoint with the `TableKey` to `Payment` and the `ObjectKey` set to the `PaymentId` for this record. For more information on extensibility, see [linking extensible metadata to objects](https://developer.lockstep.io/docs/custom-fields#linking-metadata-to-an-object).
        attr_accessor :notes

        ##
        # @return [AttachmentModel] A collection of attachments linked to this record. To retrieve this collection, specify `Attachments` in the `include` parameter when retrieving data. To create an attachment, use the [Upload Attachment](https://developer.lockstep.io/reference/post_api-v1-attachments) endpoint with the `TableKey` to `Payment` and the `ObjectKey` set to the `PaymentId` for this record. For more information on extensibility, see [linking extensible metadata to objects](https://developer.lockstep.io/docs/custom-fields#linking-metadata-to-an-object).
        attr_accessor :attachments

        ##
        # @return [CustomFieldDefinitionModel] A collection of custom fields linked to this record. To retrieve this collection, specify `CustomFieldDefinitions` in the `include` parameter when retrieving data. To create a custom field, use the [Create Custom Field](https://developer.lockstep.io/reference/post_api-v1-customfieldvalues) endpoint with the `TableKey` to `Payment` and the `ObjectKey` set to the `PaymentId` for this record. For more information on extensibility, see [linking extensible metadata to objects](https://developer.lockstep.io/docs/custom-fields#linking-metadata-to-an-object).
        attr_accessor :custom_field_definitions

        ##
        # @return [CustomFieldValueModel] A collection of custom fields linked to this record. To retrieve this collection, specify `CustomFieldValues` in the `include` parameter when retrieving data. To create a custom field, use the [Create Custom Field](https://developer.lockstep.io/reference/post_api-v1-customfieldvalues) endpoint with the `TableKey` to `Payment` and the `ObjectKey` set to the `PaymentId` for this record. For more information on extensibility, see [linking extensible metadata to objects](https://developer.lockstep.io/docs/custom-fields#linking-metadata-to-an-object).
        attr_accessor :custom_field_values

        ##
        # @return [object] This object as a JSON key-value structure
        def as_json(options={})
            {
                'groupKey' => @group_key,
                'paymentId' => @payment_id,
                'companyId' => @company_id,
                'erpKey' => @erp_key,
                'erpUpdateStatus' => @erp_update_status,
                'erpUpdateAction' => @erp_update_action,
                'paymentType' => @payment_type,
                'tenderType' => @tender_type,
                'isOpen' => @is_open,
                'memoText' => @memo_text,
                'paymentDate' => @payment_date,
                'postDate' => @post_date,
                'paymentAmount' => @payment_amount,
                'unappliedAmount' => @unapplied_amount,
                'currencyCode' => @currency_code,
                'bankAccountId' => @bank_account_id,
                'referenceCode' => @reference_code,
                'created' => @created,
                'createdUserId' => @created_user_id,
                'modified' => @modified,
                'modifiedUserId' => @modified_user_id,
                'appEnrollmentId' => @app_enrollment_id,
                'isVoided' => @is_voided,
                'inDispute' => @in_dispute,
                'currencyRate' => @currency_rate,
                'baseCurrencyPaymentAmount' => @base_currency_payment_amount,
                'baseCurrencyUnappliedAmount' => @base_currency_unapplied_amount,
                'serviceFabricStatus' => @service_fabric_status,
                'sourceModifiedDate' => @source_modified_date,
                'applications' => @applications,
                'notes' => @notes,
                'attachments' => @attachments,
                'customFieldDefinitions' => @custom_field_definitions,
                'customFieldValues' => @custom_field_values,
            }
        end

        ##
        # @return [String] This object converted to a JSON string
        def to_json(*options)
            "[#{as_json(*options).to_json(*options)}]"
        end
    end
end
