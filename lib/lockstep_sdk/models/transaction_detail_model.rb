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
    # Represents transaction detail information associated to a transaction. This can either be Invoices which are paid with a
    # Credit Memo or Payment transaction, or Credit Memos or Payments used as payment for an Invoice transaction.
    class TransactionDetailModel

        ##
        # Initialize the TransactionDetailModel using the provided prototype
        def initialize(params = {})
            @group_key = params.dig(:group_key)
            @base_currency_code = params.dig(:base_currency_code)
            @reference_number = params.dig(:reference_number)
            @transaction_detail_id = params.dig(:transaction_detail_id)
            @transaction_detail_applied_id = params.dig(:transaction_detail_applied_id)
            @transaction_id = params.dig(:transaction_id)
            @transaction_type = params.dig(:transaction_type)
            @transaction_sub_type = params.dig(:transaction_sub_type)
            @transaction_date = params.dig(:transaction_date)
            @transaction_invoice_date = params.dig(:transaction_invoice_date)
            @currency_code = params.dig(:currency_code)
            @transaction_amount = params.dig(:transaction_amount)
            @outstanding_amount = params.dig(:outstanding_amount)
            @base_currency_transaction_amount = params.dig(:base_currency_transaction_amount)
            @base_currency_outstanding_amount = params.dig(:base_currency_outstanding_amount)
            @supports_erp_pdf_retrieval = params.dig(:supports_erp_pdf_retrieval)
        end

        ##
        # @return [Uuid] Group account transaction detail is associated with.
        attr_accessor :group_key

        ##
        # @return [String] The base currency code of the group.
        attr_accessor :base_currency_code

        ##
        # @return [String] An additional reference number that is sometimes used to identify a transaction detail. The meaning of this field is specific to the ERP or accounting system used by the user.
        attr_accessor :reference_number

        ##
        # @return [Uuid] The unique ID of the transaction detail record.
        attr_accessor :transaction_detail_id

        ##
        # @return [Uuid] The unique ID of the entity applying the transaction to the transaction detail record.
        attr_accessor :transaction_detail_applied_id

        ##
        # @return [Uuid] The unique ID of the transaction record.
        attr_accessor :transaction_id

        ##
        # @return [String] The type of the transaction detail record. Recognized Invoice types are: * `AR Invoice` - Represents an invoice sent by Company to the Customer * `AP Invoice` - Represents an invoice sent by Vendor to the Company * `AR Credit Memo` - Represents a credit memo generated by Company given to Customer * `AP Credit Memo` - Represents a credit memo generated by Vendor given to Company Recognized PaymentType values are: * `AR Payment` - A payment made by a Customer to the Company * `AP Payment` - A payment made by the Company to a Vendor
        attr_accessor :transaction_type

        ##
        # @return [String] Additional type categorization of the transaction.
        attr_accessor :transaction_sub_type

        ##
        # @return [Date-time] The date when a transaction detail record was reported.
        attr_accessor :transaction_date

        ##
        # @return [Date-time] The date of the invoice associated to the transaction detail record.
        attr_accessor :transaction_invoice_date

        ##
        # @return [String] The currency code of the transaction.
        attr_accessor :currency_code

        ##
        # @return [Double] The total value of this transaction detail, inclusive or all taxes and line items.
        attr_accessor :transaction_amount

        ##
        # @return [Double] The remaining balance of this transaction detail.
        attr_accessor :outstanding_amount

        ##
        # @return [Double] The total value of this transaction detail, inclusive or all taxes and line items in the group's base currency.
        attr_accessor :base_currency_transaction_amount

        ##
        # @return [Double] The remaining balance of this transaction detail in the group's base currency.
        attr_accessor :base_currency_outstanding_amount

        ##
        # @return [Boolean] Specific transactions have support for pdf retrieval from their respective erp. When this flag is true, an additional call to Invoices/{id}/pdf or Payments/{id}/pdf can be made to retrieve a pdf directly from the erp.
        attr_accessor :supports_erp_pdf_retrieval

        ##
        # @return [object] This object as a JSON key-value structure
        def as_json(options={})
            {
                'groupKey' => @group_key,
                'baseCurrencyCode' => @base_currency_code,
                'referenceNumber' => @reference_number,
                'transactionDetailId' => @transaction_detail_id,
                'transactionDetailAppliedId' => @transaction_detail_applied_id,
                'transactionId' => @transaction_id,
                'transactionType' => @transaction_type,
                'transactionSubType' => @transaction_sub_type,
                'transactionDate' => @transaction_date,
                'transactionInvoiceDate' => @transaction_invoice_date,
                'currencyCode' => @currency_code,
                'transactionAmount' => @transaction_amount,
                'outstandingAmount' => @outstanding_amount,
                'baseCurrencyTransactionAmount' => @base_currency_transaction_amount,
                'baseCurrencyOutstandingAmount' => @base_currency_outstanding_amount,
                'supportsErpPdfRetrieval' => @supports_erp_pdf_retrieval,
            }
        end

        ##
        # @return [String] This object converted to a JSON string
        def to_json(*options)
            "[#{as_json(*options).to_json(*options)}]"
        end
    end
end
